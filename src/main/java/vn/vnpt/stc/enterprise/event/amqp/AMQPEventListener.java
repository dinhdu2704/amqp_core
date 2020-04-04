package vn.vnpt.stc.enterprise.event.amqp;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.rabbit.listener.AbstractMessageListenerContainer;
import org.springframework.amqp.rabbit.listener.SimpleMessageListenerContainer;
import org.springframework.amqp.rabbit.listener.adapter.MessageListenerAdapter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.ApplicationContext;
import org.springframework.util.ErrorHandler;
import vn.vnpt.stc.enterprise.configuration.ApplicationProperties;
import vn.vnpt.stc.enterprise.configuration.SpringContext;
import vn.vnpt.stc.enterprise.event.AMQPSubscriber;

public class AMQPEventListener extends AMQPAbstractConfiguration {
    private static final Logger logger = LoggerFactory.getLogger(AMQPEventListener.class);
    private Queue queue;
    public AMQPSubscriber subscriber;
    private AbstractMessageListenerContainer listenerContainer;
    private ApplicationContext ctx;

    public AMQPEventListener(CachingConnectionFactory connectionFactory, ApplicationContext ctx, AMQPSubscriber subscriber) {
        this.CONNECTION_FACTORY = connectionFactory;
        this.subscriber = subscriber;
        this.ctx = ctx;
        this.listenerContainer = messageListenerContainer();
        if ((subscriber.getExchange() != null) && (!subscriber.getExchange().isEmpty())){
            this.topicExchangeName = subscriber.getExchange();
        } else {
            this.topicExchangeName = TOPIC_EXCHANGE_NAME_DEFAULT;
        }
        amqpAdmin().declareBinding(eventBinding());
    }

    @Override
    public void configureRabbitTemplate(RabbitTemplate template) {

    }

    private ApplicationProperties getApplicationProperties(){
        return SpringContext.getBean(ApplicationProperties.class);
    }

    public final Binding eventBinding() {
        Binding binding;
        amqpAdmin().declareExchange(topicExchange(this.topicExchangeName));
        binding = BindingBuilder.bind(eventQueue()).to(topicExchange(this.topicExchangeName)).with(subscriber.getRoutingKey());
        return binding;
    }

    public final SimpleMessageListenerContainer messageListenerContainer() {
        SimpleMessageListenerContainer container = new SimpleMessageListenerContainer(connectionFactory());
        container.setMessageListener(messageListenerAdapter());
        container.setErrorHandler(new SimpleErrorHandler());
        container.setQueues(eventQueue());

        container.setConcurrentConsumers(subscriber.getConcurrency());
        container.afterPropertiesSet();
        container.start();

        return container;
    }

    public Queue eventQueue() {
        if (queue == null) {
            if (subscriber.getQueue().equals("")) {
                queue = amqpAdmin().declareQueue();
            } else {
                queue = new Queue(subscriber.getQueue() + "-" + getApplicationProperties().getSubNameQueue());
                amqpAdmin().declareQueue(queue);
            }
        }
        return queue;
    }

    public MessageListenerAdapter messageListenerAdapter() {
        return new MessageListenerAdapter(new MessageHandler(ctx, subscriber), jsonMessageConverter());
    }

    public class SimpleErrorHandler implements ErrorHandler {

        @Override
        public void handleError(Throwable throwable) {
            logger.error(throwable.getMessage(),throwable);
        }
    }

    public MessageConverter jsonMessageConverter() {
        return new JsonMessageConverter(subscriber.getEventType());
    }
}
