<div>
{include file=$tpl_dir./breadcrumb.tpl} 
 <!-- Left -->
<div class="center_column">
{if $category->active}
{include file=$tpl_dir./errors.tpl}
    {if $products}
		{include file=$tpl_dir./product-list.tpl products=$products}
	{elseif !isset($subcategories)}
		<li class="warning">{l s='There is no product in this category.'}</li>
	{/if}
    {else}
	<li class="warning">{l s='This category is currently unavailable.'}</li>
{/if}

</div>
