package controller.front;

import com.jfinal.core.Controller;
import com.wxb.ext.route.ControllerBind;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by 0 on 2017-10-30.
 */
@ControllerBind(controllerKey = "/", viewPath = "/WEB-INF/view/front/")
public class IndexController extends Controller{

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    public void index(){
        logger.info("进入首页");
        render("index.ftl");
    }
}

