package ywm.oms;

import com.wolf.Wolf;
import com.wolf.cloud.WolfCloudlet;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import ywm.oms.websocket.HandShakeInterceptor;
import ywm.oms.websocket.WolfWebSocketHandler;

/**
 * Created by Herbert Yu on 2019-08-14 17:41
 */
@Wolf.BootApplication(name = "oms")
@EnableFeignClients
@EnableWebSocket
public class OmsCloudlet implements WolfCloudlet, WebSocketConfigurer {

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
}
