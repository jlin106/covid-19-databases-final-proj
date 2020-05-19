<head>
 <title>Pop. Option 2</title>
 <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<?php


function outputResultsTableHeader() {
   echo "<tr>";
   echo "<th> Country </th>";
   echo "<th> Estimated Population Size<br />(millions) </th>";
   echo "<th> Population Density<br />(per km<sup>2</sup>) </th>";
   echo "<th> Population Rate of Increase<br />(annual %) </th>";
   echo "<th> Life Expectancy<br />(years) </th>";
   echo "<th> Infant Mortality Rate<br />(per 1000 live births) </th>";
   echo "<th> Fertility Rate<br />(live births per woman)</th>";
   echo "<th> Number of Confimed Cases </th>";
   echo "<th> Number of Deaths </th>";
   echo "<th> Number of Recovered Cases </th>";
   echo "</tr>";
}


// Open a database connection
// The call below relies on files named open.php and dbase-conf.php
// It initializes a variable named $mysqli, which we use below
include 'open.php';

// Configure error reporting settings
ini_set('error_reporting', E_ALL); // report errors of all types
ini_set('display_errors', true);   // report errors to screen (don't hide from user)

// Collect the data input posted here from the calling page
// The associative array called S_POST stores data using names as indices
$topbottom = $_POST['topbottom'];
$number = $_POST['number'];
$attribute = $_POST['attribute'];


echo "<h2> Option 2: Query population data by sorted by COVID data </h2>";
echo "<div class='container row'>";
echo "<h3> Currently showing ";
echo $topbottom;
echo " ";
echo $number;
echo " countries sorted by ";
echo ($attribute == 'numConfirmed') ? "number of confirmed cases." : "";
echo ($attribute == 'numDeaths') ? "number of deaths." : "";
echo ($attribute == 'numRecovered') ? "number of recovered cases" : "";
echo "</h3>";

echo "<table border=\"1px solid black\">";

// It returns true if first statement executed successfully; false otherwise.
// Results of first statement are retrieved via $mysqli->store_result()
// from which we can call ->fetch_row() to see successive rows
if ($mysqli->multi_query("CALL PopulationCovid('".$topbottom."','".$number."','".$attribute."');")) {

   // Check if a result was returned after the call
   if ($result = $mysqli->store_result()) {

       echo "<table border=\"1px solid black\">";
       $row = $result->fetch_row();

       // Output appropriate table header row
       outputResultsTableHeader();

       // Output each row of resulting relation
       do {
           echo "<tr>";
           for($i = 0; $i < sizeof($row); $i++){
               echo "<td>" . $row[$i] . "</td>";
           }
           echo "</tr>";
       } while($row = $result->fetch_row());
       echo "</table>";
       $result->close();

   }

// The "multi_query" call did not end successfully, so report the error
// This might indicate we've called a stored procedure that does not exist,
// or that database connection is broken
} else {
       printf("<br>Error: %s\n", $mysqli->error);
}

// Close the connection created above by including 'open.php' at top of this file
mysqli_close($mysqli);
echo "</div>";


?>
</body>
