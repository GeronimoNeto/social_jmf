
<div class="meusamigos">
    <div class="procuraramigo">
        <b><br>Encontre novos amigos</b>
        <form method="get">
            <input type="text" placeholder="Pesquisar pelo nome..." name="n">
        </form>
        <div class="amigoencontrado">
            <?php
                if(!$_GET['n']){header("Location: /amigos/?n=$nome");}
                if(isset($_GET['n'])){
                    $nomin = $_GET['n'];
                    $findfrien = "SELECT * FROM contas WHERE nome LIKE '%$nomin%' OR sobrenome LIKE '%$nomin%' ORDER BY id DESC LIMIT 5";
                }
                try{
                    $findfrienr = $conect->prepare($findfrien);
                    $findfrienr->execute();
                    if($findfrienr->rowCount()>0){
                    while($amg = $findfrienr->FETCH(PDO::FETCH_OBJ)) {
                        $perfilamg = "SELECT * FROM perfil WHERE id=$amg->id";
                        $perfilaa = $conect->prepare($perfilamg);
                        $perfilaa->execute();
                        $perfilamigo = $perfilaa->FETCH(PDO::FETCH_OBJ);
                        echo "<a class='mininomeamigo' href='/perfil/$amg->id'><img class='minifotoamigo' width='40' height='40' src='/content/img/alunos/$perfilamigo->foto'><b>$amg->nome $amg->sobrenome</b></a>"
            ?>
                
            <?php }}}catch(PDOException $e){} ?>
        </div>
    </div>
    <?php 
        $select = "SELECT * FROM amigos WHERE pessoa1=$acID ORDER BY id ASC";
        try{
            $resultado = $conect->prepare($select);
            $resultado->execute();
            if($resultado->rowCount()>0){
                while($show = $resultado->FETCH(PDO::FETCH_OBJ)){
                    $amigo = $show->pessoa2;
                    $idamigo = $show->id;
                    $getamigo = "SELECT * FROM contas WHERE id=$amigo";
                    $getamigoResult = $conect->prepare($getamigo);
                    $getamigoResult->execute();
                    $amigoinfo = $getamigoResult->FETCH(PDO::FETCH_OBJ);

                    $getamigoperfil = "SELECT * FROM perfil WHERE id=$amigoinfo->id";
                    $getamigoResultperfil = $conect->prepare($getamigoperfil);
                    $getamigoResultperfil->execute();
                    $amigoinfoperfil = $getamigoResultperfil->FETCH(PDO::FETCH_OBJ);
    ?>
    <div style="display:flex;flex-direction:row;flex-wrap:wrap-reverse;align-items:flex-start;justify-content:center;width:400px;">
        <div class="amigo">
            <div>
                <img src="/content/img/alunos/<?php echo $amigoinfoperfil->foto; ?>" width="70" height="70">
                <div><?php $status = ["<b style='color:gray;'>Ausente</b>","<b style='color:green;'>Online</b>","<b style='color:red;'>Ocupado</b>"]; $cargo = ["","<button title='Verificado' class='verificado1' style='margin-left:3px;width:15px;height:15px;'></button>"]; ?>
                    <b><a href="/perfil/<?php echo $amigoinfo->id; ?>"><?php echo $amigoinfo->nome." ".$amigoinfo->sobrenome.$cargo[$amigoinfo->verificado]; ?></a> <?php echo $status[$amigoinfo->status]; ?></b>
                    <b><?php echo $amigoinfoperfil->biografia; ?></b>
                </div>
            </div>
            <div class="amigobtnkk">
                <button id="deletefriend<?php echo $idamigo; ?>"></button>
            </div>
            <div id="deleteask">

            </div>
            <script>
                deletefriend<?php echo $idamigo; ?> = document.getElementById("deletefriend<?php echo $idamigo; ?>");
                deleteask = document.getElementById("deleteask");
                deletefriend<?php echo $idamigo; ?>.addEventListener("click",()=>{
                    console.log(deletefriend<?php echo $idamigo; ?>.id)
                    deleteask.innerHTML=
                    "<form method='post'><a>Deseja remover <b><?php echo $amigoinfo->nome." ".$amigoinfo->sobrenome; ?> </b>dos amigos?</a><div><input type='submit' name='excluirsim' value='<?php echo $idamigo; ?>'><input type='submit' name='excluirnao' value='Não'></div></form>"
                    deleteask.style="width:100%;height:100%;"
                })
            </script>
            <?php
                if(isset($_POST["excluirsim"])){
                    $excluiramg = $_POST["excluirsim"];
                    $deleteamg = "DELETE FROM amigos WHERE id=$excluiramg";
                    try{
                        $resultado = $conect->prepare($deleteamg);
                        $resultado->execute();
                        header("Location: ./?n=$nomin");

                        $notify = "INSERT INTO notificacoes(type,pessoa1,pessoa2) VALUES(1,$amigo,$id)";
                        $nno = $conect->prepare($notify);
                        $nno->execute();
                        $notify2 = "INSERT INTO notificacoes(type,pessoa1,pessoa2) VALUES(3,$id,$amigo)";
                        $nno2 = $conect->prepare($notify2);
                        $nno2->execute();

                    }catch(PDOException $e){}
                }
                if(isset($_POST['excluirnao'])){header("Refresh:0");}
            ?>
        </div>
        <?php }}}catch(PDOException $e){ echo '<strong>ERRO DE PDO= </strong>'.$e->getMessage();} ?>
    </div>
</div>