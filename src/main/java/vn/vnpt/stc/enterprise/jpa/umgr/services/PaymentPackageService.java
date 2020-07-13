package vn.vnpt.stc.enterprise.jpa.umgr.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.vnpt.stc.enterprise.jpa.CrudService;
import vn.vnpt.stc.enterprise.jpa.umgr.models.PaymentPackage;
import vn.vnpt.stc.enterprise.jpa.umgr.repositories.PaymentPackageRepository;

@Service
public class PaymentPackageService extends CrudService<PaymentPackage, Long> {
    public static final Logger logger = LoggerFactory.getLogger(PaymentPackageService.class);

    @Autowired
    private PaymentPackageRepository paymentPackageRepository;

    @Autowired
    public PaymentPackageService(PaymentPackageRepository repository) {
        super(PaymentPackage.class);
        this.repository = this.paymentPackageRepository = repository;
    }

}
