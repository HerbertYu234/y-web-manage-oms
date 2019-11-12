package ywm.oms;

import com.wolf.Wolf;
import com.wolf.cloud.WolfCloudlet;
import org.springframework.cloud.netflix.feign.EnableFeignClients;

/**
 * Created by Herbert Yu on 2019-08-14 17:41
 */
@Wolf.BootApplication(name = "oms")
@EnableFeignClients
public class OmsCloudlet implements WolfCloudlet {

    public static void main(String[] args) {
        Wolf.run(OmsCloudlet.class, args);
    }
}
