<script type="text/javascript" src="{$base_dir}js/conditions.js"></script>
<script type="text/javascript" src="{$js_dir}layer.js"></script>
{include file=$tpl_dir./thickbox.tpl}
{capture name=path}{l s='Your shopping cart'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}
{assign var='current_step' value='summary'}
{include file=$tpl_dir./order-steps.tpl}
<div id="global_cart">
<h2>{l s='Shopping cart summary'}</h2>
<p>{l s='Your shopping cart contains'} {$products|@count} {if $products|@count > 1}{l s='products'}{else}{l s='product'}{/if}</p>
{include file=$tpl_dir./errors.tpl}
{if isset($empty)}
<li class="warning">{l s='Your shopping cart is empty.'}</li>
{else}
{if isset($lastProductAdded) AND $lastProductAdded}
	{foreach from=$products item=product}
		{if $product.id_product == $lastProductAdded}
		{/if}
	{/foreach}
{/if}
<div id="order-detail-content" class="table_block">
	<table id="cart_summary" class="std" cellpadding="0" cellspacing="0">
		<thead>
			<tr colspan="4">
				<th class="cart_product item">{l s='Product'}</th>
				<th class="cart_availability item">{l s='Availibility'}</th>
				<th class="cart_unit item">{l s='Unit price'}</th>
				<th class="cart_quantity item">{l s='Quantity'}</th>
				<th class="cart_total last_item">{l s='Total'}</th>
			</tr>
		</thead>
		<tfoot>
			<tr class="cart_total_product">
				<td colspan="4">{l s='Total products:'}</td>
				<td class="price">{convertPrice price=$total_products_wt}</td>
		    </tr>
			{if $total_discounts != 0}
			<tr class="cart_total_voucher">
				<td colspan="4">{l s='Total vouchers:'}</td>
				<td class="price-discount">{convertPrice price=$total_discounts}</td>
		    </tr>
			{/if}
			{if $shippingCost > 0}
			<tr class="cart_total_delivery">
				<td colspan="4">{l s='Total shipping:'}</td>
				<td class="price">{convertPrice price=$shippingCost}</td>
		    </tr>
			{/if}
			<tr class="cart_total_price">
				<td colspan="4">{l s='Total:'}</td>
				<td class="price">{convertPrice price=$total_price}</td>
		    </tr>
			{if $free_ship > 0}
			<tr class="cart_free_shipping">
				<td colspan="4" style="white-space:normal">{l s='Remaining amount to be added to your cart in order to obtain free shipping:'}</td>
				<td colspan="4" class="price">{convertPrice price=$free_ship}</td>
		    </tr>
			{/if}
		</tfoot>
		<tbody>
		 {foreach from=$products item=product name=productLoop}
			{assign var='productId' value=$product.id_product}
			{assign var='productAttributeId' value=$product.id_product_attribute}
			{assign var='quantityDisplayed' value=0}
			{* Display the product line *}
			{include file=$tpl_dir./shopping-cart-product-line.tpl}
		{/foreach}	{if $discounts}
		<tbody>
		{foreach from=$discounts item=discount name=discountLoop}
			<tr class="cart_discount {if $smarty.foreach.discountLoop.last}last_item{elseif $smarty.foreach.discountLoop.first}first_item{else}item{/if}">
				<td class="cart_discount_name">{$discount.name}</td>
				<td class="cart_discount_description">{$discount.description}</td>
				<td class="cart_discount_delete" align="right">
				  <a href="{$base_dir_ssl}order.php?deleteDiscount={$discount.id_discount}" title="{l s='Delete'}">
				   <img src="{$img_dir}icon/delete.gif" alt="{l s='Delete'}" class="icon" />
				  </a>
				</td>
				<td class="cart_discount_price" colspan="2"><span class="price-discount">{convertPrice price=$discount.value_real*-1}</span></td>
		    </tr>
		{/foreach}
		</tbody>
	{/if}
	</table>
  </div>

{if $voucherAllowed}
<ul id="cart_voucher" class="table_block">
	<li id="voucher">
	{if $errors_discount}
		<ul class="error">
		{foreach from=$errors_discount key=k item=error}
			<li>{$error|escape:'htmlall':'UTF-8'}</li>
		{/foreach}
		</ul>
	{/if}
	<h4>{l s='Vouchers'}</h4>
	<p>{l s='indicate your voucher code and validate'}</p>
	<form action="{$smarty.server.PHP_SELF|htmlentities}" method="post" id="voucher">
      <table id="voucher" border="0" cellpadding="0" cellspacing="0">
       <tr>
	    <td valign="top">
	 <input type="text" id="discount_name" name="discount_name" value="{if $discount_name}{$discount_name}{else}{l s='Enter your voucher code'}{/if}" onfocus="javascript:if(this.value=='{l s='Enter your voucher code'}')this.value='';" onblur="javascript:if(this.value=='Enter your voucher code')this.value='{l s='Enter your voucher code'}';"></input>
        </td>
	    <td valign="top"><input type="submit" name="submitDiscount" value="{l s=''}" class="sub" /></td>
       </tr>
      </table>	
	</form>
   </lu>
   </ul>
{/if}
{$HOOK_SHOPPING_CART}
<p class="cart_navigation">
	<a href="{if $smarty.server.HTTP_REFERER && strstr($smarty.server.HTTP_REFERER, 'order.php')}{$base_dir}index.php{else}{$smarty.server.HTTP_REFERER}{/if}" class="buttonnext" title="{l s='Continue shopping'}">{l s='Continue shopping'}</a>
	<a href="{$base_dir}order.php?step=1" class="buttoncontinu" title="{l s='Next'}">{l s='checkout'}</a>
</p>
{/if}
</div>

