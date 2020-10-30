package ywm.oms;

import com.wolf.Wolf;
import com.wolf.cloud.WolfCloudlet;
import com.wolf.security.config.ShiroFilterBuilder;
import com.wolf.security.config.WolfSecurityAutoConfiguration;
import com.wolf.security.config.WolfSecurityConfigurerAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import ywm.library.shared.security.SecurityService;
import ywm.library.shared.security.SecurityUserFilter;
import ywm.oms.websocket.HandShakeInterceptor;
import ywm.oms.websocket.WolfWebSocketHandler;

/**
 * Created by Herbert Yu on 2019-08-14 17:41
 */
@Wolf.BootApplication(name = "oms")
@EnableFeignClients() //basePackages = {"ywm"}
@EnableWebSocket
public class OmsCloudlet extends WolfSecurityConfigurerAdapter implements WolfCloudlet, WebSocketConfigurer {

    @Autowired
    private SecurityService securityService;

    public static void main(String[] args) {
        Wolf.run(OmsCloudlet.class, args);
    }


    @Bean
    public WebSocketHandler webSocketHandlerRegist() {
        return new WolfWebSocketHandler();
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(webSocketHandlerRegist(), "/ws")
                .addInterceptors(new HandShakeInterceptor()).setAllowedOrigins("*");
    }

    @Override
    public void configureShiroFilter(ShiroFilterBuilder builder) {
        builder.withUserFilter(new SecurityUserFilter(getApplicationContext(),
                getSecurityProperties().getSessionKey()));
    }
}
