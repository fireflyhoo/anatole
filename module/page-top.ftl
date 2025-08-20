<div class="page-top animated fadeInDown">
    <!-- 移动端菜单按钮 -->
    <button id="pageTopMenuToggle" class="md:hidden p-2 absolute right-4 top-1/2 transform -translate-y-1/2 rounded-md text-gray-600 hover:text-gray-800 hover:bg-gray-100 focus:outline-none z-50">
        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
        </svg>
    </button>
    
    <!-- 桌面端导航菜单 -->
    <div class="nav hidden md:block">
        <@menuTag method="list">
            <#list menus?sort_by('priority') as menu>
                <li>
                    <a href="${menu.url!}" target="${menu.target!}">${menu.name!} </a>
                </li>
            </#list>
        </@menuTag>
    </div>
    
    <!-- 移动端导航菜单 -->
    <div id="pageTopMobileMenu" class="fixed inset-0 bg-white z-40 transform translate-x-full transition-transform duration-300 ease-in-out md:hidden">
        <div class="flex justify-end p-4 pt-8">
            <button id="pageTopMenuClose" class="p-2 rounded-md text-gray-600 hover:text-gray-800 hover:bg-gray-100 focus:outline-none">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
            </button>
        </div>
        <div class="nav">
            <ul class="px-8 py-4">
                <@menuTag method="list">
                    <#list menus?sort_by('priority') as menu>
                        <li class="mb-4">
                            <a href="${menu.url!}" target="${menu.target!}" class="text-xl text-gray-600 hover:text-gray-800 transition-colors duration-200 block py-2">${menu.name!} </a>
                        </li>
                    </#list>
                </@menuTag>
            </ul>
        </div>
        <div class="information px-8 py-4">
            <div class="avatar mx-auto">
                <img src="${settings.icon!'${user.avatar!}'}" class="rounded-full h-24 w-24" />
            </div>
        </div>
    </div>
    
    <!-- 桌面端信息 -->
    <div class="information hidden md:block">
        <div class="back_btn">
            <li>
                <a onclick="window.history.go(-1)" style="display: none" class="fa fa-chevron-left"></a>
            </li>
        </div>
        <div class="avatar">
            <img src="${settings.icon!'${user.avatar!}'}" />
        </div>
    </div>
</div>

<!-- 移动端菜单控制脚本 -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const menuToggle = document.getElementById('pageTopMenuToggle');
        const menuClose = document.getElementById('pageTopMenuClose');
        const mobileMenu = document.getElementById('pageTopMobileMenu');
        
        // 检查元素是否存在，避免页面没有这些元素时报错
        if (menuToggle && menuClose && mobileMenu) {
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
        }
    });
</script>
