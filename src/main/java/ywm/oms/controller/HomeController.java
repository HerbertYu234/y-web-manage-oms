package ywm.oms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by Herbert Yu on 2019-11-17 13:45
 */
@Controller
public class HomeController extends BaseController {

    @GetMapping(value = {"", "/"})
    public Object index() {
        return "/index";
    }
}
