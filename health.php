<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Health and Covid-19 Data</h2>
    <div class="container row">
         <h3> Option 1: Health data from specified countries </h3>
         <div class="column left">
           <form action="health_1.php" method="post">
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
             <label for="health_atrributes">Select health data:</label>
             <br>
             <select id="health_attributes" name="health_attributes" multiple>
//              Percent of Total Government Expenditure
               <option value="healthExp">Healht Expenditure</option>
//              Physicians Per 1000
               <option value="physiciansPer1000">Physicians Per 1000</option>
//              Percent of Total Population
               <option value="popUsingSafeSanitationFacilities">Percentage of Population with Access to Safe Sanitation Facilities</option>
//              Percent of Total Population
               <option value="popUsingSafeWaterServices">Percentage of Population with Access to Safe Water Facilities</option>
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


