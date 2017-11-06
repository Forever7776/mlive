<#include "./public.ftl"/>
<#macro html title_="mlive" menu_=true upload_=false css_=[] app_=[] editor_=false script_=[] echarts=false datepicker_=false autocompleter_=false datetimepicker_=false nestable_=false chosen_=false>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <link rel="shortcut icon" href="/resources/images/favicon.ico">
    <title>${title_!''}</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <#if upload_>
        <link rel="stylesheet" href="http://cdn.bootcss.com/webuploader/0.1.1/webuploader.css">
    </#if>
    <#if datepicker_>
        <link rel="stylesheet" type="text/css"
              href="http://cdn.bootcss.com/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker3.min.css">
    </#if>
    <#if datetimepicker_>
        <link rel="stylesheet" type="text/css"
              href="//cdn.bootcss.com/bootstrap-datetimepicker/4.15.35/css/bootstrap-datetimepicker.min.css">
    </#if>
    <#if nestable_>
        <link rel="stylesheet" type="text/css" href="<@res u_="platform/js/nestable/jquery.nestable.css"/>">
    </#if>
    <#if chosen_>
        <link rel="stylesheet" type="text/css" href="<@res u_="scripts/chosen/chosen.min.css"/>">
    </#if>
    <#list css_ as li>
        <link rel="stylesheet" href="${li}">
    </#list>
</head>
<body class="sticky-header">
<#--<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>-->
<section>
    <!-- main content start-->
    <div style="background: #eff0f4;min-height: 500px;" id="iframe-main-tontent">
        <#nested />
    </div>
</section>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="<@res u_="js/tools/layer-v3.1/layer.js"/>"></script>
<script src="<@res u_="js/tools/ajaxfileupload.js"/>"></script>
<#--<script>layer.config({extend: ["extend/layer.ext.js", "skin/moon/style.css"], skin: "layer-ext-moon"});</script>-->
    <#if echarts>
    <script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
    </#if>
    <#if editor_>
    <script src="<@res u_="plug-in/editor/kindeditor-all.js"/>"></script>
    </#if>
    <#if upload_>
    <script src="http://cdn.bootcss.com/webuploader/0.1.1/webuploader.min.js"></script>
    </#if>
    <#if datepicker_>
    <script src="http://cdn.bootcss.com/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    </#if>
    <#if datetimepicker_>
    <script src="http://cdn.bootcss.com/moment.js/2.10.6/moment.min.js"></script>
    <script src="http://cdn.bootcss.com/moment.js/2.10.6/locale/zh-cn.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap-datetimepicker/4.15.35/js/bootstrap-datetimepicker.min.js"></script>
    </#if>
    <#if nestable_>
    <script src="<@res u_="platform/js/nestable/jquery.nestable.js"/>"></script>
    </#if>
    <#if chosen_>
    <script src="<@res u_="scripts/chosen/chosen.jquery.min.js"/>"></script>
    </#if>
<!--common scripts for all pages-->
<#--<script src="<@res u_="platform/js/scripts.js"/>"></script>
<script src="<@res u_="platform/js/common.js"/>"></script>
<script src="<@res u_="mall/common/location.js"/>"></script>-->
<!--省市区县 scriptss-->
<#--<script src="<@res u_="scripts/location/area.js"/>"></script>
<script src="<@res u_="scripts/location/location.js"/>"></script>-->



<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <#list script_ as li>
    <script src="${li}"></script>
    </#list>
    <#list app_ as li>
    <script src="<@res u_='platform/app/'+li+'.js'/>"></script>
    </#list>
<script>
    $(function () {
        try {
            autoHeight();
        } catch (e) {
        }
    });

    var common_height = window.screen.height / 2 + 100 + "px", common_height_4 = window.screen.height / 4 + "px",
            common_height_4_1 = window.screen.height / 4 + 50 + "px";
    ;
</script>
</body>
</html>
</#macro>
<#macro script_>
    <#nested />
</#macro>



<#macro noLayoutHtml title_="mlive" upload_=false script_=[] css_=[]>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <title>${title_!''}</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <#if upload_>
        <link href="http://cdn.bootcss.com/webuploader/0.1.1/webuploader.css" rel="stylesheet">
    </#if>
    <#list css_ as li>
        <link rel="stylesheet" href="${li}">
    </#list>
    <script src="<@res u_='platform/js/modernizr.min.js'/>"></script>
    <!--[if lte IE 8 ]>
    <script src="<@res u_='platform/js/placeholders.min.js'/>"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="<@res u_='platform/js/html5shiv.min.js'/>"></script>
    <script src="<@res u_='platform/js/respond.min.js'/>"></script>
    <![endif]-->

</head>
<body style="background:#fff">

    <#nested />

<!-- Small modal -->

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" id="modal_tip"
     aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            ...
        </div>
    </div>
</div>
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<![endif]-->
<script>!window.jQuery && document.write(decodeURI('%3Cscript src="/resources/scripts/jquery.1.11.2.min.js"%3E%3C/script%3E'));</script>

    <#if upload_>
    <script src="http://cdn.bootcss.com/webuploader/0.1.1/webuploader.min.js"></script>
    </#if>
