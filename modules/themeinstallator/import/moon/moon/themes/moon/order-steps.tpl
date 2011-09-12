{* Assign a value to 'current_step' to display current style *}
<!-- Steps -->
<ul class="step" id="order_step">
	<li class="{if $current_step=='summary'}step_current{else}{if $current_step=='payment' || $current_step=='shipping' || $current_step=='address' || $current_step=='login'}step_done{else}step_todo{/if}{/if}">
		{if $current_step=='payment' || $current_step=='shipping' || $current_step=='address' || $current_step=='login'}
		<a href="{$base_dir_ssl}order.php">
			{l s='Summary'}
		</a>
		{else}
		1. {l s='Summary'}
		{/if}
	</li>
	<li class="{if $current_step=='login'}step_current{else}{if $current_step=='payment' || $current_step=='shipping' || $current_step=='address'}step_done{else}step_todo{/if}{/if}">
		{if $current_step=='payment' || $current_step=='shipping' || $current_step=='address'}
		<a href="{$base_dir_ssl}order.php?step=1">
			{l s='Login'}
		</a>
		{else}
		2. {l s='Login'}
		{/if}
	</li>
	<li class="{if $current_step=='address'}step_current{else}{if $current_step=='payment' || $current_step=='shipping'}step_done{else}step_todo{/if}{/if}">
		{if $current_step=='payment' || $current_step=='shipping'}
		<a href="{$base_dir_ssl}order.php?step=1">
			{l s='Address'}
		</a>
		{else}
		3. {l s='Address'}
		{/if}
	</li>
	<li class="{if $current_step=='shipping'}step_current{else}{if $current_step=='payment'}step_done{else}step_todo{/if}{/if}">
		{if $current_step=='payment'}
		<a href="{$base_dir_ssl}order.php?step=2">
			{l s='Shipping'}
		</a>
		{else}
		4. {l s='Shipping'}
		{/if}
	</li>
	<li id="step_end" class="{if $current_step=='payment'}step_current{else}step_todo{/if}">
		5. {l s='Payment'}
	</li>
  </ul>
  <!-- /Steps -->
<div id="commitment">  
  <ul>
   <h5>{l s='With Moon'}</h5>
   <h6>{l s='Secure payments'}</h6>
   <p>{l s='we do not store any of your credit card details and have no access to your credit card information at any time'}</p>
   <h6>{l s='Quick delivery'}</h6>
   <p>{l s='we deliver within 48h with Colissimo'}</p>
   <h6>{l s='Satisfied or refunded, easy shift and returns'}</h6>
   <p>{l s='if you are not satisfied with our products or if you want to return a product, we will be happy to accommodate'}</p>
   <p>{l s='moon street'}</p>
   <h6>{l s='Respect and privacy of your personal data'}</h6>
   <p>{l s=' we do not sell or rent your personnal information to anyone'}</p>
   <h6>{l s='Contact'}</h6>
   <p>{l s='@'} :  <a href="mailto:contact@blackwhite.fr">contact@moon.fr</a><br />
    {l s='Phone'} : <span><a href="#">{l s='+331 10 10 10'}</a></span><br />
   </p><br />
   <p><a href="{$link->getCMSLink(5, $securepayment)}"><img src="{$base_dir}themes/moon/img/payment_logo.gif" /></a></p>
  </ul>
</div>
