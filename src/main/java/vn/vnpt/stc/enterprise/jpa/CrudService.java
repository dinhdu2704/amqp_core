package vn.vnpt.stc.enterprise.jpa;


import cz.jirutka.rsql.parser.RSQLParser;
import cz.jirutka.rsql.parser.RSQLParserException;
import cz.jirutka.rsql.parser.ast.Node;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;
import vn.vnpt.stc.enterpise.commons.constants.Constants;
import vn.vnpt.stc.enterpise.commons.constants.MethodConstants;
import vn.vnpt.stc.enterpise.commons.constants.QueueConstants;
import vn.vnpt.stc.enterpise.commons.entities.dto.IdInfo;
import vn.vnpt.stc.enterpise.commons.entities.dto.PageInfo;
import vn.vnpt.stc.enterpise.commons.entities.dto.SearchInfo;
import vn.vnpt.stc.enterpise.commons.entities.jpa.core.IdEntity;
import vn.vnpt.stc.enterpise.commons.errors.ErrorInfo;
import vn.vnpt.stc.enterpise.commons.errors.ErrorKey;
import vn.vnpt.stc.enterpise.commons.event.Event;
import vn.vnpt.stc.enterpise.commons.exceptions.RemoveSystemEntityException;
import vn.vnpt.stc.enterpise.commons.rsql.jpa.CustomRsqlVisitor;
import vn.vnpt.stc.enterpise.commons.utils.ObjectMapperUtil;
import vn.vnpt.stc.enterprise.utils.SecurityUtils;

import javax.persistence.EntityNotFoundException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;

/**
 * Created by huyvv
 * Date: 16/01/2020
 * Time: 11:00 AM
 * for all issues, contact me: huyvv@vnpt-technology.vn
 **/
@SuppressWarnings({"Duplicates", "unchecked"})
public class CrudService<T extends IdEntity, ID extends Serializable> {
    private static Logger logger = LoggerFactory.getLogger(CrudService.class);
    protected CustomJpaRepository<T,ID> repository;
    private final Class<T> typeParameterClass;

    public CrudService(Class<T> typeParameterClass) {
        this.typeParameterClass = typeParameterClass;
    }

    public Event process(Event event){
        switch (event.method){
            case MethodConstants.CREATE:
                return processCreate(event);
            case MethodConstants.UPDATE:
                return processUpdate(event);
            case MethodConstants.DELETE:
                return processDelete(event);
            case MethodConstants.BATCH_DELETE:
                return processBatchDelete(event);
            case MethodConstants.ACTIVE:
                return processActive(event);
            case MethodConstants.DE_ACTIVE:
                return processDeActive(event);
            case MethodConstants.GET_ONE:
                return processGetOne(event);
            case MethodConstants.GET_FULL:
                return processGetFull(event);
            case MethodConstants.SEARCH:
                return processSearch(event);
            case MethodConstants.SEARCH_FULL:
                return processSearchFull(event);
            default:
                event.errorCode = QueueConstants.ResultStatus.ERROR;
                return event;
        }
    }

