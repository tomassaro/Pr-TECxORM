<ul class="select_Sort_ul">
<!-- MODULE Home Featured Products -->
{if isset($p) AND $p}
	{if $smarty.get.id_category|intval}
		{assign var='requestPage' value=$link->getPaginationLink('category', $category, false, false, true, false)}
		{assign var='requestNb' value=$link->getPaginationLink('category', $category, true, false, false, true)}
	{elseif $smarty.get.id_manufacturer|intval}
		{assign var='requestPage' value=$link->getPaginationLink('manufacturer', $manufacturer, false, false, true, false)}
		{assign var='requestNb' value=$link->getPaginationLink('manufacturer', $manufacturer, true, false, false, true)}
	{elseif $smarty.get.id_supplier|intval}
		{assign var='requestPage' value=$link->getPaginationLink('supplier', $supplier, false, false, true, false)}
		{assign var='requestNb' value=$link->getPaginationLink('supplier', $supplier, true, false, false, true)}
	{else}
		{assign var='requestPage' value=$link->getPaginationLink(false, false, false, false, true, false)}
		{assign var='requestNb' value=$link->getPaginationLink(false, false, true, false, false, true)}
	{/if}
{if isset($orderby) AND isset($orderway)}
<!-- Sort products -->
{if $smarty.get.id_category|intval}
	{assign var='request' value=$link->getPaginationLink('category', $category, false, true)}
{elseif $smarty.get.id_manufacturer|intval}
	{assign var='request' value=$link->getPaginationLink('manufacturer', $manufacturer, false, true)}
{elseif $smarty.get.id_supplier|intval}
	{assign var='request' value=$link->getPaginationLink('supplier', $supplier, false, true)}
{else}
	{assign var='request' value=$link->getPaginationLink(false, false, false, true)}
{/if}
<form id="productsSortForm" action="{$request}">
 <select id="selectPrductSort" onchange="document.location.href = $(this).val();">
  <option value="{$link->addSortDetails($request, 'position', 'desc')|escape:'htmlall':'UTF-8'}" {if $orderby eq 'position'    AND $orderway eq 'DESC' }selected="selected"{/if}>{l s='Trier la liste'}</option>
  <option value="{$link->addSortDetails($request, 'price', 'asc')|escape:'htmlall':'UTF-8'}" {if $orderby eq 'price'    AND $orderway eq 'ASC' }selected="selected"{/if}>{l s='price: lowest first'}</option>
  <option value="{$link->addSortDetails($request, 'price', 'desc')|escape:'htmlall':'UTF-8'}" {if $orderby eq 'price'    AND $orderway eq 'DESC'}selected="selected"{/if}>{l s='price: highest first'}</option>
  <option value="{$link->addSortDetails($request, 'name', 'asc')|escape:'htmlall':'UTF-8'}" {if $orderby eq 'name'     AND $orderway eq 'ASC' }selected="selected"{/if}>{l s='name: A to Z'}</option>
  <option value="{$link->addSortDetails($request, 'name', 'desc')|escape:'htmlall':'UTF-8'}" {if $orderby eq 'name'     AND $orderway eq 'DESC'}selected="selected"{/if}>{l s='name: Z to A'}</option>
  <option value="{$link->addSortDetails($request, 'quantity', 'desc')|escape:'htmlall':'UTF-8'}" {if $orderby eq 'quantity' AND $orderway eq 'DESC' }selected="selected"{/if}>{l s='in-stock first'}</option>
  <option value="{$link->addSortDetails($request, 'quantity',  'asc')|escape:'htmlall':'UTF-8'}" {if $orderby eq 'quantity' AND $orderway eq 'ASC'}selected="selected"{/if}>{l s='out-of-stock first'}</option>
 </select>
</form>
<!-- /Sort products -->
{/if}
</ul>
{/if}
</ul>
