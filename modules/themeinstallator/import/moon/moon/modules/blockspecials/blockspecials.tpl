<!-- MODULE Block specials -->
<div class="blockspecials">
 <div>
  {if $special}
  <ul>
   <h4>
   {l s='Specials' mod='blockspecials'}
   <span><a href="{$base_dir}prices-drop.php"  title="{l s='See all specials' mod='blockspecials'}">{l s='See all' mod='blockspecials'}</a></span>
   </h4>			
	<li>
	  <a href="{$special.link}">
	   <img src="{$img_prod_dir}{$special.id_image}-home.jpg" alt="{$special.legend|escape:htmlall:'UTF-8'}" title="{$special.name|escape:htmlall:'UTF-8'}" />             
	  </a>
	</li>
	<li class="li_info">			
	  <h5>
	   <a href="{$special.link}" title="{$special.name|escape:htmlall:'UTF-8'}">{$special.name|escape:htmlall:'UTF-8'|truncate:20}</a>
	  </h5>
	  <p><a href="{$special.link}">{$special.description_short|strip_tags:htmlall:'UTF-8'|truncate:300}</a></p>
	  <div>
       <b class="span_reduction">{if $special.reduction_percent}{l s='reduced by' mod='blockspecials'}{$special.reduction_percent}%{/if}</b> 
	   <span>
         <ol class="chiftpirce">{displayWtPrice p=$special.price_without_reduction}</ol>
         <strong class="newpirce">{displayWtPrice p=$special.price}</strong>
       </span>
       </div>
    </li>
	<!-- /Block payment logo  -->
  </ul>
  {else}
  <p>{l s='No specials at this time' mod='blockspecials'}</p>
  {/if}
 </div>
</div>
<!-- /MODULE Block specials -->