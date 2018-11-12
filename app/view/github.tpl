<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>segi-blog</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/github-markdown-css/2.10.0/github-markdown.css">
    <style>
        .markdown-body {
            box-sizing: border-box;
            min-width: 200px;
            max-width: 980px;
            margin: 0 auto;
            padding: 45px;
        }

        @media (max-width: 767px) {
            .markdown-body {
                padding: 15px;
            }
        }

        a.header-anchor {
            color: #3eaf7c;
        }

        a.header-anchor:hover {
            text-decoration: none;
        }
    </style>
</head>
<body class="markdown-body">
    {{ data | safe  }}
</body>
</html>