<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Population and Covid-19 Data</h2>
    <p> Population statistics: </p>
    <ul>
      <li>Estimated Population Size</li>
      <li>Population Density</li>
      <li>Population Rate of Increase</li>
      <li>Life Expectancy</li>
      <li>Infant Mortality Rate</li>
      <li>Fertility Rate</li>
    </ul>
    <div class="container row">
         <h3> Option 1: Query by country </h3>
         <p> View Population statistics along with Covid-19 statistics of selected countries </p>
         <div class="column left">
           <form action="population_1.php" method="post">
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
       <br>
       <div class="container row">
         <h3> Option 2: Query sort based on Covid-19 statistic </h3>
         <p> Sort the data based on a Covid-19 statistic and view the top few or bottom few countries' data. </p>
         <p> (Ex. View 5 countries' population data with the highest number of confirmed cases) </p>
         <div class="column left">
           <form action="population_2.php" method="post">
             View either the top countries or bottom countries
             <select id="topbottom" name="topbottom" required>
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select>
             Enter number of countries to display (1-235)
             <input type="text" name="number" required>
             Sort by Covid-19 statistic:
             <select id="attribute" name="attribute" required>
               <option value="numConfirmed">Number of Confirmed Cases</option>
               <option value="numDeaths">Number of Deaths</option>
               <option value="numRecovered">Number of Recovered</option>
             </select>.
             <br>
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
       <br>
       <div class="container row">
         <h3> Option 3: Query sort based on Population statistic </h3>
         <p> Sort the data based on a Population statistic and view the top few or bottom few countries' data. </p>
         <p> (Ex. View 5 countries' population data with the highest Estimated Population Size) </p>
         <div class="column left">
           <form action="population_3.php" method="post">
             View either the top countries or bottom countries
             <select id="topbottom" name="topbottom" required>
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select>
             Enter number of countries to display (1-235)
             <input type="text" name="number" required>
             Sort by Population statistic:
             <select id="attribute" name="attribute" required>
               <option value="estPopSize">Estimated Population Size</option>
               <option value="popDensity">Population Density</option>
               <option value="rateIncrease">Population Rate of Increase</option>
               <option value="lifeExpectancy">Life Expectancy</option>
               <option value="mortalityRate">Infant Mortality Rate</option>
               <option value="fertilityRate">Fertility Rate</option>
             </select>.
             <br>
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
</body>
