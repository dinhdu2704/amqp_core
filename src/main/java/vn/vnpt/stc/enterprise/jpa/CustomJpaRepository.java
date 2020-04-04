package vn.vnpt.stc.enterprise.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;
import vn.vnpt.stc.enterpise.commons.entities.jpa.core.IdEntity;

import java.io.Serializable;

/**
 * Created by huyvv
 * Date: 16/01/2020
 * Time: 11:00 AM
 * for all issues, contact me: huyvv@vnpt-technology.vn
 **/
@NoRepositoryBean
public interface CustomJpaRepository<T extends IdEntity, ID extends Serializable> extends JpaRepository<T,ID>, JpaSpecificationExecutor<T> {
}
