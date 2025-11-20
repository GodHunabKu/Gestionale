		<?php if(is_loggedin() && web_admin_level()>=9) { ?>
			<a href="<?php print $shop_url.'remove/item/'.$get_item.'/'.$item[0]['category'].'/'; ?>" class="btn btn-danger" onclick="return confirm('Sure?')"><?php print $lang_shop['is_delete_items']; ?></a>
			<a class="btn btn-primary" role="button" data-toggle="collapse" href="#discount" aria-expanded="false" aria-controls="discount"><?php print $lang_shop['discount']; ?> (- XX%)</a>
			
					<div class="collapse" id="discount">
						</br>
						<div class="row">
							<div class="col-lg-2"></div>
							<div class="col-lg-8">
								<form action="" method="post" class="form-horizontal">
									<div class="form-group col-lg-6">
										<label class="control-label" for="discount_value"><?php print $lang_shop['discount']; ?></label>
										<div class="input-group mb-2 mr-sm-2 mb-sm-0">
											<div class="input-group-addon">-</div>
											<input class="form-control" name="discount_value" id="discount_value" type="number" min="1" max="100" value="25" required>
											<div class="input-group-addon">%</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-3">
												<label for="months"><?php print ucfirst($lang_shop['months']); ?> (30 <?php print $lang_shop['days']; ?>)</label>
												<input class="form-control" type="number" value="0" id="discount_months" name="discount_months" min="0" required>
											</div>
											<div class="col-lg-3">
												<label for="days"><?php print ucfirst($lang_shop['days']); ?></label>
												<input class="form-control" type="number" value="0" id="discount_days" name="discount_days" min="0" required>
											</div>
											<div class="col-lg-3">
												<label for="hours"><?php print ucfirst($lang_shop['hours']); ?></label>
												<input class="form-control" type="number" value="0" id="discount_hours" name="discount_hours" min="0" required>
											</div>
											<div class="col-lg-3">
												<label for="reason"><?php print ucfirst($lang_shop['minutes']); ?></label>
												<input class="form-control" type="number" value="0" id="discount_minutes" name="discount_minutes" min="0" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<input class="btn btn-success btn-block" name="add_discount" value="<?php print $lang_shop['discount']; ?>" type="submit" onclick="return confirm('Sure?')">
									</div>
								</form>
							</div>
						</div>
					</div>
						
			</br></br>
		<?php } ?>

			<!-- Breadcrumbs 2025 -->
			<nav aria-label="breadcrumb" class="breadcrumb-modern mb-4">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<?php print $shop_url; ?>"><i class="fa fa-home"></i> Home</a></li>
					<li class="breadcrumb-item"><a href="<?php print $shop_url.'category/'.$item[0]['category'].'/'; ?>"><i class="fa fa-tag"></i> <?php print is_get_category_name($item[0]['category']); ?></a></li>
					<li class="breadcrumb-item active"><i class="fa fa-cube"></i> <?php if(!$item_name_db) print $item_name = get_item_name($item[0]['vnum']); else print $item_name = get_item_name_locale_name($item[0]['vnum']); ?></li>
				</ol>
			</nav>

			<div class="media-section">
				<div class="images">
					<h3 class="section-title">
						<i class="fa fa-cube"></i> <?php if(!$item_name_db) print get_item_name($item[0]['vnum']); else print get_item_name_locale_name($item[0]['vnum']); ?>
					</h3>
					<?php
						if(is_loggedin())
							if(isset($_POST['buy']) && isset($_POST['buy_key']) && $_POST['buy_key'] == $_SESSION['buy_key'])
							{
								$ok = 0;
								
								if($total<=is_coins(0))
								{
									$buy_bonuses = array();
									$bonuses_ok = true;
									
									if($item[0]['type']==3) {
										for($i=0;$i<$count;$i++)
										{
											if(isset($_POST['attrtype'.$i]) && isset($bonuses['bonus'.$_POST['attrtype'.$i]]) && intval($bonuses['bonus'.$_POST['attrtype'.$i]])!=0)
												$buy_bonuses[] = intval($_POST['attrtype'.$i]);
											else {
												$bonuses_ok = false;
												break;
											}
										}
									}
									
									if(count($buy_bonuses) !== count(array_unique($buy_bonuses)))
										$bonuses_ok = false;
										
									if($bonuses_ok && is_buy_item($get_item, $buy_bonuses))
									{
										is_pay_coins(0, $total);
										$ok = 1;

										// Traccia l'acquisto per statistiche "Più Popolari"
										require_once __DIR__ . '/../../include/functions/popular_items.php';
										$item_name = $item_name_db ? get_item_name_locale_name($item[0]['vnum']) : get_item_name($item[0]['vnum']);
										track_purchase($item[0]['vnum'], $item_name, $total);
									} else { $ok=2; ?>
										<div class="alert alert-dismissible alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<?php if($bonuses_ok) print $lang_shop['no_space']; else print 'ERROR'; ?>
										</div>
								<?php }
								}
							
							if($ok==1) { ?>
								<div class="alert alert-dismissible alert-success">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<?php print $lang_shop['successfully_bought']; ?>
								</div>
							<?php } else if($ok==0) { ?>
								<div class="alert alert-dismissible alert-danger">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									ERROR
								</div>
							<?php }
							}
							$_SESSION['buy_key'] = mt_rand(1, 1000);
						?>
						<?php if(($item[0]['type']!=3) || ($item[0]['type']==3 && $item[0]['description'])) { ?>
						<div class="card mb-3">
							<div class="card-header bg-primary"><?php print $lang_shop['description']; ?></div>
							<div class="card-block">
								<p class="card-text"><?php if($item[0]['description']) print nl2br($item[0]['description']); else print $lang_shop['no_description']; ?></p>
							</div>
						</div>
						<?php } if($item[0]['type']==3) { ?>
						<div class="card">
							<div class="card-header bg-success card-header-white"><?php print $lang_shop['bonus_selection']; ?></div>
							<div class="card-block">
								<div class="form-group">
									<?php for($i=0;$i<$count;$i++) { ?>
										<select onChange="use(this)" class="form-control select-spacing" name="attrtype<?php print $i ?>" id="attrtype<?php print $i ?>" form="buy_item" required>
											<option value="" selected="selected"><?php print $lang_shop['bonus_selection'].' #'.$i; ?></option>
											<?php foreach($available_bonuses as $key => $bonus) { ?>
											<option value="<?php print $key; ?>"><?php print str_replace("[n]", $bonus, $bonuses_name[$key]); ?></option>
											<?php } ?>
										</select>
										<?php } ?>
								</div>
							</div>
						</div>
						<?php } ?>
				</div>
			</div>
				<?php if(is_loggedin() && is_coins(0)>=$total) { ?>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel"><?php print $lang_shop['buy']; ?></h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="close-red">&times;</span></button>
							</div>
							<div class="modal-body">
								<?php print $lang_shop['sure']; ?>
							</div>
							<div class="modal-footer">
								<form action="" method="post" id="buy_item">
									<input type="hidden" name="buy_key" value="<?php echo $_SESSION['buy_key'] ?>">
									<input class="btn btn-success" type="submit" onClick="$('#myModal').modal('hide');" name="buy" value="<?php print $lang_shop['buy']; ?>">
									<button type="button" class="btn btn-danger" data-dismiss="modal"><?php print $lang_shop['no']; ?></button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<?php } ?>

		<!-- Bonus Item Section -->
		<?php
			$item_bonuses = get_item_bonuses($get_item);
			if(count($item_bonuses) > 0) {
		?>
		<div class="item-bonuses-section mt-4 mb-4">
			<h3 class="section-title mb-3">
				<i class="fa fa-magic"></i> Bonus Item
			</h3>
			<div class="card">
				<div class="card-body">
					<div class="row">
						<?php foreach($item_bonuses as $bonus) { ?>
						<div class="col-md-6 col-lg-4 mb-3">
							<div class="bonus-item">
								<i class="fa fa-check-circle bonus-icon"></i>
								<span class="bonus-name"><?php echo htmlspecialchars($bonus['name']); ?></span>
								<span class="bonus-value"><?php echo htmlspecialchars($bonus['formatted_value']); ?></span>
							</div>
						</div>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
		<?php } ?>

		<!-- Reviews & Rating Section -->
		<?php
			$account_login = get_account_name();
			$item_vnum = $item[0]['vnum'];
			$has_purchased = has_purchased_item($account_login, $item_vnum);
			$has_reviewed = has_reviewed_item($get_item, $account_login);
			$rating_data = get_item_average_rating($get_item);
			$reviews = get_item_reviews($get_item);

			// Handle review submission
			if(isset($_POST['submit_review']) && $has_purchased && !$has_reviewed) {
				$rating = intval($_POST['rating']);
				$review_text = trim($_POST['review_text']);

				if($rating >= 1 && $rating <= 5) {
					if(add_item_review($get_item, $account_login, $rating, $review_text)) {
						echo '<div class="alert alert-success"><i class="fa fa-check"></i> Recensione pubblicata con successo!</div>';
						// Reload rating data
						$rating_data = get_item_average_rating($get_item);
						$reviews = get_item_reviews($get_item);
						$has_reviewed = true;
					} else {
						echo '<div class="alert alert-danger"><i class="fa fa-times"></i> Errore durante la pubblicazione della recensione.</div>';
					}
				}
			}
		?>

		<div class="reviews-section mt-4 mb-4">
			<h3 class="section-title mb-3">
				<i class="fa fa-star"></i> Recensioni & Valutazioni
			</h3>

			<!-- Rating Summary -->
			<div class="card mb-4">
				<div class="card-body">
					<div class="rating-summary">
						<div class="rating-average">
							<div class="rating-number"><?php echo $rating_data['average']; ?></div>
							<div class="rating-stars">
								<?php for($i = 1; $i <= 5; $i++) { ?>
									<i class="fa fa-star<?php echo $i <= round($rating_data['average']) ? '' : '-o'; ?> star-icon"></i>
								<?php } ?>
							</div>
							<div class="rating-count"><?php echo $rating_data['total']; ?> recensioni</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Write Review Form (only if purchased and not reviewed) -->
			<?php if($has_purchased && !$has_reviewed) { ?>
			<div class="card mb-4">
				<div class="card-header bg-primary">
					<i class="fa fa-pencil"></i> Scrivi una Recensione
				</div>
				<div class="card-body">
					<form method="post" action="">
						<div class="form-group">
							<label for="rating">Valutazione:</label>
							<div class="star-rating-input">
								<?php for($i = 5; $i >= 1; $i--) { ?>
								<input type="radio" name="rating" value="<?php echo $i; ?>" id="star<?php echo $i; ?>" required>
								<label for="star<?php echo $i; ?>"><i class="fa fa-star"></i></label>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label for="review_text">La tua recensione:</label>
							<textarea name="review_text" id="review_text" class="form-control" rows="4" placeholder="Descrivi la tua esperienza con questo item..." maxlength="500"></textarea>
							<small class="form-text text-muted">Massimo 500 caratteri (opzionale)</small>
						</div>
						<button type="submit" name="submit_review" class="btn btn-primary">
							<i class="fa fa-check"></i> Pubblica Recensione
						</button>
					</form>
				</div>
			</div>
			<?php } elseif(!$has_purchased) { ?>
			<div class="alert alert-info">
				<i class="fa fa-info-circle"></i> Devi acquistare questo item per lasciare una recensione.
			</div>
			<?php } elseif($has_reviewed) { ?>
			<div class="alert alert-success">
				<i class="fa fa-check-circle"></i> Hai già recensito questo item.
			</div>
			<?php } ?>

			<!-- Reviews List -->
			<?php if(count($reviews) > 0) { ?>
			<div class="reviews-list">
				<?php foreach($reviews as $review) { ?>
				<div class="card mb-3">
					<div class="card-body">
						<div class="review-header">
							<div class="review-author">
								<i class="fa fa-user-circle"></i>
								<strong><?php echo htmlspecialchars($review['account_login']); ?></strong>
							</div>
							<div class="review-rating">
								<?php for($i = 1; $i <= 5; $i++) { ?>
									<i class="fa fa-star<?php echo $i <= $review['rating'] ? '' : '-o'; ?> star-small"></i>
								<?php } ?>
							</div>
							<div class="review-date">
								<small class="text-muted">
									<i class="fa fa-clock-o"></i>
									<?php echo date('d/m/Y H:i', strtotime($review['created_at'])); ?>
								</small>
							</div>
						</div>
						<?php if($review['review_text']) { ?>
						<div class="review-text">
							<?php echo nl2br(htmlspecialchars($review['review_text'])); ?>
						</div>
						<?php } ?>
					</div>
				</div>
				<?php } ?>
			</div>
			<?php } else { ?>
			<div class="alert alert-secondary">
				<i class="fa fa-comment-o"></i> Nessuna recensione disponibile. Sii il primo a recensire questo item!
			</div>
			<?php } ?>
		</div>

		<!-- Item Correlati dalla Stessa Categoria -->
		<?php
			$related_items = is_get_related_items($item[0]['category'], $get_item, 6);
			if(count($related_items) > 0) {
		?>
		<div class="related-items-section mt-5">
			<h3 class="section-title mb-4">
				<i class="fa fa-cubes"></i> Altri Item di <?php print is_get_category_name($item[0]['category']); ?>
			</h3>
			<div class="row">
				<?php foreach($related_items as $row) {
					$original_price = $row['coins'];
					$final_price = $row['discount'] > 0 ? $row['coins'] - ($row['coins'] * $row['discount'] / 100) : $row['coins'];
				?>
				<div class="col-lg-2 col-md-4 col-sm-6 mb-3">
					<a href="<?php print $shop_url.'item/'.$row['id'].'/'; ?>" class="item-link">
						<div class="card item-card item-card-small text-center">
							<div class="card-block">
								<div class="min-image-item">
									<center>
										<img class="image-item-small"
											 src="<?php print $shop_url; ?>images/items/<?php print get_item_image($row['vnum']); ?>.png"
											 alt="<?php if(!$item_name_db) print get_item_name($row['vnum']); else print get_item_name_locale_name($row['vnum']); ?>">
									</center>
								</div>
								<?php if($row['discount']>0) { ?>
								<span class="badge badge-danger discount-badge-small">
									-<?php print $row['discount']; ?>%
								</span>
								<?php } ?>
								<div class="item-price-small mt-2">
									<?php if($row['discount'] > 0) { ?>
										<span class="price-final-small"><i class="fa fa-money"></i> <?php echo round($final_price); ?> MD</span>
									<?php } else { ?>
										<span class="price-final-small"><i class="fa fa-money"></i> <?php echo $final_price; ?> MD</span>
									<?php } ?>
								</div>
							</div>
							<div class="card-footer card-footer-small text-muted">
								<small><?php if(!$item_name_db) print get_item_name($row['vnum']); else print get_item_name_locale_name($row['vnum']); ?></small>
							</div>
						</div>
					</a>
				</div>
				<?php } ?>
			</div>
		</div>
		<?php } ?>