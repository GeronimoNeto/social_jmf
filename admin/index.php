<?php
    include_once("../content/code/sessao.php");
    if($role<2){header("Location: /perfil");}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="../perfil/style.css">
    <link rel="icon" type="image/x-icon" href="/content/img/alunos/<?php echo $pFoto; ?>">
    <link rel="stylesheet" href="/perfil/tema<?php echo $theme; ?>.css">
</head>
<body>
    <section class="main">    
        <?php include("../content/pages/caminhos.html"); ?>
    </section>
    <div class="contas">
        
    </div>
</body>
</html>