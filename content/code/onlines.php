<?php 
    $onlines = "SELECT status FROM contas WHERE status>0";
    try{
        $on = $conect->prepare($onlines);
        $on->execute();
        $row = $on->rowCount();

        $updatestatus = "UPDATE status SET onlines=$row";
        $up = $conect->prepare($updatestatus);
        $up->execute();

        echo "<div class='userson' id='userson'>$row </div>";
    }catch(PDOException $e){}
?>
<script>
    
</script>
<style>
    .userson:hover::after{
        content: " Online";
    }
</style>