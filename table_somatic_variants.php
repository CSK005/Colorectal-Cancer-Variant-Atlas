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

   // SQL query to select data from Somatic_Variant_Data table
   $sql = "SELECT * FROM Somatic_Variant_Data";

   $result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Somatic Variant Data information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />


</head>
<body>
    <br /><br />
    <div class="container">
        <h3 text-align="left">Somatic Variant Data</h3>
        <br />
        <div class="table-responsive">
            <table id="data" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <td>SRR ID</td>
                        <td>Total Variants</td>
                        <td>SNPs</td>
                        <td>MNP</td>
                        <td>INS</td>
                        <td>DEL</td>
                        <td>Transitions</td>
                        <td>Transversions</td>
                        <td>Missense Variants</td>
                        <td>Silent Variants</td>
                        <td>Nonsense Variants</td>
                    </tr>
                </thead>
                <tbody>
                <?php

                // Check if there are results and display them
                if ($result->num_rows > 0){
                    while($row = mysqli_fetch_array($result)) {
                        echo '
                        <tr>
                            <td>'.$row["SRR_ID"].'</td>
                            <td>'.$row["Total_Variants"].'</td>
                            <td>'.$row["SNPs"].'</td>
                            <td>'.$row["MNP"].'</td>
                            <td>'.$row["INS"].'</td>
                            <td>'.$row["DEL"].'</td>
                            <td>'.$row["Transitions"].'</td>
                            <td>'.$row["Transversions"].'</td>
                            <td>'.$row["Missense_Variants"].'</td>
                            <td>'.$row["Silent_Variants"].'</td>
                            <td>'.$row["Nonsense_Variants"].'</td>
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