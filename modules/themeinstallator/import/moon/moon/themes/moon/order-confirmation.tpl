{capture name=path}{l s='Order confirmation'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}

{assign var='current_step' value='payment'}
{include file=$tpl_dir./order-steps.tpl}
<h2>{l s='Order confirmation'}</h2>
<div class="order_globale_step">
{include file=$tpl_dir./errors.tpl}
{$HOOK_ORDER_CONFIRMATION}
{$HOOK_PAYMENT_RETURN}
<br />
</div>
<p class="cart_navigation">
<a href="{$base_dir_ssl}history.php" class="buttonnext" title="{l s='Back to orders'}">{l s='Back to orders'}</a>
</p>