<?php 
if(isset($_POST['fechar'])){
    header("Location: /");
}
if(isset($_POST['cadastrar'])){
    $nascimento = $_POST['nascimento'];
    $genero = $_POST['genero'];
    $nome = ucfirst(strtolower($_POST['nome']));
    $sobrenome = ucfirst(strtolower($_POST['sobrenome']));
    $email = $_POST['email'];
    $senha = base64_encode($_POST['senha']);
    $verificado = 0;
    $status = 0;
    if(!empty(ctype_alpha($nome))&&!empty(ctype_alpha($sobrenome))&&!empty($email)&&!empty($senha)&&!empty($nascimento)){
        errorMes(2);
        try{
            
            $checkregis = "SELECT * FROM contas WHERE email=:emailCheckR";
            $resulterR = $conect->prepare($checkregis);
            $resulterR->bindParam(':emailCheckR',$email,PDO::PARAM_STR);
            $resulterR->execute();
            if($resulterR->rowCount()>0){
                errorMes(3);
            }else{
                $cadastro = "INSERT INTO contas (nome, sobrenome, email, senha, verificado, status, nascimento) VALUES (:nome, :sobrenome, :email, :senha, :verificado, :status, :nascimento)";
                $result = $conect->prepare($cadastro);
                $result->bindParam(':nome',$nome,PDO::PARAM_STR);
                $result->bindParam(':sobrenome',$sobrenome,PDO::PARAM_STR);
                $result->bindParam(':email',$email,PDO::PARAM_STR);
                $result->bindParam(':senha',$senha,PDO::PARAM_STR);
                $result->bindParam(':verificado',$verificado,PDO::PARAM_STR);
                $result->bindParam(':status',$status,PDO::PARAM_STR);
                $result->bindParam(':nascimento',$nascimento,PDO::PARAM_STR);
                $result->execute();
                
                $checklogin = "SELECT * FROM contas WHERE email=:emailCheck";
                $resulter = $conect->prepare($checklogin);
                $resulter->bindParam(':emailCheck',$email,PDO::PARAM_STR);
                $resulter->execute();
                if($resulter->rowCount()>0){
                    $apelido = "";
                    $capa = "capa.png";
                    $biografia = "Escreva algo legal :)";
                    $turma = "none";

                    if($genero=="o"){
                        $fotos = ["m1","m2","m3","h1","h2","h3"];
                        $foto = $fotos[random_int(0,5)].".png";
                    }else{
                        $foto = $genero.random_int(1,3).".png";
                    }

                    $rc = $resulter->fetch(PDO::FETCH_OBJ);
                    $idCheck = $rc->id;
                    $perfil = "INSERT INTO perfil(id,apelido,capa,biografia,turma,foto) VALUES(:idp,:apelido,:capa,:biografia,:turma,:foto)";
                    $perfilresult = $conect->prepare($perfil);
                    $perfilresult->bindParam(':idp',$idCheck,PDO::PARAM_STR);
                    $perfilresult->bindParam(':apelido',$apelido,PDO::PARAM_STR);
                    $perfilresult->bindParam(':capa',$capa,PDO::PARAM_STR);
                    $perfilresult->bindParam(':biografia',$biografia,PDO::PARAM_STR);
                    $perfilresult->bindParam(':turma',$turma,PDO::PARAM_STR);
                    $perfilresult->bindParam(':foto',$foto,PDO::PARAM_STR);
                    $perfilresult->execute();
                }
            }
        }catch(PDOException $e){
            echo "<strong>ERRO DE CADASTRO PDO = </strong>".$e->getMessage();
        }
    }else{
        errorMes(0);
    }
}
?>