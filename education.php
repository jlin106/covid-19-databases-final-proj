<head>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<?php
  include 'open.php';
?>
<body>
    <h2> Education and Covid-19 Data</h2>
    <div class="container row">
         <h3> Option 1: Education data from specified countries </h3>
         <div class="column left">
           <form action="education_1.php" method="post">
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
             <label for="education_atrributes">Select population data:</label>
             <br>
             <select id="education_attributes" name="education_attributes" multiple>
//             As % of Govt. Expenditure
               <option value="totalPublicExp">Total Public Expenditure on Education</option>
//             As % of Govt. Expenditure on Education
               <option value="primaryEdPercent">Government Expenditure on Primary Education</option>
//             As % of Govt. Expenditure on Education
               <option value="secondaryEdPercent">Government Expenditure on Secondary Education</option>
//             As % of Govt. Expenditure on Education
               <option value="tertiaryEdPercent">Government Expenditure on Tertiary Education</option>
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


