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
						<div class="col-md-3">
							<a href="<?php print $shop_url.'item/'.$row['id'].'/'; ?>">
								<div class="card mb-3 text-center">
									<div class="card-block">
										<!-- Badge NUOVO per item recenti -->
										<?php if(is_item_new($row['id'])) { ?>
										<span class="badge badge-new-item">
											<i class="fa fa-star"></i> NUOVO
										</span>
										<?php } ?>

										<!-- Categoria Badge (ricerca) -->
										<span class="category-badge-small">
											<i class="fa fa-tag"></i> <?php echo is_get_category_name($row['category']); ?>
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
										<a href="<?php print $shop_url.'item/'.$row['id'].'/'; ?>"><?php if(!$item_name_db) print get_item_name($row['vnum']); else print get_item_name_locale_name($row['vnum']); ?></a>
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
