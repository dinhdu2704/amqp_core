package vn.vnpt.stc.enterprise;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.EnableScheduling;
import vn.vnpt.stc.enterprise.configuration.ApplicationProperties;

@SpringBootApplication(
        exclude = {MongoAutoConfiguration.class, MongoDataAutoConfiguration.class}
)
@EnableScheduling
@EnableConfigurationProperties(ApplicationProperties.class)
public class StcEnterpriseCoreSmartFarm {
    private static Logger logger = LoggerFactory.getLogger(StcEnterpriseCoreSmartFarm.class);

    @EventListener(ApplicationReadyEvent.class)
    public void doSomethingAfterStartup() {
        logger.info("#{} have just started up", StcEnterpriseCoreSmartFarm.class.getSimpleName());
    }
    public static void main(String[] args) {
        SpringApplication.run(StcEnterpriseCoreSmartFarm.class, args);
    }

}