<!--common scripts for all pages-->
<script src="<@res u_="platform/js/scripts.js"/>"></script>
<script src="<@res u_="platform/js/common.js"/>"></script>
    <#list script_ as li>
    <script src="${li}"></script>
    </#list>
<script type="text/javascript" src="<@res u_='plug-in/json2.min.js'/>"></script>
</body>
</html>
</#macro>

<#macro paginate currentPage totalPage actionUrl urlParas="">
    <#if (totalPage <= 0) || (currentPage > totalPage)><#return></#if>
    <#local startPage = currentPage - 4>
    <#if (startPage < 1)><#local startPage = 1></#if>

    <#local endPage = currentPage + 4>
    <#if (endPage > totalPage)><#local endPage = totalPage></#if>

<ul>
    <li class="prev <#if currentPage==1>disabled</#if>"><a
        <#if currentPage!=1>href="${actionUrl}?page=1${urlParas!}"</#if>>首页</a></li>
    <#if (currentPage <= 8)>
        <#local startPage = 1>
    </#if>
    <#if ((totalPage - currentPage) < 8)>
        <#local endPage = totalPage>
    </#if>

    <#if (currentPage == 1)>
        <li class="disabled"><a>&laquo;</a></li>
    <#else>
        <li><a href="${actionUrl}?page=#{currentPage - 1}${urlParas!}" class="prev_page">&laquo;</a></li>
    </#if>

    <#if (currentPage > 8)>
        <li><a href="${actionUrl}?page=#{1}${urlParas!}">#{1}</a></li>
        <li><a href="${actionUrl}?page=#{2}${urlParas!}">#{2}</a></li>
        <li><a>...</a></li>
    </#if>

    <#list startPage..endPage as i>
        <#if currentPage == i>
            <li class="active"><a>#{i}</a></li>
        <#else>
            <li><a href="${actionUrl}?page=#{i}${urlParas!}">#{i}</a></li>
        </#if>
    </#list>

    <#if ((totalPage - currentPage) >= 8)>
        <li><a>...</a></li>
        <li><a href="${actionUrl}?page=#{totalPage - 1}${urlParas!}">#{totalPage - 1}</a></li>
        <li><a href="${actionUrl}?page=#{totalPage}${urlParas!}">#{totalPage}</a></li>
    </#if>

    <#if (currentPage == totalPage)>
        <li class="next <#if currentPage==totalPage>disabled</#if>"><a rel="下页">&raquo;</a></li>
    <#else>
        <li class="next"><a href="${actionUrl}?page=#{currentPage + 1}${urlParas!}" rel="下页">&raquo;</a></li>
    </#if>
</ul>
</#macro>

<#macro paginateByForm currentPage totalPage actionUrl urlParas="">
    <#if (totalPage <= 0) || (currentPage > totalPage)><#return></#if>
    <#local startPage = currentPage - 4>
    <#if (startPage < 1)><#local startPage = 1></#if>

    <#local endPage = currentPage + 4>
    <#if (endPage > totalPage)><#local endPage = totalPage></#if>

<nav>
    <ul class="pagination">
        <#if (currentPage <= 8)>
            <#local startPage = 1>
        </#if>
        <#if ((totalPage - currentPage) < 8)>
            <#local endPage = totalPage>
        </#if>

        <#if (currentPage == 1)>
            <li><a>&laquo;</a></li>
        <#else>
            <li><a href="javascript:page('#{currentPage - 1}')" class="prev_page">&laquo;</a></li>
        </#if>

        <#if (currentPage > 8)>
            <li><a href="javascript:page('#{1}')">#{1}</a></li>
            <li><a href="javascript:page('#{2}')">#{2}</a></li>
            <li><a>...</a></li>
        </#if>

        <#list startPage..endPage as i>
            <#if currentPage == i>
                <li class="active"><a>#{i}</a></li>
            <#else>
                <li><a href="javascript:page('#{i}')">#{i}</a></li>
            </#if>
        </#list>

        <#if ((totalPage - currentPage) >= 8)>
            <li><a>...</a></li>
            <li><a href="javascript:page('#{totalPage - 1}')">#{totalPage - 1}</a></li>
            <li><a href="javascript:page('#{totalPage}')">#{totalPage}</a></li>
        </#if>

        <#if (currentPage == totalPage)>
            <li><a rel="下页">&raquo;</a></li>
        <#else>
            <li><a href="javascript:page('#{currentPage + 1}')" rel="下页">&raquo;</a></li>
        </#if>
    </ul>
</nav>
</#macro>

<#macro modalLoadPage>
<!-- 模态框（Modal） -->
<div class="modal fade" id="modalLoadPage" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    上传分类图标
                </h4>
            </div>
            <div class="modal-body">
                <!--内容-->
            </div>
        <#--<div class="modal-footer">-->
        <#--<button type="button" class="btn btn-default" data-dismiss="modal">关闭 </button>-->
        <#--</div>-->
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</#macro>

