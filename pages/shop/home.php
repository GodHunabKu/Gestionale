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