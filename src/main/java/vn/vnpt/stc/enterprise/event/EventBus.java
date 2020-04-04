package vn.vnpt.stc.enterprise.event;

import vn.vnpt.stc.enterpise.commons.event.Event;
import vn.vnpt.stc.enterprise.event.amqp.AMQPEventPublisher;

public interface EventBus {
    public void registerSubscriber(AMQPSubscriber subscriber);
    public Event publish(String routingKey, Event event);
    public Event publish(String topicExchange, String routingKey, Event event);
    public AMQPEventPublisher registerPublisher(String topicExchange);
}
