package vn.vnpt.stc.enterprise.jpa.umgr.repositories;

import org.springframework.stereotype.Repository;
import vn.vnpt.stc.enterprise.jpa.CustomJpaRepository;
import vn.vnpt.stc.enterprise.jpa.umgr.models.PaymentPackage;

@Repository
public interface PaymentPackageRepository extends CustomJpaRepository<PaymentPackage, Long> {
}
