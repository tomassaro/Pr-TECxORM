<?php /* Smarty version Smarty-3.0.7, created on 2011-09-13 01:41:02
         compiled from "/srv/Ignas/Presta/prestashop/themes/tecform/./header_menu.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8599847574e6e8a7ea2fca3-66253534%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'afc6ec607aa73a4655aee2ef4ba9aca5ca15b622' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/themes/tecform/./header_menu.tpl',
      1 => 1315864924,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8599847574e6e8a7ea2fca3-66253534',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_escape')) include '/srv/Ignas/Presta/prestashop/tools/smarty/plugins/modifier.escape.php';
?><div id="header_nav">
                <span>
                    <a href="<?php echo $_smarty_tpl->getVariable('base_dir')->value;?>
/" class="head"> <?php echo smartyTranslate(array('s'=>'Home'),$_smarty_tpl);?>
</a>
                </span>


            <?php  $_smarty_tpl->tpl_vars['node'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('blockCategTree')->value['children']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['node']->key => $_smarty_tpl->tpl_vars['node']->value){
?>
                <span>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['node']->value['link'];?>
" class="<?php if (isset($_smarty_tpl->getVariable('currentCategoryId',null,true,false)->value)&&($_smarty_tpl->tpl_vars['node']->value['id']==$_smarty_tpl->getVariable('currentCategoryId')->value)){?>selected<?php }?> head" title="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['node']->value['desc'],'html','UTF-8');?>
"><?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['node']->value['name'],'html','UTF-8');?>
</a>
                </span>
            <?php }} ?>


    <div id="header_actions">
        <span id="header_login">
           <a href="/" class="head"> <?php echo smartyTranslate(array('s'=>'Login'),$_smarty_tpl);?>
</a>
        </span>
        <span id="header_chart">
            <a href="/" class="head"> &nbsp;</a> 
        </span>
    </div>
</div>