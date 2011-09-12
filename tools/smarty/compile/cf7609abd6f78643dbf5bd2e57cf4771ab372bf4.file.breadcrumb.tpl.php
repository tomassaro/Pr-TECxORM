<?php /* Smarty version Smarty-3.0.7, created on 2011-09-13 01:35:03
         compiled from "/srv/Ignas/Presta/prestashop/themes/tecform/./breadcrumb.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7268631684e6e8917eeec99-31576517%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'cf7609abd6f78643dbf5bd2e57cf4771ab372bf4' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/themes/tecform/./breadcrumb.tpl',
      1 => 1315866087,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7268631684e6e8917eeec99-31576517',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_escape')) include '/srv/Ignas/Presta/prestashop/tools/smarty/plugins/modifier.escape.php';
?>
BREAD_ZZZ
<!-- Breadcrumb -->
<?php if (isset(Smarty::$_smarty_vars['capture']['path'])){?><?php $_smarty_tpl->tpl_vars['path'] = new Smarty_variable(Smarty::$_smarty_vars['capture']['path'], null, null);?><?php }?>
<div class="breadcrumb">
	<a href="<?php echo $_smarty_tpl->getVariable('base_dir')->value;?>
" title="<?php echo smartyTranslate(array('s'=>'return to'),$_smarty_tpl);?>
 <?php echo smartyTranslate(array('s'=>'Home'),$_smarty_tpl);?>
"><?php echo smartyTranslate(array('s'=>'Home'),$_smarty_tpl);?>
</a><?php if (isset($_smarty_tpl->getVariable('path',null,true,false)->value)&&$_smarty_tpl->getVariable('path')->value){?><span class="navigation-pipe"><?php echo smarty_modifier_escape($_smarty_tpl->getVariable('navigationPipe')->value,'html','UTF-8');?>
</span><?php if (!strpos($_smarty_tpl->getVariable('path')->value,'span')){?><span class="navigation_page"><?php echo $_smarty_tpl->getVariable('path')->value;?>
</span><?php }else{ ?><?php echo $_smarty_tpl->getVariable('path')->value;?>
<?php }?><?php }?>
</div>
<!-- /Breadcrumb -->