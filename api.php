<?php

$source_url = __DIR__ . '/data.json';

$json_data = file_get_contents($source_url);

$disks = json_decode($json_data, true);

header('Content-type: application/json');

echo json_encode($disks);
