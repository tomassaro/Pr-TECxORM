{if count($categoryProducts) > 1}
<script type="text/javascript">var middle = {$middlePosition};</script>
<script type="text/javascript" src="{$base_dir}modules/productscategory/js/productscategory.js"></script>
<div id="{if count($categoryProducts) > 0}productscategory{else}productscategory_noscroll{/if}">
<h3>{l s='In the same category' mod='productscategory'}</h3>
{if count($categoryProducts) > 3}<a id="productscategory_scroll_left" title="{l s='Previous' mod='productscategory'}" href="javascript:{ldelim}{rdelim}">{l s='Previous' mod='productscategory'}</a>{/if}
<div id="productscategory_list">
	<ul {if count($categoryProducts) > 3}style="width: {math equation="width * nbImages" width=107 nbImages=$categoryProducts|@count}px"{/if}>
	  {foreach from=$categoryProducts item='categoryProduct' name=categoryProduct}
		<li {if count($categoryProducts) < 4}style="width: {math equation="width / nbImages" width=94 nbImages=$categoryProducts|@count}%"{/if}>
         <div class="boxgrid slidedown">
		  <img class="cover" src="{$img_prod_dir}{$categoryProduct.id_image}-home.jpg" alt="{$categoryProduct.name|htmlspecialchars}" />
		   <h5>
            <a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category)}" title="{$categoryProduct.name|htmlspecialchars}">
			{$categoryProduct.name|truncate:15}
			</a>
		   </h5> 
           <p>{displayWtPrice p=$categoryProduct.price}</p>
           <p class="nav">
            <a href="{$productLink}" title="{l s='Details' mod='productscategory'}">{l s='Details' mod='productscategory'}</a>
  </p> 
         </div>
        </li>
	  {/foreach}
	</ul>
</div>
{if count($categoryProducts) > 3}<a id="productscategory_scroll_right" title="{l s='Next' mod='productscategory'}" href="javascript:{ldelim}{rdelim}">{l s='Next' mod='productscategory'}</a>{/if}
{/if}
</div>
