<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Population and Covid-19 Data</h2>
    <div class="container row">
         <h3> Option 1: Population data from specified countries </h3>
         <div class="column left">
           <form action="population_1.php" method="post">
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
	     <br>
	     <br>
             <label for="pop_atrributes">Select population data:</label>
             <br>
             <select id="pop_attributes" name="pop_attributes" multiple>
               <option value="estPopSize">Estimated Population Size</option>
               <option value="popDensity">Population Density</option>
               <option value="rateIncrease">Population Rate of Increase</option>
               <option value="lifeExpectancy">Life Expectancy</option>
               <option value="mortalityRate">Mortality Rate</option>
               <option value="fertilityRate">Fertility Rate</option>
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
         <h3> Option 2:</h3>
         <div class="column left">
           <form action="" method="post">
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
       <br>
       <div class="container row">
         <h3> Option 3:</h3>
         <div class="column left">
           <form action="" method="post">
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
</body>

