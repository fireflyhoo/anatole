<div class="sidebar animated fadeInDown">
    <div class="logo-title">
        <div class="title">
            <img src="${blog_logo!'${user.avatar!}'}" style="width:127px;<#if settings.avatar_circle!false>border-radius:50%</#if>" />
            <h3 title="">
                <a href="${blog_url!}">${blog_title!}</a>
            </h3>
            <div class="description">
                <#if settings.hitokoto!false>
                    <p id="yiyan">获取中...</p>
                <#else >
                    <p>${user.description!}</p>
                </#if>
            </div>
        </div>
    </div>
    <#include "social-list.ftl">
    <div class="footer">
        <a target="_blank" href="#">
            <div class="footer_text">
                <@global.footer_info />
            </div>
        </a>
    </div>
</div>
