<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 - 页面出错 | 凉风网</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
        .float {
            animation: float 3s ease-in-out infinite;
        }
    </style>
</head>
<body class="bg-gradient-to-b from-blue-100 to-purple-200 min-h-screen flex items-center justify-center p-4">
    <div class="text-center">
        <div class="mb-8">
            <img src="https://via.placeholder.com/200x200.png?text=505" alt="可爱的505图标" class="w-40 h-40 mx-auto rounded-full shadow-lg float">
        </div>
        <h1 class="text-6xl font-bold text-purple-600 mb-4">哎呀!</h1>
        <p class="text-xl text-gray-700 mb-8">看起来这个页面被风吹走了~</p>
        <div class="space-y-4">
            <p class="text-lg text-gray-600">别担心,让我们一起回到首页吧!</p>
            <a href="/" class="inline-block bg-purple-500 hover:bg-purple-600 text-white font-bold py-2 px-4 rounded-full transition duration-300 ease-in-out transform hover:scale-105">
                返回首页
            </a>
        </div>
    </div>
    <div class="absolute bottom-4 left-4 text-gray-500 text-sm">
        &copy; 2023 凉风网. 版权所有.
    </div>
</body>
</html>