<?php

$source_url = __DIR__ . '/data.json';

$json_data = file_get_contents($source_url);

$disks = json_decode($json_data, true);

$genre = $_GET['genre'] ?? '';

if ($genre) {
    $filtered_results = array_filter($disks, fn ($disk) => $disk['genre'] === $genre);

    $disks = $filtered_results;
}

header('Content-type: application/json');

echo json_encode($disks);
