<!-- Block Newsletter module-->
<!-- /Block Newsletter module-->
	 <!-- Block Newsletter  -->
	 <ul id="footernewsletter">
       <h4>{l s='Newsletter'}</h4>
       <p>{l s='Get news and exclusive offers on our mailing list' mod='blocknewsletter'}</p>
	   <form action="{$base_dir}" method="post">
	     {if $msg}
	     <p style="color:black" class="{if $nw_error}warning_inline{else}success_inline{/if}">{$msg}</p>
	     {/if}
         <table id="footernewsletter" border="0" cellpadding="0" cellspacing="0">
          <tr>
	       <td valign="center">
            <input type="text" class="input_buttonnewsletter" name="email" size="21" value="{if $value}{$value}{else}{l s='your e-mail' mod='blocknewsletter'}{/if}" onfocus="javascript:if(this.value=='{l s='your e-mail' mod='blocknewsletter'}')this.value='';" onblur="javascript:if(this.value=='')this.value='{l s='your e-mail' mod='blocknewsletter'}';" />
           </td>
	       <td valign="center"><input type="submit" value="&nbsp;" class="buttonnewsletter" name="submitNewsletter" /></td>
          </tr>
         </table>	
				<select name="action">
					<option value="0"{if $action == 0} selected="selected"{/if}>{l s='Subscribe' mod='blocknewsletter'}</option>
					<option value="1"{if $action == 1} selected="selected"{/if}>{l s='Unsubscribe' mod='blocknewsletter'}</option>
				</select>
	    </form>
       </ul>
	 <!-- /Block Newsletter  -->
