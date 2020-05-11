<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Labor Force and Covid-19 Data</h2>
    <div class="container row">
         <h3> Option 1: Labor force data from specified countries </h3>
         <div class="column left">
           <form action="laborforce_1.php" method="post">
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
         <h3> Option 2: Labor force data sorted by COVID data </h3>
         <div class="column left">
           <form action="laborforce_2.php" method="post">
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
         <h3> Option 3: Data sorted by labor force data </h3>
         <div class="column left">
           <form action="laborforce_3.php" method="post">
             View <select id="topbottom" name="topbottom">
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select> (1-235) <input type="text" name="number"> countries by
             <select id="attribute" name="attribute">
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
