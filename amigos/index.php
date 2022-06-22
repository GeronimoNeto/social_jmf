<?php
ob_start();
session_start();
    include("../content/code/sessao.php");
    $cargo = ["","<button title='Verificado' class='verificado1' style='margin-left:5px;'></button>"];
    $meses = [
        "01" => 'Janeiro',
        "02" => 'Fevereiro',
        "03" => 'Março',
        "04" => 'Abril',
        "05" => 'Maio',
        "06" => 'Junho',
        "07" => 'Julho',
        "08" => 'Agosto',
        "09" => 'Setembro',
        "10" => 'Outubro',
        "11" => 'Novembro',
        "12" => 'Dezembro'
    ];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Amigos</title>
    <link rel="stylesheet" href="../perfil/style.css">
    <link rel="icon" type="image/x-icon" href="/content/img/alunos/<?php echo $pFoto; ?>">
    <link rel="stylesheet" href="/perfil/tema<?php echo $theme; ?>.css">
</head>
<body>
    <section class="main" style="background-color:rgba(0,0,0,0.1)">    
        <?php include("../content/pages/caminhos.html"); ?>
        <section class="content">
            <section class="infos">
                <div class="cape" id="cape" style="background-image: url(/content/img/capas/<?php echo $pCapa; ?>);"></div>
                <div id="icon" class="icon" style="background-image: url(/content/img/alunos/<?php echo $pFoto; ?>);">
                    <div class="status st<?php echo $acstatus ?>"></div>
                </div>
            </section>
            <section class="profile">
                <div class="namesdiv">
                    <h3><?php echo "$acnome $acsobrenome".$cargo[$acverificado]; ?></h3>
                </div>
                <div class="biodiv">
                    <form action="" method="post">
                        
                        <?php if($acID!=$id) { ?>
                            <input name="alterbio" type="text" maxlength="50" value="<?php echo $pBio; ?>">
                        <?php }else{ ?>
                            <div style="margin-top:6px;margin-left:-4px;font-size:21px;text-align:center;"><?php echo $pBio; ?></div>
                        <?php } ?>

                        <div class="outras">
                            <?php include_once("../content/code/turmas.php"); ?>
                            <div style="width:35px;height:35px;margin-right:-9px;"></div>
                            <b class="aniversario"><?php $dia = substr($acdata,-2,2); $mes = substr($acdata,-5,2); $idade = 2022-substr($acdata,0,4); echo $dia." de ".$meses[$mes]." (".$idade." anos)"; ?></b>
                        </div>
                    </form>
                </div>
                <?php include_once("../content/code/amigos.php"); ?>
            </section>
        </section>
    </section>
    <?php include("../content/code/onlines.php"); include("../content/code/notificacoes.php"); ?>
</body>
</html>