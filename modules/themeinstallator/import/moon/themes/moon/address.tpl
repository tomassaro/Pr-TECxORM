<script type="text/javascript">
// <![CDATA[
idSelectedCountry = {if isset($smarty.post.id_state)}{$smarty.post.id_state|intval}{else}false{/if};
countries = new Array();
{foreach from=$countries item='country'}
	{if isset($country.states)}
		countries[{$country.id_country|intval}] = new Array();
		{foreach from=$country.states item='state' name='states'}
			countries[{$country.id_country|intval}]['{$state.id_state|intval}'] = '{$state.name}';
		{/foreach}
	{/if}
{/foreach}
//]]>
</script>

{capture name=path}{l s='Your addresses'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}
<div id="myaccountnav">
		<ul>
	        <li class="bnthyshome"><a href="{$base_dir_ssl}my-account.php">{l s='Home'}</a></li>
			<li><a href="{$base_dir_ssl}history.php" title="">{l s='orders'}</a></li>
			<li><a href="{$base_dir_ssl}order-slip.php" title="">{l s='credit slips'}</a></li>
			{if $voucherAllowed}
			<li><a href="{$base_dir_ssl}discount.php" title="">{l s='vouchers'}</a></li>
			{/if}
			{if $returnAllowed}
		    <li><a href="{$base_dir_ssl}order-follow.php" class="selected">{l s='Merchandise returns'}</a></li>
   	        {/if}
			<li><a href="{$base_dir_ssl}addresses.php"  class="selected" title="">{l s='addresses'}</a></li>
			<li><a href="{$base_dir_ssl}identity.php" title="">{l s='personal info'}</a></li>
		</ul>
</div>
<div id="address_myaccountnav">
<h2>
  {l s='Your addresses'}
  <a href="{$base_dir}index.php?mylogout" id="logout" title="{l s='log out'}">{l s='Sign out'}</a>
</h2>
<h3><span>{if isset($id_address)}{l s='Modify the address'}</span> {if isset($smarty.post.alias)}"{$smarty.post.alias}"{elseif $address->alias}"{$address->alias|escape:'htmlall':'UTF-8'}"{/if}{else}{l s='To add a new address, please fill out the form below.'}{/if}</h3>
{include file=$tpl_dir./errors.tpl}

<form action="{$request_uri|escape:'htmlall':'UTF-8'}" method="post" class="std">
	<fieldset id="required">
			<p id="required">
			<label for="alias">{l s='Title'}</label>
			<input type="text" id="alias" name="alias" value="{if isset($smarty.post.alias)}{$smarty.post.alias}{elseif $address->alias}{$address->alias|escape:'htmlall':'UTF-8'}{else}{l s='My address'}{/if}" />
			<sup>*</sup>
		</p>
			<p id="required">
			<label for="firstname">{l s='First name'}</label>
			<input type="text" name="firstname" id="firstname" value="{if isset($smarty.post.firstname)}{$smarty.post.firstname}{else}{$address->firstname|escape:'htmlall':'UTF-8'}{/if}" />
			<sup>*</sup>
		</p>
			<p id="required">
			<label for="lastname">{l s='Last name'}</label>
			<input type="text" id="lastname" name="lastname" value="{if isset($smarty.post.lastname)}{$smarty.post.lastname}{else}{$address->lastname|escape:'htmlall':'UTF-8'}{/if}" />
			<sup>*</sup>
		</p>
			<p id="required">
			<label for="address1">{l s='Address'}</label>
			<input type="text" id="address1" name="address1" value="{if isset($smarty.post.address1)}{$smarty.post.address1}{else}{$address->address1|escape:'htmlall':'UTF-8'}{/if}" />
			<sup>*</sup>
		</p>
			<p id="required">
			<label for="address2">{l s='Address (2)'}</label>
			<input type="text" id="address2" name="address2" value="{if isset($smarty.post.address2)}{$smarty.post.address2}{else}{$address->address2|escape:'htmlall':'UTF-8'}{/if}" />
		</p>
			<p id="required">
			<label for="postcode">{l s='Postal code / Zip code'}</label>
			<input type="text" id="postcode" name="postcode" value="{if isset($smarty.post.postcode)}{$smarty.post.postcode}{else}{$address->postcode|escape:'htmlall':'UTF-8'}{/if}" />
			<sup>*</sup>
		</p>
			<p id="required">
			<label for="city">{l s='City'}</label>
			<input type="text" name="city" id="city" value="{if isset($smarty.post.city)}{$smarty.post.city}{else}{$address->city|escape:'htmlall':'UTF-8'}{/if}" maxlength="64" />
			<sup>*</sup>
		</p>
			<p id="required">
			<label for="id_country">{l s='Country'}</label>
			<select id="id_country" name="id_country">{$countries_list}</select>
			<sup>*</sup>
		</p>
		<p class="required id_state select">
			<label for="id_state">{l s='State'}</label>
			<select name="id_state" id="id_state">
				<option value="">-</option>
			</select>
			<sup>*</sup>
		</p>
			<p id="required">
			<label for="other">{l s='Additional information'}</label>
			<textarea id="other" name="other" cols="26" rows="3">{if isset($smarty.post.other)}{$smarty.post.other}{else}{$address->other|escape:'htmlall':'UTF-8'}{/if}</textarea>
		</p>
			<p id="required">
			<label for="phone">{l s='Home phone'}</label>
			<input type="text" id="phone" name="phone" value="{if isset($smarty.post.phone)}{$smarty.post.phone}{else}{$address->phone|escape:'htmlall':'UTF-8'}{/if}" />
		</p>
			<p id="required">
			<label for="phone_mobile">{l s='Mobile phone'}</label>
			<input type="text" id="phone_mobile" name="phone_mobile" value="{if isset($smarty.post.phone_mobile)}{$smarty.post.phone_mobile}{else}{$address->phone_mobile|escape:'htmlall':'UTF-8'}{/if}" />
		</p>
			<p id="required">
			<input type="hidden" name="token" value="{$token}" />
			<label for="company">{l s='Company'}</label>
			<input type="text" id="company" name="company" value="{if isset($smarty.post.company)}{$smarty.post.company}{else}{$address->company|escape:'htmlall':'UTF-8'}{/if}" />
		</p>
	<p class="submit">
		{if isset($id_address)}<input type="hidden" name="a" value="{$id_address|intval}" />{/if}
		{if isset($back)}<input type="hidden" name="back" value="{$back}?step=1" />{/if}
		<input type="submit" name="submitAddress" id="submitAddress" value="{l s='Save'}" class="buttonvalidate" />
	</p>
	<p class="p_required"><sup>*</sup>{l s='Required field'}</p>
	</fieldset>
</form>
</div>