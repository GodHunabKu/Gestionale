                    <div class="sidebar-widget">
                        <h3 class="widget-title">
                            <i class="fa fa-star"></i>
                            Più Acquistati
                        </h3>
                        <div class="widget-content">
							<?php
								$most = most_bought();
								if(count($most) > 0) {
									foreach($most as $item) {
							?>
                            <div class="item-row">
                                <div class="item-icon">
                                    <img src="<?php print $shop_url.'images/items/'.get_item_image($item['vnum']).'.png'; ?>"
                                         alt="<?php if(!$item_name_db) print get_item_name($item['vnum']); else print get_item_name_locale_name($item['vnum']); ?>">
                                </div>
                                <div class="item-info">
                                    <a href="<?php print $shop_url.'item/'.$item['id'].'/'; ?>" class="item-name">
                                        <?php if(!$item_name_db) print get_item_name($item['vnum']); else print get_item_name_locale_name($item['vnum']); ?>
                                    </a>
                                    <div class="item-stats">
                                        <span class="item-price">
                                            <i class="fa fa-money"></i> <?php print $item['coins']; ?> MD
                                        </span>
                                        <span class="item-purchases">
                                            <i class="fa fa-shopping-cart"></i> <?php print $item['bought_times']; ?>x
                                        </span>
                                    </div>
                                </div>
                            </div>
							<?php
									}
								} else {
									echo '<div class="no-items"><p>Nessun acquisto ancora</p></div>';
								}
							?>
                        </div>
                    </div>
