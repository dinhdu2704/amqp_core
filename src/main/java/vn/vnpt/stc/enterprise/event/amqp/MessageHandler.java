package vn.vnpt.stc.enterprise.event.amqp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import vn.vnpt.stc.enterpise.commons.constants.MethodConstants;
import vn.vnpt.stc.enterpise.commons.constants.QueueConstants;
import vn.vnpt.stc.enterpise.commons.constants.RoutingKeyConstants;
import vn.vnpt.stc.enterpise.commons.entities.jpa.umgr.User;
import vn.vnpt.stc.enterpise.commons.entities.security.UserPrincipal;
import vn.vnpt.stc.enterpise.commons.event.Event;
import vn.vnpt.stc.enterpise.commons.utils.ObjectMapperUtil;
import vn.vnpt.stc.enterprise.event.AMQPSubscriber;
import vn.vnpt.stc.enterprise.utils.RequestUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.HashSet;
import java.util.Set;

public class MessageHandler {
    private static final Logger logger = LoggerFactory.getLogger(MessageHandler.class);

    private ApplicationContext ctx;
    private AMQPSubscriber subscriber;

    public MessageHandler(ApplicationContext ctx, AMQPSubscriber subscriber) {
        this.ctx = ctx;
        this.subscriber = subscriber;
    }

    public void handleMessage(Event event) {
        Object instance = ctx.getBean(subscriber.getInstanceClass());

        if(event.token != null && !"undefined".equals(event.token) && !"".equals(event.token) && !"login".equals(event.method)
            && !"anonymousUser".equals(event.token)
        ){
            User user = getUserByToken(event.token);
            initSecurityInfo(event.token, user);
        }

        try {
            subscriber.getConsumeMethod().invoke(instance,event);
        } catch (IllegalAccessException e) {
            logger.error("Error handling event",e);
        } catch (InvocationTargetException e) {
            logger.error("Error handling event",e);
        }
    }

    private User getUserByToken(String token){
        Event event = new Event();
        event.method = MethodConstants.CURRENT_USER;
        event.payload = token;

        event = RequestUtils.amqp
                (QueueConstants.TOPIC_EXCHANGE_INTERNAL, RoutingKeyConstants.ROUTING_KEY_USER, event);

        return ObjectMapperUtil.objectMapper(event.payload, User.class);
    }

    private void initSecurityInfo(String token, User user){
        Set<GrantedAuthority> authorities = new HashSet<>();
        for(String scope : user.getAuthorities()){
            authorities.add(new SimpleGrantedAuthority(scope));
        }
        UserPrincipal principal = new UserPrincipal(user.getEmail(), "", authorities, null, user.getId());
        Authentication authentication = new UsernamePasswordAuthenticationToken(principal, token, authorities);
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }
}
