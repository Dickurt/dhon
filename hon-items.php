<?php require_once('header.php'); require_once('connection.php'); ?>

<div class="tile-list">
	<ul>

		<?php
			$hon_items = R::getAll("SELECT * FROM items WHERE game = 2");

			for($i = 0; $i < count($hon_items); $i++) :
				$item_names = $hon_items[$i]['name'];
				$img_name = getImgName($item_names);

				$has_equivalent = false;
				$equivalent_result = R::getRow("SELECT h.name FROM items h INNER JOIN item_conversions c ON c.dota = h.id WHERE c.hon = " . $hon_items[$i]['id']);
				if($equivalent_result != null) {
					$has_equivalent = true;
					$equivalent_name = $equivalent_result['name'];
					$equivalent_img_name = getImgName($equivalent_name);
				}
		?>

			<li class="tile item hon">
				<img class="icon" src="assets/img/hon/items/<?php echo $img_name; ?>.jpg">
				<h2><?php echo $item_names; ?></h2>
				
				<?php if($has_equivalent) : ?>
					<ul>
						<li class="tile item equivalent dota">
							<img class="icon" src="assets/img/dota/items/<?php echo $equivalent_img_name; ?>.png">
							<h2><?php echo $equivalent_name; ?></h2>
						</li>
					</ul>
				<?php endif; ?>

			</li>

		<?php endfor; ?>

	</ul>
</div>

<?php require_once('footer.php'); ?>
