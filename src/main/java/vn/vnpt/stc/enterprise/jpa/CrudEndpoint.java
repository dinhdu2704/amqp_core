package vn.vnpt.stc.enterprise.jpa;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vn.vnpt.stc.enterpise.commons.constants.QueueConstants;
import vn.vnpt.stc.enterpise.commons.constants.RoutingKeyConstants;
import vn.vnpt.stc.enterpise.commons.entities.jpa.core.IdEntity;
import vn.vnpt.stc.enterpise.commons.event.Event;
import vn.vnpt.stc.enterprise.event.EventBus;

import java.io.Serializable;

/**
 * Created by huyvv
 * Date: 16/01/2020
 * Time: 11:00 AM
 * for all issues, contact me: huyvv@vnpt-technology.vn
 **/
public abstract class CrudEndpoint<T extends IdEntity, ID extends Serializable> {

    @SuppressWarnings("unused")
    private static Logger logger = LoggerFactory.getLogger(CrudEndpoint.class);

    protected CrudService<T,ID> service;
    protected EventBus eventBus;

    public CrudEndpoint(CrudService service, EventBus eventBus) {
        this.service = service;
        this.eventBus = eventBus;
    }

    public void process(Event event){
        event = service.process(event);
        eventBus.publish(QueueConstants.TOPIC_EXCHANGE_EXTERNAL, RoutingKeyConstants.HTTP_GW_ROUTING_KEY, event);
    }
}
