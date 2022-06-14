
<?php 

    $users = $conn->query("SELECT * FROM users order by `name` asc ");
    
?>
<div class="card card-cascade wider ml-1 mr-1  col-md-12" >
    <div class="card-header">
        
        <div class="card-title">
            User List
        </div>
    </div>
    <div class="card-body">
    <table class="table table-bordered">
        <colgroup>
            <col width="10%">
            <col width="10%">
            <col width="20%">
            <col width="20%">
            <col width="10%">
            <col width="20%">
        </colgroup>
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Type</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            $i = 1;
            while($row= $users->fetch_assoc()){   
                ?>
                <tr>
                    <td class="text-center"><?php echo $i++; ?></td>
                    <td><?php echo $row['name']; ?></td>
                    <td><?php echo $row['email']; ?></td>
                    <td><?php echo $row['username']; ?></td>
                    <td> <?php if($row['user_type'] == 1): ?>
                        User 
                     <?php endif; ?></td>
                    <td>
                        <center>
                            <button class="btn btn-sm btn-danger remove_borrower" data-id="<?php echo $row['id'] ?>">Delete</button>
                        </center>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
    </div>
</div>
<script>
$('table').dataTable();
$('.remove_borrower').click(function(){
    var _conf = confirm("Are you sure to delete this data?");
    if(_conf == true){
        $.ajax({
            url:'ajax.php?action=delete_user',
            method:'POST',
            data:{id:$(this).attr('data-id')},
            error:err=>{
                console.log(err)
            },
            success:function(resp){
                if(resp == 1){
                    alert('Data successfully deleted');
                    location.reload()
                }
            }
        })
    }

})
</script>