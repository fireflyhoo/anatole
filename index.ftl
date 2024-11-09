<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>凉风网 - 文章列表</title>
    <script src="https://cdn.tailwindcss.com"></script>
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
            <h2 class="text-3xl font-bold mb-6 text-center text-gray-800">热门文章</h2>
            <div id="articleGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                 <div class="bg-white rounded-lg shadow-md overflow-hidden">
                    <div class="aspect-video relative">
                    <img :src="https://via.placeholder.com/200x300.png" :alt="article.title" class="absolute inset-0 w-full h-full object-cover" />
                    </div>
                    <div class="p-4">
                    <h3 class="text-xl font-semibold mb-2">{{ article.title }}</h3>
                    <p class="text-gray-600">{{ article.summary }}</p>
                    </div>
                </div>
                <div class="bg-white rounded-lg shadow-md overflow-hidden">
                    <div class="aspect-video relative">
                    <img :src="https://via.placeholder.com/200x300.png" :alt="article.title" class="absolute inset-0 w-full h-full object-cover" />
                    </div>
                    <div class="p-4">
                    <h3 class="text-xl font-semibold mb-2">{{ article.title }}</h3>
                    <p class="text-gray-600">{{ article.summary }}</p>
                    </div>
                </div>
                  <div class="bg-white rounded-lg shadow-md overflow-hidden">
                    <div class="aspect-video relative">
                    <img :src="https://via.placeholder.com/200x300.png" :alt="article.title" class="absolute inset-0 w-full h-full object-cover" />
                    </div>
                    <div class="p-4">
                    <h3 class="text-xl font-semibold mb-2">{{ article.title }}</h3>
                    <p class="text-gray-600">{{ article.summary }}</p>
                    </div>
                </div>
                <div class="bg-white rounded-lg shadow-md overflow-hidden">
                    <div class="aspect-video relative">
                    <img :src="https://via.placeholder.com/200x300.png" :alt="article.title" class="absolute inset-0 w-full h-full object-cover" />
                    </div>
                    <div class="p-4">
                    <h3 class="text-xl font-semibold mb-2">{{ article.title }}</h3>
                    <p class="text-gray-600">{{ article.summary }}</p>
                    </div>
                </div>
            
            </div>
            <div class="mt-8 flex justify-center">
                <nav class="inline-flex rounded-md shadow">
                    <button id="prevPage" class="px-4 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed">
                        上一页
                    </button>
                    <span id="pageInfo" class="px-4 py-2 border-t border-b border-gray-300 bg-white text-sm font-medium text-gray-700"></span>
                    <button id="nextPage" class="px-4 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed">
                        下一页
                    </button>
                </nav>
            </div>
        </main>
    </div>
</body>
</html>