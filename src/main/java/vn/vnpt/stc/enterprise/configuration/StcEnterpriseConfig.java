package vn.vnpt.stc.enterprise.configuration;

import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import vn.vnpt.stc.enterprise.event.AMQPService;
import vn.vnpt.stc.enterprise.event.EventBus;
import vn.vnpt.stc.enterprise.event.amqp.AMQPEventBus;
import vn.vnpt.stc.enterprise.event.cache.ObjectCache;
import vn.vnpt.stc.enterprise.event.cache.RedisCache;
import vn.vnpt.stc.enterprise.event.cache.cmd.MessageSubscriber;

import javax.sql.DataSource;

@Configuration
@EnableAsync
@EnableAspectJAutoProxy
@EnableJpaRepositories("vn.vnpt.stc.enterprise.jpa")
@EnableTransactionManagement
public class StcEnterpriseConfig {
    /* ========================= RABBIT MQ ============================ */
    @Bean
    @ConfigurationProperties(prefix = "spring.rabbitmq")
    public CachingConnectionFactory connectionFactory() {
        return new CachingConnectionFactory();
    }

    @Bean
    public EventBus eventBus(CachingConnectionFactory connectionFactory, ApplicationContext ctx) {
        return new AMQPEventBus(connectionFactory, ctx);
    }

    @Bean
    public AMQPService amqpService(ApplicationContext ctx) {
        return new AMQPService(ctx);
    }

    /* ========================= Redis ============================ */
    @Bean
    @ConfigurationProperties(prefix = "spring.redis")
    public RedisConnectionFactory redisConnectionFactory() {
        return new JedisConnectionFactory();
    }

    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();
        redisTemplate.setConnectionFactory(redisConnectionFactory);
        return redisTemplate;
    }

    @Bean
    public ObjectCache systemCache(RedisTemplate redisTemplate) {
        return new RedisCache(redisTemplate);
    }

    @Bean
    MessageListenerAdapter messageListener() {
        return new MessageListenerAdapter(new MessageSubscriber());
    }

    @Bean
    RedisMessageListenerContainer redisContainer() {
        RedisMessageListenerContainer container
                = new RedisMessageListenerContainer();
        container.setConnectionFactory(redisConnectionFactory());
        container.addMessageListener(messageListener(), new PatternTopic("__keyevent@*__:set"));
        return container;
    }

    /* ========================= Mysql ============================ */
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    @Primary
    public DataSource dataSource() {
        return new DriverManagerDataSource();
    }
}
