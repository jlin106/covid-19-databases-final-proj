<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Health and Covid-19 Data</h2>
    <p> Health statistics: </p>
    <ul>
      <li>Health Expenditure</li>
      <li>Refugees and Asylum Seekers Percentage</li>
      <li>Physicians Per 1000</li>
      <li>Percentage of Population with Access to Safe Sanitation Facilities</li>
      <li>Percentage of Population with Access to Safe Water Facilities</li>
    </ul>
    <div class="container row">
      <h3> Option 1: Query by country </h3>
      <p> View Health statistics along with Covid-19 statistics of selected countries </p>
         <div class="column left">
           <form action="health_1.php" method="post">
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
         <p> (Ex. View 5 countries' health data with the highest number of confirmed cases) </p>
         <div class="column left">
           <form action="health_2.php" method="post">
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
         <h3> Option 3: Query sort based on Health statistic </h3>
         <p> Sort the data based on an Health statistic and view the top few or bottom few countries' data. </p>
         <p> (Ex. View 5 countries' health data with the highest Health Expenditure) </p>
         <div class="column left">
           <form action="health_3.php" method="post">
             View either the top countries or bottom countries
             <select id="topbottom" name="topbottom" required>
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select>
             Enter number of countries to display (1-235)
             <input type="text" name="number" required>
             Sort by Health statistic:
             <select id="attribute" name="attribute" required>
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
