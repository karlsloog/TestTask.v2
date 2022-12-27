<?php 
# Connecting with MySQLserver (server, user, password, database)
    $connect=mysqli_connect("localhost","root","","testtaskdb") or die ("Connection Failed");

# Referring to the required tables
    $query="SELECT 	pnt.pn,
                    pnt.last,
                    pnt.first,
                    ins.iname,
                    DATE_FORMAT(ins.from_date, '%m-%d-%y') AS fromdate,
                    DATE_FORMAT(ins.to_date, '%m-%d-%y') AS todate
            FROM 	patient pnt, insurance ins 
            WHERE 	pnt._id=ins.patient_id
            ORDER BY ins.from_date DESC,
                    pnt.last DESC;";

# Running while loop and fetching data from database
    $result=mysqli_query($connect,$query);
    while($row=mysqli_fetch_assoc($result))
{
    echo $row['pn'], ", ", $row['last'], ", ", $row['first'], ", ", $row['iname'], ", ", $row['fromdate'], ", ", $row['todate'], "<br>";
}
    ?> 