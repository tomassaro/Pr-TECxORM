{capture name=path}<a href="my-account.php">{l s='My account'}</a>
<span class="navigation-pipe">{$navigationPipe}</span>{l s='Order history'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}
<div id="myaccountnav">
		<ul>
	        <li class="bnthyshome"><a href="{$base_dir_ssl}my-account.php">{l s='Home'}</a></li>
			<li><a href="{$base_dir_ssl}history.php" class="selected" title="">{l s='orders'}</a></li>
			<li><a href="{$base_dir_ssl}order-slip.php" title="">{l s='credit slips'}</a></li>
			{if $voucherAllowed}
			<li><a href="{$base_dir_ssl}discount.php" title="">{l s='vouchers'}</a></li>
			{/if}
			{if $returnAllowed}
		    <li><a href="{$base_dir_ssl}order-follow.php" title="{l s='Merchandise returns'}">{l s='Merchandise returns'}</a></li>
	        {/if}
			<li><a href="{$base_dir_ssl}addresses.php" title="">{l s='addresses'}</a></li>
			<li><a href="{$base_dir_ssl}identity.php" title="">{l s='personal info'}</a></li>
		</ul>
</div>
<h2>
  {l s='Order history'}
  <a href="{$base_dir}index.php?mylogout" id="logout" title="{l s='log out' mod='blockmyaccount'}">{l s='Sign out'}</a>
</h2>
<div class="order_globale_step">
<p>{l s='Here are the orders you have placed since the creation of your account'}.</p>
<br />
<div class="block-center" id="block-history">
	{if $orders && count($orders)}
	<table id="order-list" class="std" style="width:730px">
		<thead>
			<tr>
				<th class="first_item">{l s='Order'}</th>
				<th class="item">{l s='Date'}</th>
				<th class="item">{l s='Total price'}</th>
				<th class="item">{l s='Payment'}</th>
				<th class="item">{l s='Status'}</th>
				<th class="item">{l s='Invoice'}</th>
				<th class="last_item">&nbsp;</th>
			</tr>
		</thead>
		<tbody>
		{foreach from=$orders item=order name=myLoop}
			<tr class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if} {if $smarty.foreach.myLoop.index % 2}alternate_item{/if}">
				<td class="history_link bold">
					{if $order.invoice && $order.virtual}<img src="{$img_dir}icon/download_product.gif" class="icon" alt="{l s='Product(s) to download'}" title="{l s='Product(s) to download'}" />{/if}
					<a class="color-myaccount" href="javascript:showOrder(1, {$order.id_order|intval}, 'order-detail');">{l s='#'}{$order.id_order|string_format:"%06d"}</a>
				</td>
				<td class="history_date bold">{dateFormat date=$order.date_add full=0}</td>
				<td class="history_price"><span class="price">{displayPrice price=$order.total_paid_real currency=$order.id_currency no_utf8=false convert=false}</span>                </td>
				<td class="history_method">{$order.payment|escape:'htmlall':'UTF-8'}</td>
				<td class="history_state">{$order.order_state|escape:'htmlall':'UTF-8'}</td>
				<td class="history_invoice">
				{if ($order.invoice or $order.invoice_number) AND $invoiceAllowed}
					<a href="{$base_dir}pdf-invoice.php?id_order={$order.id_order|intval}" title="{l s='Invoice'} {$order.name|escape:'htmlall':'UTF-8'}"><img src="{$img_dir}icon/pdf.gif" alt="{l s='Invoice'} {$order.name|escape:'htmlall':'UTF-8'}" class="icon" /></a>
					<a href="{$base_dir}pdf-invoice.php?id_order={$order.id_order|intval}" title="{l s='Invoice'} {$order.name|escape:'htmlall':'UTF-8'}">{l s='PDF'}</a>
				{else}-{/if}
				</td>
				<td class="history_detail"><a class="color-myaccount" href="javascript:showOrder(1, {$order.id_order|intval}, 'order-detail');">{l s='details'}</a></td>
			</tr>
		{/foreach}
		</tbody>
	</table>
	<div class="tbody_dotted_end">&nbsp;</div>
	<div id="block-order-detail" class="hidden">&nbsp;</div>
	{else}
	<p class="warning">{l s='You have not placed any orders.'}</p>
	{/if}
	<br /><br />
</div>
</div>