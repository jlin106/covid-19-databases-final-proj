<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
  <?php
    include 'open.php';
  ?>
  <h2> Trade and Covid-19 Data </h2>
  <p> Trade statistics: </p>
  <ul>
    <li>Major Trading Partners - Imports</li>
    <ul>
      <li>Country Name</li>
      <li>Percent Import of Total Trade</li>
    </ul>
    <li>Major Trading Partners - Exports</li>
    <ul>
      <li>Country Name</li>
      <li>Percent Export of Total Trade</li>
    </ul>
  </ul>
  <div class="container row">
    <h3> Option 1: Query by country </h3>
    <p> For the selected countries, display their major trading partners (imports and exports)
      along with some trade statistics and Covid-19 statistics </p>
    <div class="column left">
      <form action="trade_1.php" method="post">
        <label for="country[]">Select country/countries of interest:</label>
        <br>
        <select id="country[]" name="country[]" multiple required>
           <?php
             $countries = $mysqli->query("SELECT name FROM Country");
             while ($rows = $countries->fetch_assoc()) {
               $country_name = $rows['name'];
               echo "<option value='$country_name'>$country_name</option>";
             }
           ?>
         </select>
         <br>
         <input type="submit" value="Submit">
      </form>
    </div>
  </div>
</body>
