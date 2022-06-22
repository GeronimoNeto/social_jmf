<?php
    ob_start();
    session_start();
    include("./content/code/erro.php");
?>
<!DOCTYPE html>
<html lang="en">
    <?php
    if(isset($_SESSION['email'])&&(isset($_SESSION['senha']))){
        include("./content/code/sessao.php");
        include("./content/pages/feed.php");
    }else{
        
    
        include("./content/code/conexao.php");
        include("./content/code/login.php");
        include("./content/code/cadastro.php");
        include("./content/pages/login.php");
    }
?>
</html>