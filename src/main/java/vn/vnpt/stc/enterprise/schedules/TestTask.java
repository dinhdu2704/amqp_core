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

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@Component
public class TestTask {
    public static void main(String[] args) {
        String myDate = "1970/01/01 00:00:00";
        LocalDateTime localDateTime = LocalDateTime.parse(myDate,
                DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss") );

        long millis = localDateTime
                .atZone(ZoneId.systemDefault())
                .toInstant().toEpochMilli();

        System.out.println("millis = " + millis);
    }
}
