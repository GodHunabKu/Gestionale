<?php
	@ob_start();
	include 'include/functions/header.php';
?>
<!DOCTYPE html>
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
    <title><?php print $lang_shop['site_title'].' - '.$server_name; ?></title>
	
    <!-- Preconnect per Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <!-- Google Fonts - Inter e Cinzel -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Cinzel:wght@600;700&display=swap" rel="stylesheet">
    
    <!-- CSS Base e Bootstrap -->
    <link rel="stylesheet" type="text/css" href="<?php print $shop_url; ?>assets/css/base.css" />
    <link rel="stylesheet" type="text/css" href="<?php print $shop_url; ?>assets/css/fonts.css" />
    <link rel="stylesheet" type="text/css" href="<?php print $shop_url; ?>assets/css/bootstrap.css" />
    
    <!-- CSS Nuovo Design Ultra Fedele -->
    <link rel="stylesheet" type="text/css" href="<?php print $shop_url; ?>assets/css/master3.css?v=<?php echo time(); ?>" />
    <link rel="stylesheet" type="text/css" href="<?php print $shop_url; ?>assets/css/shop-items-enhanced2.css?v=<?php echo time(); ?>" />

    <!-- Font Awesome e Animazioni -->
    <link rel="stylesheet" type="text/css" href="<?php print $shop_url; ?>assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="<?php print $shop_url; ?>assets/css/animate.css" />

    <link rel="shortcut icon" type="image/x-icon" href="<?php print $shop_url; ?>assets/img/favicon.ico?">

    <!--[if lt IE 9]><script type="text/javascript" src="assets/js/html5.min.js"></script><![endif]-->

</head>

