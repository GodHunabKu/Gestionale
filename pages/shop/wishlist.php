<?php
	// Wishlist - Item Preferiti Utente
	require_once __DIR__ . '/../../include/functions/wishlist.php';

	if(!is_loggedin()) {
		redirect($shop_url.'login');
		exit;
	}

	$account_id = get_account_id();

	// Gestione add/remove
	if(isset($_GET['action']) && isset($_GET['item_id'])) {
		$item_id = intval($_GET['item_id']);

		if($_GET['action'] == 'add' && isset($_GET['vnum']) && isset($_GET['name']) && isset($_GET['price'])) {
			$vnum = intval($_GET['vnum']);
			$name = $_GET['name'];
			$price = intval($_GET['price']);
			wishlist_add($account_id, $item_id, $vnum, $name, $price);
			redirect($shop_url.'wishlist');
		} elseif($_GET['action'] == 'remove') {
			wishlist_remove($account_id, $item_id);
			redirect($shop_url.'wishlist');
		}
	}

	$wishlist = wishlist_get($account_id);
?>

<div class="wishlist-page">
	<div class="wishlist-header mb-4">
		<h1 class="wishlist-title">
			<i class="fa fa-heart"></i> I Miei Preferiti
		</h1>
		<p class="wishlist-subtitle">
			<?php echo count($wishlist); ?> item nella tua wishlist
		</p>
	</div>

	<?php if(count($wishlist) == 0) { ?>
		<div class="alert alert-info text-center py-5">
			<i class="fa fa-heart-o" style="font-size: 4rem; opacity: 0.3; margin-bottom: 1rem;"></i>
			<h3>La tua wishlist è vuota</h3>
			<p>Aggiungi item ai preferiti cliccando il cuore sulle card item!</p>
			<a href="<?php print $shop_url; ?>" class="btn btn-primary mt-3">
				<i class="fa fa-shopping-cart"></i> Esplora lo Shop
			</a>
		</div>
	<?php } else { ?>
		<div class="row">
			<?php foreach($wishlist as $item) {
				// Ottieni dati completi item dal database
				$sth = $database->runQuerySqlite('SELECT * FROM item_shop_items WHERE id = ?');
				$sth->bindParam(1, $item['item_id'], PDO::PARAM_INT);
				$sth->execute();
				$row = $sth->fetch();

				if($row) {
					$final_price = $row['discount'] > 0 ? $row['coins'] - ($row['coins'] * $row['discount'] / 100) : $row['coins'];
			?>
			<div class="col-md-3 mb-4">
				<div class="wishlist-item-card">
					<!-- Bottone Rimuovi -->
					<a href="<?php print $shop_url.'wishlist?action=remove&item_id='.$row['id']; ?>"
					   class="wishlist-remove-btn"
					   onclick="return confirm('Rimuovere dai preferiti?')">
						<i class="fa fa-times"></i>
					</a>

					<!-- Badge NUOVO se applicabile -->
					<?php if(is_item_new($row['id'])) { ?>
					<span class="badge badge-new-item">
						<i class="fa fa-star"></i> NUOVO
					</span>
					<?php } ?>

					<a href="<?php print $shop_url.'item/'.$row['id'].'/'; ?>">
						<div class="card text-center">
							<div class="card-block">
								<div class="min-image-item">
									<center>
										<img class="image-item" src="<?php print $shop_url; ?>images/items/<?php print get_item_image($row['vnum']); ?>.png">
									</center>
								</div>

								<?php if($row['discount']>0) { ?>
								<span class="badge badge-danger font-weight-bold strong pull-right">- <?php print $row['discount']; ?>%</span>
								<?php } ?>

								<!-- Prezzo -->
								<div class="wishlist-item-price mt-2">
									<?php if($row['discount'] > 0) { ?>
										<del><?php echo number_format($row['coins']); ?> MD</del><br>
										<strong><?php echo number_format($final_price); ?> MD</strong>
									<?php } else { ?>
										<strong><?php echo number_format($row['coins']); ?> MD</strong>
									<?php } ?>
								</div>
							</div>
							<div class="card-footer text-muted">
								<?php echo htmlspecialchars($item['name']); ?>
							</div>
						</div>
					</a>

					<!-- Bottone Acquista Veloce -->
					<a href="<?php print $shop_url.'item/'.$row['id'].'/'; ?>" class="btn btn-success btn-block mt-2">
						<i class="fa fa-shopping-cart"></i> Acquista Ora
					</a>
				</div>
			</div>
			<?php
				}
			} ?>
		</div>
	<?php } ?>
</div>
