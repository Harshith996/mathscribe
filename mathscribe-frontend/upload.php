 <!-- 

// error_reporting (E_ALL ^ E_NOTICE);


// var_dump($_FILES);
// echo ini_get('file_uploads');
// echo 'file_uploads: '. ini_get('file_uploads'). '<br />';
// echo 'upload_tmp_dir: '. ini_get('upload_tmp_dir'). '<br />';
// echo 'upload_max_filesize: '. ini_get('upload_max_filesize'). '<br />';
// echo 'max_file_uploads: '. ini_get('max_file_uploads'). '<br />';


// if (($_FILES['file']['name']!="")){
// // Where the file is going to be stored
// 	$target_dir = "upload/";
// 	$file = $_FILES['file']['name'];
// 	$path = pathinfo($file);
// 	$filename = $path['filename'];
// 	$ext = $path['extension'];
// 	$temp_name = $_FILES['file']['tmp_name'];
// 	$path_filename_ext = $target_dir.$filename.".".$ext;
 
// // Check if file already exists
// if (file_exists($path_filename_ext)) {
//  echo "Sorry, file already exists.";
//  }else{
//  move_uploaded_file($temp_name,$path_filename_ext);
//  echo "Congratulations! File Uploaded Successfully.";
//  }
// }

// -->

<?php
if(isset($_POST['submit'])){
        $name       = $_FILES['file']['name'];  
        $temp_name  = $_FILES['file']['tmp_name']; 

		$new_name = "math." . explode(".", $name)[1];
        if(isset($name) and !empty($name)){
            $location = 'C:\xampp\htdocs\mathscribe_test\\';      
            if(move_uploaded_file($temp_name, $location.$new_name)){
                echo 'File uploaded successfully';
            }
        } else {
            echo 'You should select a file to upload !!';
        }
    

        header('Location: render.html');
 		exit;
}

?>