<body>
    <!-- Navigation Bar - Clean and Compact (TOP) -->
    <div class="header">
        <div class="container">
            <nav class="main-navigation">
                <ul class="nav-menu">
                    <li class="nav-item">
                        <a href="<?php print $shop_url; ?>" class="nav-link">
                            <i class="fa fa-shopping-cart"></i>
                            <span><?php print $lang_shop['site_title']; ?></span>
                        </a>
                    </li>
					<?php if(!is_loggedin()) { ?>
                    <li class="nav-item">
                        <a href="<?php print $shop_url; ?>login" class="nav-link">
                            <i class="fa fa-user"></i>
                            <span><?php print $lang_shop['login']; ?></span>
                        </a>
                    </li>
					<?php } else { ?>
                    <li class="nav-item">
                        <a href="<?php print $shop_url; ?>donations" class="nav-link highlight">
                            <i class="fa fa-heart"></i>
                            <span>Dona</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php print $shop_url; ?>logout" class="nav-link">
                            <i class="fa fa-sign-out"></i>
                            <span><?php print $lang_shop['logout']; ?></span>
                        </a>
                    </li>
					<?php } ?>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-language"></i>
                            <span><?php print $language_codes[$language_code]; ?></span>
                        </a>
						<div class="dropdown-menu">
							<?php
								foreach($language_codes as $key => $value)
									print '<a href="'.$shop_url.'?lang='.$key.'" class="dropdown-item">'.$value.'</a>';
							?>
						</div>
					</li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-<?php if(is_loggedin() || $current_page=='item') print 9; else print 12; ?>">
                <div class="homepage-content" >
					<?php
						switch ($current_page) {
							case 'home':
								include 'pages/shop/home.php';
								break;
							case 'items':
								include 'pages/shop/items.php';
								break;
							case 'item':
								include 'pages/shop/item.php';
								break;
							case 'login':
								include 'pages/shop/login.php';
								break;
							case 'logout':
								include 'pages/shop/logout.php';
								break;
							case 'categories':
								include 'pages/admin/is_categories.php';
								break;
							case 'add_items':
								include 'pages/admin/add_items.php';
								break;
							case 'add_items_bonus':
								include 'pages/admin/add_items_bonus.php';
								break;
							case 'settings':
								include 'pages/admin/settings.php';
								break;
							case 'paypal':
								include 'pages/admin/paypal.php';
								break;
							case 'coins':
								include 'pages/shop/coins.php';
								break;
							case 'donations':
								include 'pages/shop/donations-page-bigsmoke.php';
								break;
							case 'pay':
								include 'pages/shop/pay.php';
								break;
							default:
								include 'pages/shop/home.php';
						}
						
						if(!is_loggedin() && $current_page!='login')
						{
					?>
					<div class="jumbotron">
						<form action="<?php print $shop_url; ?>login" method="post" class="form-inline justify-content-center">
							<label class="sr-only" for="inlineFormInput"><?php print $lang_shop['name_login']; ?></label>
							<input class="form-control mb-4 mr-sm-4 mb-sm-0" name="username" id="username" pattern=".{5,64}" maxlength="64" placeholder="<?php print $lang_shop['name_login']; ?>" required="" type="text" autocomplete="off">

							<label class="sr-only" for="inlineFormInputGroup"><?php print $lang_shop['password']; ?></label>
							<input class="form-control input-group mb-4 mr-sm-4 mb-sm-0" name="password" id="password" pattern=".{5,16}" maxlength="16" placeholder="<?php print $lang_shop['password']; ?>" required="" type="password">

							<button type="submit" class="btn btn-primary"><?php print $lang_shop['login2']; ?></button>
						</form>
					</div>
					<?php } ?>
                </div>
            </div>
			<?php
				if(is_loggedin()|| $current_page=='item') {
			?>
            <div class="col-md-3">
                <div class="sidebar">
				<?php
					$padding_md='';

					if(is_loggedin())
					{
						print '<a href="'.$shop_url.'donations" data-toggle="tooltip" data-placement="left" title="" data-original-title="Dona per ricevere MD Coins">';
						$padding_md = ' class="md-coins-spacing"';
					}
					if(is_loggedin()) {
				?>
                    <div class="info-coins-button">
						<img src="<?php print $shop_url; ?>images/md.png" data-toggle="tooltip" data-placement="right" title="" data-original-title="MD"<?php print $padding_md; ?>> <?php print number_format(is_coins(), 0, '', '.'); ?>
					</div>
				<?php
					}
					if($padding_md!='')
						print '</a>';

					if($current_page=='item')
						include 'include/sidebar/info_object.php';
					
					if(is_loggedin()) {
				?>
					<ul class="list-group">
						<li class="list-group-item">
							<center><p class="account-name"><?php print get_account_name(); ?></p></center>
						</li>
					</ul>
				<?php } print '<div class="spacer-md"></div>'; if(is_loggedin() && web_admin_level()>=9) { ?>
                    <div class="action-box">
                        <a href="<?php print $shop_url; ?>settings"><i class="fa fa-cogs"></i>Admin</a>
                        <a class="color" href="<?php print $shop_url; ?>donations"><i class="fa fa-heart"></i>Dona</a>
                        <div class="clear"></div>
                    </div>
				<?php }
					if(is_loggedin()) {
						include 'include/sidebar/last_bought.php';
						include 'include/sidebar/most_bought.php';
					}
				?>
                </div>
            </div>
			<?php } ?>
            <div class="clearfix"></div>
        </div>
    </div>

    <!-- Logo Bar - At Bottom -->
    <div class="logo-bar-bottom">
        <div class="container">
            <a href="<?php print $shop_url; ?>" class="logo-link">
                <img class="site-logo" src="<?php print $shop_url; ?>images/logo.png" alt="ONE Server">
            </a>
        </div>
    </div>

    <div class="footer">
        <div class="container">
            <div class="copyright">
				<div class="col-md-12 p-info">
					<p class="text-center">
						&copy; <?php print date('Y'); ?> ONE Server - Tutti i diritti riservati
					</p>
				</div>
            </div>
        </div>
    </div>
	
</body>
    <script src="<?php print $shop_url; ?>assets/js/jquery.js"></script>
    <script src="<?php print $shop_url; ?>assets/js/tether.min.js"></script>
    <script src="<?php print $shop_url; ?>assets/js/bootstrap.min.js"></script>
	
	<?php include 'include/functions/js.php'; ?>
</html>