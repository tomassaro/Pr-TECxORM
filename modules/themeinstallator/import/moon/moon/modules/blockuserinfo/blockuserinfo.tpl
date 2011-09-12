<!-- Block user information module HEADER -->
<div id="header_user">
  <div class="header_links">
   <li>
		{l s='Welcome' mod='blockuserinfo'},
		{if $logged}
			<strong><a href="{$base_dir_ssl}my-account.php">{$customerName}</a></strong> (<a href="{$base_dir}index.php?mylogout" title="{l s='Log me out' mod='blockuserinfo'}">{l s='Log out' mod='blockuserinfo'}</a>)
		{else}
			(<a href="{$base_dir_ssl}my-account.php">{l s='Log in' mod='blockuserinfo'}</a>)
		{/if}
   </li>
 </div>
 <div class="shopping_cart">
  	 <span class="ajax_cart_quantity" style="color:#ff6600">{if $cart_qties > 0}{$cart_qties}{else}0{/if}</span>
 	 <span class="ajax_cart_product_txt{if $cart_qties > 1} hidden{/if}"><strong>{l s='item' mod='blockuserinfo'}</strong></span>
	 <span class="ajax_cart_product_txt_s{if $cart_qties < 2} hidden{/if}"><strong>{l s='items' mod='blockuserinfo'}</strong></span>
     <b class="ajax_cart_total{if $cart_qties == 0} hidden{/if}">{if $cart_qties > 0}{if $priceDisplay == 1}{convertPrice price=$cart->getOrderTotal(false, 4)}{else}{convertPrice price=$cart->getOrderTotal(true, 4)}{/if}{/if}</b>
	 <p>
       <a href="{$base_dir_ssl}order.php" title="{l s='View' mod='blockuserinfo'}">{l s='View' mod='blockuserinfo'}</a>
       <a href="{$base_dir_ssl}order.php?step=1" id="button_order_cart" title="{l s='Check out' mod='blockcart'}">{l s='Checkout' mod='blockuserinfo'}</a>
     </p>
  </div>
</div>
<!-- /Block user information module HEADER -->
