                    <div class="sidebar-widget">
                        <h3 class="widget-title">
                            <i class="fa fa-clock-o"></i>
                            <?php print $lang_shop['last_bought']; ?>
                        </h3>
                        <div class="widget-content">
							<?php
								foreach(last_bought() as $last) {
							?>
                            <div class="item-row">
                                <div class="item-icon">
                                    <img src="<?php print $shop_url.'images/items/'.get_item_image($last['vnum']).'.png'; ?>"
                                         alt="<?php if(!$item_name_db) print get_item_name($last['vnum']); else print get_item_name_locale_name($last['vnum']); ?>">
                                </div>
                                <div class="item-info">
                                    <a href="<?php print $shop_url.'item/'.$last['id'].'/'; ?>" class="item-name">
                                        <?php if(!$item_name_db) print get_item_name($last['vnum']); else print get_item_name_locale_name($last['vnum']); ?>
                                    </a>
                                    <div class="item-price">
                                        <i class="fa fa-money"></i> <?php print $last['coins']; ?> MD
                                    </div>
                                </div>
                            </div>
							<?php } ?>
                        </div>
                    </div>