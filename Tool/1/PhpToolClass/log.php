<?php

if (function_exists('hlog')) {
    die('hlog 函数已经被定义.');
}
else {
    function hlog($source) {
        error_log(' ');
        error_log('----- start ----');

        if (is_array($source)) {
            error_log(print_r($source, true));
        }
        else {
            error_log($source);
        }

        error_log('-----  end  ----');
    }
}