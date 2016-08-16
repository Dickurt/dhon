<?php require_once('header.php'); require_once('connection.php'); ?>

<div class="search">
	<div class="left">
		Enter a Dota hero and find the HoN equivalent<br />
		<input id="search-bar" type="text" class="search-bar" placeholder="Search hero" onkeyup="search()" />
	</div>

	<div class="right">
		<div id="search-result" class="search-result"></div>
	</div>
</div>

<div class="tile-list">
	<ul>

		<?php
			$dota_heroes = R::getAll("SELECT * FROM heroes WHERE game = 1");

			for($i = 0; $i < count($dota_heroes); $i++) :
				$hero_name = $dota_heroes[$i]['name'];
				$img_name = getImgName($hero_name);

				$has_equivalent = false;
				$equivalent_result = R::getRow("SELECT h.name FROM heroes h INNER JOIN hero_conversions c ON c.hon = h.id WHERE c.dota = ".$dota_heroes[$i]['id']);
				if($equivalent_result != null) {
					$has_equivalent = true;
					$equivalent_name = $equivalent_result['name'];
					$equivalent_img_name = getImgName($equivalent_name);
				}
		?>

			<li class="tile hero dota">

				<img class="icon" src="assets/img/dota/heroes/<?php echo $img_name; ?>.png">
				<h2><?php echo $hero_name; ?></h2>

				<?php if($has_equivalent) : ?>
					<ul>
						<li class="tile hero equivalent hon">
							<img class="icon" src="assets/img/hon/heroes/<?php echo $equivalent_img_name; ?>.jpg">
							<h2><?php echo $equivalent_name; ?></h2>
						</li>
					</ul>
				<?php endif; ?>

			</li>

		<?php endfor; ?>

	</ul>
</div>

<script>
function search(){
	var input = document.getElementById("search-bar").value;
	if(input.length < 2)
		return;

	getEquivalentHero(input, 'hon');
}
</script>

<?php require_once('footer.php'); ?>
