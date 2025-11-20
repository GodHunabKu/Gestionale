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