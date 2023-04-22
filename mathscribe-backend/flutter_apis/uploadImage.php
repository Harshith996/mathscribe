<?php

    require_once '../includes/DbOperation.php';
    $response = array();

    if($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        if(
            isset($_FILES['img'])
            and isset($_POST['pc_id'])
            and isset($_POST['user_id'])
        )
        {
            $path = $_FILES['img']['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
            $file_path = "../images/";
            $full_name = $_POST['pc_id'] . "_" . $_POST['user_id'];
            $file_path = $file_path . basename($full_name) . "." . $ext;
            if(move_uploaded_file($_FILES['img']['tmp_name'], $file_path))
            {
                $response['error'] = false;
                $response['message'] = "File successfully uploaded";
            }
            else
            {
                $response['error'] = true;
                $response['message'] = "Something went wrong";
            }
        }
        else
        {
            $response['error'] = true;
            $response['message'] = "Required Fields are missing";
        }
    }
    else
    {
        $response['error'] = true;
        $response['message'] = "Invalid Request";
    }
    
    echo json_encode($response);

?>