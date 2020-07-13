package vn.vnpt.stc.enterprise.jpa.umgr.endpoints;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import vn.vnpt.stc.enterpise.commons.event.Event;
import vn.vnpt.stc.enterprise.event.EventBus;
import vn.vnpt.stc.enterprise.jpa.CrudEndpoint;
import vn.vnpt.stc.enterprise.jpa.umgr.models.PaymentPackage;
import vn.vnpt.stc.enterprise.jpa.umgr.services.PaymentPackageService;

@Component
public class PaymentPackageEndpoint extends CrudEndpoint<PaymentPackage, Long> {
    private static Logger logger = LoggerFactory.getLogger(PaymentPackageEndpoint.class);

    @Autowired
    public PaymentPackageEndpoint(PaymentPackageService service, EventBus eventBus) {
        super(service, eventBus);
    }

    public void process(Event event) {
        logger.info("#{} receive method: #{}", this.getClass().getSimpleName(), event.method);
        super.process(event);
    }
}
