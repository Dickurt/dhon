<?php
// Get the database credentials from another file,
// so that our credentials won't have to live in
// the Git repo.
require_once('credentials.php');
DEFINE('HOST', DHON_DB_HOST);
DEFINE('USER', DHON_DB_USER);
DEFINE('PASS', DHON_DB_PASS);
DEFINE('DBNAME', DHON_DB_NAME);

require_once('rb.php');

R::setup('mysql:host='.HOST.';dbname='.DBNAME, USER, PASS);
R::freeze(true); // Enables transactions

/**
 * Global helper function that is included here since this
 * file gets included everywhere anyway.
 */
function getImgName($hero_name) {
	return preg_replace("/ /", "_", strtolower($hero_name));
}
?>
