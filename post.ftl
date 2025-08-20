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
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/prismjs@1.19.0/prism.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/themes/prism.min.css" rel="stylesheet" />
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
                    <img src="https://img.coollf.com/logo.png" alt="凉风网 Logo" class="h-12 w-12">
                    <h1 class="text-2xl font-bold text-gray-800">凉风网</h1>
                </div>
                <!-- 添加汉堡菜单按钮，仅在移动端显示 -->
                <button id="menu-toggle" class="md:hidden text-gray-600 hover:text-gray-800 focus:outline-none">
                    <i class="fa fa-bars text-2xl"></i>
                </button>
                <!-- 桌面端菜单 -->
                <nav class="hidden md:block">
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
       
       <!-- 添加移动端侧边菜单 -->
       <div id="mobile-menu" class="fixed top-0 left-0 h-full w-64 bg-white shadow-lg transform -translate-x-full transition-transform duration-300 ease-in-out z-50 md:hidden">
           <div class="p-4 flex justify-between items-center border-b">
               <h2 class="font-bold text-xl">菜单</h2>
               <button id="close-menu" class="text-gray-600 hover:text-gray-800">
                   <i class="fa fa-times text-xl"></i>
               </button>
           </div>
           <nav class="p-4">
               <ul class="space-y-4">
               <@menuTag method="list">
                   <#list menus?sort_by('priority') as menu>
                       <li>
                           <a href="${menu.url!}" target="${menu.target!}" class="block text-gray-600 hover:text-gray-800 transition-colors duration-200 py-2 mobile-menu-item">${menu.name!} </a>
                       </li>
                   </#list>
               </@menuTag>
               </ul>
           </nav>
       </div>
       
       <!-- 添加半透明背景遮罩 -->
       <div id="menu-overlay" class="fixed inset-0 bg-black bg-opacity-50 z-40 hidden transition-opacity duration-300 ease-in-out md:hidden"></div>

       <main>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <h1 class="text-3xl font-bold my-8 text-center">${post.title}</h1>
            <div class="flex justify-between items-center mb-4">
            </div>
            <article class="prose lg:prose-xl max-w-none">
              ${post.formatContent!}
            </article>
        </div>
        <div class="share" style="display: inline-flex">
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
       </main>
    </div>
    <@global.statistics />
    </body>
    
    <!-- 添加JavaScript控制菜单显示/隐藏 -->
    <script>
        // 确保DOM加载完成
        document.addEventListener('DOMContentLoaded', function() {
            // 获取菜单元素
            const menuToggle = document.getElementById('menu-toggle');
            const closeMenu = document.getElementById('close-menu');
            const mobileMenu = document.getElementById('mobile-menu');
            const menuOverlay = document.getElementById('menu-overlay');
            const mobileMenuItems = document.querySelectorAll('.mobile-menu-item');
            
            // 检查元素是否存在
            if (!menuToggle || !closeMenu || !mobileMenu || !menuOverlay) {
                return;
            }
            
            // 打开菜单函数
            function openMenu() {
                mobileMenu.classList.remove('-translate-x-full');
                menuOverlay.classList.remove('hidden');
                // 防止背景滚动
                document.body.style.overflow = 'hidden';
            }
            
            // 关闭菜单函数
            function closeMenuFn() {
                mobileMenu.classList.add('-translate-x-full');
                menuOverlay.classList.add('hidden');
                // 恢复背景滚动
                document.body.style.overflow = '';
            }
            
            // 添加事件监听器
            menuToggle.addEventListener('click', openMenu);
            closeMenu.addEventListener('click', closeMenuFn);
            menuOverlay.addEventListener('click', closeMenuFn);
            
            // 点击菜单项后关闭菜单
            mobileMenuItems.forEach(item => {
                item.addEventListener('click', closeMenuFn);
            });
            
            // 处理屏幕大小变化
            function handleResize() {
                if (window.innerWidth >= 768) { // md breakpoint
                    closeMenuFn();
                }
            }
            
            // 添加窗口大小变化事件监听器
            window.addEventListener('resize', handleResize);
        });
    </script>
</body>
</html>