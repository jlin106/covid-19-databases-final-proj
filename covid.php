<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
  <?php
    include 'open.php';
  ?>
  <h2> Covid-19 Data </h2>
  <div class="container row">
    <h3> Option 1: Query by date and sorted attribute </h3>
    <div class="column left">
      <form action="covid_1.php" method="post">
        <label for="covid_date">Enter date (01/22/2020 to 05/08/2020):</label>
        <br>
        <input type="date" id="covid_date" name="covid_date"
               min="2020-01-22" max="2020-05-08">
        <br>
        <br>
        <label for="country">Sort by attribute:</label>
        <select id="covid_attribute" name="covid_attribute">
          <option value="numConfirmed">Number of Confimed Cases</option>
          <option value="numDeaths">Number of Deaths</option>
          <option value="numRecovered">Number of Recovered Cases</option>
        </select>
        <input type="submit" value="Submit">
      </form>
    </div>
  </div>
  <br>
  <div class="container row">
    <h3> Option 2: Query by date and country </h3>
    <div class="column left">
      <form action="covid_2.php" method="post">
        <label for="covid_date">Enter date (01/22/2020 to 05/08/2020):</label>
        <br>
        <input type="date" id="covid_date" name="covid_date"
               min="2020-01-22" max="2020-05-08">
        <br>
        <br>
        <label for="country">Select country/countries of interest:</label>
	      <br>
	      <select id="country" name="country" multiple>
          <?php
            $countries = $mysqli->query("SELECT name FROM Country");
            while ($rows = $countries->fetch_assoc()) {
              $country_name = $rows['name'];
              echo "<option value='$country_name'>$country_name</option>";
            }
          ?>
        </select>
        <input type="submit" value="Submit">
      </form>
    </div>
  </div>
  <br>
  <div class="container row">
    <h3> Option 3: Time series by country</h3>
    <div class="column left">
      <form action="covid_3.php" method="post">
        <label for="country">Select one country of interest:</label>
	      <br>
	      <select id="country" name="country">
          <?php
          $countries = $mysqli->query("SELECT name FROM Country");
            while ($rows = $countries->fetch_assoc()) {
              $country_name = $rows['name'];
              echo "<option value='$country_name'>$country_name</option>";
            }
          ?>
        </select>
        <input type="submit" value="Submit">
      </form>
    </div>
  </div>
</body>
