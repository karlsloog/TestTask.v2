<?php 
// Connecting with MySQLserver (server, user, password, database)
    $connect=mysqli_connect("localhost","root","","testtaskdb") or die ("Connection Failed");

// Referring to the required tables
    $query="SELECT 	p.pn,
                    p.last,
                    p.first,
                    i.iname,
                    DATE_FORMAT(i.from_date, '%m-%d-%y') AS fromdate,
                    DATE_FORMAT(i.to_date, '%m-%d-%y') AS todate
            FROM 	patient p
            JOIN    insurance i ON p.pn
            WHERE 	p._id = i.patient_id
            ORDER BY i.from_date, p.last;";

// Fetching each row as an assoc. array
    $result=mysqli_query($connect,$query);
    while($row=mysqli_fetch_assoc($result))
{
    // Extract values from the array
    $pn = $row['pn'];
    $last = $row['last'];
    $first = $row['first'];
    $iname = $row['iname'];
    $from_date = $row['fromdate'];
    $to_date = $row['todate'];

    // Print the values to the console
    echo "$pn, $last, $first, $iname, $from_date, $to_date\n";
}
    ?> 