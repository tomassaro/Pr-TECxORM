<tr class="{if $smarty.foreach.productLoop.last}last_item{elseif $smarty.foreach.productLoop.first}first_item{/if}{if isset($customizedDatas.$productId.$productAttributeId) AND $quantityDisplayed == 0}alternate_item{/if} cart_item">
	<td class="cart_product">
	  <a href="{$link->getProductLink($product.id_product, $product.link_rewrite, $product.category)|escape:'htmlall':'UTF-8'}">
		<img src="{$img_prod_dir}{$product.id_image}-small.jpg" alt="{$product.name|escape:'htmlall':'UTF-8'}" />
	  </a>
	  <h5>
	   <a href="{$link->getProductLink($product.id_product, $product.link_rewrite, $product.category)|escape:'htmlall':'UTF-8'}">{$product.name|escape:'htmlall':'UTF-8'}</a> 
	  </h5>
		<span>
		{if $product.attributes}
		<a class="cart_span_attribut" href="{$link->getProductLink($product.id_product, $product.link_rewrite, $product.category)|escape:'htmlall':'UTF-8'}">{$product.attributes|escape:'htmlall':'UTF-8'}</a>
		{if $product.attributes}{if isset($product.attributes_each.2)}{$product.attributes_each.2}{/if}{/if}
		{if $product.attributes}{if isset($product.attributes_each.1)}{$product.attributes_each.1}{/if}{/if}		
		{/if}
		</span> 	
     </td>
	<td class="cart_availability">
		{if $product.active AND ($product.allow_oosp OR $product.stock_quantity > 0)}
			<img src="{$img_dir}icon/available.gif" alt="{l s='Available'}" />
		{else}
			<img src="{$img_dir}icon/unavailable.gif" alt="{l s='Out of stock'}" />
		{/if}
	</td>
	<td class="cart_unit">{convertPrice price=$product.price_wt}</td>
	<td class="cart_quantity">
		{if isset($customizedDatas.$productId.$productAttributeId) AND $quantityDisplayed == 0}{$product.customizationQuantityTotal}{/if}
		{if !isset($customizedDatas.$productId.$productAttributeId) OR $quantityDisplayed > 0}
		<span class="cart_quantity_number">
		{if $quantityDisplayed == 0 AND isset($customizedDatas.$productId.$productAttributeId)}{$customizedDatas.$productId.$productAttributeId|@count}{else}{$product.quantity-$quantityDisplayed}{/if}
		</span>		
		<span style="float:right">
		 <a class="cart_quantity_up" href="{$base_dir}cart.php?add&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;token={$token_cart}" title="{l s='Add'}">
		  <img src="{$img_dir}icon/quantity_up.gif" alt="{l s='Add'}" />
		 </a>
		 <br />
		 <a class="cart_quantity_down" href="{$base_dir}cart.php?add&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;op=down&amp;token={$token_cart}" title="{l s='Subtract'}">
		 <img src="{$img_dir}icon/quantity_down.gif" alt="{l s='Subtract'}" />
		 </a>
        </span>		
        <span style="float:right; margin-top:0.7em">
		<a class="cart_quantity_delete" href="{$base_dir}cart.php?delete&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;token={$token_cart}" title="{l s='Delete'}">
		<img src="{$img_dir}icon/delete.gif" alt="{l s='Delete'}" class="icon" />
		</a>
		{/if}
	    </span>
	</td>
	<td class="cart_total"><span class="price">{if $quantityDisplayed == 0 AND isset($customizedDatas.$productId.$productAttributeId)}{convertPrice price=$product.total_customization_wt}{else}{convertPrice price=$product.total_wt}{/if}</span></td>
</tr>
