<div id="left_column">
 <div id="left_column_top"></div>
 {$HOOK_LEFT_COLUMN}
</div>
<div class="div_categorie_product">
 <h2 class="category_title">
	{$category->name|escape:'htmlall':'UTF-8'}
    <span>{$nb_products|intval}&nbsp;</span><b>{if $nb_products>1}{l s='products'}{else}{l s='product'}{/if}</b>
</h2> 
<div class="sort_page">
	{include file=$tpl_dir./pagination.tpl}
    {if $products}
		{include file=$tpl_dir./product-sort.tpl}
	{/if}
</div>
<ul class="categorie_product">
 {if isset($products) AND $products}
  {assign var='liHeight' value=360}
  {assign var='nbItemsPerLine' value=4}
  {assign var='nbLi' value=$products|@count}
  {assign var='nbLines' value=$nbLi/$nbItemsPerLine|ceil}
  {assign var='ulHeight' value=$nbLines*$liHeight}
<ul>
 {foreach from=$products item=product name=products}
 {assign var='productLink' value=$link->getProductLink($product.id_product, $product.link_rewrite, $product.category)}
 <li class="ajax_block_product {if $smarty.foreach.products.first}first_item{elseif $smarty.foreach.products.last}last_item{else}item{/if} {if $smarty.foreach.products.iteration%$nbItemsPerLine == 0}last_item_of_line{elseif $smarty.foreach.products.iteration%$nbItemsPerLine == 1}first_item_of_line{/if} {if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - ($smarty.foreach.products.total % $nbItemsPerLine))}last_line{/if}">
 <div class="boxgrid slidedown">
  <img class="cover" src="{$img_prod_dir}{$product.id_image}-home.jpg" alt="{$product.legend|escape:htmlall:'UTF-8'}"/>
  <h5>
    <a href="{$product.link|escape:'htmlall':'UTF-8'}" title="{$product.legend|escape:'htmlall':'UTF-8'}">{$product.name|truncate:30|escape:'htmlall':'UTF-8'}</a>
  </h5>
  <p><a href="{$product.link}" title="{l s='More' mod='homefeatured'}">{$product.description_short|strip_tags|truncate:45:'...'}</a></p>
  <p class="price">{displayWtPrice p=$product.price}</p>
  <p class="nav">
   <a href="{$productLink}" title="{l s='View' mod='homefeatured'}">{l s=' i '}</a>
   <span><a rel="ajax_id_product_{$product.id_product|intval}" href="{$base_dir}cart.php?add&amp;id_product={$product.id_product|intval}&amp;token={$static_token}">{l s='+'}</a></span>
  </p> 
  </div>
 </li>
 {/foreach}
</ul>
 {else}
  <p>{l s='No featured products' mod='homefeatured'}</p>
 {/if}
</ul>
<!-- /MODULE Home Featured Products -->
</div>
</div>