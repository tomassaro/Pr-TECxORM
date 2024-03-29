{capture name=path}<a href="my-account.php">{l s='My account'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Your vouchers'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}
<div id="myaccountnav">
		<ul>
	        <li class="bnthyshome"><a href="{$base_dir_ssl}my-account.php">{l s='Home'}</a></li>
			<li><a href="{$base_dir_ssl}history.php" title="{l s='orders'}">{l s='orders'}</a></li>
			<li><a href="{$base_dir_ssl}order-slip.php" title="">{l s='credit slips'}</a></li>
			<li><a href="{$base_dir_ssl}discount.php" class="selected" title="">{l s='vouchers'}</a></li>
			{if $returnAllowed}
		    <li><a href="{$base_dir_ssl}order-follow.php" title="{l s='Merchandise returns'}">{l s='Merchandise returns'}</a></li>
	        {/if}
			<li><a href="{$base_dir_ssl}addresses.php" title="">{l s='addresses'}</a></li>
			<li><a href="{$base_dir_ssl}identity.php" title="">{l s='personal info'}</a></li>
		</ul>
</div>
<h2 >
  {l s='My Vouchers'}
  <a href="{$base_dir}index.php?mylogout" id="logout">{l s='Sign out'}</a>
</h2>
{if $discount && count($discount) && $nbDiscounts}
<table class="discount std">
	<thead>
		<tr>
			<th class="discount_code first_item">{l s='Code'}</th>
			<th class="discount_description item">{l s='Description'}</th>
			<th class="discount_quantity item">{l s='Quantity'}</th>
			<th class="discount_value item">{l s='Value'}</th>
			<th class="discount_minimum item">{l s='Minimum'}</th>
			<th class="discount_cumulative item">{l s='Cumulative'}</th>
			<th class="discount_expiration_date last_item">{l s='Expiration date'}</th>
		</tr>
	</thead>
	<tbody>
	{foreach from=$discount item=discount name=myLoop}
		<tr class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if} {if $smarty.foreach.myLoop.index % 2}alternate_item{/if}">
			<td class="discount_code">{$discount.name}</td>
			<td class="discount_description">{$discount.description}</td>
			<td class="discount_quantity">{$discount.quantity_for_user}</td>
			<td class="discount_value">
				{if $discount.id_discount_type == 1}
					{$discount.value|escape:'htmlall':'UTF-8'}%
				{elseif $discount.id_discount_type == 2}
					{convertPrice price=$discount.value}
				{else}
					{l s='Free shipping'}
				{/if}
			</td>
			<td class="discount_minimum">
				{if $discount.minimal == 0}
					{l s='none'}
				{else}
					{convertPrice price=$discount.minimal}
				{/if}
			</td>
			<td class="discount_cumulative">
				{if $discount.cumulable == 1}
					<img src="{$img_dir}icon/yes.gif" alt="{l s='Yes'}" class="icon" />
				{else}
					<img src="{$img_dir}icon/no.gif" alt="{l s='No'}" class="icon" />
				{/if}
			</td>
			<td class="discount_expiration_date">{dateFormat date=$discount.date_to}</td>
		</tr>
	{/foreach}
	</tbody>
</table>
{else}
	<li class="warning">{l s='You do not possess any vouchers.'}</li>
{/if}
