<?php
   // Database connection
   $hostname = "mutaxome.ctloiszawrby.us-east-2.rds.amazonaws.com";
   $username = "admin";
   $password = "MutaXome2025";
   $databaseName = "Colorectal Cancer Variant Atlas (CRC-VA)";
   
   $conn = mysqli_connect($hostname, $username, $password, $databaseName);
   if (!$conn) {
       die("Connection failed: " . mysqli_connect_error());
   }

   // SQL query to select data from Cancer_Study_Data table
   $sql = "SELECT * FROM Colorectal_Cancer_Exome_Dataset";

   $result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colon cancer and Normal colon exome dataset information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />

</head>
<body>
    <div class="container">
        <h3 text-align="left">Colon cancer and Normal colon exome dataset information</h3>
        <br />
        <div class="table-responsive">
            <table id="data" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <td>NCB SRA ID</td>
                        <td>Cancer Name</td>
                        <td>Design</td>
                        <td>Instrument</td>
                        <td>Strategy</td>
                        <td>Source</td>
                        <td>Selection</td>
                        <td>Layout</td>
                        <td>Isolate</td>
                        <td>BioProject</td>
                        <td>BioSample</td>
                        <td>Clinical Info</td>
                    </tr>
                </thead>
                <tbody>
                <?php
                // Check if there are results and display them
                if ($result->num_rows > 0){
                    while($row = mysqli_fetch_array($result)) {
                        echo '
                        <tr>
                            <td>'.$row["NCB_SRA_ID"].'</td>
                            <td>'.$row["Cancer_Name"].'</td>
                            <td>'.$row["Design"].'</td>
                            <td>'.$row["Instrument"].'</td>
                            <td>'.$row["Strategy"].'</td>
                            <td>'.$row["Source"].'</td>
                            <td>'.$row["Selection"].'</td>
                            <td>'.$row["Layout"].'</td>
                            <td>'.$row["Isolate"].'</td>
                            <td>'.$row["BioProject"].'</td>
                            <td>'.$row["BioSample"].'</td>
                            <td>
                                <a href="view_details_cancer_study.php?study_id='.$row["NCB_SRA_ID"].'" class="btn btn-info">Clinical Info</a>
                            </td>
                        </tr>
                        ';
                    }
                } else {
                    echo "<tr><td colspan='12'>No records found</td></tr>";
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // Initialize DataTable with search and sorting functionality
        $(document).ready(function() {
            // Initialize DataTable
            var table = $('#data').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": true,  // Enable search functionality
                "ordering": true,   // Enable sorting
                "info": true,
                "autoWidth": false,
                "pageLength": 5 
            });

            // If you dynamically add rows or modify table, re-initialize DataTable
            table.draw();
        });
    </script>

</body>
</html>

<?php
mysqli_close($conn);  // Close database connection
?>