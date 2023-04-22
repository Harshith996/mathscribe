<?php

class DbOperation {
    private $con;
    function __construct()
    {
        require_once 'DbConnect.php';
        $db = new DbConnect();
        $this->con = $db->connect();
    }

    ///////////////////////////////////////////////////
    // Core User Operations
    public function register_user()
    {
        $query = "INSERT INTO `user_id`(`user_id`) VALUES (NULL);";
        $stmt = $this->con->prepare($query);
        if($stmt->execute()){
            $user_id = $this->con->insert_id;
            $values['user_id'] = $user_id;
            return $values;
        }
        else
        {
            return -1;
        }
    }

    public function obtain_session_code()
    {
        $query = "INSERT INTO `pc_id`(`pc_id`) VALUES (NULL);";
        $stmt = $this->con->prepare($query);
        if($stmt->execute()){
            $pc_id = $this->con->insert_id;
            $values['pc_id'] = $pc_id;
            return $values;
        }
        else
        {
            return -1;
        }
    }

}

?>