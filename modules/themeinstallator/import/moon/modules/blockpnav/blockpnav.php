<?php

class BlockPNav extends Module
{
	function __construct()
	{
		$this->name = 'blockpnav';
		$this->tab = 'Blocks';
		$this->version = 0.1;

		parent::__construct();

		$this->displayName = $this->l('Product navigation (previous/next) block');
		$this->description = $this->l('Adds a block that displays product navigation links (previous/next).');
	}

	function install()
	{
		if (!parent::install())
			return false;
		if (!$this->registerHook('extraLeft'))
			return false;
		return true;
	}

	function hookExtraLeft($params)
	{
		global $smarty, $cookie, $link, $product;
		$pnav = false;

		$fileindex = basename($_SERVER['PHP_SELF']);
		if ($fileindex=='product.php' && is_object($product))
		{
			// previous
			$pnav_previous_product = $this->_pnav_get_product('previous');
			if (is_array($pnav_previous_product))
			{
				$pnav = true;
				$smarty->assign('pnav_previous_product', $pnav_previous_product);
			}
		
			// next
			$pnav_next_product = $this->_pnav_get_product('next');
			if (is_array($pnav_next_product))
			{
				$pnav = true;
				$smarty->assign('pnav_next_product', $pnav_next_product);
			}

			if ($pnav) return $this->display(__FILE__, 'blockpnav.tpl');
		}
	}

	function hookExtraRight($params)
	{
		return $this->hookExtraLeft($params);
	}

	private function _pnav_get_product($position)
	{
		global $smarty, $cookie, $link, $product;

		if ($position=='next') { $operator = '>'; $orderway = 'ASC'; }
		else if ($position=='previous') {$operator = '<'; $orderway = 'DESC'; }
		else return;

		$id_lang = intval($cookie->id_lang);

		$sql = '
			SELECT p.id_product, p.ean13, pl.name, pl.link_rewrite, cl.link_rewrite as cat_link_rewrite
			FROM `'._DB_PREFIX_.'product` p
			LEFT JOIN `'._DB_PREFIX_.'product_lang` pl ON (p.`id_product` = pl.`id_product` AND pl.`id_lang` = '.$id_lang.')
			LEFT JOIN `'._DB_PREFIX_.'category_lang` cl ON (p.`id_category_default` = cl.`id_category` AND cl.`id_lang` = '.$id_lang.')
			WHERE p.`active`=1
				AND p.`id_category_default`='.intval($product->id_category_default).'
				AND p.id_product'.$operator.intval($product->id).'
			ORDER BY p.id_product '.$orderway.' LIMIT 1';

		$result = Db::getInstance()->ExecuteS($sql);
		if (is_array($result) && count($result))
		{
			$row = $result[0];
			$row['link'] = $link->getProductLink($row['id_product'], $row['link_rewrite'], $row['cat_link_rewrite'], $row['ean13']);
			return $row;
		}
	}

}

?>
