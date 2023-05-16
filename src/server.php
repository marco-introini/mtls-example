<?php

if ($_SERVER['SSL_CLIENT_VERIFY'] != 'SUCCESS') {
    die('SSL client verification failed');
}

echo "Welcome ".$_SERVER["SSL_CLIENT_S_DN_CN"];