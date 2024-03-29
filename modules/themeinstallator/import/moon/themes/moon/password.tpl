{capture name=path}{l s='Forgot your password'}{/capture}
{include file=$tpl_dir./breadcrumb.tpl}

<h2>{l s='Forgot your password'}</h2>
<div class="order_globale_step">
{include file=$tpl_dir./errors.tpl}
{if isset($confirmation)}
<p class="success">{l s='Your password has been successfully reset and has been sent to your e-mail address:'} {$email|escape:'htmlall':'UTF-8'}</p>
{else}
<p>{l s='Please enter your e-mail address used to register. We will e-mail you your new password.'}</p>
<form action="{$request_uri|escape:'htmlall':'UTF-8'}" method="post" class="std">
	<fieldset id="password">
		<p class="text">
			<label for="email">{l s='Type your e-mail address:'}</label>
			<input type="text" class="enter_password" id="email" name="email" value="{if isset($smarty.post.email)}{$smarty.post.email|escape:'htmlall'|stripslashes}{/if}" />
		</p>
		<p class="submit">
			<input type="submit" class="submit_password" value="{l s='Retrieve'}" />
		</p>
	</fieldset>
</form>
{/if}
<p class="clear">
	<a href="{$base_dir_ssl}authentication.php" title="{l s='Back to Login'}" class="buttonprecedent">{l s='Back to Login'}</a>
</p>
</div>