    protected Event processCreate(Event event){
        T entity = ObjectMapperUtil.objectMapper(event.payload, typeParameterClass);
        event.payload = ObjectMapperUtil.toJsonString(create(entity));
        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    protected Event processUpdate(Event event){
        T entity = ObjectMapperUtil.objectMapper(event.payload, typeParameterClass);
        event.payload = ObjectMapperUtil.toJsonString(update((ID) entity.getId(), entity));
        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    protected Event processDelete(Event event){
        IdInfo idInfo = ObjectMapperUtil.objectMapper(event.payload, IdInfo.class);
        T entity = get((ID) idInfo.getId());
        //if entity created by system, can not remove
        if(Constants.SYSTEM.equalsIgnoreCase(entity.getCreatedBy())){
            event.errorCode = QueueConstants.ResultStatus.ERROR;
            ErrorInfo errorInfo= new ErrorInfo();
            errorInfo.setErrorKey(ErrorKey.CommonErrorKey.REMOVE_SYSTEM_ENTITY);
            event.payload = ObjectMapperUtil.toJsonString(errorInfo);
            return event;
        }
        try {
            deleteById((ID) idInfo.getId());
        } catch (DataIntegrityViolationException e){
            // catch foreign key
            event.errorCode = QueueConstants.ResultStatus.ERROR;
            ErrorInfo errorInfo= new ErrorInfo();
            errorInfo.setErrorKey(ErrorKey.CommonErrorKey.REMOVE_RELATIVE_ENTITY);
            event.payload = ObjectMapperUtil.toJsonString(errorInfo);
            return event;
        }

        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    protected Event processBatchDelete(Event event) {
        List<Long> ids = ObjectMapperUtil.listMapper(event.payload, Long.class);
        List<Long> fail = new ArrayList<>();
        for(Long id : ids){
            try{
                deleteById((ID) id);
            }catch (Exception ex){
                logger.error(ex.getMessage(), ex);
                fail.add(id);
            }
        }
        event.payload = ObjectMapperUtil.toJsonString(fail);
        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    protected Event processActive(Event event){
        IdInfo idInfo = ObjectMapperUtil.objectMapper(event.payload, IdInfo.class);
        activate((ID) idInfo.getId());
        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    protected Event processDeActive(Event event){
        IdInfo idInfo = ObjectMapperUtil.objectMapper(event.payload, IdInfo.class);
        deactivate((ID) idInfo.getId());
        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    protected Event processGetOne(Event event){
        IdInfo idInfo = ObjectMapperUtil.objectMapper(event.payload, IdInfo.class);
        event.payload = ObjectMapperUtil.toJsonString(get((ID) idInfo.getId()));
        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    protected Event processGetFull(Event event){
        IdInfo idInfo = ObjectMapperUtil.objectMapper(event.payload, IdInfo.class);
        event.payload = ObjectMapperUtil.toJsonString(getFull((ID) idInfo.getId()));
        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    protected Event processSearch(Event event){
        SearchInfo searchInfo = ObjectMapperUtil.objectMapper(event.payload, SearchInfo.class);
        String orders = searchInfo.getOrders();
        Pageable pageable;
        if(orders == null || "".equals(orders)){
            pageable = PageRequest.of(searchInfo.getPageNumber(), searchInfo.getPageSize());
        }else {
            pageable = PageRequest.of
                    (searchInfo.getPageNumber(), searchInfo.getPageSize(),
                            vn.vnpt.stc.enterpise.commons.utils.StringUtils.toSort(orders));
        }
        Page<T> page = search(searchInfo.getQuery(), pageable);
        PageInfo pageInfo = new PageInfo();
        pageInfo.setTotalCount(page.getTotalElements());
        pageInfo.setData(ObjectMapperUtil.toJsonString(page.getContent()));

        event.payload = ObjectMapperUtil.toJsonString(pageInfo);
        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    protected Event processSearchFull(Event event){
        SearchInfo searchInfo = ObjectMapperUtil.objectMapper(event.payload, SearchInfo.class);
        String orders = searchInfo.getOrders();
        Pageable pageable;
        if(orders == null || "".equals(orders)){
            pageable = PageRequest.of(searchInfo.getPageNumber(), searchInfo.getPageSize());
        }else {
            pageable = PageRequest.of
                    (searchInfo.getPageNumber(), searchInfo.getPageSize(),
                            vn.vnpt.stc.enterpise.commons.utils.StringUtils.toSort(orders));
        }
        Page<T> page = searchFull(searchInfo.getQuery(), pageable);
        PageInfo pageInfo = new PageInfo();
        pageInfo.setTotalCount(page.getTotalElements());
        pageInfo.setData(ObjectMapperUtil.toJsonString(page.getContent()));

        event.payload = ObjectMapperUtil.toJsonString(pageInfo);
        event.errorCode = QueueConstants.ResultStatus.SUCCESS;
        return event;
    }

    public T get(ID id) {
        T t = repository.findById(id).orElse(null);
        return t;
    }

    public T getFull(ID id) {
        T t = repository.findById(id).orElse(null);
        return t;
    }

    public List<T> findAll() {
        return repository.findAll();
    }

    public Page<T> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    public List<T> search(String query) {
        if(StringUtils.isEmpty(query)){
            return repository.findAll();
        }
        Node rootNode = new RSQLParser().parse(query);
        Specification<T> spec = rootNode.accept(new CustomRsqlVisitor<T>());
        return repository.findAll(spec);
    }

    public Page<T> search(String query, Pageable pageable) {
        return searchByQuery(query, pageable);
    }

    public Page<T> searchFull(String query, Pageable pageable) {
        return searchByQuery(query, pageable);
    }

    public Page<T> searchByQuery(String query, Pageable pageable){
        if(StringUtils.isEmpty(query)){
            return repository.findAll(pageable);
        }
        try {
            Node rootNode = new RSQLParser().parse(query);
            Specification<T> spec = rootNode.accept(new CustomRsqlVisitor<T>());
            return repository.findAll(spec, pageable);
        } catch(RSQLParserException pe) {
            logger.error("SEARCH FAIL: {}",query);
            logger.error(pe.getMessage(), pe);
            return emptyPage();
        } catch (Exception e) {
            logger.error("SEARCH FAIL: {}",query);
            logger.error(e.getMessage(), e);
            return emptyPage();
        }
    }

    public T create(T entity) {
        beforeCreate(entity);
        repository.save(entity);
        afterCreate(entity);
        return entity;
    }

    public T update(ID id, T entity) {
        beforeUpdate(entity);
        T old = get(id);
        if(entity.getCreated() == null) entity.setCreated(old.getCreated());
        if(entity.getCreatedBy() == null) entity.setCreatedBy(old.getCreatedBy());
        if(old == null) {
            throw new EntityNotFoundException("No entity with id " + id);
        }
        repository.save(entity);
        afterUpdate(old,entity);
        return entity;
    }

    public void delete(T entity) {
        if(entity.getCreatedBy()!= null && entity.getCreatedBy().equals(Constants.SYSTEM)){
            throw new RemoveSystemEntityException();
        }
        beforeDelete(entity);
        repository.delete(entity);
        afterDelete(entity);
    }

    public void deleteById(ID id) {
        T entity = get(id);
        if(entity.getCreatedBy()!= null && entity.getCreatedBy().equals(Constants.SYSTEM)){
            throw new RemoveSystemEntityException();
        }
        delete(entity);
    }

    public Long count() {
        return repository.count();
    }

    protected void beforeCreate(T entity) {
        entity.setCreated(System.currentTimeMillis());
        if(entity.getCreatedBy() == null) {
            String currentUsername = SecurityUtils.getCurrentUserLogin();
            entity.setCreatedBy(currentUsername);
        }
        if(entity.getActive() == null) {
            entity.setActive(Constants.EntityStatus.ACTIVE);
        }
    }

    protected void afterCreate(T entity) {
        //do something after create
    }

    protected void beforeUpdate(T entity) {
        entity.setUpdated(System.currentTimeMillis());
        entity.setUpdatedBy(SecurityUtils.getCurrentUserLogin());
        if(entity.getActive() == null) {
            entity.setActive(Constants.EntityStatus.ACTIVE);
        }
    }

    protected void afterUpdate(T old, T updated) {
        //do something after update
    }

    protected void beforeDelete(T entity) {
        //do something before delete
    }

    protected void afterDelete(T entity) {
        //do something after delete
    }

    public Page<T> emptyPage() {
        return new Page<T>() {
            @Override
            public int getTotalPages() {
                return 0;
            }

            @Override
            public long getTotalElements() {
                return 0;
            }

            @Override
            public <U> Page<U> map(Function<? super T, ? extends U> function) {
                return null;
            }

            @Override
            public int getNumber() {
                return 0;
            }

            @Override
            public int getSize() {
                return 0;
            }

            @Override
            public int getNumberOfElements() {
                return 0;
            }

            @Override
            public List<T> getContent() {
                return new ArrayList<>();
            }

            @Override
            public boolean hasContent() {
                return false;
            }

            @Override
            public Sort getSort() {
                return null;
            }

            @Override
            public boolean isFirst() {
                return false;
            }

            @Override
            public boolean isLast() {
                return false;
            }

            @Override
            public boolean hasNext() {
                return false;
            }

            @Override
            public boolean hasPrevious() {
                return false;
            }

            @Override
            public Pageable nextPageable() {
                return null;
            }

            @Override
            public Pageable previousPageable() {
                return null;
            }

            @Override
            public Iterator<T> iterator() {
                return null;
            }
        };
    }

    public void activate(ID id) {
        T t = repository.findById(id).orElse(null);

        if(t != null) {
            t.setActive(Constants.EntityStatus.ACTIVE);
            update(id, t);
        }
    }

    public void deactivate(ID id) {
        T t = repository.findById(id).orElse(null);
        if(t != null) {
            t.setActive(Constants.EntityStatus.IN_ACTIVE);
            update(id, t);
        }
    }
}
