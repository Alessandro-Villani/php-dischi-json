<?php

//Preparing DB Url
$source_url = __DIR__ . '/data.json';

//Recover data from DB Url
$json_data = file_get_contents($source_url);

//Convert data into PHP
$disks = json_decode($json_data, true);

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
