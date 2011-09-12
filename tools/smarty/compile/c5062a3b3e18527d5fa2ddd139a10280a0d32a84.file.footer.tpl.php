<?php /* Smarty version Smarty-3.0.7, created on 2011-09-13 01:35:05
         compiled from "/srv/Ignas/Presta/prestashop/themes/tecform/footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3597213304e6e89196142d0-49419453%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c5062a3b3e18527d5fa2ddd139a10280a0d32a84' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/themes/tecform/footer.tpl',
      1 => 1315829024,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3597213304e6e89196142d0-49419453',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>


		<?php if (!$_smarty_tpl->getVariable('content_only')->value){?>
				</div>
                                				<div id="header_right">
					<?php echo $_smarty_tpl->getVariable('HOOK_TOP')->value;?>

				</div>

<!-- Right -->
				<div id="right_column" class="column">
					<?php echo $_smarty_tpl->getVariable('HOOK_RIGHT_COLUMN')->value;?>

				</div>
			</div>

<!-- Footer -->
			<div id="footer"><?php echo $_smarty_tpl->getVariable('HOOK_FOOTER')->value;?>
</div>
		</div>
	<?php }?>
	</body>
</html>
