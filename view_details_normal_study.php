<?php
// Get the NCB_SRA_ID from the URL query parameter
$NCB_SRA_ID = $_GET['study_id'];

// Database connection details
$hostname = "mutaxome.ctloiszawrby.us-east-2.rds.amazonaws.com";
$username = "admin";
$password = "MutaXome2025";
$databaseName = "Colorectal Cancer Variant Atlas (CRC-VA)";

// Establish the database connection
$conn = mysqli_connect($hostname, $username, $password, $databaseName);

// Check the connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// SQL query to select the record based on Normal_Colon_Exome_Datasets_Cli
$sql = "SELECT * FROM Normal_Colon_Exome_Datasets_Cli WHERE NCB_SRA_ID = '$NCB_SRA_ID'";

// Execute the query
$result = $conn->query($sql);
$row = mysqli_fetch_array($result);

// Check if the record is found
if ($row) {
?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<body>
    <div class="container">
        <h3 text-align="left">Normal colon exome dataset information - Details</h3>
        <br />
        <div class="container">
        <a href="full_ncb_sra.php" class="btn btn-primary">Previous Table</a>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>NCB SRA ID</th>
                <td><?php echo $row["NCB_SRA_ID"]; ?></td>
            </tr>
            <tr>
                <th>Sex</th>
                <td><?php echo $row["SEX"]; ?></td>
            </tr>
            <tr>
                <th>Age</th>
                <td><?php echo $row["AGE"]; ?></td>
            </tr>
            <tr>
                <th>BioProject</th>
                <td><?php echo $row["BIOPROJECT"]; ?></td>
            </tr>
            <tr>
                <th>BioSample</th>
                <td><?php echo $row["BIOSAMPLE"]; ?></td>
            </tr>
            <tr>
                <th>Center Name</th>
                <td><?php echo $row["CENTER_NAME"]; ?></td>
            </tr>
            <tr>
                <th>Scope</th>
                <td><?php echo $row["SCOPE"]; ?></td>
            </tr>
            <tr>
                <th>Tissue</th>
                <td><?php echo $row["TISSUE"]; ?></td>
            </tr>
        </table>
    </div>
</body>
</html>
<?php
} else {
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    </head>
    <body>
        <div class="container">
            <h3 text-align="left">Normal colon exome dataset information - Details</h3>
            <br />
            <div class="container">
            <a href="full_ncb_sra.php" class="btn btn-primary">Previous Table</a>
            <p>No details found for the given NCB_SRA_ID in Clinical Information</p>
            </div>
    </div>
</body>
</html>
<?php
}
?>
