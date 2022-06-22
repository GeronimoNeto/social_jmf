<div class="publicacoes" style="background-image:url();">
    <?php
        try{
            $getFriends = "SELECT * FROM amigos WHERE pessoa1=$acID ORDER BY id DESC";
            $infoFriends = $conect->prepare($getFriends);
            $infoFriends->execute();
            while($realinfofriends = $infoFriends->FETCH(PDO::FETCH_OBJ)){
                $pessoa2 = $realinfofriends->pessoa2;
                $select = "SELECT * FROM publicacoes WHERE idConta=$pessoa2 ORDER BY id DESC";
                $resultado = $conect->prepare($select);
                $resultado->execute();
                if($resultado->rowCount()>0){
                    while($show = $resultado->FETCH(PDO::FETCH_OBJ)){
                        $acIDPub = $show->id;
                        $idContala = $show->idConta;

                        $getpubOwner = "SELECT * FROM contas WHERE id=$idContala";
                        $preparepub = $conect->prepare($getpubOwner);
                        $preparepub->execute();
                        $getinfoOwner = $preparepub->FETCH(PDO::FETCH_OBJ);


                        $quantidadecmt = "SELECT * FROM comentarios WHERE idPub=$acIDPub";
                        $quantidadecmta = $conect->prepare($quantidadecmt);
                        $quantidadecmta->execute();
                        $qtscmta = $quantidadecmta->rowCount();
                    ?>
    <a name="pub<?php echo $acIDPub; ?>"></a>
    <div class="pub">
        <div style="margin-right:8px;"></div>
        <div>
            <div style="display:flex;flex-direction:column;align-items:flex-start;justify-content:center;">
                <?php
                    $cargo = ["","<button title='Verificado' class='verificado1' style='margin-left:5px; width:15px;height:15px;'></button>"];
                    $dia = substr($show->data,8,-9);$mes = substr($show->data, 6,1);$ano = substr($show->data, 0,4);
                    $meses = [1 => 'Janeiro','Fev.','Março','Abril','Maio','Junho','Julho','Agosto','Set.','Out.','Nov.','Dez.'];
                    $data = $dia." de ".$meses[$mes]." de ".$ano." às ".substr($show->data,-8,5);
                ?>
                <div style="width:415px;">
                    <a href="/perfil/<?php echo $getinfoOwner->id; ?>" style="display:flex;flex-direction:row;justify-content:space-between;width:100%;text-decoration:none;"><b><?php echo $getinfoOwner->nome." ".$getinfoOwner->sobrenome.$cargo[$getinfoOwner->verificado]; ?></b><?php echo $data; ?></a>
                </div>
                <textarea id="tx<?php echo $acIDPub ?>" class="textpub" cols="50" disabled><?php echo $show->texto; ?></textarea>
                <script>
                    var s_height = document.getElementById("tx<?php echo $acIDPub ?>").scrollHeight;
                    document.getElementById("tx<?php echo $acIDPub ?>").setAttribute('style','height:'+s_height+'px');
                </script>
                <?php if($show->midia!="nil") { ?>
                    <img style="border-radius:10px;" width="410" src="/content/img/pub/<?php echo $show->midia; ?>">
                <?php } ?>
            </div>
            
            <form method="post" action="#pub<?php echo $acIDPub; ?>">
                <div style="display:flex;flex-direction:column;align-items:center;">
                    <button name="curtir" class="curtir" id="curtir" value="<?php echo $acIDPub; ?>"></button>
                    <b><?php echo $show->likes ?></b>
                </div>
                <div style="display:flex;flex-direction:column;align-items:center;">
                    <button name="responder" class="responder" id="responder" value="<?php echo $acIDPub; ?>"></button>
                    <b><?php echo $qtscmta; ?></b>
                </div>
                <?php if($acID==$id) { ?>
                    <div style="display:flex;flex-direction:column;align-items:center;">
                        <button class="compartilhar" name="compartilhar<?php echo $acIDPub; ?>" value="<?php echo $acIDPub; ?>"></button>
                        <b><?php echo $show->comp; ?></b>
                    </div>
                <?php } ?>
                <?php if($acID!=$id) { ?>
                    <button name="excluir" class="excluir" value="<?php echo $acIDPub; ?>"></button>
                <?php } ?>
            </form>
            <div class="comentarios">
                <form method="post" action="#pub<?php echo $acIDPub; ?>">
                    <input type="text" minlength="1" maxlength="500" placeholder="Faça um comentário..." name="textocoment<?php echo $acIDPub; ?>">
                    <input type="submit" value="<?php echo $acIDPub; ?>" class="responder" name="comentar<?php echo $acIDPub; ?>">
                </form>
                <?php
                    if(isset($_POST["comentar$acIDPub"])){
                        $comentar = $_POST["comentar$acIDPub"];
                        $textoc = $_POST["textocoment$acIDPub"];
                        $inserircomentario = "INSERT INTO comentarios(idConta,texto,idPerfil,idPub) VALUES($id,:textoc,$getinfoOwner->id,$comentar)";
                        if($textoc!=""){
                            try{
                                $newcmt = $conect->prepare($inserircomentario);
                                $newcmt->bindParam(':textoc',$textoc,PDO::PARAM_STR);
                                $newcmt->execute();

                                if($acID!=$id){
                                    $notify = "INSERT INTO notificacoes(type,pessoa1,pessoa2) VALUES(4,$acID,$id)";
                                    $nno = $conect->prepare($notify);
                                    $nno->execute();
                                }

                                header("Refresh:0");
                            }catch(PDOException $e){}
                        }
                    }

                    if(isset($_POST["compartilhar$acIDPub"])){
                        $cop = $_POST["compartilhar$acIDPub"];
                        $textop = "$getinfoOwner->nome $getinfoOwner->sobrenome ".$show->texto;
                        $compartilharpub = "INSERT INTO publicacoes(midia,texto,idConta,idPerfil) VALUES(:midia,:texto,$id,$acID)";
                        try{
                            $ncomp = $conect->prepare($compartilharpub);
                            $ncomp->bindParam(':midia',$show->midia,PDO::PARAM_STR);
                            $ncomp->bindParam(':texto',$textop,PDO::PARAM_STR);
                            $ncomp->execute();

                            $updatecomp = "UPDATE publicacoes SET comp=comp+1 WHERE id=$acIDPub";
                            $updatecompe = $conect->prepare($updatecomp);
                            $updatecompe->execute();

                            if($acID!=$id){
                                $notify = "INSERT INTO notificacoes(type,pessoa1,pessoa2) VALUES(7,$acID,$id)";
                                $nno = $conect->prepare($notify);
                                $nno->execute();
                            }

                            header("Refresh:0");
                        }catch(PDOException $e){}
                    }

                    $comentarios = "SELECT * FROM comentarios WHERE idPerfil=$getinfoOwner->id AND idPub=$acIDPub ORDER BY id DESC";
                    try{
                        $rcomentarios = $conect->prepare($comentarios);
                        $rcomentarios->execute();
                        if($rcomentarios->rowCount()>0){
                            while($show2 = $rcomentarios->FETCH(PDO::FETCH_OBJ)){
                                $donocmt = "SELECT * FROM contas WHERE id=$show2->idConta";
                                $rdonocmt = $conect->prepare($donocmt);
                                $rdonocmt->execute();
                                $donok = $rdonocmt->FETCH(PDO::FETCH_OBJ);

                                $donocmt2 = "SELECT * FROM perfil WHERE id=$show2->idConta";
                                $rdonocmt2 = $conect->prepare($donocmt2);
                                $rdonocmt2->execute();
                                $donok2 = $rdonocmt2->FETCH(PDO::FETCH_OBJ);
                                $getrida = random_int(1,9999);

                                $diac = substr($show2->datetime,8,-9);$mes = substr($show2->datetime, 6,1);$ano = substr($show2->datetime, 0,4);
                               
                                $datac = $diac." de ".$meses[$mes]." de ".$ano." às ".substr($show2->datetime,-8,5);
                ?>
                <div class="coment">
                    <div>
                        <div>
                            <img src="/content/img/alunos/<?php echo $donok2->foto; ?>" width="30" height="30" style="border-radius:10px;">
                            <b style="margin-left:5px;"><a href="/perfil/<?php echo $donok->id; ?>"><?php echo $donok->nome." ".$donok->sobrenome.$cargo[$donok->verificado];; ?></a></b>
                        </div>
                        <a title="<?php echo $datac; ?>"><?php echo substr($show2->datetime,11,5); ?></a>
                    </div>
                    <section>
                        <textarea id="cx<?php echo $getrida ?>" cols="47" rows="0" disabled><?php echo $show2->texto; ?></textarea>
                        <script>
                            var d_height = document.getElementById("cx<?php echo $getrida ?>").scrollHeight;
                            document.getElementById("cx<?php echo $getrida ?>").setAttribute('rows',d_height/18);
                        </script>
                    </section>
                </div>
                <?php }}}catch(PDOException $e){} ?>

            </div>
        </div>
    </div>

    <?php }}}}catch(PDOException $e){ echo '<strong>ERRO DE PDO= </strong>'.$e->getMessage();} ?>
    <?php
        if(isset($_POST['excluir'])){
            $exc = $_POST['excluir'];
            $deletar = "DELETE FROM publicacoes WHERE id=$exc AND idConta=$acID";
            $deletare = $conect->prepare($deletar);
            $deletare->execute();
            header("Location: /perfil/$acID");
        }
        if(isset($_POST['curtir'])){
            $cut = $_POST['curtir'];
            $inserircurtida = "INSERT INTO curtidas(idPub,idConta) VALUES(:idPub,:idConta)";
            try{
                $curtidas = "SELECT * FROM curtidas WHERE idPub=:vidPub AND idConta=:vidConta";
                $getcurtidas = $conect->prepare($curtidas);
                $getcurtidas->bindParam(':vidPub',$cut,PDO::PARAM_INT);
                $getcurtidas->bindParam(':vidConta',$id,PDO::PARAM_INT);
                $getcurtidas->execute();
                if($getcurtidas->rowCount()>0){
                    $removercurtida = "DELETE FROM curtidas WHERE idPub=$cut AND idConta=$id";
                    $resultcurtir = $conect->prepare($removercurtida);
                    $resultcurtir->execute();
                    $curtirr = "UPDATE publicacoes SET likes=likes-1 WHERE id=$cut";
                    $curtirre = $conect->prepare($curtirr);
                    $curtirre->execute();

                    if($acID!=$id){
                        $notify = "INSERT INTO notificacoes(type,pessoa1,pessoa2) VALUES(6,$acID,$id)";
                        $nno = $conect->prepare($notify);
                        $nno->execute();
                    }

                }else{
                    $resultcurtir = $conect->prepare($inserircurtida);
                    $resultcurtir->bindParam(':idPub',$cut,PDO::PARAM_INT);
                    $resultcurtir->bindParam(':idConta',$id,PDO::PARAM_INT);
                    $resultcurtir->execute();
                    $curtirr = "UPDATE publicacoes SET likes=likes+1 WHERE id=$cut";
                    $curtirre = $conect->prepare($curtirr);
                    $curtirre->execute();

                    if($acID!=$id){
                        $notify = "INSERT INTO notificacoes(type,pessoa1,pessoa2) VALUES(5,$acID,$id)";
                        $nno = $conect->prepare($notify);
                        $nno->execute();
                    }
                }
            }catch(PDOException $e){}
            header("Refresh:0");
        }
    ?>
</div>