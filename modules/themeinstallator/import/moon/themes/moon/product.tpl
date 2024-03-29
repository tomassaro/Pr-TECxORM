{include file=$tpl_dir./errors.tpl}
{if $errors|@count == 0}
<script type="text/javascript">
// <![CDATA[

// PrestaShop internal settings
var currencySign = '{$currencySign|html_entity_decode:2:"UTF-8"}';
var currencyRate = '{$currencyRate|floatval}';
var currencyFormat = '{$currencyFormat|intval}';
var currencyBlank = '{$currencyBlank|intval}';
var taxRate = {$product->tax_rate|floatval};

//JS Hook
var oosHookJsCodeFunctions = new Array();

// Parameters
var id_product = '{$product->id|intval}';
var productHasAttributes = {if isset($groups)}true{else}false{/if};
var quantitiesDisplayAllowed = {if $display_qties == 1}true{else}false{/if};
var quantityAvailable = {if $display_qties == 1 && $product->quantity}{$product->quantity}{else}0{/if};
var allowBuyWhenOutOfStock = {if $allow_oosp == 1}true{else}false{/if};
var availableNowValue = '{$product->available_now|escape:'quotes':'UTF-8'}';
var availableLaterValue = '{$product->available_later|escape:'quotes':'UTF-8'}';
var productPriceWithoutReduction = {$product->getPriceWithoutReduct()|default:'null'};
var reduction_percent = {if $product->reduction_percent}{$product->reduction_percent}{else}0{/if};
var reduction_price = {if $product->reduction_percent}0{else}{$product->getPrice(true, NULL, 2, NULL, true)}{/if};
var reduction_from = '{$product->reduction_from}';
var reduction_to = '{$product->reduction_to}';
var default_eco_tax = {$product->ecotax};
var currentDate = '{$smarty.now|date_format:'%Y-%m-%d'}';
var maxQuantityToAllowDisplayOfLastQuantityMessage = {$last_qties};
var noTaxForThisProduct = {if $no_tax == 1}true{else}false{/if};

// Customizable field
var img_ps_dir = '{$img_ps_dir}';
var customizationFields = new Array();
{assign var='imgIndex' value=0}
{assign var='textFieldIndex' value=0}
{foreach from=$customizationFields item='field' name='customizationFields'}
{assign var='key' value='pictures_'|cat:$product->id|cat:'_'|cat:$imgIndex}
	customizationFields[{$smarty.foreach.customizationFields.index|intval}] = new Array();
	customizationFields[{$smarty.foreach.customizationFields.index|intval}][0] = '{if $field.type|intval == 0}img{$imgIndex++}{else}textField{$textFieldIndex++}{/if}';
	customizationFields[{$smarty.foreach.customizationFields.index|intval}][1] = {if $field.type|intval == 0 AND $pictures.$key}2{else}{$field.required|intval}{/if};
{/foreach}

// Translations
var doesntExist = '{l s='The product does not exist in this model. Please choose another.' js=1}';
var doesntExistNoMore = '{l s='This product is no longer in stock' js=1}';
var doesntExistNoMoreBut = '{l s='with those attributes but is available with others' js=1}';
var uploading_in_progress = '{l s='Uploading in progress, please wait...' js=1}';
var fieldRequired = '{l s='Please fill all required fields' js=1}';


{if isset($groups)}
	// Combinations
	{foreach from=$combinations key=idCombination item=combination}
		addCombination({$idCombination|intval}, new Array({$combination.list}), {$combination.quantity}, {$combination.price}, {$combination.ecotax}, {$combination.id_image}, '{$combination.reference|addslashes}');
	{/foreach}
	// Colors
	{if $colors|@count > 0}
		{if $product->id_color_default}var id_color_default = {$product->id_color_default|intval};{/if}
	{/if}
{/if}

//]]>
</script>

{include file=$tpl_dir./breadcrumb.tpl}
          <!-- AddThis Button BEGIN -->
	  	  <span id="addthis">
