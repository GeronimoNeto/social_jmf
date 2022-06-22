<?php
    ob_start();
    session_start();
    include("../content/code/conexao.php");
    if(!isset($_SESSION['email'])&&(!isset($_SESSION['senha']))){
        header("Location: s/");
    }
    $acID = $_GET['conta'];
    $token = $_SESSION['email'];
    $login = "SELECT * FROM contas WHERE email=:token";
    try{
        $get = $conect->prepare($login);
        $get->bindParam(':token',$token,PDO::PARAM_STR);
        $get->execute();
        if($get->rowCount()>0){
            $ac = $get->fetch(PDO::FETCH_OBJ);
            $id = $ac->id;
            $nome = $ac->nome;
            $theme = $ac->tema;
            $role = $ac->role;
            if($ac->status==0 || $role<1 ){header("Location: /content/code/sair.php?d=1");}
            $acSelect = "SELECT * FROM contas WHERE id=:acID";
            $acr = $conect->prepare($acSelect);
            $acr->bindParam(':acID',$acID, PDO::PARAM_INT);
            $acr->execute();
            if($acr->rowCount()>0){
                $acc = $acr->fetch(PDO::FETCH_OBJ);
                $acnome = $acc->nome;
                $acsobrenome = $acc->sobrenome;
                $acemail = $acc->email;
                $acstatus = $acc->status;
                $acverificado = $acc->verificado;
                $acdata = $acc->nascimento;

                $pSelect = "SELECT * FROM perfil WHERE id=:pID";
                $pCon = $conect->prepare($pSelect);
                $pCon->bindParam(':pID', $acID, PDO::PARAM_INT);
                $pCon->execute();
                if($pCon->rowCount()>0){
                    $pO = $pCon->fetch(PDO::FETCH_OBJ);
                    $pApelido = $pO->apelido;
                    $pCapa = $pO->capa;
                    $pBio = $pO->biografia;
                    $pTurma = $pO->turma;
                    $pFoto = $pO->foto;
                }
            }else{
                header("Location: /perfil/$id");
            }
        }
    }catch(PDOException $e){}
    
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
    <title>Perfil</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" type="image/x-icon" href="../content/img/alunos/<?php echo $pFoto; ?>">
    <link rel="stylesheet" href="tema<?php echo $theme; ?>.css">
</head>
<body>
    <section class="main">    
        <?php include("../content/pages/caminhos.html"); ?>
        <section class="content">
            <section class="infos">
                <div class="cape" id="cape" style="background-image: url(/content/img/capas/<?php echo $pCapa; ?>);"></div>
                <div id="icon" class="icon" style="background-image: url(/content/img/alunos/<?php echo $pFoto; ?>);">
                    <div class="status st<?php echo $acstatus ?>"></div>
                </div>
            </section>
            <?php if($id!=$acID){ ?>
                <form method="post"><button name="addfriend" class="btnaddamigo">Adicionar</button></form>
                <?php } include_once("../content/code/adicionaramigo.php"); ?>
                <section class="profile">
                    <div class="namesdiv">
                        <h3 id="verifyckt"><?php echo "$acnome $acsobrenome".$cargo[$acverificado]; ?></h3>
                    </div>
                    <div class="biodiv">
                        <form action="" method="post">
                            <?php if($acID==$id) { ?>
                            <input name="alterbio" type="text" id="alterbio" maxlength="50" value="<?php echo $pBio; ?>">
                            <?php }else{ ?>
                                <div style="margin-top:6px;margin-left:-4px;font-size:21px;text-align:center;"><?php echo $pBio; ?></div>
                            <?php } ?>
                                <div class="outras">
                                    <?php include_once("../content/code/turmas.php"); ?>

                                    <?php if($acID==$id) { ?>
                                        <script>
                                            turmas = document.getElementById("turmas")
                                            alterbio = document.getElementById("alterbio")
                                            function BtnSave(){
                                                document.getElementById("aparecerbtnsalvar").innerHTML='<input type="submit" value="Salvar Alterações" name="savealtbio">'
                                            }
                                            turmas.addEventListener("change",BtnSave)
                                            alterbio.addEventListener("change",BtnSave)
                                        </script>
                                    <?php } ?>
                                <div id="aparecerbtnsalvar">
                                    <div style="width:35px;height:35px;margin-right:-9px;"></div>
                                </div>
                                <b class="aniversario"><?php $dia = substr($acdata,-2,2); $mes = substr($acdata,-5,2); $idade = 2022-substr($acdata,0,4); echo $dia." de ".$meses[$mes]." (".$idade." anos)"; ?></b>
                            </div>
                        </form>
                        <?php include_once("../content/code/alterarbiografia.php"); ?>
                    </div>
                <?php if($acID==$id) { ?>
                <form method="post" class="publik" enctype="multipart/form-data">
                    <div style="display:flex;flex-direction:column">
                        <input type="text" placeholder="No que você está pensando?" name="textin" maxlength="500">
                        <input name="fotopub" type="file" style="background-color:transparent;border:0px !important;">
                    </div>
                    <input type="submit" value=">" name="publik" class="publikinput">
                </form>
                <?php } include_once("../content/code/publicacoes.php"); ?>
                <div id="myspub"></div>
                <?php include("../content/code/onlines.php"); include("../content/code/notificacoes.php"); ?>
                <div id="picchange"></div>
                <?php if($acID==$id) { ?> <script src="../content/code/imagem.js"></script>
                <?php } include_once("../content/code/imagem.php"); ?>
            </section>
        </section>
    </section>
</body>
</html>