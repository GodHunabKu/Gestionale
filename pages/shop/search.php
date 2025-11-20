		<?php
			$search_term = isset($_GET['q']) ? trim($_GET['q']) : '';

			if(empty($search_term)) {
				redirect($shop_url);
				exit;
			}

			// Paginazione
			$current_page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
			$per_page = 12;

			// Esegui ricerca
			$results = is_search_items_global($search_term, $current_page, $per_page);
			$total_items = is_search_items_count($search_term);
			$total_pages = ceil($total_items / $per_page);
		?>

		<!-- Breadcrumbs 2025 -->
		<nav aria-label="breadcrumb" class="breadcrumb-modern mb-4">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="<?php print $shop_url; ?>"><i class="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item active"><i class="fa fa-search"></i> Ricerca: "<?php echo htmlspecialchars($search_term); ?>"</li>
			</ol>
		</nav>

		<div class="media-section">
			<div class="images">
				<h3 class="section-title">
					<i class="fa fa-search"></i> Risultati per "<?php echo htmlspecialchars($search_term); ?>"
					<span class="badge badge-primary ml-2"><?php echo $total_items; ?> item</span>
				</h3>

				<?php if($total_items == 0) { ?>
					<div class="alert alert-warning">
						<i class="fa fa-exclamation-triangle"></i> <strong>Nessun risultato trovato</strong>
						<p class="mb-0 mt-2">Prova a:
							<ul>
								<li>Verificare l'ortografia</li>
								<li>Usare parole chiave più generiche</li>
								<li>Cercare per numero vnum dell'item</li>
							</ul>
						</p>
						<a href="<?php print $shop_url; ?>" class="btn btn-primary mt-3">
							<i class="fa fa-arrow-left"></i> Torna allo Shop
						</a>
					</div>
				<?php } else { ?>

				<div class="row items-grid">
					<?php foreach($results as $row) {
						$original_price = $row['coins'];
						$final_price = $row['discount'] > 0 ? $row['coins'] - ($row['coins'] * $row['discount'] / 100) : $row['coins'];
					?>
						<div class="col-lg-3 col-md-4 col-sm-6 mb-4 item-card-container">
							<a href="<?php print $shop_url.'item/'.$row['id'].'/'; ?>" class="item-link">
								<div class="card item-card text-center">
									<!-- Preview Hover Badge -->
									<div class="quick-view-badge">
										<i class="fa fa-search-plus"></i> Anteprima
									</div>

									<!-- Categoria Badge -->
									<span class="category-badge-small">
										<i class="fa fa-tag"></i> <?php echo is_get_category_name($row['category']); ?>
									</span>

									<div class="card-block">
										<div class="min-image-item">
											<center>
												<img class="image-item lazyload"
													 data-src="<?php print $shop_url; ?>images/items/<?php print get_item_image($row['vnum']); ?>.png"
													 src="<?php print $shop_url; ?>images/loading-placeholder.png"
													 alt="<?php if(!$item_name_db) print get_item_name($row['vnum']); else print get_item_name_locale_name($row['vnum']); ?>">
											</center>
										</div>
										<?php if($row['discount']>0) { ?>
										<span class="badge badge-danger discount-badge pulse-badge">
											<i class="fa fa-percent"></i> -<?php print $row['discount']; ?>%
										</span>
										<?php }
											if($row['expire']>0) {
												$expire = date("Y-m-d H:i:s", $row['expire']);
										?>
										<p class="card-text">
											<small class="font-weight-bold strong pull-right text-danger" data-countdown="<?php print $expire; ?>">
												<i class="fa fa-clock-o"></i>
											</small>
										</p>
										<?php }
											if($row['type']==3) {
										?>
										<p class="card-text">
											<small class="font-weight-bold strong text-warning">
												<i class="fa fa-star"></i> <?php print $lang_shop['bonus_selection']; ?>
											</small>
										</p>
										<?php } ?>

										<!-- Prezzo con icona -->
										<div class="item-price mt-2">
											<?php if($row['discount'] > 0) { ?>
												<span class="price-original"><del><?php echo $original_price; ?> MD</del></span><br>
												<span class="price-final"><i class="fa fa-money"></i> <?php echo round($final_price); ?> MD</span>
											<?php } else { ?>
												<span class="price-final"><i class="fa fa-money"></i> <?php echo $final_price; ?> MD</span>
											<?php } ?>
										</div>
									</div>
									<div class="card-footer text-muted">
										<?php if(!$item_name_db) print get_item_name($row['vnum']); else print get_item_name_locale_name($row['vnum']); ?>
									</div>

									<!-- Hover Preview Popup -->
									<div class="item-hover-preview">
										<h4><?php if(!$item_name_db) print get_item_name($row['vnum']); else print get_item_name_locale_name($row['vnum']); ?></h4>
										<p class="preview-category"><i class="fa fa-tag"></i> <?php echo is_get_category_name($row['category']); ?></p>
										<p class="preview-price">
											<i class="fa fa-money"></i>
											<?php if($row['discount'] > 0) { ?>
												<del><?php echo $original_price; ?> MD</del> <strong><?php echo round($final_price); ?> MD</strong>
											<?php } else { ?>
												<strong><?php echo $final_price; ?> MD</strong>
											<?php } ?>
										</p>
										<button class="btn btn-sm btn-primary">
											<i class="fa fa-eye"></i> Vedi Dettagli
										</button>
									</div>
								</div>
							</a>
						</div>
					<?php } ?>
				</div>

				<!-- Paginazione -->
				<?php if($total_pages > 1) { ?>
				<nav aria-label="Paginazione ricerca" class="mt-4">
					<ul class="pagination pagination-modern justify-content-center">
						<?php
							// Prima pagina
							if($current_page > 1) {
								echo '<li class="page-item"><a class="page-link" href="?p=search&q='.urlencode($search_term).'&page=1"><i class="fa fa-angle-double-left"></i></a></li>';
								echo '<li class="page-item"><a class="page-link" href="?p=search&q='.urlencode($search_term).'&page='.($current_page-1).'"><i class="fa fa-angle-left"></i> Indietro</a></li>';
							}

							// Pagine numerate
							$start_page = max(1, $current_page - 2);
							$end_page = min($total_pages, $current_page + 2);

							if($start_page > 1) {
								echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
							}

							for($i = $start_page; $i <= $end_page; $i++) {
								$active = $i == $current_page ? 'active' : '';
								echo '<li class="page-item '.$active.'"><a class="page-link" href="?p=search&q='.urlencode($search_term).'&page='.$i.'">'.$i.'</a></li>';
							}

							if($end_page < $total_pages) {
								echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
							}

							// Ultima pagina
							if($current_page < $total_pages) {
								echo '<li class="page-item"><a class="page-link" href="?p=search&q='.urlencode($search_term).'&page='.($current_page+1).'">Avanti <i class="fa fa-angle-right"></i></a></li>';
								echo '<li class="page-item"><a class="page-link" href="?p=search&q='.urlencode($search_term).'&page='.$total_pages.'"><i class="fa fa-angle-double-right"></i></a></li>';
							}
						?>
					</ul>
					<p class="text-center text-muted mt-2">
						Pagina <?php echo $current_page; ?> di <?php echo $total_pages; ?>
					</p>
				</nav>
				<?php } ?>

				<?php } ?>
			</div>
		</div>
