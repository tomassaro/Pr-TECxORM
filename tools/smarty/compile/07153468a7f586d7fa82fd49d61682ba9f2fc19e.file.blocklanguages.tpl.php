<?php /* Smarty version Smarty-3.0.7, created on 2011-09-13 01:41:01
         compiled from "/srv/Ignas/Presta/prestashop/modules/blocklanguages/blocklanguages.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5800012764e6e8a7de0d657-92596744%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '07153468a7f586d7fa82fd49d61682ba9f2fc19e' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/modules/blocklanguages/blocklanguages.tpl',
      1 => 1306134704,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5800012764e6e8a7de0d657-92596744',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>


<!-- Block languages module -->
<div id="languages_block_top">
	<ul id="first-languages">
		<?php  $_smarty_tpl->tpl_vars['language'] = new Smarty_Variable;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('languages')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['language']->key => $_smarty_tpl->tpl_vars['language']->value){
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['language']->key;
?>
			<li <?php if ($_smarty_tpl->tpl_vars['language']->value['iso_code']==$_smarty_tpl->getVariable('lang_iso')->value){?>class="selected_language"<?php }?>>
				<?php if ($_smarty_tpl->tpl_vars['language']->value['iso_code']!=$_smarty_tpl->getVariable('lang_iso')->value){?>
				    <?php $_smarty_tpl->tpl_vars['indice_lang'] = new Smarty_variable($_smarty_tpl->tpl_vars['language']->value['id_lang'], null, null);?>
					<?php if (isset($_smarty_tpl->getVariable('lang_rewrite_urls',null,true,false)->value[$_smarty_tpl->getVariable('indice_lang',null,true,false)->value])){?>
						<a href="<?php echo $_smarty_tpl->getVariable('lang_rewrite_urls')->value[$_smarty_tpl->getVariable('indice_lang')->value];?>
" title="<?php echo $_smarty_tpl->tpl_vars['language']->value['name'];?>
">
					<?php }else{ ?>
						<a href="<?php echo $_smarty_tpl->getVariable('link')->value->getLanguageLink($_smarty_tpl->tpl_vars['language']->value['id_lang'],$_smarty_tpl->tpl_vars['language']->value['name']);?>
" title="<?php echo $_smarty_tpl->tpl_vars['language']->value['name'];?>
">
					<?php }?>

				<?php }?>
					<img src="<?php echo $_smarty_tpl->getVariable('img_lang_dir')->value;?>
<?php echo $_smarty_tpl->tpl_vars['language']->value['id_lang'];?>
.jpg" alt="<?php echo $_smarty_tpl->tpl_vars['language']->value['iso_code'];?>
" width="16" height="11" />
				<?php if ($_smarty_tpl->tpl_vars['language']->value['iso_code']!=$_smarty_tpl->getVariable('lang_iso')->value){?>
					</a>
				<?php }?>
			</li>
		<?php }} ?>
	</ul>
</div>
<script type="text/javascript">
	$('ul#first-languages li:not(.selected_language)').css('opacity', 0.3);
	$('ul#first-languages li:not(.selected_language)').hover(function(){
		$(this).css('opacity', 1);
	}, function(){
		$(this).css('opacity', 0.3);
	});
</script>
<!-- /Block languages module -->

