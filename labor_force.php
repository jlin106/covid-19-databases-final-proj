<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Labor Force and Covid-19 Data</h2>
    <div class="container row">
      <h3> Option 1: Query by country </h3>
      <p> View Labor Force statistics along with Covid-19 statistics of selected countries </p>
         <div class="column left">
           <form action="laborforce_1.php" method="post">
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
         <p> (Ex. View 5 countries' labor force data with the highest number of confirmed cases) </p>
         <div class="column left">
           <form action="laborforce_2.php" method="post">
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
         <h3> Option 3: Query sort based on Labor Force statistic </h3>
         <p> Sort the data based on a Labor Force statistic and view the top few or bottom few countries' data. </p>
         <p> (Ex. View 5 countries' labor force data with the highest Labor Force Participation Rate) </p>
         <div class="column left">
           <form action="laborforce_3.php" method="post">
             View either the top countries or bottom countries
             <select id="topbottom" name="topbottom" required>
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select>
             Enter number of countries to display (1-235)
             <input type="text" name="number" required>
             Sort by Labor Force statistic:
             <select id="attribute" name="attribute" required>
               <option value="laborForceParticipationRate">Labor Force Participation Rate</option>
               <option value="unemploymentRate">Unemployment Rate</option>
               <option value="percentEmplAgriculture">Percentage Employed in Agriculture</option>
               <option value="percentEmplIndustry">Percentage Employed in Industry</option>
               <option value="percentEmplServices">Percentage Employed in Service</option>
             </select>.
             <br>
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
</body>
