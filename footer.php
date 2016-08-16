				</div>
			</div>
		</div>

		<script>
			function getEquivalentHero(input, game){
				var xmlhttp = new XMLHttpRequest();
			    xmlhttp.onreadystatechange = function() {
			        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			        	if(xmlhttp.responseText == "null"){
			        		document.getElementById("search-result").innerHTML = 'No equivalent hero found';
			        		return;
			        	}

			        	var response = JSON.parse(xmlhttp.responseText);

			        	var input_game = 'dota';

			        	var img_filename = response.name.toLowerCase().replace(" ", "_");
			        	var img_filename_input_hero = response.input_hero.toLowerCase().replace(" ", "_");
			        	if(game == 'hon'){
			        		img_filename += '.jpg';
			        		img_filename_input_hero += ".png";
			        	}
			        	else{
			        		input_game = 'hon';
			        		img_filename += '.png';
			        		img_filename_input_hero += ".jpg";
			        	}

			        	var input_hero =	'<div style="vertical-align: middle; display: inline-block;" class="tile hero ' + input_game + '">'
												+ '<img class="icon" src="assets/img/' + input_game + '/heroes/' + img_filename_input_hero + '">'
												+ '<h2>' + response.input_hero + '</h2>'
											+ '</div>';

						var equals =		'<b style="background: #444; padding: 10px; border-radius: 5px; margin: 0px 10px;">Equals</b>';

			        	var equivalent_hero = 	'<div style="vertical-align: middle; display: inline-block;" class="tile hero ' + game + '">'
												+ '<img class="icon" src="assets/img/' + game + '/heroes/' + img_filename + '">'
												+ '<h2>' + response.name + '</h2>'
											+ '</div>';

			            document.getElementById("search-result").innerHTML = input_hero + equals + equivalent_hero;
			        }
			    }

				xmlhttp.open("GET", "getequivalenthero.php?input=" + input + "&game=" + game, true);
				xmlhttp.send();
			}
		</script>

	</body>
</html>