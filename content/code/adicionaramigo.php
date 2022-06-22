<?php
    if(isset($_POST['addfriend'])){
        try{
            $verifyfriend = "SELECT * FROM amigos WHERE pessoa1=$id AND pessoa2=$acID";
            $rverifyfriend = $conect->prepare($verifyfriend);
            $rverifyfriend->execute();
            if($rverifyfriend->rowCount()<1){
                $adim = "INSERT INTO amigos(pessoa1,pessoa2,status) VALUES($id,$acID,1)";
                $radim = $conect->prepare($adim);
                $radim->execute();

                $notify = "INSERT INTO notificacoes(type,pessoa1,pessoa2) VALUES(0,$acID,$id)";
                $nno = $conect->prepare($notify);
                $nno->execute();
                $notify2 = "INSERT INTO notificacoes(type,pessoa1,pessoa2) VALUES(2,$id,$acID)";
                $nno2 = $conect->prepare($notify2);
                $nno2->execute();


                echo "<div style='position:absolute;width:100%;display:flex;justify-content:flex-end;align-items:center;'><b style='color:green;margin-right:10%;margin-top:55px;'>Você adicionou $acnome $acsobrenome aos amigos!</b></div>";
                header("Refresh:2");
            }else{
                echo "<div style='position:absolute;width:100%;display:flex;justify-content:flex-end;align-items:center;'><b style='color:red;margin-right:10%;margin-top:55px;'>Já está na lista de amigos!</b></div>";
                header("Refresh:2");
            }
        }catch(PDOException $e){}
    }
?>