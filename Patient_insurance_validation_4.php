<?php
   # Defining PatientRecord interface
   interface PatientRecord {
      public function getId();
      public function getPn();
   }

   # Defining Patient class
   class Patient implements PatientRecord {
        private $_id;
        private $pn;
        private $first;
        private $last;
        private $dob;
        private $insurances;

        # Constructor
        public function __construct($pn) {
            # Connecting with MySQLserver (server, user, password, database)
            $connect=mysqli_connect("localhost","root","","testtaskdb") or die ("Connection Failed");


            # Selecting patient table data from database
            $sql = "SELECT * FROM patient WHERE pn = '$pn'";
            $result = mysqli_query($connect, $sql);

            # Filling out class properties
            if (mysqli_num_rows($result) > 0) {
                $row = mysqli_fetch_assoc($result);
                $this->_id = $row["_id"];
                $this->pn = $row["pn"];
                $this->first = $row["first"];
                $this->last = $row["last"];
                $this->dob = $row["dob"];
                }
            # Select insurance table data from database
            $sql = "SELECT *, DATE_FORMAT(from_date, '%y-%m-%d') AS from_date, DATE_FORMAT(to_date, '%y-%m-%d') AS to_date FROM insurance WHERE patient_id = '$this->_id'";
            $result = mysqli_query($connect, $sql);

            # Filling out insurances property with Insurance instances
            $this->insurances = array();
            if (mysqli_num_rows($result) > 0) {
                while($row = mysqli_fetch_assoc($result)) {
                $insurance = new Insurance($row["_id"], $row["patient_id"], $row["iname"], $row["from_date"], $row["to_date"]);
                array_push($this->insurances, $insurance);
                #echo $row['from_date'];
                }
            }
        }

        # Implement PatientRecord methods
        public function getId() {
            return $this->_id;
        }

        public function getPn() {
            return $this->pn;
            }

        # Other methods
        public function getName() {
            return $this->last . ", " . $this->first;
        }

        public function getInsurances() {
            return $this->insurances;
        }

        public function printInsuranceTable($date) {
           # echo "Patient Number, Last First, Insurance name, Is Valid\n";
            foreach ($this->insurances as $insurance) {
            $isValid = $insurance->isValid($date) ? "Yes" : "No";
            echo "Patient Number: " . $this->pn . ", " . $this->getName() . ", " . $insurance->getName() . ", " . $isValid . "\n";
            #echo $date;
            }
        }
    }

    # Define Insurance class
    class Insurance implements PatientRecord{
        private $_id;
        private $patient_id;
        private $iname;
        private $from_date;
        private $to_date;

        public function getId() {
            return $this->_id;
        }

        public function getPn() {
            return $this->pn;
            }

        public function __construct($_id, $patient_id, $iname, $from_date, $to_date) {
            $this->_id = $_id;
            $this->patient_id = $patient_id;
            $this->iname = $iname;
            $this->from_date = $from_date;
            $this->to_date = $to_date;
        }

        public function getName() {
            return $this->iname;
        }

        public function isValid($date) {
            $date = date('Y-m-d');
            $timestamp = strtotime($date);
		    return $timestamp >= strtotime($this->from_date) && $timestamp <= strtotime($this->to_date);
        }
    }
    ?>

<?php
    # Create Patient instance
    $patient = new Patient("52345578765");

    # Display patient Id
    $patient->getId() . "\n";

    # Display patient Pn
    $patient->getPn() . "\n";

    # Display patient name
    $patient->getName() . "\n";

    # Display patient insurances
    $insurances = $patient->getInsurances();
    foreach ($insurances as $insurance) {
        $insurance->getName() . "\n";
    }

    # Print insurance table for a specific date
    $patient->printInsuranceTable(date('m-d-y'));
    ?>