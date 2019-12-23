package ywm.oms.controller;

import com.wolf.lang.helper.Maps;
import com.wolf.lang.helper.Strings;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ywm.oms.websocket.WolfWebSocketHandler;

import java.util.Arrays;
import java.util.Map;

//import ywm.oms.websocket.WSServer;

/**
 * Created by Herbert Yu on 2019-12-16 13:04
 * 使用 WebSocket 向前端推送消息
 * 有两种方式第二种基于注解的已被注释
 */
@RequestMapping("/websocket")
@RestController
public class WSCenterController extends BaseController {


    private static final String ALL = "@all";

    /**
     * 指定会话ID发消息
     */
    @RequestMapping(value = "/push", method = RequestMethod.POST)
    public Map sendOneMessage(@RequestParam(required = true) String message,
                              @RequestParam(required = true) String users) {
        if (Strings.equals(ALL, users)) {
            WolfWebSocketHandler.sendMessage(Maps.of("payload", message));
        } else {
            String[] receivers = Strings.split(users, "|");
//            String[] receivers = users.split("|");
            if (null != receivers && receivers.length > 0) {
                Arrays.stream(receivers).forEach(user -> {
                    WolfWebSocketHandler.sendMessage(Maps.of("payload", message), user);
                });
            }
        }
        return Maps.of("success", true);
    }
}
