{capture name=path}<a href="my-account.php">{l s='My account'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Credit slips'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}
<div id="myaccountnav">
		<ul>
	        <li class="bnthyshome"><a href="{$base_dir_ssl}my-account.php">{l s='Home'}</a></li>
			<li><a href="{$base_dir_ssl}history.php" title="">{l s='orders'}</a></li>
			<li><a href="{$base_dir_ssl}order-slip.php" class="selected" title="">{l s='credit slips'}</a></li>
			{if $voucherAllowed}
			<li><a href="{$base_dir_ssl}discount.php" title="">{l s='vouchers'}</a></li>
			{/if}
			{if $returnAllowed}
		    <li><a href="{$base_dir_ssl}order-follow.php" class="selected" title="{l s='Merchandise returns'}">{l s='Merchandise returns'}</a></li>
   	        {/if}
			<li><a href="{$base_dir_ssl}addresses.php" title="">{l s='addresses'}</a></li>
			<li><a href="{$base_dir_ssl}identity.php" title="">{l s='personal info'}</a></li>
		</ul>
</div>
<h2>
  {l s='Credit slips'}
  <a href="{$base_dir}index.php?mylogout" id="logout">{l s='Sign out'}</a>
</h2>
<div class="order_globale_step">
<p>{l s='Credit slips you received after canceled orders'}.</p>
<div class="block-center" id="block-history">
	{if $ordersSlip && count($ordersSlip)}
	<table id="order-list" class="std">
		<thead>
			<tr>
				<th class="first_item">{l s='Credit slip'}</th>
				<th class="item">{l s='Order'}</th>
				<th class="item">{l s='Date issued'}</th>
				<th class="last_item">{l s='View credit slip'}</th>
			</tr>
		</thead>
		<tbody>
		{foreach from=$ordersSlip item=slip name=myLoop}
			<tr class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if} {if $smarty.foreach.myLoop.index % 2}alternate_item{/if}">
				<td class="bold"><span class="color-myaccount">{l s='#'}{$slip.id_order_slip|string_format:"%06d"}</span></td>
				<td class="history_method"><a class="color-myaccount" href="javascript:showOrder(1, {$slip.id_order|intval}, 'order-detail');">{l s='#'}{$slip.id_order|string_format:"%06d"}</a></td>
				<td class="bold">{dateFormat date=$slip.date_add full=0}</td>
				<td class="history_invoice">
					<a href="{$base_dir}pdf-order-slip.php?id_order_slip={$slip.id_order_slip|intval}" title="{l s='Credit slip'} {l s='#'}{$slip.id_order_slip|string_format:"%06d"}"><img src="{$img_dir}icon/pdf.gif" alt="{l s='Order slip'} {l s='#'}{$return.id_order_slip|string_format:"%06d"}" class="icon" /></a>
					<a href="{$base_dir}pdf-order-slip.php?id_order_slip={$slip.id_order_slip|intval}" title="{l s='Credit slip'} {l s='#'}{$slip.id_order_slip|string_format:"%06d"}">{l s='PDF'}</a>
				</td>
			</tr>
		{/foreach}
		</tbody>
	</table>
	<div id="block-order-detail" class="hidden">&nbsp;</div>
	{else}
		<li class="warning">{l s='You have not received any credit slips.'}</li>
	{/if}
</div>
</div>