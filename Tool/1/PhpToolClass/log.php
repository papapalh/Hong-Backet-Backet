<?php

if (function_exists('hlog')) {
    die('hlog 函数已经被定义.');
}
else {
    function hlog($source) {

        $scriptPath = array_shift(debug_backtrace());

        error_log('----- start ----');

        if (is_string($source)) {
            error_log($source);
        }
        else {
            error_log(print_r($source, true));
        }

        error_log('-----  end  ----');
        error_log('log路径为: ' . $scriptPath['file']);
    }
}