<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Travel and Covid-19 Data</h2>
    <div class="container row">
         <h3> Option 1: Travel data from specified countries </h3>
         <div class="column left">
           <form action="travel_1.php" method="post">
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
             <label for="travel_atrributes">Select travel data:</label>
             <br>
             <select id="travel_attributes" name="travel_attributes" multiple>
//             Percent of Total Population
               <option value="migrantPercentOfPop">International Migrant Percentage</option>
//             Total number
               <option value="numRefugeesAndAsylum">Refugees and Asylum Seekers Percentage</option>
//             Millions of US Dollars
               <option value="tourismExp">Toursim Expenditure</option>
//             Thousands of Arrivals
               <option value="numTourists">Tourist/Visitor Arrivals</option>
               <option value="numConfirmed">Number of Confirmed Cases</option>
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

