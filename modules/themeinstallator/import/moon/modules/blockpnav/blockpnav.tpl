<div id="blocknav">
<p>
{if ($pnav_previous_product)}
	<a id="previous" href="{$pnav_previous_product.link}" title="{$pnav_previous_product.name|escape:'htmlall':'UTF-8'}">&nbsp;</a> 
{/if}
{if ($pnav_next_product)}
	<a id="next" href="{$pnav_next_product.link}" title="{$pnav_next_product.name|escape:'htmlall':'UTF-8'}">&nbsp;</a> 
{/if}
</p>
</div>