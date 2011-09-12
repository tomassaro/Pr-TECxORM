<?php /* Smarty version Smarty-3.0.7, created on 2011-09-13 01:35:03
         compiled from "/srv/Ignas/Presta/prestashop/modules/smartydebug/fb.Debug.tpl" */ ?>
<?php /*%%SmartyHeaderCode:15256036904e6e8917af3d27-52510676%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '51d13a35e7ec0db7f757897e156633322655ccfb' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/modules/smartydebug/fb.Debug.tpl',
      1 => 1300793414,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15256036904e6e8917af3d27-52510676',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_escape')) include '/srv/Ignas/Presta/prestashop/tools/smarty/plugins/modifier.escape.php';
?>


<script type="text/javascript">
// <![CDATA[
var Smarty_debug = function Smarty_debug(collapsed){

        var group = (collapsed) ? console.groupCollapsed : console.group;

        group("Smarty Debug");

        <?php if (!empty($_smarty_tpl->getVariable('template_data',null,true,false)->value)){?>
        group("Included templates & config files");
        <?php  $_smarty_tpl->tpl_vars['template'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('template_data')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['template']->key => $_smarty_tpl->tpl_vars['template']->value){
?>       
        console.log("<?php echo $_smarty_tpl->tpl_vars['template']->value['name'];?>
: (compile <?php echo sprintf("%.5f",$_smarty_tpl->tpl_vars['template']->value['compile_time']);?>
) (render <?php echo sprintf("%.5f",$_smarty_tpl->tpl_vars['template']->value['render_time']);?>
) (cache <?php echo sprintf("%.5f",$_smarty_tpl->tpl_vars['template']->value['cache_time']);?>
)");
        <?php }} ?>
        console.groupEnd();
        <?php }?>

        group("Assigned template variables");
        <?php  $_smarty_tpl->tpl_vars['vars'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('assigned_vars')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['vars']->key => $_smarty_tpl->tpl_vars['vars']->value){
?>
          console.log("$<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['vars']->key,'html');?>
:", <?php echo json_encode($_smarty_tpl->tpl_vars['vars']->value);?>
);
        <?php }} ?>
        console.groupEnd();

        group("Assigned config file variables (outer template scope)");
        <?php  $_smarty_tpl->tpl_vars['vars'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('config_vars')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['vars']->key => $_smarty_tpl->tpl_vars['vars']->value){
?>
          console.log("<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['vars']->key,'html');?>
:", <?php echo json_encode($_smarty_tpl->tpl_vars['vars']->value);?>
);
        <?php }} ?>
        console.groupEnd();


        console.groupEnd();
        return "Smarty version <?php echo 'Smarty-3.0.7';?>
";

};
// ]]>
</script>