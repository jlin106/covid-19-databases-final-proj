<head>
 <title>Option2</title>
 <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<?php


function outputResultsTableHeader() {
   echo "<tr>";
   echo "<th> Country Name </th>";
   echo "<th> Number of Confirmed Cases </th>";
   echo "<th> Number of Deaths </th>";
   echo "<th> Number of Recovered Cases </th>";
   echo "</tr>";
}

// Open a database connection
include 'open.php';

// Configure error reporting settings
ini_set('error_reporting', E_ALL); // report errors of all types
ini_set('display_errors', true);   // report errors to screen (don't hide from user)

// Collect the data input posted here from the calling page
// The associative array called S_POST stores data using names as indices
$countries = $_POST['country'];
$covid_date = $_POST['covid_date'];

$countries_list = implode(', ', $countries);

echo "<h2> Option 2: Query by date and country </h2>";
echo "<div class='container row'>";
echo "<h3> Date: ";
echo $covid_date;
echo "</h3>";
echo "<h3> Countries of Interest: ";
echo $countries_list;
echo "</h3>";

echo "<table border=\"1px solid black\">";
outputResultsTableHeader();

// Retrieving each selected option
foreach ($countries as $country) {
  // It returns true if first statement executed successfully; false otherwise.
  // Results of first statement are retrieved via $mysqli->store_result()
  // from which we can call ->fetch_row() to see successive rows
  if ($mysqli->multi_query("CALL CovidByCountry('".$covid_date."','".$country."');")) {
  // Check if a result was returned after the call
     if ($result = $mysqli->store_result()) {
	 $row = $result->fetch_row();
         // Output each row of resulting relation
         do {
             echo "<tr>";
             for($i = 0; $i < sizeof($row); $i++){
                 echo "<td>" . $row[$i] . "</td>";
             }
             echo "</tr>";
         } while($row = $result->fetch_row());
	 $result->close();
	 $mysqli->next_result();
     } else {
	echo "<tr>";
	echo "<td>";
	echo $country;
	echo "</td>";
	echo "<td> No data </td>";
	echo "<td> No data </td>";
	echo "<td> No data </td>";
        echo "</tr>";
     }
  // The "multi_query" call did not end successfully, so report the error
  // This might indicate we've called a stored procedure that does not exist,
  // or that database connection is broken
  } else {
     printf("<br>Error: %s\n", $mysqli->error);
  }
}
echo "</table>";

// Close the connection created above by including 'open.php' at top of this file
mysqli_close($mysqli);
echo "</div>";

?>
</body>

