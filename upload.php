<?php

include __DIR__.'/vendor/autoload.php';
require './src/Instagram.php';

if (!isset($_POST['user'])){
    echo 'should be POST';
    return;
}

$username = $_POST['user'];
$password = $_POST['password'];
$video =  $_POST['video'];
$caption = $_POST['caption'];

$i = new \InstagramAPI\Instagram(false);

$i->setUser($username, $password);

try {
    $i->login();
} catch (Exception $e) {
    $e->getMessage();
    exit();
}

try {
    $i->uploadVideo($video, $caption);
} catch (Exception $e) {
    echo $e->getMessage();
}
