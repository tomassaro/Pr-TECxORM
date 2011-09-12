<?php /* Smarty version Smarty-3.0.7, created on 2011-09-13 01:35:04
         compiled from "/srv/Ignas/Presta/prestashop/themes/tecform/./product-compare.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18865936024e6e8918424ca2-70387741%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'da591112c4c107d3a3c9fc932271e8107eb882e1' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/themes/tecform/./product-compare.tpl',
      1 => 1311597652,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18865936024e6e8918424ca2-70387741',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>


<?php if ($_smarty_tpl->getVariable('comparator_max_item')->value){?>
<script type="text/javascript">
// <![CDATA[
	var min_item = '<?php echo smartyTranslate(array('s'=>'Please select at least one product.','js'=>1),$_smarty_tpl);?>
';
	var max_item = "<?php echo smartyTranslate(array('s'=>'You cannot add more than','js'=>1),$_smarty_tpl);?>
 <?php echo $_smarty_tpl->getVariable('comparator_max_item')->value;?>
 <?php echo smartyTranslate(array('s'=>'product(s) in the product comparator','js'=>1),$_smarty_tpl);?>
";
//]]>
</script>
	<form method="get" action="<?php echo $_smarty_tpl->getVariable('link')->value->getPageLink('products-comparison.php',true);?>
" onsubmit="true">
		<p>
		<input type="submit" class="button" value="<?php echo smartyTranslate(array('s'=>'Compare'),$_smarty_tpl);?>
" style="float:right" />
		<input type="hidden" name="compare_product_list" class="compare_product_list" value="" />
		</p>
	</form>
<?php }?>

