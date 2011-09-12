<!-- MODULE Block new products -->
<div class="products_block">
 <h3>
  {l s='New products' mod='blocknewproducts'}
   <span><a href="{$base_dir}new-products.php"  title="{l s='See all' mod='blocknewproducts'}">{l s='See all' mod='blocknewproducts'}</a></span>
 </h3>
 {if $new_products}
	{foreach from=$new_products item=product name=myLoop}
 {/foreach}
 <li class="boxgrid slidedown">
  <img class="cover" src="{$img_prod_dir}{$new_products.0.id_image}-home.jpg" alt="{$new_products.0.legend|escape:htmlall:'UTF-8'}"/>
  <h5>
	<a href="{$new_products.0.link}" title="{$new_products.0.name|escape:htmlall:'UTF-8'}">{$new_products.0.name|escape:htmlall:'UTF-8'|truncate:30}</a>
  </h5>
  <p><a href="{$best_sellers.0.link}" title="{l s='More' mod='homefeatured'}">{$new_products.0.description_short|strip_tags|truncate:35:'...'}</a></p>
  <p class="price">{displayWtPrice p=$new_products.0.price}</p>
  <p class="nav">
   <a href="{$new_products.0.link}" title="{$product.name|escape:htmlall:'UTF-8'}">{l s='Details' mod='blocknewproducts'}</a>
  </p> 
 </li>
 <li class="boxgrid slidedown">
  <img class="cover" src="{$img_prod_dir}{$new_products.1.id_image}-home.jpg" alt="{$new_products.1.legend|escape:htmlall:'UTF-8'}"/>
  <h5>
	<a href="{$new_products.1.link}" title="{$new_products.1.name|escape:htmlall:'UTF-8'}">{$new_products.1.name|escape:htmlall:'UTF-8'|truncate:30}</a>
  </h5>
  <p><a href="{$best_sellers.1.link}" title="{l s='More' mod='homefeatured'}">{$new_products.1.description_short|strip_tags|truncate:35:'...'}</a></p>
  <p class="price">{displayWtPrice p=$new_products.1.price}</p>
  <p class="nav">
   <a href="{$new_products.1.link}" title="{$product.name|escape:htmlall:'UTF-8'}">{l s='Details' mod='blocknewproducts'}</a>
  </p> 
 </li>
 <li class="boxgrid slidedown">
  <img class="cover" src="{$img_prod_dir}{$new_products.2.id_image}-home.jpg" alt="{$new_products.2.legend|escape:htmlall:'UTF-8'}"/>
  <h5>
	<a href="{$new_products.2.link}" title="{$new_products.2.name|escape:htmlall:'UTF-8'}">{$new_products.2.name|escape:htmlall:'UTF-8'|truncate:30}</a>
  </h5>
  <p><a href="{$best_sellers.2.link}" title="{l s='More' mod='homefeatured'}">{$new_products.2.description_short|strip_tags|truncate:35:'...'}</a></p>
  <p class="price">{displayWtPrice p=$new_products.2.price}</p>
  <p class="nav">
   <a href="{$new_products.2.link}" title="{$product.name|escape:htmlall:'UTF-8'}">{l s='Details' mod='blocknewproducts'}</a>
  </p> 
 </li>
 {else}
  <p>{l s='No new product at this time' mod='blocknewproducts'}</p>
 {/if}
</div>
<!-- /MODULE Block new products -->
