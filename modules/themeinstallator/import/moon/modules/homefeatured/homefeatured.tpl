<!-- MODULE Home Featured Products -->
<div class="products_block">
{if isset($products) AND $products}
 {assign var='liHeight' value=360}
 {assign var='nbItemsPerLine' value=4}
 {assign var='nbLi' value=$products|@count}
 {assign var='nbLines' value=$nbLi/$nbItemsPerLine|ceil}
 {assign var='ulHeight' value=$nbLines*$liHeight}
 <ul>
  <h3>{l s='featured products' mod='homefeatured'}</h3>
  {foreach from=$products item=product name=homeFeaturedProducts}
  {assign var='productLink' value=$link->getProductLink($product.id_product, $product.link_rewrite, $product.category)}
  <li class="{if $smarty.foreach.homeFeaturedProducts.first}first_item{elseif $smarty.foreach.homeFeaturedProducts.last}last_item{else}item{/if} {if $smarty.foreach.homeFeaturedProducts.iteration%$nbItemsPerLine == 0}last_item_of_line{elseif $smarty.foreach.homeFeaturedProducts.iteration%$nbItemsPerLine == 1}first_item_of_line{/if} {if $smarty.foreach.homeFeaturedProducts.iteration > ($smarty.foreach.homeFeaturedProducts.total - ($smarty.foreach.homeFeaturedProducts.total % $nbItemsPerLine))}last_line{/if}">
<div class="boxgrid slidedown">
  <img class="cover" src="{$img_prod_dir}{$product.id_image}-home.jpg" alt="{$product.legend|escape:htmlall:'UTF-8'}"/>
  <h5 class="h5">
    <a class="h5" href="{$productLink}" title="{$product.name|escape:htmlall:'UTF-8'|truncate:20}">{$product.name|escape:htmlall:'UTF-8'|truncate:30}</a>
  </h5>
  <p><a href="{$product.link}" title="{l s='More' mod='homefeatured'}">{$product.description_short|strip_tags|truncate:50:'...'}</a></p>
  <p class="price">{displayWtPrice p=$product.price}</p>
  <p class="nav">
   <a href="{$productLink}" title="{l s='View' mod='homefeatured'}">{l s='Details' mod='homefeatured'}</a>
  </p> 
  </div>
 </li>
 {/foreach}
        </ul>
    {else}
    <p>{l s='No featured products' mod='homefeatured'}</p>
{/if}
</div>

<!-- /MODULE Home Featured Products -->
