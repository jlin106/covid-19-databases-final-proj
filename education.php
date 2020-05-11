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
         <h3> Option 2: Education data sorted by COVID data </h3>
         <div class="column left">
           <form action="education_2.php" method="post">
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
         <h3> Option 3: Data sorted by education data </h3>
         <div class="column left">
           <form action="education_3.php" method="post">
             View <select id="topbottom" name="topbottom">
               <option value="top">top</option>
               <option value="bottom">bottom</option>
             </select> (1-235) <input type="text" name="number"> countries by
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
