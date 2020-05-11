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
            <label for="country[]">Select country/countries of interest:</label>
     	      <br>
     	      <select id="country[]" name="country[]" multiple>
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
         <h3> Option 2: Population data sorted by COVID data</h3>
         <div class="column left">
           <form action="population_2.php" method="post">
             View <select id="topbottom" name="topbottom">
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select> (1-235) <input type="text" name="number"> countries by
             <select id="attribute" name="attribute">
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
         <h3> Option 3: Data sorted by population data </h3>
         <div class="column left">
           <form action="population_3.php" method="post">
             View <select id="topbottom" name="topbottom">
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select> (1-235) <input type="text" name="number"> countries by
             <select id="attribute" name="attribute">
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
