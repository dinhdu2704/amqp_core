package vn.vnpt.stc.enterprise.jpa.umgr.models;

import vn.vnpt.stc.enterpise.commons.entities.jpa.core.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "payment_packages")
public class PaymentPackage extends IdEntity {
    private Long userId;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
