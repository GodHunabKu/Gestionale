<div class="media-section">
    <div class="images">
        <h3 class="section-title"><i class="fa fa-list-ul"></i> <a href="<?php print $shop_url; ?>"><?php print $lang_shop['site_title']; ?></a> / <?php print ucfirst($current_page); ?></h3>
		<?php
			$remove = isset($_GET['remove']) ? $_GET['remove'] : null;
			if($remove)
				is_delete_category($remove);
			
			if(isset($_POST['edit']))
				is_edit_category($_POST['id'], $_POST['name'.$_POST['id']], $_POST['img'.$_POST['id']]);
				
			if(isset($_POST['add']))
			{
				is_add_category($_POST['name'], $_POST['img']);
				print '<div class="alert alert-dismissible alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						'.$lang_shop['category_added'].'
					</div>';
			}
		?>
        <div class="panel panel-info">
            <div class="panel-heading">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#active" role="tab">
                            <?php print $lang_shop['is_tab1']; ?>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#add" role="tab">
                            <?php print $lang_shop['is_tab2']; ?>
                        </a>
                    </li>
                </ul>

            </div>
            <div class="panel-body">

                <div class="tab-content">
                    <div class="tab-pane active" id="active" role="tabpanel">

                        <table class="table table-striped table-hover ">
                            <thead>
                                <tr>
                                    <th>img</th>
                                    <th>
                                        <?php print $lang_shop['name']; ?>
                                    </th>
                                    <th>#</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stmt=$database->runQuerySqlite("SELECT id, name, img FROM item_shop_categories ORDER BY id ASC"); $stmt->execute(); $result = $stmt->fetchAll(); if($result && count($result) > 0) { foreach($result as $key => $row) { ?>
                                <form action="" method="post" class="form-horizontal">
                                    <tr>
                                        <input type="hidden" name="id" value="<?php print $row['id']; ?>">
                                        <td>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <img src="<?php print $shop_url; ?>images/items/img_categorie/<?php print $row['img']; ?>.png">
                                                </div>
                                                <div class="col-md-9">
                                                    <input class="admin-input-width form-control" name="img<?php print $row['id']; ?>" type="text" value="<?php print $row['img']; ?>" placeholder="es: Cavalcature">
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <input class="admin-input-width form-control" name="name<?php print $row['id']; ?>" type="text" value="<?php print $row['name']; ?>">
                                        </td>
                                        <td>
                                            <input class="btn btn-primary btn-sm" name="edit" value="<?php print $lang_shop['edit']; ?>" type="submit">
                                        </td>
                                        <td>
                                            <a href="<?php print $shop_url.'remove/category/'.$row['id'].'/'; ?>" class="btn btn-danger btn-sm">
                                                <?php print $lang_shop['item_remove']; ?>
                                            </a>
                                        </td>
                                    </tr>
                                </form>
                                <?php } } else print 'Nothing found'; ?>
                            </tbody>
                        </table>

                    </div>
                    <div class="tab-pane" id="add" role="tabpanel">
                        </br>
                        <form action="" method="post" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="focusedInput">
                                            <?php print $lang_shop['category_name']; ?>
                                        </label>
                                        <input class="form-control" name="name" type="text">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="focusedInput">
                                            <?php print $lang_shop['is_image_representative']; ?>
                                        </label>
                                        <input class="form-control" name="img" type="text" placeholder="es: Cavalcature, Rune, Spiriti...">
                                        <small class="form-text text-muted">Immagini disponibili: Cavalcature, Rune, Spiriti, anelli_potere, anelli_speciali, anime, buoni_moneta, cinture, generale, miglioramento, pietre, premium, titoli, trofei</small>
                                    </div>
                                    <div class="form-group">
                                        <input class="btn btn-success btn-block" name="add" value="<?php print $lang_shop['add_category']; ?>" type="submit">
                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>