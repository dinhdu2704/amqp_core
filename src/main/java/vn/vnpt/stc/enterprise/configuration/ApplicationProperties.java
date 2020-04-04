package vn.vnpt.stc.enterprise.configuration;


import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(
        prefix = "application",
        ignoreUnknownFields = false
)
public class ApplicationProperties {

    private Activation activation;
    private String subNameQueue;
    private Long timeAfterSoftDelete;
    private TokenTime tokenTime;

    public ApplicationProperties() {
    }

    public Activation getActivation() {
        return activation;
    }

    public void setActivation(Activation activation) {
        this.activation = activation;
    }

    public String getSubNameQueue() {
        return subNameQueue;
    }

    public void setSubNameQueue(String subNameQueue) {
        this.subNameQueue = subNameQueue;
    }

    public TokenTime getTokenTime() {
        return tokenTime;
    }

    public void setTokenTime(TokenTime tokenTime) {
        this.tokenTime = tokenTime;
    }

    public static class Activation {
        private long expirePeriodActiveMail;
        private long expirePeriodResetPassword;
        private boolean enableMail;

        public long getExpirePeriodActiveMail() {
            return expirePeriodActiveMail;
        }

        public void setExpirePeriodActiveMail(long expirePeriodActiveMail) {
            this.expirePeriodActiveMail = expirePeriodActiveMail;
        }

        public long getExpirePeriodResetPassword() {
            return expirePeriodResetPassword;
        }

        public void setExpirePeriodResetPassword(long expirePeriodResetPassword) {
            this.expirePeriodResetPassword = expirePeriodResetPassword;
        }

        public boolean isEnableMail() {
            return enableMail;
        }

        public void setEnableMail(boolean enableMail) {
            this.enableMail = enableMail;
        }
    }

    public static class TokenTime{
        private long remember;
        private long noRemember;

        public long getRemember() {
            return remember;
        }

        public void setRemember(long remember) {
            this.remember = remember;
        }

        public long getNoRemember() {
            return noRemember;
        }

        public void setNoRemember(long noRemember) {
            this.noRemember = noRemember;
        }
    }

    public Long getTimeAfterSoftDelete() {
        return timeAfterSoftDelete;
    }

    public void setTimeAfterSoftDelete(Long timeAfterSoftDelete) {
        this.timeAfterSoftDelete = timeAfterSoftDelete;
    }

}
