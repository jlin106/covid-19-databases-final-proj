<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Education and Covid-19 Data</h2>
    <p> Education statistics: Total Public Expenditure on Education (% of govt. exp),
       Government Expenditure on Primary Education (% of govt. exp. on education),
       Government Expenditure on Secondary Education (% of govt. exp. on education),
       Government Expenditure on Tertiary Education (% of govt. exp. on education)</p>
    <div class="container row">
         <h3> Option 1: Query by country </h3>
         <p> View Education statistics along with Covid-19 statistics of selected countries </p>
         <div class="column left">
           <form action="education_1.php" method="post">
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
         <h3> Option 2: Query sort based on Covid-19 statistic </h3>
         <p> Sort the data based on a Covid-19 statistic and view the top few or bottom
           few countries' data. </p>
         <p> (Ex. View the 5 countries' education data with the highest number of confirmed cases) </p>
         <div class="column left">
           <form action="education_2.php" method="post">
             View either the top countries or bottom countries
             <select id="topbottom" name="topbottom">
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select>
             Enter number of countries to display (1-235)
             <input type="text" name="number">
             Sort by Covid-19 statistic:
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
         <h3> Option 3: Query sort based on Education statistic </h3>
         <p> Sort the data based on an Education statistic and view the top few or bottom
           few countries' data. </p>
         <p> (Ex. View the 5 countries' education data with the highest Total Public Expenditure on Education) </p>
         <div class="column left">
           <form action="education_3.php" method="post">
             View either the top countries or bottom countries
             <select id="topbottom" name="topbottom">
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select>
             Enter number of countries to display (1-235)
             <input type="text" name="number">
             Sort by Education statistic:
             <select id="attribute" name="attribute">
               <option value="totalPublicExp">Total Public Expenditure on Education</option>
               <option value="primaryEdPercent">Government Expenditure on Primary Education</option>
               <option value="secondaryEdPercent">Government Expenditure on Secondary Education</option>
               <option value="tertiaryEdPercent">Government Expenditure on Tertiary Education</option>
             </select>.
             <br>
             <input type="submit" value="Submit">
           </form>
         </div>
       </div>
</body>
