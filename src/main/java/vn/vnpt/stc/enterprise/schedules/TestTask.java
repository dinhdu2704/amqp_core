package vn.vnpt.stc.enterprise.schedules;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import vn.vnpt.stc.enterpise.commons.constants.MethodConstants;
import vn.vnpt.stc.enterpise.commons.constants.QueueConstants;
import vn.vnpt.stc.enterpise.commons.constants.RoutingKeyConstants;
import vn.vnpt.stc.enterpise.commons.entities.jpa.umgr.ObjectList;
import vn.vnpt.stc.enterpise.commons.entities.jpa.umgr.User;
import vn.vnpt.stc.enterpise.commons.event.Event;
import vn.vnpt.stc.enterpise.commons.utils.ObjectMapperUtil;
import vn.vnpt.stc.enterprise.utils.RequestUtils;

@Component
public class TestTask {
    //@Scheduled(fixedRate = 100000L)
    public void test1(){
        Event event = new Event();
        event.method = MethodConstants.CURRENT_USER;
        event.payload = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0dWFubnA0QG1haWxpbmF0b3IuY29tIiwiZXhwIjoxNTg4NDg4MzM4LCJ1c2VyX2lkIjoyMTQsInNjb3BlIjpbIlJPTEVfRkFSTV9BRE1JTiJdLCJ0ZW5hbnRfaWRzIjpbMTcsMjMsMjQsMjUsMjYsMjcsMjgsMjksMzBdfQ.hRaqITO-urLDxsfKfryGnBVHsx2WALEyXKkg_uG90Xc0il-gNhKncgMuSRgEXtgAO6B-UMHZJ1tmsofnmj_wNA";

        event = RequestUtils.amqp
                (QueueConstants.TOPIC_EXCHANGE_INTERNAL, RoutingKeyConstants.ROUTING_KEY_USER, event);

        User user =  ObjectMapperUtil.objectMapper(event.payload, User.class);
    }

    //@Scheduled(fixedRate = 100000L)
    public void test2(){
        Long userId = 215L;
        Event event = new Event();
        event.payload = userId.toString();
        event.method = MethodConstants.GET_TENANTS_OF_USER;
        event = RequestUtils.amqp
                (QueueConstants.TOPIC_EXCHANGE_INTERNAL, RoutingKeyConstants.ROUTING_KEY_TENANT, event);
        ObjectList o = ObjectMapperUtil.objectMapper(event.payload, ObjectList.class);
    }

    //@Scheduled(fixedRate = 100000L)
    public void test3(){
        Long userId = 214L;
        Event event = new Event();
        event.payload = userId.toString();
        event.method = MethodConstants.GET_TENANTS_OF_FARM_ADMIN;
        event = RequestUtils.amqp
                (QueueConstants.TOPIC_EXCHANGE_INTERNAL, RoutingKeyConstants.ROUTING_KEY_TENANT, event);
        ObjectList o = ObjectMapperUtil.objectMapper(event.payload, ObjectList.class);
    }
}
