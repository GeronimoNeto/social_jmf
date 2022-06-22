<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feed</title>
    <link rel="stylesheet" href="../perfil/style.css">
    <link rel="icon" type="image/x-icon" href="/content/img/alunos/<?php echo $pFoto; ?>">
    <link rel="stylesheet" href="/perfil/tema0.css">
</head>
<body>
    <section class="main">    
        <?php include("caminhos.html"); ?>
    
        <div class="feed-noticias">
            <?php include_once("./content/code/feed.php"); ?>
            <?php include("./content/code/onlines.php"); include("./content/code/notificacoes.php"); ?>
        </div>
    </section>
</body>
</html>