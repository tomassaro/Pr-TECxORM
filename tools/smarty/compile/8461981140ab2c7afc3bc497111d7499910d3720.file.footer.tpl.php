<?php /* Smarty version Smarty-3.0.7, created on 2011-09-12 12:00:31
         compiled from "/srv/Ignas/Presta/prestashop/themes/prestashop/footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:10626842164e6dca2fc5e721-05438304%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8461981140ab2c7afc3bc497111d7499910d3720' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/themes/prestashop/footer.tpl',
      1 => 1306134704,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '10626842164e6dca2fc5e721-05438304',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>


		<?php if (!$_smarty_tpl->getVariable('content_only')->value){?>
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
