package vn.vnpt.stc.enterprise.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vn.vnpt.stc.enterpise.commons.event.Event;
import vn.vnpt.stc.enterprise.event.process.MessageProcess;

/**
 * Created by huyvv
 * Date: 19/01/2020
 * Time: 9:06 PM
 * for all issues, contact me: huyvv@vnpt-technology.vn
 **/
public class RequestUtils {

    private static Logger logger = LoggerFactory.getLogger(RequestUtils.class);

    private RequestUtils() {
    }

    public static Event amqp(String exchange, String routingKey, Event event) {
        event.token = SecurityUtils.getCurrentUserJWT();
        MessageProcess messageProcess = new MessageProcess();
        messageProcess.setRoutingKey(routingKey);
        messageProcess.setExchange(exchange);
        messageProcess.setEvent(event);
        try {
            messageProcess.process();
        } catch (Exception ex) {
            logger.error(ex.toString());
            return event;
        }
        return messageProcess.getEvent();
    }
}
