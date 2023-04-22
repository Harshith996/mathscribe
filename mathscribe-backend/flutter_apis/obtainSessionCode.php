<?php

    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    require_once '../includes/DbOperation.php';
    $response = array();
    $db = new DbOperation();
    $pc = $db->obtain_session_code();
    echo $pc['pc_id'];

?>