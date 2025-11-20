<?php
	if(($current_page=='item' && $item[0]['expire']>0) || ($current_page=='item' && $item[0]['discount']>0) || $current_page=='items')
	{
?>
    <script src="<?php print $shop_url; ?>assets/js/jquery.countdown.min.js"></script>
    <script src="<?php print $shop_url; ?>assets/js/moment-with-locales.min.js"></script>
    <script src="<?php print $shop_url; ?>assets/js/moment-timezone-with-data.js"></script>
<?php } ?>

<!-- Modern JavaScript (ES6+) -->
<script src="<?php print $shop_url; ?>assets/js/shop-modern.js?v=2.0.0"></script>

<!-- Configurazione dinamica -->
<script>
if (typeof SHOP_CONFIG !== 'undefined') {
    SHOP_CONFIG.countdownFormat = '%D <?php print $lang_shop['days']; ?> %H:%M:%S';
}
</script>
