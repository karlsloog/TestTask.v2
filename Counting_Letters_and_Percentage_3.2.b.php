<?php
// Connecting with MySQLserver (server, user, password, database)
$connect=mysqli_connect("localhost","root","","testtaskdb") or die ("Connection failed");
$query="SELECT last, first FROM patient";
$result=mysqli_query($connect,$query);

    // Making one long string with DB records.
    $fullname='';

    while ($row=mysqli_fetch_assoc($result)) {
            $fullname.=$row["last"].$row["first"];
            };
    
    /** 
     * Selecting last and first db values in uppercase,
     * so when you run script then it won't separate upper and lowercase letters.
     * Removed all whitespaces, when patient may have multible names.
     * Sorting all splited letters ASC
     */
    $names = strtoupper($fullname);
    $names=str_replace(' ','',$names);
    $splitLetters = str_split($names);
    sort($splitLetters);
    $countLetters = count($splitLetters);

    // Calculating the letters.
    $letters = [];

    foreach($splitLetters as $letter){
        if(isset($letters[$letter])){
            $letters[$letter] += 1;
        } else {
            $letters[$letter] = 1;  
        } 
    }

    // Printing out how many times letters were used and their percentage
    // Percentage calculation is made in the echo. Rounds to two decimal points.
    foreach($letters as $letter => $total){
        echo $letter."\t".$total."\t".round(($total/$countLetters*100),2)." %"."\n";
    }
?>