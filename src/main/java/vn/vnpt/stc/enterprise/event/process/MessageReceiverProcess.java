package vn.vnpt.stc.enterprise.event.process;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import vn.vnpt.stc.enterpise.commons.constants.QueueConstants;
import vn.vnpt.stc.enterpise.commons.constants.QueueConstants.ResultStatus;
import vn.vnpt.stc.enterpise.commons.constants.RoutingKeyConstants;
import vn.vnpt.stc.enterpise.commons.event.Event;
import vn.vnpt.stc.enterprise.event.AMQPSubscribes;
import vn.vnpt.stc.enterprise.event.cache.cmd.MessageFactory;

@Component
public class MessageReceiverProcess {
    private final Logger logger = LoggerFactory.getLogger(MessageReceiverProcess.class);

    //processing internal event receive from module user
    @AMQPSubscribes(exchange = QueueConstants.TOPIC_EXCHANGE_INTERNAL, queue = "enterprise-core-system-user", routingKey = RoutingKeyConstants.ROUTING_KEY_USER)
    @SuppressWarnings("unused")
    public void processMessageReceiverFromUserModule(Event event) {
        process(event);
    }

    //processing internal event receive from module tenant
    @AMQPSubscribes(exchange = QueueConstants.TOPIC_EXCHANGE_INTERNAL, queue = "enterprise-core-system-tenant", routingKey = RoutingKeyConstants.ROUTING_KEY_TENANT)
    @SuppressWarnings("unused")
    public void processMessageReceiverFromTenantModule(Event event) {
        process(event);
    }

    private void process(Event event){
        String requestId = event.id;

        MessageProcess message = MessageFactory.getMessage(requestId);
        if (message != null) {
            message.setResponseMsg("OK");
            logger.info("ResponseMsg: #{}", message.getResponseMsg());
            if (ResultStatus.SUCCESS == event.errorCode) {
                message.receiveResult(event);
            } else {
                message.receiveError("1", "test", event);
            }
        } else {
            logger.warn("Not found MessageProcess with #{}", requestId);
        }
    }
}
