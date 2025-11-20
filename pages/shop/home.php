<!-- Admin Quick Access -->
<?php if(is_loggedin() && web_admin_level()>=9) { ?>
<div class="admin-toolbar mb-4">
	<a href="<?php print $shop_url; ?>categories" class="btn btn-info btn-sm">
		<i class="fa fa-cog"></i> <?php print $lang_shop['administration_categories']; ?>
	</a>
	<a href="<?php print $shop_url; ?>admin/paypal" class="btn btn-success btn-sm">
		<i class="fa fa-dollar"></i> <?php print $lang_shop['administration_pp']; ?>
	</a>
</div>
<?php } ?>

<!-- Hero Section -->
<div class="hero-section mb-5">
	<div class="hero-content text-center">
		<h1 class="hero-title">
			<i class="fa fa-gem"></i> <?php print $lang_shop['site_title']; ?>
		</h1>
		<p class="hero-subtitle">Categorie dello Shop</p>
	</div>
</div>

<!-- Nuovi Arrivi Section -->
<?php
	try {
		$newest_items = is_get_newest_items(8);
		if(is_array($newest_items) && count($newest_items) > 0) {
?>
<div class="newest-items-section mb-5">
	<div class="section-header mb-4">
		<h2 class="section-title-large">
			<i class="fa fa-star"></i> Nuovi Arrivi
		</h2>
		<p class="section-subtitle">Gli ultimi item aggiunti al nostro shop</p>
	</div>

	<div class="row">
		<?php
			require_once __DIR__ . '/../../include/functions/wishlist.php';
			$account_id = get_account_id();

			foreach($newest_items as $row) {
				$in_wishlist = wishlist_has($account_id, $row['id']);
				$item_name = !$item_name_db ? get_item_name($row['vnum']) : get_item_name_locale_name($row['vnum']);
		?>
		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<div class="newest-item-card item-with-wishlist">
				<!-- Bottone Wishlist -->
				<a href="<?php print $shop_url.'wishlist?action='.($in_wishlist ? 'remove' : 'add').'&item_id='.$row['id'].'&vnum='.$row['vnum'].'&name='.urlencode($item_name).'&price='.$row['coins']; ?>"
				   class="wishlist-heart-btn <?php echo $in_wishlist ? 'in-wishlist' : ''; ?>"
				   onclick="return confirm('<?php echo $in_wishlist ? 'Rimuovere dai preferiti?' : 'Aggiungere ai preferiti?'; ?>')">
					<i class="fa fa-heart<?php echo $in_wishlist ? '' : '-o'; ?>"></i>
				</a>

				<a href="<?php print $shop_url.'item/'.$row['id'].'/'; ?>">
					<div class="card text-center">
						<div class="card-block">
							<!-- Badge NUOVO sempre visibile qui -->
							<span class="badge badge-new-item">
								<i class="fa fa-star"></i> NUOVO
							</span>

						<div class="min-image-item">
							<center>
								<img class="image-item" src="<?php print $shop_url; ?>images/items/<?php print get_item_image($row['vnum']); ?>.png">
							</center>
						</div>

						<?php if($row['discount']>0) { ?>
						<span class="badge badge-danger font-weight-bold strong pull-right">- <?php print $row['discount']; ?>%</span>
						<?php }
							if($row['expire']>0) {
								$expire = date("Y-m-d H:i:s", $row['expire']);
						?>
						<p class="card-text"><small class="font-weight-bold strong pull-right text-danger" data-countdown="<?php print $expire; ?>"></small></p>
						<?php }
							if($row['type']==3) {
						?>
						<p class="card-text"><small class="font-weight-bold strong pull-right text-danger"><?php print $lang_shop['bonus_selection']; ?></small></p>
						<?php } ?>
					</div>
						<div class="card-footer text-muted">
							<?php echo $item_name; ?>
						</div>
					</div>
				</a>
			</div>
		</div>
		<?php } ?>
	</div>
</div>
<?php
		}
	} catch (Exception $e) {
		// Silently skip if there's an error loading newest items
		error_log("Error loading newest items: " . $e->getMessage());
	}
?>

<!-- Categories Grid - Professional MMORPG Layout -->
<div class="categories-showcase">
	<div class="row justify-content-center g-4">
		<?php
			$list = array();
			$list = is_categories_list();

			if(!count($list)) {
				echo '<div class="col-12 text-center"><p class="text-muted">Nessuna categoria disponibile</p></div>';
			} else {
				foreach($list as $row) {
					$hasPromo = checkForPromotions($row['id']);
		?>
		<div class="col-lg-4 col-md-6 col-sm-12">
			<a href="<?php print $shop_url.'category/'.$row['id'].'/'; ?>" class="category-card-link">
				<div class="category-card <?php echo $hasPromo ? 'has-promotion' : ''; ?>">
					<?php if($hasPromo) { ?>
					<div class="promo-badge">
						<i class="fa fa-fire"></i>
						<span>PROMO</span>
					</div>
					<?php } ?>

					<div class="category-card-image">
						<img src="<?php print $shop_url; ?>images/items/img_categorie/<?php print $row['img']; ?>.png"
						     alt="<?php print $row['name']; ?>"
						     onerror="this.onerror=null; this.src='<?php print $shop_url; ?>images/default-category.png';">
						<div class="category-overlay">
							<i class="fa fa-arrow-circle-right"></i>
							<span>Esplora</span>
						</div>
					</div>

					<div class="category-card-footer">
						<h3 class="category-name"><?php print $row['name']; ?></h3>
						<div class="category-divider"></div>
					</div>
				</div>
			</a>
		</div>
		<?php
				}
			}
		?>
	</div>
</div>