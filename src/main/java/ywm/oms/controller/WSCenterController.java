package ywm.oms.controller;

import com.wolf.lang.helper.Maps;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ywm.oms.websocket.WolfWebSocketHandler;

import java.util.Map;

//import ywm.oms.websocket.WSServer;

/**
 * Created by Herbert Yu on 2019-12-16 13:04
 */
@RequestMapping("/websocket")
@RestController
public class WSCenterController extends BaseController {

    /**
     * 群发消息内容
     *
     * @param message
     * @return
     */
    @RequestMapping(value = "/sendAll", method = RequestMethod.GET)
    public Map sendAllMessage(@RequestParam(required = true) String message) {
        WolfWebSocketHandler.sendMessage(Maps.of("payload", message));
        return Maps.of("success", true);
    }


    /**
     * 指定会话ID发消息
     *
     * @param message 消息内容
     * @param id      连接会话ID
     * @return
     */
    @RequestMapping(value = "/sendOne", method = RequestMethod.GET)
    public Map sendOneMessage(@RequestParam(required = true) String message,
                              @RequestParam(required = true) String id) {
        WolfWebSocketHandler.sendMessage(Maps.of("payload", message), id);
        return Maps.of("success", true);
    }
}
