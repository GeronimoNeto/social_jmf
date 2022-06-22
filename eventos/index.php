<?php
    ob_start();
    session_start();
    include_once("../content/code/sessao.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eventos</title>
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
                    <h2>ARRAIÁ</h2>
                    <h2>29/06</h2>
                </div>
                <p>No dia 29/06 vamos ter o arraiá do cumpade zé, às 19h, venha prestigiar com a gente.</p>
                <div class="event-image-area">
                    <img class="event-image" src="./img/arraia.png">
                </div>
            </div>
        </div>
    </section>
</body>
</html>