<!-- AddThis Button BEGIN -->
<a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4af5a5a120e276f9"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4af5a5a120e276f9"></script>
<!-- AddThis Button END -->
         </span>
         <!-- AddThis Button END --> 		

{if $HOOK_EXTRA_LEFT}{$HOOK_EXTRA_LEFT}{/if}

<div id="div_main_product">
<div id="primary_block">
	{if $confirmation}
	<p class="confirmation">
		{$confirmation}
	</p>
	{/if}

<!-- left infos-->
<div id="pb-right-column">
 {if $have_image}
 <div id="image-block">
 <!-- product img-->
	<img src="{$img_prod_dir}{$cover.id_image}-large.jpg" alt="" id="bigpic" title="{$product->name|escape:'htmlall':'UTF-8'}"/>
	{else}
	<img src="{$img_prod_dir}{$lang_iso}-default-large.jpg" alt="" title="{$product->name|escape:'htmlall':'UTF-8'}" />
	{/if}
    
<!-- thumbnails -->
<div id="views_block" {if count($images) < 2}class="hidden"{/if}>
{if count($images) > 3}<a id="view_scroll_left" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">{l s='Previous'}</a>{/if}
 <div id="thumbs_list">
	<ul style="width: {math equation="width * nbImages" width=82 nbImages=$images|@count}px">
	{foreach from=$images item=image name=thumbnails}
  	 <li>
	  <a href="{$img_prod_dir}{$product->id}-{$image.id_image}-thickbox.jpg" rel="other-views" class="thickbox {if $smarty.foreach.thumbnails.first}shown{/if}">
	   <img id="thumb_{$image.id_image}" src="{$img_prod_dir}{$product->id}-{$image.id_image}-medium.jpg" width="50" height="50" alt="{$image.legend|htmlspecialchars}" title="{$image.legend|htmlspecialchars}" />
	  </a>
	 </li>
	 {/foreach}
	</ul>
  </div>
 {if count($images) > 3}<a id="view_scroll_right" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">{l s='Next'}</a>{/if}
