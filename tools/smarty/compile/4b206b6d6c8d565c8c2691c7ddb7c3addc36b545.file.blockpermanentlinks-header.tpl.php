<?php /* Smarty version Smarty-3.0.7, created on 2011-09-13 01:41:01
         compiled from "/srv/Ignas/Presta/prestashop/modules/blockpermanentlinks/blockpermanentlinks-header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2482467014e6e8a7df0a835-17690258%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4b206b6d6c8d565c8c2691c7ddb7c3addc36b545' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/modules/blockpermanentlinks/blockpermanentlinks-header.tpl',
      1 => 1306134704,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2482467014e6e8a7df0a835-17690258',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>


<!-- Block permanent links module HEADER -->
<ul id="header_links">
	<li id="header_link_contact"><a href="<?php echo $_smarty_tpl->getVariable('link')->value->getPageLink('contact-form.php',true);?>
" title="<?php echo smartyTranslate(array('s'=>'contact','mod'=>'blockpermanentlinks'),$_smarty_tpl);?>
"><?php echo smartyTranslate(array('s'=>'contact','mod'=>'blockpermanentlinks'),$_smarty_tpl);?>
</a></li>
	<li id="header_link_sitemap"><a href="<?php echo $_smarty_tpl->getVariable('link')->value->getPageLink('sitemap.php');?>
" title="<?php echo smartyTranslate(array('s'=>'sitemap','mod'=>'blockpermanentlinks'),$_smarty_tpl);?>
"><?php echo smartyTranslate(array('s'=>'sitemap','mod'=>'blockpermanentlinks'),$_smarty_tpl);?>
</a></li>
	<li id="header_link_bookmark">
	 
		<script type="text/javascript">writeBookmarkLink('<?php echo $_smarty_tpl->getVariable('come_from')->value;?>
', '<?php echo addslashes(addslashes($_smarty_tpl->getVariable('meta_title')->value));?>
', '<?php echo smartyTranslate(array('s'=>'bookmark','mod'=>'blockpermanentlinks'),$_smarty_tpl);?>
');</script>
	</li>
</ul>
<!-- /Block permanent links module HEADER -->
