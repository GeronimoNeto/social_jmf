<?php 
    $types = [
        0=>"Adicionou você aos amigos",
        1=>"Removeu você dos amigos",
        2=>"Foi adicionado(a) aos amigos",
        3=>"Foi removido(a) dos amigos",
    
        4=>"Comentou em uma publicação",
        5=>"Curtiu uma publicação sua",
        6=>"Removeu uma curtida de uma publicação sua",

        7=>"Compartilhou uma publicação sua",
    ];
?>
<div class='notificacao' id="notificacao"></div>
<div class="mynoti" id="mynoti">
    <?php 
        try{
            $notificacoes = "SELECT * FROM notificacoes WHERE pessoa1=$id ORDER BY id DESC";
            $noti = $conect->prepare($notificacoes);
            $noti->execute();
            while($n=$noti->FETCH(PDO::FETCH_OBJ)){
                $tp = $types[$n->type];
                $pessoa2 = "SELECT * FROM contas WHERE id=$n->pessoa2;";
                $p2 = $conect->prepare($pessoa2);
                $p2->execute();
                $pp2 = $p2->FETCH(PDO::FETCH_OBJ);
                $p2nome = $pp2->nome;

    ?>
    <div class="dotp">
        <b><?php echo "<a href='/perfil/$pp2->id'>$p2nome</a> $tp"; ?></b>
    </div>
    <?php 
        }}catch(PDOException $e){}
    ?>
</div>
<script>
    notificacao = document.getElementById("notificacao")
    mynoti = document.getElementById("mynoti")
    let state = 1
    notificacao.addEventListener("click",()=>{
        if(state==0){
            state=1
            mynoti.style="left:-1000px;"
        }else if(state==1){
            state=0
            mynoti.style="left:50px;"
        }
    })
</script>