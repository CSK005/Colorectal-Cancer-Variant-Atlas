<?php
// Database connection details
$hostname = "mutaxome.ctloiszawrby.us-east-2.rds.amazonaws.com";
$username = "admin";
$password = "MutaXome2025";
$databaseName = "Colorectal Cancer Variant Atlas (CRC-VA)";

$conn = mysqli_connect($hostname, $username, $password, $databaseName);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Get the ID from the query string
$NCB_SRA_ID = $_GET['study_id'];

// SQL query to get the details of the selected record
$sql = "SELECT * FROM Colorectal_Cancer_Clinical_Info WHERE NCB_SRA_ID = '$NCB_SRA_ID'";

$result = $conn->query($sql);
$row = mysqli_fetch_array($result);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Details - Colon cancer and Normal colon exome dataset information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<body>
    <div class="container">
        <h3 text-align="left">Colon cancer exome dataset information - Details</h3>
        <div class="container">
        <a href="full_cancer_view.php" class="btn btn-primary">Previous Table</a>
        </div>
        <br />
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <tr><td><strong>NCB SRA ID:</strong></td><td><?php echo $row["NCB_SRA_ID"]; ?></td></tr>
                <tr><td><strong>SEX:</strong></td><td><?php echo $row["SEX"]; ?></td></tr>
                <tr><td><strong>AGE:</strong></td><td><?php echo $row["AGE"]; ?></td></tr>
                <tr><td><strong>BMI:</strong></td><td><?php echo $row["BMI"]; ?></td></tr>
                <tr><td><strong>CENTER NAME:</strong></td><td><?php echo $row["CENTER_NAME"]; ?></td></tr>
                <tr><td><strong>COLLECTION PROCEDURE:</strong></td><td><?php echo $row["COLLECTION_PROCEDURE"]; ?></td></tr>
                <tr><td><strong>DEVELOPMENT STAGE:</strong></td><td><?php echo $row["DEVELOPMENTAL_STAGE"]; ?></td></tr>
                <tr><td><strong>SCOPE:</strong></td><td><?php echo $row["SCOPE"]; ?></td></tr>
                <tr><td><strong>TISSUE:</strong></td><td><?php echo $row["TISSUE"]; ?></td></tr>
                <tr><td><strong>TISSUE1:</strong></td><td><?php echo $row["TISSUE1"]; ?></td></tr>
               <!-- <tr><td><strong>Open Link:</strong></td>
                    <td>
                    <?php 
                     // Correct way to embed PHP within HTML
                     echo '<a href="' . $row["Url"] . $row["NCB_SRA_ID"] . '" class="btn btn-info" target="_blank">Click Here</a>';
                     ?>
                    </td>
                </tr> -->

            </table>
        </div>
    </div>

    <br />
</body>
</html>

<?php
mysqli_close($conn);  // Close the database connection
// https://www.ebi.ac.uk/ena/browser/view/SRR10550018
?>
