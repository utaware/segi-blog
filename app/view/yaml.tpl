<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>segi-blog</title>
    <link rel="stylesheet" href="/public/css/vuepress.css">
    <style>
        body {
            box-sizing: border-box;
            min-width: 200px;
            max-width: 980px;
            margin: 0 auto;
            padding: 45px;
        }
    </style>
</head>
<body>
    <div class="content">
      <h3>title:</h3>
      {{ data.data.title }}
      <h3>description:</h3>
      {{ data.data.description }}
      <h3>author:</h3>
      {{ data.data.author }}
      <h3>content:</h1>
      {{ data.content | safe  }}

    </div>
</body>
</html>