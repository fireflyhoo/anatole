<#macro head title>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <title>${title!}</title>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="renderer" content="webkit">
    <meta name="theme-color" content="${settings.google_color!'#fff'}">
    <meta name="author" content="${user.nickname!}" />
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />
    <@global.head />
    <link href="//cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet"/>
    <link href="${theme_base!}/source/css/blog_basic.min.css?version=88107691fe" rel="stylesheet">
    <link href="${theme_base!}/source/css/style.min.css" type="text/css" rel="stylesheet" />

    <#if is_post?? || is_sheet??>
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
    </#if>

    <link rel="alternate" type="application/rss+xml" title="atom 1.0" href="${atom_url!}">
    <style>
        <#if !settings.post_title_uppper!true>
        .post .post-title h3 {
            text-transform: none;
        }
        </#if>
        <#if !settings.blog_title_uppper!true>
        .sidebar .logo-title .title h3 {
            text-transform: none;
        }
        </#if>
        ::-webkit-scrollbar {
            width: 6px;
            height: 6px;
            background-color: #eee;
        }
        ::-webkit-scrollbar-thumb {
            background-color: ${settings.scrollbar!'#3798e8'};
        }
        ::-webkit-scrollbar-track {
            background-color: #eee;
        }
        ${settings.custom!}
    </style>
</head>
<body>
</#macro>

<#macro footer>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/jquery@1.9.1/jquery.min.js"></script>
<script type="text/javascript">
    var url = location.href;
    var urlstatus = false;
    $(".nav li a").each(function () {
        if ((url + '/').indexOf($(this).attr('href')) > -1 && $(this).attr('href') != '/') {
            $(this).addClass('current');
            urlstatus = true;
        } else {
            $(this).removeClass('current');
        }
    });
    if (!urlstatus) {
        $(".nav li a").eq(0).addClass('current');
    }

    <#if settings.hitokoto!false>
	  var xhr = new XMLHttpRequest();
	  xhr.open('get', 'https://v1.hitokoto.cn');
	  xhr.onreadystatechange = function () {
          if (xhr.readyState === 4) {
              var data = JSON.parse(xhr.responseText);
              var yiyan = document.getElementById('yiyan');
              yiyan.innerText = data.hitokoto+"        -「"+data.from+"」";
          }
      };
	  xhr.send();
    </#if>
</script>
<@global.statistics />
</body>
</html>
</#macro>
