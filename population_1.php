<head>
 <title>Population Data Option 1</title>
</head>
<body>
<?php
//
//
// function outputResultsTableHeader() {
//    echo "<tr>";
//    echo "<th>countryId</th>";
//    echo "<th>estPopSize</th>";
//    echo "<th>popDensity</th>";
//    echo "<th>rateIncrease</th>";
//    echo "<th>lifeExpectancy</th>";
//    echo "<th>mortalityRate</th>";
//    echo "<th>fertilityRate</th>";
//    echo "</tr>";
// }
//
// function getIDsFromCountries($country_names)
//   $ids_array = array();
//   $ids = $mysqli->query("SELECT countryId FROM Country WHERE name IN ('$countries_list');");
//   while ($rows = $ids>fetch_assoc()) {
//     $countryId = $rows['countryId'];
//     array_push($ids_array, $countryId)
//   }
//   return $ids_array;
// }
//
//
// // Open a database connection
// include 'open.php';
//
// // Configure error reporting settings
// ini_set('error_reporting', E_ALL); // report errors of all types
// ini_set('display_errors', true);   // report errors to screen (don't hide from user)
//
// // Collect the data input posted here from the calling page
// // The associative array called S_POST stores data using names as indices
// $countries = $_POST['countries'];
// $attributes = $_POST['pop_attributes'];

// $countries_list = $mysqli->real_escape_string(implode(', ', $countries));
// $country_ids = getIDsFromCountries($countries_list);
// $country_ids_list = $mysqli->real_escape_string(implode(', ', $country_ids));
// $query = "SELECT * FROM Population WHERE countryId IN ('$country_ids_list');";
// // Call the stored procedure named ShowRawScores
// // "multi_query" executes given (multiple-statement) MySQL query
// // It returns true if first statement executed successfully; false otherwise.
// // Results of first statement are retrieved via $mysqli->store_result()
// // from which we can call ->fetch_row() to see successive rows
// if ($mysqli->multi_query($query)) {
//
//    // Check if a result was returned after the call
//    if ($result = $mysqli->store_result()) {
//
//        echo "<table border=\"1px solid black\">";
//        $row = $result->fetch_row();
//
//        // If the first row of result begins with 'ERROR: ', then our
//        // stored procedure produced a relation that indicates error(s)
//        if (strcmp($row[0], 'ERROR: ') == 0) {
//            echo "<tr><th> Result </th></tr>";
//            do {
//                echo "<tr><td>" ;
//                for($i = 0; $i < sizeof($row); $i++){
//                    echo $row[$i];
//                }
//                echo "</td></tr>";
//            } while ($row = $result->fetch_row());
//
//
//        // Otherwise, we received real results, so output table
//        } else {
//
//            // Output appropriate table header row
//            outputResultsTableHeader();
//
//            // Output each row of resulting relation
//            do {
//                echo "<tr>";
//                for($i = 0; $i < sizeof($row); $i++){
//                    echo "<td>" . $row[$i] . "</td>";
//                }
//                echo "</tr>";
//            } while($row = $result->fetch_row());
//        }
//
//        echo "</table>";
//        $result->close();
//
//    }
//
// // The "multi_query" call did not end successfully, so report the error
// // This might indicate we've called a stored procedure that does not exist,
// // or that database connection is broken
// } else {
//        printf("<br>Error: %s\n", $mysqli->error);
// }
//
// // Close the connection created above by including 'open.php' at top of this file
// mysqli_close($mysqli);


?>
</body>
