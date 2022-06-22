<?php
    ob_start();
    session_start();
    include("../content/code/sessao.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anuncios</title>
    <link rel="stylesheet" href="../perfil/style.css">
    <link rel="icon" type="image/x-icon" href="/content/img/alunos/<?php echo $pFoto; ?>">
    <link rel="stylesheet" href="/perfil/tema<?php echo $theme; ?>.css">
</head>
<body>
    <section class="main">    
        <?php include("../content/pages/caminhos.html"); ?>
    
        <div class="eventos-page">
            <div class="event-area">
                <div style="display:flex;justify-content:space-between;">
                    <h2>SÁBADO LETIVO</h2>
                    <h2>25/06</h2>
                </div>
                <p>Dia Letivo</p>
                <div class="event-image-area">
                    <img class="event-image">
                </div>
            </div>
            <div class="event-area">
                <div style="display:flex;justify-content:space-between;">
                    <h2>FÉRIAS</h2>
                    <h2>30/06</h2>
                </div>
                <p>Término do 2º Período</p>
                <div class="event-image-area">
                    <img class="event-image">
                </div>
            </div>
        </div>
    </section>
</body>
</html>