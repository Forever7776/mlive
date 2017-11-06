package controller.Interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import tool.qiniu.ContextUtils;

import javax.servlet.http.HttpServletRequest;

public class ProjectInteceptor implements Interceptor {

    public void intercept(Invocation ai) {
        Controller cl = ai.getController();
        HttpServletRequest request = cl.getRequest();
        boolean isAjax = ContextUtils.isAjax(request);
        ai.invoke();
        if (!isAjax) {
            cl.setAttr("context", new ContextUtils());
            cl.setAttr("imgurl", ContextUtils.img());
            cl.setAttr("domain", ContextUtils.getHttpDomain());
        }
    }

}
