<?php
    $formatP = ["png","jpg","jpeg","JPG","gif"];
    if(isset($_POST['alterfoto'])){
        $extensao = pathinfo($_FILES['foto']['name'],PATHINFO_EXTENSION);
        if(in_array($extensao, $formatP) && $_FILES['foto']['size']<=2097152){
            $pasta = "../content/img/alunos/";
            $temporario = $_FILES['foto']['tmp_name'];
            $novoNome = md5($id.$token).".jpg";
            $mudarfoto = "UPDATE perfil SET foto=:foto WHERE id=$id";
            try{
                $resultfoto = $conect->prepare($mudarfoto);
                $resultfoto->bindParam(':foto',$novoNome,PDO::PARAM_STR);
                $resultfoto->execute();
                $upar = move_uploaded_file($temporario, $pasta.$novoNome);
                echo "<div class='imgerro' style='background-color:green;'>Sucesso ao alterar foto! Limpe o cache caso não apresente mudanças.</div>";
                header("Refresh:2");
            }catch(PDOException $e){}
        }else{
            echo "<div class='imgerro'>Excedeu o limite de 2mb ou o formato do arquivo é inválido.</div>";
            header("Refresh:2");
        }
    }
    if(isset($_POST['altercape'])){
        $extensao = pathinfo($_FILES['cape']['name'],PATHINFO_EXTENSION);
        if(in_array($extensao, $formatP) && $_FILES['cape']['size']<=2097152){
            $pasta = "../content/img/capas/";
            $temporario = $_FILES['cape']['tmp_name'];
            $novoNome = md5($id.$token).".jpg";
            $mudarcapa = "UPDATE perfil SET capa=:capa WHERE id=$id";
            try{
                $resultcapa = $conect->prepare($mudarcapa);
                $resultcapa->bindParam(':capa',$novoNome,PDO::PARAM_STR);
                $resultcapa->execute();
                $uparcapa = move_uploaded_file($temporario, $pasta.$novoNome);
                echo "<div class='imgerro' style='background-color:green;'>Sucesso ao alterar foto! Limpe o cache caso não apresente mudanças.</div>";
                header("Refresh:2");
            }catch(PDOException $e){}
        }else{
            echo "<div class='imgerro'>Excedeu o limite de 2mb ou o formato do arquivo é inválido.</div>";
            header("Refresh:2");
        }
    }

    if(isset($_POST['cancelfoto'])){header("Location:./");}
    if(isset($_POST['cancelcape'])){header("Location:./");}
?>