package controller;

import cn.dreampie.log.Slf4jLogFactory;
import com.jfinal.config.*;
import com.jfinal.log.Log4jLogFactory;
import com.jfinal.plugin.activerecord.SqlReporter;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.wxb.ext.plugin.quartz.QuartzPlugin;
import com.wxb.ext.plugin.tablebind.AutoTableBindPlugin;
import com.wxb.ext.route.AutoBindRoutes;
import constant.ErrorConstant;
import controller.Interceptor.ProjectInteceptor;
import controller.model.BaseModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tool.qiniu.QiNiuApi;

import java.util.Properties;

/**
 * Created by kz on 2017-10-30.
 */
public class ProjectConfig extends JFinalConfig {
    private final Logger logger = LoggerFactory.getLogger(ProjectConfig.class);

    private Routes routes;
    public static Properties properties;
    private boolean isDev = isDevMode();

    private boolean isDevMode() {
        String osName = System.getProperty("os.name");
        logger.info("osName:" + osName);
        return osName.indexOf("Windows") != -1;
    }

    @Override
    public void configConstant(Constants me) {
        properties = loadPropertyFile("config.properties");
        me.setDevMode(isDev);
        me.setFreeMarkerTemplateUpdateDelay(0);
        if (!isDev) {
            me.setError404View(ErrorConstant.VIEW_ERROR_404);
            me.setError401View(ErrorConstant.VIEW_ERROR_401);
            me.setError403View(ErrorConstant.VIEW_ERROR_403);
            me.setError500View(ErrorConstant.VIEW_ERROR_500);
        }
        //初始化 七牛
        try {
            new QiNiuApi(getProperty("up.access"), getProperty("up.secret"), getProperty("up.bucket"));
            logger.info("[init]七牛上传服务 初始化#SUCCESS");
        } catch (Exception e) {
            logger.error("[init]七牛服务初始化--->异常 #ERROR  ", e);
        }
    }

    @Override
    public void configRoute(Routes me) {
        this.routes = me;
        // 自动扫描 建议用注解
        me.add(new AutoBindRoutes().autoScan(false));
    }


    @Override
    public void configPlugin(Plugins me) {
        DruidPlugin druidPlugin = new DruidPlugin(getProperty("jdbc.url"), getProperty("jdbc.user"), getProperty("jdbc.pwd"));
        logger.info("[init]druid 启动#SUCCESS");
        me.add(druidPlugin);

        // 配置自定义的扩展插件--AutoTableBindPlugin插件
        AutoTableBindPlugin atbp = new AutoTableBindPlugin(druidPlugin);
        if (isDev) {
            atbp.setShowSql(true);
        }
        atbp.addExcludeClasses(BaseModel.class);
        atbp.autoScan(true);
        me.add(atbp);
        logger.info("[init]AutoTableBindPlugin 启动#SUCCESS");
        EhCachePlugin ehCachePlugin = new EhCachePlugin();
        me.add(ehCachePlugin);
        logger.info("[init]EhCachePlugin 启动#SUCCESS");
        me.add(new QuartzPlugin("job.properties"));
        logger.info("[init]定时器插件 启动#SUCCESS");
        SqlReporter.setLog(true);

    }

    @Override
    public void configInterceptor(Interceptors me) {
        me.add(new ProjectInteceptor());
        logger.info("[init]拦截器启动成功！");
    }

    @Override
    public void configHandler(Handlers me) {

    }
}