</div>
</div>
	<!-- right infos-->
	<div id="pb-left-column">
	<h2>{$product->name|escape:'htmlall':'UTF-8'}</h2>
		{if $product->description_short}
		<div id="short_description_block">
			<p id="short_description_content" class="rte align_justify">{$product->description_short}</p>
			{if $product->description}
			<p id="button_more_detail"><a href="javascript:{ldelim}{rdelim}" class="button">{l s='More details'}</a></p>
			{/if}
		</div>
		{/if}

		{if $colors}
		<!-- colors -->
		<div id="color_picker">
			<p>{l s='Pick a color:' js=1}</p>
			<div class="clear"></div>
			{foreach from=$colors key='id_attribute' item='color'}
				<a id="color_{$id_attribute|intval}" class="color_pick" style="background: {$color.value};" onclick="updateColorSelect({$id_attribute|intval});">{if file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}<img src="{$img_col_dir}{$id_attribute}.jpg" alt="" title="{$color.name}" />{/if}</a>
			{/foreach}
		</div><br />
		{/if}

		<!-- add to cart form-->
		<form id="buy_block" action="{$base_dir}cart.php" method="post">

			<!-- hidden datas -->
			<p class="hidden">
				<input type="hidden" name="token" value="{$token}" />
				<input type="hidden" name="id_product" value="{$product->id|intval}" id="product_page_product_id" />
				<input type="hidden" name="add" value="1" />
				<input type="hidden" name="id_product_attribute" id="idCombination" value="" />
			</p>

			<!-- prices -->
			<p class="price">
				{if $product->on_sale}
					<span class="on_sale">{l s='On sale!'}</span>
				{elseif ($product->reduction_price != 0 || $product->reduction_percent != 0) && ($product->reduction_from == $product->reduction_to OR ($smarty.now|date_format:'%Y-%m-%d' <= $product->reduction_to && $smarty.now|date_format:'%Y-%m-%d' >= $product->reduction_from))}
				{/if}
				<span class="our_price_display"><span id="our_price_display">{convertPrice price=$product->getPrice(true, NULL, 2)}</span> {if $product->getPrice(true, NULL, 2) != $product->getPrice(false, NULL, 2)}{l s='incl. tax'}{/if}</span>
				<br />
				{if $displayPreTax AND $display_ht AND $product->id_tax}
				<br />
				<span id="pretaxe_price">{l s='('}<span id="pretaxe_price_display">{convertPrice price=$product->getPrice(false, NULL, 2)}</span> {l s='tax not incl.)'}</span>
				{/if}
			</p>
			{if ($product->reduction_price != 0 || $product->reduction_percent != 0) && ($product->reduction_from == $product->reduction_to OR ($smarty.now|date_format:'%Y-%m-%d' <= $product->reduction_to && $smarty.now|date_format:'%Y-%m-%d' >= $product->reduction_from))}
				<p id="old_price"><span class="bold"><span id="old_price_display">{convertPrice price=$product->getPriceWithoutReduct()}</span> {l s='incl. tax'}</span></p>
			{/if}
			{if $product->reduction_percent != 0 && ($product->reduction_from == $product->reduction_to OR ($smarty.now|date_format:'%Y-%m-%d' <= $product->reduction_to && $smarty.now|date_format:'%Y-%m-%d' >= $product->reduction_from))}
				<p id="reduction_percent">{l s='(price reduced by'} <span class="reduction_percent_number" style="color:#000000" id="reduction_percent_display">{$product->reduction_percent|floatval}</span> %{l s=')'}</p>
			{/if}
			{if $product->ecotax != 0}
				<p class="price-ecotax">{l s='include'} <span id="ecotax_price_display">{convertPrice price=$product->ecotax}</span> {l s='for green tax'}</p>
			{/if}

			{if $product->reference}<p id="product_reference"><label for="product_reference">{l s='Reference :'} </label><span class="editable">{$product->reference|escape}</span></p>{/if}
			{if isset($groups)}
			<!-- attributes -->
			<div id="attributes">
			{foreach from=$groups key=id_attribute_group item=group}
			<p>
				<label for="group_{$id_attribute_group|intval}">{$group.name|escape:'htmlall':'UTF-8'} :</label>
				{assign var='groupName' value='group_'|cat:$id_attribute_group}
				<select name="{$groupName}" id="group_{$id_attribute_group|intval}" onchange="javascript:findCombination();">
					{foreach from=$group.attributes key=id_attribute item=group_attribute}
						<option value="{$id_attribute|intval}"{if (isset($smarty.get.$groupName) && $smarty.get.$groupName|intval == $id_attribute) || $group.default == $id_attribute} selected="selected"{/if}>{$group_attribute|escape:'htmlall':'UTF-8'}</option>
					{/foreach}
				</select>
			</p>
			{/foreach}
			</div>
			{/if}

			<!-- quantity wanted -->
			<p id="quantity_wanted_p"{if (!$allow_oosp && $product->quantity == 0) || $virtual} style="display:none;"{/if}>
				<label>{l s='Quantity :'}</label>
				<input type="text" name="qty" id="quantity_wanted" class="text" value="{if isset($quantityBackup)}{$quantityBackup|intval}{else}1{/if}" size="2" maxlength="3" />
			</p>

			<!-- availability -->
			<p id="availability_statut"{if ($allow_oosp && $product->quantity == 0 && !$product->available_later) || (!$product->available_now && $display_qties != 1) } style="display:none;"{/if}>
				<span id="availability_label">{l s='Availability:'} </span>

			</p>

			<!-- number of item in stock -->
			<p style="float:left" id="pQuantityAvailable"{if $display_qties != 1 || ($allow_oosp && $product->quantity == 0)} style="display:none;"{/if}>
				<span id="availability_number">{$product->quantity|intval}</span>
				<span{if $product->quantity > 1} style="display:none;color:#000"{/if} id="quantityAvailableTxt">{l s='item in stock'}</span>
				<span{if $product->quantity < 2} style="display:none;color:#000"{/if} id="quantityAvailableTxtMultiple">{l s='items in stock'}</span>
			</p>
			
			<!-- Out of stock hook -->
			<p id="oosHook"{if $product->quantity > 0} style="display:none;"{/if}>
				{$HOOK_PRODUCT_OOS}
			</p>
			<p class="warning-inline" id="last_quantities"{if ($product->quantity > $last_qties || $product->quantity == 0) || $allow_oosp} style="display:none;"{/if} >{l s='Warning: Last items in stock!'}</p><br /><br />

			<span{if !$allow_oosp && $product->quantity == 0} style="display:none;"{/if} id="add_to_cart" class="buttons_bottom_block">
			<input type="submit" name="Submit" value="{l s='Add to cart'}" /></sp>
			{if $HOOK_PRODUCT_ACTIONS}
				{$HOOK_PRODUCT_ACTIONS}
			{/if}
		</form>
	</div>
	{if $HOOK_EXTRA_RIGHT}{$HOOK_EXTRA_RIGHT}{/if}
	<!-- accessories -->
	<div class="accessories_block">
	{if isset($accessories) AND $accessories}
	   <ul>
        <h6>{l s='you may alose like...'}</h6>
		 {foreach from=$accessories item=accessory name=accessories_list}
		 {assign var='accessoryLink' value=$link->getProductLink($accessory.id_product, $accessory.link_rewrite, $accessory.category)}
	     <li class="ajax_block_product {if $smarty.foreach.accessories_list.first}first_item{elseif $smarty.foreach.accessories_list.last}last_item{else}item{/if} product_accessories_description">
         <div class="boxgrid slidedown">
  	      <img class="cover" src="{$img_prod_dir}{$accessory.id_image}-home.jpg" width="100" height="100" alt="{$accessory.legend|escape:'htmlall':'UTF-8'}"
		  <h5>
		   <a href="{$accessoryLink|escape:'htmlall':'UTF-8'}" title="{$accessory.legend|escape:'htmlall':'UTF-8'}">{$accessory.name|truncate:20|escape:'htmlall':'UTF-8'}</a>
		  </h5>				
		  <p>{displayWtPrice p=$accessory.price}</p>
          <p class="nav">
           <a href="{$accessoryLink|escape:'htmlall':'UTF-8'}" title="{$accessory.legend|escape:'htmlall':'UTF-8'}">{l s=' i '}</a>
          </p>			 
         </div>
        </li>
       {/foreach}
     </ul>
    {/if}
   </div>
{if $quantity_discounts}
<!-- quantity discount -->
<ul class="idTabs">
	<li><a style="cursor: pointer">{l s='Quantity discount'}</a></li>
