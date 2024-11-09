<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="author" content="${user.nickname!}" />
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />
    <@global.head />
    <title>${post.title!} - ${blog_title!}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="//cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet"/>
    <link href="${theme_base!}/source/css/blog_basic.min.css?version=88107691fe" rel="stylesheet">
    <link href="${theme_base!}/source/css/style.min.css" type="text/css" rel="stylesheet" />
    <link href="//cdn.jsdelivr.net/npm/prismjs@1.19.0/themes/prism${settings.code_pretty!}.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/prismjs@1.19.0/prism.min.js"></script>
    <style>
        table {
            border-spacing: 0;
            border-collapse: collapse;
            margin-top: 0;
            margin-bottom: 16px;
            display: block;
            width: 100%;
            overflow: auto;

        }
        table th {
            font-weight: 600;
        }
        table th,
        table td {
            padding: 6px 13px;
            border: 1px solid #dfe2e5;
        }
        table tr {
            background-color: #fff;
            border-top: 1px solid #c6cbd1;
        }
        table tr:nth-child(2n) {
            background-color: #f6f8fa;
        }
    </style>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
       <header class="mb-8">
            <div class="flex items-center justify-between mb-6">
                <div class="flex items-center space-x-4">
                    <img src="https://via.placeholder.com/50" alt="凉风网 Logo" class="h-12 w-12">
                    <h1 class="text-2xl font-bold text-gray-800">凉风网</h1>
                </div>
                <nav>
                    <ul class="flex space-x-4">
                    <@menuTag method="list">
                        <#list menus?sort_by('priority') as menu>
                            <li>
                                <a href="${menu.url!}" target="${menu.target!}" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">${menu.name!} </a>
                            </li>
                        </#list>
                    </@menuTag>
                    </ul>
                </nav>
            </div>
            <div class="h-px bg-gray-200"></div>
       </header>
       <main>
        <div class="main">
        <div class="content">
            <div class="post-page">
                
                <div class="post-title">
                    <h3>
                        <a>${post.title}</a>
                    </h3>
                </div>
                <div class="post-content">
                    ${post.formatContent!}
                </div>
                <div class="post-footer">
                    <div class="meta">
                        <div class="info">
                            <i class="fa fa-sun-o"></i>
                            <span class="date">${post.createTime?string("yyyy-MM-dd")}</span>
                            <i class="fa fa-comment-o"></i>
                            <a href="${post.fullPath!}#comment_widget">Comments</a>
                            <#if tags?size gt 0>
                                <i class="fa fa-tag"></i>
                                <#list tags as tag>
                                    <a href="${tag.fullPath!}" class="tag">&nbsp;${tag.name}</a>
                                </#list>
                            </#if>
                        </div>
                    </div>
                </div>
                
                <div class="share" style="display: inline-flex">
                    <div class="evernote">
                        <a href="javascript:(function(){EN_CLIP_HOST='http://www.evernote.com';try{var%20x=document.createElement('SCRIPT');x.type='text/javascript';x.src=EN_CLIP_HOST+'/public/bookmarkClipper.js?'+(new%20Date().getTime()/100000);document.getElementsByTagName('head')[0].appendChild(x);}catch(e){location.href=EN_CLIP_HOST+'/clip.action?url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title);}})();"
                        ref="nofollow" target="_blank" class="fa fa-bookmark"></a>
                    </div>
                    <div class="weibo">
                        <a href="javascript:void((function(s,d,e){try{}catch(e){}var f='http://service.weibo.com/share/share.php?',u=d.location.href,p=['url=',e(u),'&title=',e(d.title),'&appkey=2924220432'].join('');function a(){if(!window.open([f,p].join(''),'mb',['toolbar=0,status=0,resizable=1,width=620,height=450,left=',(s.width-620)/2,',top=',(s.height-450)/2].join('')))u.href=[f,p].join('');};if(/Firefox/.test(navigator.userAgent)){setTimeout(a,0)}else{a()}})(screen,document,encodeURIComponent));"
                        class="fa fa-weibo"></a>
                    </div>
                    <div class="twitter">
                        <a href="http://twitter.com/home?status=${post.fullPath!},${blog_title!},${post.title};"
                        class="fa fa-twitter"></a>
                    </div>
                </div>
                <div class="pagination">
                    <ul class="clearfix">
                        <#if nextPost??>
                            <li class="next pagbuttons">
                                <a class="btn" role="navigation" href="${nextPost.fullPath!}" title="${nextPost.title}">下一篇</a>
                            </li>
                        </#if>
                        <#if prevPost??>
                            <li class="pre pagbuttons">
                                <a class="btn" role="navigation" href="${prevPost.fullPath!}" title="${prevPost.title}">上一篇</a>
                            </li>
                        </#if>
                    </ul>
                </div>
                <div id="comment_widget" style="margin: 30px;">
                    <#include "module/comment.ftl">
                    <@comment post=post type="post" />
                </div>
            </div>
        </div>
        
    </div>
    </main>
    </div>
    <@global.statistics />
    </body>
</html>