
<?php include('helper/db_connect.php') ?>

<h3> Dashboard Counter </h3>
<div class="col-lg-12">
    <div class="row">
    <div class="card bg-success dash_total text-white col-md-2 mr-4 float-left" >
        <center>
            <h4><b>Total Registered Users</b></h4>
            <hr>
            <h3><b><?php echo $conn->query("SELECT * FROM users")->num_rows ?></b></h3>
        </center>
       </div>
       <div class="card bg-success dash_total text-white col-md-2 mr-4 float-left" >
        <center>
            <h4><b>Total Books</b></h4>
            <hr>
            <h3><b><?php echo $conn->query("SELECT * FROM books")->num_rows ?></b></h3>
        </center>
       </div>
       <div class="card bg-info dash_total text-white col-md-2 mr-4 float-left" >
        <center>
            <h4><b>Total Borrowed Books</b></h4>
            <hr>
            <h3><b><?php echo $conn->query("SELECT * FROM borrowed_books where status = 0 ")->num_rows ?></b></h3>
        </center>
       </div>
       <div class="card bg-warning dash_total text-white col-md-2 mr-4 float-left" >
        <center>
            <h4><b>Total Borrowers</b></h4>
            <hr>
            <h3><b><?php echo $conn->query("SELECT * FROM borrowers ")->num_rows ?></b></h3>
        </center>
       </div>
    </div>
</div>
<script>

</script>