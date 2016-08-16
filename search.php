<?php require_once('header.php'); require_once('connection.php'); ?>

<div class="search-page">
	Find an equivalent hero in the selected game
	<input id="search-bar" type="text" class="search-bar" placeholder="Search hero" onkeyup="search()" />
	<select id="game" name="game" class="game-dropdown" onchange="search()">
		<option value="dota">Find me a Dota hero</option>
		<option value="hon">Find me a HoN hero</option>
	</select>
</div>

<div id="search-page-result" class="search-page-result">

</div>

<script>
function getEquivalentHero(input, game) {
	var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        	if(xmlhttp.responseText == "null") {
        		document.getElementById("search-result").innerHTML = 'No equivalent hero found';
        		return;
        	}

        	var response = JSON.parse(xmlhttp.responseText);

        	var input_game = 'dota';

        	var img_filename = response.name.toLowerCase().replace(" ", "_");
        	var img_filename_input_hero = response.input_hero.toLowerCase().replace(" ", "_");
        	if(game == 'hon') {
        		img_filename += '.jpg';
        		img_filename_input_hero += ".png";
        	}
        	else {
        		input_game = 'hon';
        		img_filename += '.png';
        		img_filename_input_hero += ".jpg";
        	}

        	var input_hero =	'<div style="display: block; margin: 0px auto;" class="tile hero ' + input_game + '">'
									+ '<img class="icon" src="assets/img/' + input_game + '/heroes/' + img_filename_input_hero + '">'
									+ '<h2>' + response.input_hero + '</h2>'
								+ '</div>';

			var equals =		'<h1 align="center">=</h1>';

        	var equivalent_hero = 	'<div style="display: block; margin: 0px auto;" class="tile hero ' + game + '">'
									+ '<img class="icon" src="assets/img/' + game + '/heroes/' + img_filename + '">'
									+ '<h2>' + response.name + '</h2>'
								+ '</div>';

            document.getElementById("search-result").innerHTML = input_hero + equals + equivalent_hero;
        }
    }

	xmlhttp.open("GET", "getequivalenthero.php?input=" + input + "&game=" + game, true);
	xmlhttp.send();
}

function search() {
	var input = document.getElementById("search-bar").value;
	if(input.length < 2)
		return;

	var game = document.getElementById("game").value;

	getEquivalentHero(input, game);
}
</script>

<?php require_once('footer.php'); ?>
