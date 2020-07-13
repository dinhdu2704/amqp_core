package vn.vnpt.stc.enterprise;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import vn.vnpt.stc.enterpise.commons.constants.QueueConstants;
import vn.vnpt.stc.enterpise.commons.constants.RoutingKeyConstants;
import vn.vnpt.stc.enterpise.commons.event.Event;
import vn.vnpt.stc.enterpise.commons.event.EventType;
import vn.vnpt.stc.enterprise.event.AMQPSubscribes;
import vn.vnpt.stc.enterprise.event.EventBus;
import vn.vnpt.stc.enterprise.event.process.MessageReceiverProcess;
import vn.vnpt.stc.enterprise.jpa.umgr.endpoints.PaymentPackageEndpoint;
import vn.vnpt.stc.enterprise.jpa.umgr.services.PaymentPackageService;

@Component
public class RootEndpoint {
    private static final Logger logger = LoggerFactory.getLogger(RootEndpoint.class);
    private MessageReceiverProcess messageReceiverProcess;
    private PaymentPackageEndpoint paymentPackageEndpoint;

    @Autowired
    public RootEndpoint(
            EventBus eventBus,
            MessageReceiverProcess messageReceiverProcess,
            PaymentPackageService paymentPackageService){
        this.messageReceiverProcess = messageReceiverProcess;
        this.paymentPackageEndpoint = new PaymentPackageEndpoint(paymentPackageService, eventBus);
    }

    /**
     * FOR REQUEST EVENT
     */
    @AMQPSubscribes(exchange = QueueConstants.TOPIC_EXCHANGE_REQUEST, queue = QueueConstants.QUEUE_REQUEST_CORE_PAYMENT,
            routingKey = RoutingKeyConstants.ROUTING_KEY_REQUEST_CORE_PAYMENT)
    public void processExternal(Event event, MessageProperties messageProperties) {
        //only accept request event
        if (!EventType.REQUEST.equals(event.type)) return;

        switch (messageProperties.getReceivedRoutingKey()) {
            case RoutingKeyConstants.ROUTING_KEY_PAYMENT:
                paymentPackageEndpoint.process(event);
                break;
            default:
                //do something else
        }
    }

    /** FOR RESPONSE EVENT*/
    @AMQPSubscribes(exchange = QueueConstants.TOPIC_EXCHANGE_RESPONSE, queue = QueueConstants.QUEUE_RESPONSE_CORE_PAYMENT,
            routingKey = RoutingKeyConstants.ROUTING_KEY_RESPONSE_CORE_PAYMENT)
    public void processInternal(Event event, MessageProperties messageProperties){
        if(!EventType.RESPONSE.equals(event.type)) return;

        //free function call RequestUtils AMQP, for thread continue running
        messageReceiverProcess.process(event);

        switch (event.method){
            default:
                //do something else
        }
    }
}
