{capture name=path}{l s='Manufacturers'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}
<h2>{l s='Manufacturers'}</h2>
{if isset($errors) AND $errors}
	{include file=$tpl_dir./errors.tpl}
{else}
<p>{if $nbManufacturers > 1}{l s='There are'} <span class="bold">{$nbManufacturers} {l s='manufacturers.'}</span>{else}{l s='There is'} <span class="bold">{$nbManufacturers} {l s='manufacturer.'}</span>{/if}</p>
{if $nbManufacturers > 0}
	{include file=$tpl_dir./product-sort.tpl}
	<ul id="manufacturers_list">
	{foreach from=$manufacturers item=manufacturer}
		<li>
	   <div class="logo boxgrid slidedown">
		{if $manufacturer.nb_products > 0}
		{/if}
		 <img class="cover" src="{$img_manu_dir}{$manufacturer.image|escape:'htmlall':'UTF-8'}-large.jpg" height="120" width="120" alt="" />
			<!-- name -->
			 <h3>
					{if $manufacturer.nb_products > 0}
					<a href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)|escape:'htmlall':'UTF-8'}">
					{/if}
					{$manufacturer.name|truncate:60:'...'|escape:'htmlall':'UTF-8'}
					{if $manufacturer.nb_products > 0}
					</a>
					{/if}
				</h3>
				<p class="description">
				{if $manufacturer.nb_products > 0}
					<a href="{$link->getmanufacturerLink($supplier.id_manufacturer, $manufacturer.link_rewrite)|escape:'htmlall':'UTF-8'}"></a>
				{/if}
				{$manufacturer.description|escape:'htmlall':'UTF-8'}
				{if $manufacturer.nb_products > 0}
				</a>
				{/if}
				</p>
			
			{if $manufacturer.nb_products > 0}
				<a href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)|escape:'htmlall':'UTF-8'}">
			{/if}
				<p>{$manufacturer.nb_products|intval} {if $manufacturer.nb_products > 1}{l s='products'}{else}{l s='products'}{/if}</p>
			{if $manufacturer.nb_products > 0}
				</a>
			{/if}

			{if $manufacturer.nb_products > 0}
				<a class="button" href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)|escape:'htmlall':'UTF-8'}">{l s='view products'}</a>
			{/if}
			</div>
			<br class="clear"/>
		</li>
	{/foreach}
	</ul>
	<ul style="clear:both">{include file=$tpl_dir./pagination.tpl}</ul>
{/if}
{/if}
