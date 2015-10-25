<?php
	if(!is_dir($_SERVER['DOCUMENT_ROOT'] .'uico/'.date('Y').'/')) mkdir($_SERVER['DOCUMENT_ROOT'] .'wp-content/uploads/fivedoll/'.date('Y').'/',0777);
	if(!is_dir($_SERVER['DOCUMENT_ROOT'] .'uico/'.date('Y').'/'.date('m').'/')) mkdir($_SERVER['DOCUMENT_ROOT'] .'wp-content/uploads/fivedoll/'.date('Y').'/'.date('m').'/',0777);
	
	$targetFolder = 'uico/'.date('Y').'/'.date('m'); // Relative to the root	
			
	if(1) {
		$tempFile = $_FILES['fileToUpload']['tmp_name'];
		$targetPath = $_SERVER['DOCUMENT_ROOT'] . $targetFolder;
		//$targetFile = rtrim($targetPath,'/') . '/' . $_FILES['fileToUpload']['name'];
		// Validate the file type
		$fileTypes = array('jpg','jpeg','gif','png'); // File extensions
		$fileParts = pathinfo($_FILES['fileToUpload']['name']);
		
		$targetFile = rtrim($targetPath,'/') . '/' . md5($_FILES['fileToUpload']['name'].time()) . '.' .$fileParts['extension'];
		
		if (in_array($fileParts['extension'],$fileTypes)) {
			move_uploaded_file($tempFile);
			move_uploaded_file($_FILES['fileToUpload']['tmp_name'],iconv('utf-8','gb2312',$_FILES['fileToUpload']['name']));
			$res = array(
					'fileToUpload' => $_FILES['fileToUpload']['name'],
					'targetPath' => $targetFolder . '/' . md5($_FILES['fileToUpload']['name']) . '.' .$fileParts['extension'],
			);
			echo json_encode($res);
		} else {
			echo 'Invalid file type.';
		}
		
	}
?>
