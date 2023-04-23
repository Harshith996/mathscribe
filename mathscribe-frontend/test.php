<?php


$text= $_POST['text'];

$dir='/backend/images';



	// Open a known directory, and proceed to read its contents
foreach(glob('backend/images/*.jpg') as $image) 
	{	
		$name = explode('_',$image)[0];
        $fin= explode('/', $name)[2]; 

        if($fin == $text){
            $ans= explode('/', $image)[2];
            echo $ans;
            return;
        };	
	}

    $n="false";
 
    echo $n;

?>