</ul>
<div id="quantityDiscount">
	<table class="std">
			<tr>
				{foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
				<th>{$quantity_discount.quantity|intval} 
				{if $quantity_discount.quantity|intval > 1}
					{l s='quantities'}
				{else}
					{l s='quantity'}
				{/if}
				</th>
				{/foreach}
			</tr>
			<tr>
				{foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
				<td>
				{if $quantity_discount.id_discount_type|intval == 1}
					-{$quantity_discount.value|floatval}%
				{else}
					-{convertPrice price=$quantity_discount.value|floatval}
				{/if}
				</td>
				{/foreach}
			</tr>
	</table>
</div>
{/if}
{$HOOK_PRODUCT_FOOTER}
<!-- description and features -->
{if $product->description || $features || $HOOK_PRODUCT_TAB}
<div id="more_info_sheets" class="sheets align_justify">
	<ul id="more_info_tabs" class="idTabs idTabsShort">
		{if $product->description}<li><a id="more_info_tab_more_info" href="#idTab1">{l s='Description'}</a></li>{/if}
		{if $features}<li><a id="more_info_tab_data_sheet" href="#idTab2">{l s='Data sheet'}</a></li>{/if}
		{$HOOK_PRODUCT_TAB}
	</ul>
	{if $product->description}
		<!-- full description -->
		<div id="idTab1">{$product->description}</div>
	{/if}
	{if $features}
		<!-- product's features -->
		<ul id="idTab2" class="bullet">
		{foreach from=$features item=feature}
			<li><span>{$feature.name|escape:'htmlall':'UTF-8'}</span>{l s=':'} {$feature.value|escape:'htmlall':'UTF-8'}</li>
		{/foreach}
		</ul>
	{/if}
	{$HOOK_PRODUCT_TAB_CONTENT}
	</div>
</div>
{/if}

<!-- Customizable products -->
{if $product->customizable}
	<ul class="idTabs">
		<li><a style="cursor: pointer">{l s='Product customization'}</a></li>
	</ul>
	<div class="customization_block">
		<form method="post" action="{$customizationFormTarget}" enctype="multipart/form-data" id="customizationForm">
			<p>
				<img src="{$img_dir}icon/infos.gif" alt="Informations" />
				{l s='After saving your customized product, do not forget to add it to your cart.'}
				{if $product->uploadable_files}<br />{l s='Allowed file formats are: GIF, JPG, PNG'}{/if}
			</p>
			{if $product->uploadable_files|intval}
			<h2>{l s='Pictures'}</h2>
			<ul id="uploadable_files">
				{counter start=0 assign='customizationField'}
				{foreach from=$customizationFields item='field' name='customizationFields'}
					{if $field.type == 0}
						<li class="customizationUploadLine{if $field.required} required{/if}">{assign var='key' value='pictures_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
							{if isset($pictures.$key)}<div class="customizationUploadBrowse"><img src="{$pic_dir}{$pictures.$key}_small" alt="" /><a href="{$link->getUrlWith('deletePicture', $field.id_customization_field)}"><img src="{$img_dir}icon/delete.gif" alt="{l s='delete'}" class="customization_delete_icon" /></a></div>{/if}
							<div class="customizationUploadBrowse"><input type="file" name="file{$field.id_customization_field}" id="img{$customizationField}" value="" class="customization_block_input" />{if $field.required}<sup>*</sup>{/if}
							<div class="customizationUploadBrowseDescription">{if !empty($field.name)}{$field.name}{else}{l s='Please select an image file from your hard drive'}{/if}</div></div>
						</li>
						{counter}
					{/if}
				{/foreach}
			</ul>
			{/if}
			{if $product->text_fields|intval}
			<h2>{l s='Texts'}</h2>
			<ul id="text_fields">
				{counter start=0 assign='customizationField'}
				{foreach from=$customizationFields item='field' name='customizationFields'}
					{if $field.type == 1}
						<li class="customizationUploadLine{if $field.required} required{/if}">{assign var='key' value='textFields_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
							{if !empty($field.name)}{$field.name}{/if}<input type="text" name="textField{$field.id_customization_field}" id="textField{$customizationField}" value="{if isset($textFields.$key)}{$textFields.$key|stripslashes}{/if}" class="customization_block_input" />{if $field.required}<sup>*</sup>{/if}
						</li>
						{counter}
					{/if}
				{/foreach}
			</ul>
			{/if}
			<p style="clear: left;" id="customizedDatas">
				<input type="hidden" name="quantityBackup" id="quantityBackup" value="" />
				<input type="hidden" name="submitCustomizedDatas" value="1" />
				<input type="button" class="button" value="{l s='Save'}" onclick="javascript:saveCustomization()" />
			</p>
		</form>
		<p class="clear required"><sup>*</sup> {l s='required fields'}</p>
	</div>
{/if}
{/if}
</div>
</div>
