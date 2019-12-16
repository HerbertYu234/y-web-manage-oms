package ywm.oms.websocket;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.wolf.lang.helper.Maps;
import com.wolf.lang.serializer.json.WolfJson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by Herbert Yu on 2019-12-16 13:46
 */
public class WolfWebSocketHandler implements WebSocketHandler {

    private static ConcurrentHashMap<String, WebSocketSession> webSocketManager = new ConcurrentHashMap<>();

    private final Logger logger = LoggerFactory.getLogger(WolfWebSocketHandler.class);

    private String getWebSocketSessionId(WebSocketSession session) {
//        Map<String, Object> attributes = session.getAttributes();
//        Object id = attributes.get("id");
//        Objects.requireNonNull(id, "id不能为空！");
//        return (String) id;
        return session.getId();
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        getWebSocketManager().put(getWebSocketSessionId(session), session);
        logger.info("[WebSocket] 连接建立. 当前连接数:{} ", getCurrentSize());

        sendMessage(Maps.of("socketSessionId", session.getId()), session.getId());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        getWebSocketManager().remove(getWebSocketSessionId(session));
        logger.info("[WebSocket] 关闭连接. 当前连接数:{}", getCurrentSize());
    }

    @Override
    public void handleMessage(WebSocketSession wsSession, WebSocketMessage<?> message) throws Exception {
        logger.info("[WebSocket] 收到消息: " + message.toString());
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        logger.error("[WebSocket] 异常！[{}]. disconnecting....", exception.getMessage(), exception);
        if (session.isOpen()) {
            session.close();
        }
        getWebSocketManager().remove(session.getId());
    }

    /*
     * 是否支持消息拆分发送：如果接收的数据量比较大，最好打开(true), 否则可能会导致接收失败。
     * 如果出现WebSocket连接接收一次数据后就自动断开，应检查是否是这里的问题。
     */
    @Override
    public boolean supportsPartialMessages() {
        return true;
    }


    public static ConcurrentHashMap<String, WebSocketSession> getWebSocketManager() {
        return webSocketManager;
    }

    public int getCurrentSize() {
        return getWebSocketManager().size();
    }


    public static void sendMessage(Map<String, Object> message) {
        try {
            String jsonMsg = WolfJson.objectMapper().writeValueAsString(message);
            sendMessage(jsonMsg);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    public static void sendMessage(Map<String, Object> message, String key) {
        try {
            String jsonMsg = WolfJson.objectMapper().writeValueAsString(message);
            sendMessage(jsonMsg, key);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }


    public static void sendMessage(String message) {
        for (WebSocketSession session : getWebSocketManager().values()) {
            sendMessage(session, message);
        }
    }

    public static void sendMessage(String message, String key) {
        WebSocketSession session = getWebSocketManager().get(key);
        sendMessage(session == null ? null : session, message);
    }

    public static void sendMessage(byte[] payload) {
        for (WebSocketSession session : getWebSocketManager().values()) {
            sendMessage(session, payload);
        }
    }

    public static void sendMessage(byte[] payload, String key) {
        WebSocketSession session = getWebSocketManager().get(key);
        sendMessage(session == null ? null : session, payload);
    }

    private static void sendMessage(WebSocketSession session, byte[] payload) {
        sendMessage(session, new BinaryMessage(payload));
    }

    private static void sendMessage(WebSocketSession session, String message) {
        sendMessage(session, new TextMessage(message));
    }

    private static void sendMessage(WebSocketSession session, WebSocketMessage<?> message) {
        try {
            if (null != session) {
                session.sendMessage(message);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
