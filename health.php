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
         <h3> Option 2: Health data sorted by COVID data </h3>
         <div class="column left">
           <form action="health_2.php" method="post">
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
         <h3> Option 3: Data sorted by health data </h3>
         <div class="column left">
           <form action="health_3.php" method="post">
             View <select id="topbottom" name="topbottom">
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select> (1-235) <input type="text" name="number"> countries by
             <select id="attribute" name="attribute">
               <option value="healthExp">Health Expenditure</option>
               <option value="physiciansPer1000">Physicians Per 1000</option>
               <option value="popUsingSafeSanitationFacilities">Percentage of Population with Access to Safe Sanitation Facilities</option>
               <option value="popUsingSafeWaterServices">Percentage of Population with Access to Safe Water Facilities</option>
             </select>.
             <br>
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
</body>
