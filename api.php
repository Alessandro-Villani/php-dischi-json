<?php

const DB_SERVERNAME = 'localhost';
const DB_USERNAME = 'root';
const DB_PASSWORD = 'root';
const DB_NAME = 'dischi';

try {
    $con = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME);
} catch (Exception $e) {
    echo $e->getMessage();
    die();
}

$disks = [];

try {
    $sql = 'SELECT `disks`.`title` AS `title`, `authors`.`name` AS `author`, `disks`.`year` AS `year`, `disks`.`poster` AS `poster`, `genres`.`name` AS `genre` 
    FROM `disks`
    JOIN `genres`
    ON `genres`.`id` = `disks`.`genre_id`
    JOIN `authors`
    ON `authors`.`id` = `disks`.`author_id`
    ORDER BY `disks`.`id`';
    $result = $con->query($sql);
    if ($result->num_rows) {
        while ($row = $result->fetch_assoc()) {
            array_push($disks, $row);
        }
    }
} catch (Exception $e) {
    echo $e->getMessage();
    die();
}

//Preparing DB Url
//$source_url = __DIR__ . '/data.json';

//Recover data from DB Url
//$json_data = file_get_contents($source_url);

//Convert data into PHP
//$disks = json_decode($json_data, true);

//Api call by genre
$genre = $_GET['genre'] ?? '';

if ($genre) {
    $filtered_results = array_filter($disks, fn ($disk) => $disk['genre'] === $genre);

    $disks = $filtered_results;
}

//Defining output format
header('Content-type: application/json');

//Sending
echo json_encode($disks);
