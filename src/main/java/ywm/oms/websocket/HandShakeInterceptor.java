package ywm.oms.websocket;

import com.wolf.lang.helper.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import java.util.Map;

/**
 * Created by Herbert Yu on 2019-12-16 13:51
 */
public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor {

    private final Logger logger = LoggerFactory.getLogger(HandShakeInterceptor.class);

    /*
     * 在WebSocket连接建立之前的操作，以鉴权为例
     */
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
                                   WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {

        logger.info("Handle before webSocket connected. ");

        // 获取url传递的参数，通过attributes在Interceptor处理结束后传递给WebSocketHandler
        // WebSocketHandler可以通过WebSocketSession的getAttributes()方法获取参数
        ServletServerHttpRequest serverRequest = (ServletServerHttpRequest) request;
        String key = serverRequest.getServletRequest().getParameter("key");
        String secret = serverRequest.getServletRequest().getParameter("secret");
        String type = serverRequest.getServletRequest().getParameter("type");

        if (valideWSToken(key, secret, type)) {
            logger.info("[WebSocket]验证通过, WebSocket connecting.... ");
            attributes.put("key", key);
            attributes.put("secret", secret);
            return super.beforeHandshake(request, response, wsHandler, attributes);
        } else {
            logger.error("[WebSocket]验证失败, WebSocket will not connect. ");
            response.setStatusCode(HttpStatus.UNAUTHORIZED);
            return false;
        }
    }


    private boolean valideWSToken(String key, String secret, String type) {
        return Strings.isNotBlank(key) && Strings.isNotBlank(secret);
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
                               WebSocketHandler wsHandler, Exception ex) {
        // 省略
        super.afterHandshake(request, response, wsHandler, ex);
    }
}
