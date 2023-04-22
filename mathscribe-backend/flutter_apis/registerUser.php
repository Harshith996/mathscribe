<?php

    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    require_once '../includes/DbOperation.php';
    $response = array();

    if($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $db = new DbOperation();
        $user = $db->register_user();
        $response['error'] = false;
        $response['user_id'] = $user['user_id'];
        $response['message'] = 'User registered successfully';
    }
    else
    {
        $response['error'] = true;
        $response['message'] = "Invalid Request";
    }
    
    echo json_encode($response);

?>