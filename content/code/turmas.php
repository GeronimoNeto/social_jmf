<b>Turma</b>
<?php 
    try{ $turmas = "SELECT * FROM turmas"; 
        $t = $conect->prepare($turmas);
        $t->execute();
        $url =  $_SERVER['REQUEST_URI'];
        if($acID==$id && $url=="/perfil/$acID"){
            echo "<select name='turmas' id='turmas'>";
            while ($a = $t->FETCH(PDO::FETCH_OBJ)){
                echo "<option value='$a->valor' id='$a->valor'>$a->nome</option>";
            }
            echo "</select><script> turma = document.getElementById('$pTurma'); turma.selected=true </script>";
        }else{
            $te = "SELECT nome FROM turmas WHERE valor='$pTurma'";
            $tee = $conect->prepare($te);
            $tee->execute();
            $teee = $tee->FETCH(PDO::FETCH_OBJ);
            echo "<b style='font-size:13px;'>$teee->nome</b>";
        }
    }catch(PDOException $e){}
?>