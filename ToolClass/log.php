<?php

function hLog($source)
{
	if (is_array($source)) {
		error_log(print_r($source, true));
	}
	else {
		error_log($source);
	}
}
