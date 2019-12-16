//package ywm.oms.websocket;
//
//import com.wolf.lang.helper.Strings;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//
//import javax.websocket.OnClose;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.Session;
//import javax.websocket.server.PathParam;
//import javax.websocket.server.ServerEndpoint;
//import java.io.IOException;
//import java.util.concurrent.ConcurrentHashMap;
//
///**
// * Created by Herbert Yu on 2019-12-16 10:42
// *
// * ServerEndpoint
// * 这个注解用于标识作用在类上，它的主要功能是把当前类标识成一个WebSocket的服务端
// *  注解的值用户客户端连接访问的URL地址
// */
//@ServerEndpoint(value = "/ws/{id}")
//@Component
//public class WSServer {
//
//    private Logger logger = LoggerFactory.getLogger(WSServer.class);
//
//    /**
//     * 与某个客户端的连接会话，需要通过它来与客户端进行数据收发
//     */
//    private Session session;
//
//    /**
//     * 标识当前连接客户端的唯一标识
//     */
//    private String id;
//
//    /**
//     * 用于存所有的连接服务的客户端，这个对象存储是安全的
//     */
//    private static ConcurrentHashMap<String, WSServer> webSocketManager = new ConcurrentHashMap<>();
//
//
//    @OnOpen
//    public void OnOpen(Session session, @PathParam(value = "id") String id) {
//        this.session = session;
//        this.id = id; // id是用来表示唯一客户端，如果需要指定发送，需要指定发送通过id来区分
//        webSocketManager.put(id, this);
//        logger.info("[WebSocket] 连接成功，当前连接人数为：={}", webSocketManager.size());
//    }
//
//
//    @OnClose
//    public void OnClose() {
//        webSocketManager.remove(this.id);
//        logger.info("[WebSocket] 退出成功，当前连接人数为：={}", webSocketManager.size());
//    }
//
//
//    @OnMessage
//    public void onMessage(String message, Session session) {
//        logger.info("[WebSocket] 收到消息：{}", message);
////        sendMessage(session,message);
//    }
//
//
//    public static void sendMessage(String message, String id) {
//        if (Strings.isBlank(id)) {
//            for (String key : webSocketManager.keySet()) {
//                Session session = webSocketManager.get(key).session;
//                sendMessage(session, message);
//            }
//        } else {
//            WSServer wsServer = webSocketManager.get(id);
//            sendMessage(wsServer == null ? null : wsServer.session, message);
//        }
//    }
//
//
//    private static void sendMessage(Session session, String message) {
//        if (null != session && session.isOpen()) {
//            try {
//                session.getBasicRemote().sendText(message);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//
//
//}
