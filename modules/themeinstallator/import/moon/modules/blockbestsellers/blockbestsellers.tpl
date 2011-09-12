<!-- MODULE Block best sellers -->
<div class="products_block">
 <h3>
   {l s='Top sellers' mod='blockbestsellers'}
   <span><a href="{$base_dir}best-sales.php"  class="all_seller"  title="{l s='See all' mod='blockbestsellers'}">{l s='See all' mod='blockbestsellers'}</a></span>
 </h3>
 {if $best_sellers|@count > 0}
 <li class="boxgrid slidedown">
  <img class="cover" src="{$img_prod_dir}{$best_sellers.0.id_image}-home.jpg" alt="{$best_sellers.0.legend|escape:htmlall:'UTF-8'}"/>
  <h5>
   <a href="{$best_sellers.0.link}" title="{$best_sellers.0.name|escape:htmlall:'UTF-8'}">{$best_sellers.0.name|escape:htmlall:'UTF-8'|truncate:30}</a>
  </h5>
  <p><a href="{$best_sellers.0.link}" title="{l s='More' mod='homefeatured'}">{$best_sellers.0.description_short|strip_tags|truncate:35:'...'}</a></p>
  <p class="price">{$best_sellers.0.price}</p>
  <p class="nav">
   <a href="{$best_sellers.0.link}" title="{$product.name|escape:htmlall:'UTF-8'}">{l s='Details' mod='blockbestsellers'}</a>
  </p> 
 </li>
 {if $best_sellers|@count > 1}
  <li class="boxgrid slidedown">
  <img class="cover" src="{$img_prod_dir}{$best_sellers.1.id_image}-home.jpg" alt="{$best_sellers.1.legend|escape:htmlall:'UTF-8'}"/>
  <h5>
   <a href="{$best_sellers.1.link}" title="{$best_sellers.1.name|escape:htmlall:'UTF-8'}">{$best_sellers.1.name|escape:htmlall:'UTF-8'|truncate:30}</a>
  </h5>
  <p><a href="{$best_sellers.1.link}" title="{l s='More' mod='homefeatured'}">{$best_sellers.1.description_short|strip_tags|truncate:35:'...'}</a></p>
  <p class="price">{$best_sellers.1.price}</p>
  <p class="nav">
   <a href="{$best_sellers.1.link}" title="{$product.name|escape:htmlall:'UTF-8'}">{l s='Details' mod='blockbestsellers'}</a>
  </p> 
 </li>
 {/if}
 {if $best_sellers|@count > 2}
  <li class="boxgrid slidedown">
  <img class="cover" src="{$img_prod_dir}{$best_sellers.2.id_image}-home.jpg" alt="{$best_sellers.2.legend|escape:htmlall:'UTF-8'}"/>
  <h5>
   <a href="{$best_sellers.2.link}" title="{$best_sellers.1.name|escape:htmlall:'UTF-8'}">{$best_sellers.2.name|escape:htmlall:'UTF-8'|truncate:30}</a>
  </h5>
  <p><a href="{$best_sellers.2.link}" title="{l s='More' mod='homefeatured'}">{$best_sellers.2.description_short|strip_tags|truncate:35:'...'}</a></p>
  <p class="price">{$best_sellers.2.price}</p>
  <p class="nav">
   <a href="{$best_sellers.2.link}" title="{$product.name|escape:htmlall:'UTF-8'}">{l s='Details' mod='blockbestsellers'}</a>
  </p> 
 </li>
 {/if}
{else}
<li class="warning">{l s='No best sellers at this time' mod='blockbestsellers'}</li>
{/if}
</div>
<!-- /MODULE Block best sellers -->

