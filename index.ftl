<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="${user.nickname!}" />
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />
    <@global.head />
    <title>${title!}</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <header class="mb-8">
            <div class="flex items-center justify-between mb-6">
                <div class="flex items-center space-x-4">
                    <img src="https://img.coollf.com/logo.png" alt="凉风网 Logo" class="h-12 w-12">
                    <h1 class="text-2xl font-bold text-gray-800">凉风网</h1>
                </div>
                <!-- 移动端菜单按钮 -->
                <button id="menuToggle" class="md:hidden p-2 rounded-md text-gray-600 hover:text-gray-800 hover:bg-gray-100 focus:outline-none">
                    <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
                    </svg>
                </button>
                <!-- 桌面端导航菜单 -->
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
                <!-- 移动端导航菜单 -->
                <nav id="mobileMenu" class="fixed inset-0 bg-white z-50 transform translate-x-full transition-transform duration-300 ease-in-out md:hidden">
                    <div class="flex justify-end p-4">
                        <button id="menuClose" class="p-2 rounded-md text-gray-600 hover:text-gray-800 hover:bg-gray-100 focus:outline-none">
                            <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                            </svg>
                        </button>
                    </div>
                    <ul class="px-8 py-4">
                    <@menuTag method="list">
                        <#list menus?sort_by('priority') as menu>
                            <li class="mb-4">
                                <a href="${menu.url!}" target="${menu.target!}" class="text-xl text-gray-600 hover:text-gray-800 transition-colors duration-200 block py-2">${menu.name!} </a>
                            </li>
                        </#list>
                    </@menuTag>
                    </ul>
                </nav>
            </div>
            <div class="h-px bg-gray-200"></div>
        </header>
        <main>
            <h2 class="text-3xl font-bold mb-6 text-center text-gray-800">热门文章</h2>
            <div id="articleGrid" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-4">
                <#list posts.content as post>
                 <div class="bg-white rounded-lg shadow-md overflow-hidden">
                    <a href="${post.fullPath!}">
                    <div class="aspect-video relative">
                    <img src="https://image.tmdb.org/t/p/original/p5AwpwkF6gcRJ04NEbtUQM7vJMN.jpg" alt="${post.title}" class="absolute inset-0 w-full h-full object-cover" />
                    </div>
                    <div class="p-4">
                    <h3 class="text-xl font-semibold mb-2">${post.title}</h3>
                    <p class="text-gray-600">${post.summary!}</p>
                    </div>
                    </a>
                </div>
                </#list>
            </div>
            <div class="mt-8 flex justify-center">
                <nav class="inline-flex rounded-md shadow">
                <#if posts.totalPages gt 1>
                    <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="5">
                    <#if pagination.hasPrev>
                        <a href="${pagination.prevPageFullPath!}">
                        <button id="prevPage" class="px-4 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed">
                            上一页
                        </button>
                        </a>
                    </#if>
                    <span id="pageInfo" class="px-4 py-2 border-t border-b border-gray-300 bg-white text-sm font-medium text-gray-700"></span>
                     <#if pagination.hasNext>
                     <a href="${pagination.nextPageFullPath!}">
                        <button id="nextPage" class="px-4 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed">
                            下一页
                        </button>
                     </a>
                     </#if>
                    </@paginationTag>
                </#if>
                </nav>
            </div>
        </main>
    </div>
    <@global.statistics />
    
    <!-- 移动端菜单控制脚本 -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const menuToggle = document.getElementById('menuToggle');
            const menuClose = document.getElementById('menuClose');
            const mobileMenu = document.getElementById('mobileMenu');
            
            // 打开菜单
            menuToggle.addEventListener('click', function() {
                mobileMenu.classList.remove('translate-x-full');
                document.body.style.overflow = 'hidden'; // 防止背景滚动
            });
            
            // 关闭菜单
            menuClose.addEventListener('click', function() {
                mobileMenu.classList.add('translate-x-full');
                document.body.style.overflow = ''; // 恢复背景滚动
            });
            
            // 点击菜单项后关闭菜单
            const menuItems = mobileMenu.querySelectorAll('a');
            menuItems.forEach(item => {
                item.addEventListener('click', function() {
                    mobileMenu.classList.add('translate-x-full');
                    document.body.style.overflow = '';
                });
            });
        });
    </script>
</body>
</html>