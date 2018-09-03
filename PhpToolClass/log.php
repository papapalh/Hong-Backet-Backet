<?php

if (function_exists('hLog')) {
    die('Hlog 函数已经被定义.');
}
else {
    function hLog($source) {
        error_log('----- start ----');
        error_log('-----'. __FILE__.'----');

        if (is_array($source)) {
            error_log(print_r($source, true));
        }
        else {
            error_log($source);
        }

        error_log('----- end ----');
    }
}
