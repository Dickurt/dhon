<?php
require_once('connection.php');

if(isset($_GET['input']) && isset($_GET['game'])) {
	$input = $_GET['input'];
	$game = $_GET['game'];

	$result = null;
										
	if($game == 'dota'){
		$result = R::getRow('	SELECT h.name, i.input_hero
								FROM heroes h, (
									SELECT h.name AS input_hero
									FROM heroes h
									WHERE game = 2
									AND h.name = ANY (
										SELECT h.name
										FROM heroes h
										WHERE h.name LIKE "'.$input.'%")
									HAVING count(*) = 1
								) i
								WHERE h.id = ANY (
									SELECT c.dota
									FROM hero_conversions c
									WHERE c.hon = ANY (
										SELECT h.id
										FROM heroes h
										WHERE game = 2
										AND h.name LIKE "'.$input.'%"))');
	}
	else{
		$result = R::getRow('	SELECT h.name, i.input_hero
								FROM heroes h, (
									SELECT h.name AS input_hero
									FROM heroes h
									WHERE game = 1
									AND h.name = ANY (
										SELECT h.name
										FROM heroes h
										WHERE h.name LIKE "'.$input.'%")
									HAVING count(*) = 1
								) i
								WHERE h.id = ANY (
									SELECT c.hon
									FROM hero_conversions c
									WHERE c.dota = ANY (
										SELECT h.id
										FROM heroes h
										WHERE game = 1
										AND h.name LIKE "'.$input.'%"))');
	}
	
	echo json_encode($result);
}
?>