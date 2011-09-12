<?php /*%%SmartyHeaderCode:7432036184e6dca2dc65348-90390003%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'dbd8dc9033db7c62c72705f7e9eaa2745364589f' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/modules/blockcategories/blockcategories.tpl',
      1 => 1306504148,
      2 => 'file',
    ),
    'd53b49e718ee162aa8e38126c448a0c62784a927' => 
    array (
      0 => '/srv/Ignas/Presta/prestashop/modules/blockcategories/category-tree-branch.tpl',
      1 => 1306134704,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7432036184e6dca2dc65348-90390003',
  'has_nocache_code' => false,
  'cache_lifetime' => 3600,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!$no_render) {?>

<!-- Block categories module -->
<div id="categories_block_left" class="block">
	<h4>Kategorijos</h4>
	<div class="block_content">
		<ul class="tree dhtml">
									
<li >
	<a href="http://srv.lo/Ignas/Presta/prestashop/category.php?id_category=2"  title="Now that you can buy movies from the iTunes Store and sync them to your iPod, the whole world is your theater.">iPods</a>
			<ul>
									
<li >
	<a href="http://srv.lo/Ignas/Presta/prestashop/category.php?id_category=5"  title="Aprašas">Podai 2</a>
	</li>
												
<li class="last">
	<a href="http://srv.lo/Ignas/Presta/prestashop/category.php?id_category=6"  title="Podai 3">Podai 3</a>
	</li>
							</ul>
	</li>
												
<li >
	<a href="http://srv.lo/Ignas/Presta/prestashop/category.php?id_category=3"  title="Wonderful accessories for your iPod">Accessories</a>
	</li>
												
<li class="last">
	<a href="http://srv.lo/Ignas/Presta/prestashop/category.php?id_category=4"  title="The latest Intel processor, a bigger hard drive, plenty of memory, and even more new features all fit inside just one liberating inch. The new Mac laptops have the performance, power, and connectivity of a desktop computer. Without the desk part.">Laptops</a>
	</li>
							</ul>
		<script type="text/javascript">
		// <![CDATA[
			// we hide the tree only if JavaScript is activated
			$('div#categories_block_left ul.dhtml').hide();
		// ]]>
		</script>
	</div>
</div>
<!-- /Block categories module -->
<?php } ?>