                    <?php
                        // Include il sistema popular items
                        require_once __DIR__ . '/../functions/popular_items.php';
                        $popular_items = get_most_popular(5);

                        if(count($popular_items) > 0) {
                    ?>
                    <div class="list-table mt-3">
                        <h3 class="title"><i class="fa fa-fire"></i> Più Acquistati</h3>
                        <table>
                            <?php foreach($popular_items as $item) {
                                // Cerca item nel database per ottenere l'ID
                                $sth = $database->runQuerySqlite('SELECT id FROM item_shop_items WHERE vnum = ? LIMIT 1');
                                $sth->bindParam(1, $item['vnum'], PDO::PARAM_INT);
                                $sth->execute();
                                $item_data = $sth->fetch();

                                if($item_data) {
                            ?>
                            <tr>
                                <td class="border-right popular-item-cell">
                                    <a href="<?php print $shop_url.'item/'.$item_data['id'].'/'; ?>" class="text-white-link popular-item-link">
                                        <img src="<?php print $shop_url; ?>images/items/<?php print get_item_image($item['vnum']); ?>.png"
                                             class="popular-item-icon"
                                             alt="<?php echo $item['name']; ?>">
                                        <span class="popular-item-name">
                                            <?php echo $item['name']; ?>
                                        </span>
                                    </a>
                                </td>
                                <td class="popular-item-price">
                                    <a href="<?php print $shop_url.'item/'.$item_data['id'].'/'; ?>" class="text-white-link">
                                        <span class="price-badge"><?php echo $item['price']; ?> MD</span>
                                    </a>
                                </td>
                                <td class="popular-item-count">
                                    <span class="count-badge" title="Acquistato <?php echo $item['count']; ?> volte">
                                        <i class="fa fa-shopping-cart"></i> <?php echo $item['count']; ?>
                                    </span>
                                </td>
                            </tr>
                            <?php
                                }
                            } ?>
                        </table>
                    </div>
                    <?php } ?>
