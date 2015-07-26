<?php

$username = 'matt.vitale@angieslist.com';
$password = 'Ap94qv304!3';

$ad = ldap_connect("hqaddc01.angieslist.com") or die("Couldn't connect to LDAP");
//ldap_set_option($ad, LDAP_OPT_PROTOCOL_VERSION, 3);

$bd = ldap_bind($ad,$username,$password) or die("Couldn't bind to LDAP");

if ($bd) {
	echo "It works";
} else {
	echo "No work";
}

?>