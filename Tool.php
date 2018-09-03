<?php

$path = __DIR__ . '/PhpToolClass';
var_dump($_SERVER);

HongInit($path);

// 递归加载文件
function HongInit($path)
{
    $file_paths = scandir($path);

    foreach ($file_paths as $file_path) {
            
        if ($file_path == '.' || $file_path == '..') continue;

        $file_path = __DIR__ . '/PhpToolClass/' . $file_path;

        if (is_dir($file_path)) {
            HongInit($file_path);
        }
        else {
            var_dump($file_path);
            include $file_path;
        }
    }
}