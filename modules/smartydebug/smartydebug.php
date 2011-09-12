<?php
/*
	Module Name: SmartyDebug
	Module URI: http://www.ecartservice.net/free-prestashop-modules/
	Description: Support smarty debugging to firebug or  javascript popup
	Version: 0.1.0
	Author: Paul Campbell
	Author URI: http://www.ecartservice.net/

	Copyright 2009, paul r campbell (pcampbell@ecartservice.net)

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.

	This copyright notice  and licence should be retained in all modules based on this framework.
	This does not affect your rights to assert copyright over your own original work.
*/

class SmartyDebug extends Module
{
	private $_html = '';
	private $_postErrors = array();

	function __construct()
	{
		$this->name = 'smartydebug';
		parent::__construct();

		$this->tab = 'developer_tools';
		$this->version = '1.4.0.17';
    $this->author = 'eCartService.net';
		$this->displayName = $this->l('Smarty Template Debug (with FireBug&trade; Support)');
		$this->description = $this->l('Debug module or theme templates by enabling the Smarty debug console.');
	}

	public function install()
	{
		parent::install();

		if (!$this->registerHook('header'))
			return false;

		// Set some defaults
		Configuration::updateValue($this->name.'_checkbox', 'false');
		Configuration::updateValue($this->name.'_fbcheckbox', 'true');

		return true;
	}

	public function uninstall()
	{
		if (!Configuration::deleteByName($this->name.'_checkbox') OR !Configuration::deleteByName($this->name.'_fbcheckbox')
			OR !parent::uninstall())
			return FALSE;
		else
			return TRUE;
	}

	private function _postValidation()
	{

	}

	private function _postProcess()
	{
		Configuration::updateValue($this->name.'_checkbox', (Tools::getValue('smartydebug') ? 'true' : 'false'));
		Configuration::updateValue($this->name.'_fbcheckbox', (Tools::getValue('usefirebug') ? 'true' : 'false'));

		$this->_html .= '<div class="conf confirm">'.$this->l('Settings updated').'</div>';
	}

	public function getContent()
	{
		$this->_html .= '<h2>'.$this->displayName.'</h2>';

		if (Tools::isSubmit('submit'))
		{
			$this->_postValidation();

			if (!sizeof($this->_postErrors))
				$this->_postProcess();
			else
			{
				foreach ($this->_postErrors AS $err)
				{
					$this->_html .= '<div class="alert error">'.$err.'</div>';
				}
			}
		}

		$this->_displayForm();

		return $this->_html;
	}

	private function _displayForm()
	{
		$this->_html .= '
		<form action="'.$_SERVER['REQUEST_URI'].'" method="post">
			<fieldset>
				<legend><img src="../img/admin/cog.gif" alt="" class="middle" />'.$this->l('Settings').'</legend>
				<label>'.$this->l('Debug').'</label>
				<div class="margin-form">
					<input type="checkbox" name="smartydebug" value="'.(Tools::getValue('smartydebug', Configuration::get($this->name.'_checkbox')) ? "true" : "false").'"' .
					(Tools::getValue('smartydebug', Configuration::get($this->name.'_checkbox')) == "true" ? ' checked="checked"' : '') . ' />
					<p class="clear">'.$this->l('Select to enable smarty debugging in Prestashop and <b>remember to turn it off when you\'re finished</b>!').'</p>
				</div>
				<label>'.$this->l('Use FireBug').'</label>
				<div class="margin-form">
					<input type="checkbox" name="usefirebug" value="'.(Tools::getValue('usefirebug', Configuration::get($this->name.'_fbcheckbox')) ? "true" : "false").'"' .
					(Tools::getValue('usefirebug', Configuration::get($this->name.'_fbcheckbox')) == "true" ? ' checked="checked"' : '') . ' />
					<p class="clear">'.$this->l('Send output to FireBug (disable this option to use the javascript console).').'</p>
				</div>
			<input type="submit" name="submit" value="'.$this->l('Update').'" class="button" />
			</fieldset>
		</form>';
		$this->_html .= '
		<style type="text/css">.lnk{color:#0000ff;text-decoration:underline;}</style>
		<fieldset class="space">
			<legend><img src="../img/admin/unknown.gif" alt="" class="middle" />'.$this->l('Usage Information').'</legend>
			 <h3>'.$this->l('The Ultimate Prestashop Module and Theme Development Tool').'</h3>
			 <p><b>'.$this->l('You must install ').'<a class="lnk" href="https://addons.mozilla.org/en-US/firefox/addon/1843">FireBug</a> '.$this->l('in your ').'<a class="lnk"  href="http://www.mozilla.com/firefox/">Firefox Browser</a>'. $this->l(' to use this with the \'Use FireBug\' option enabled (default).').'</b></p>
			 <p>'.$this->l('You can however disable FireBug support and use the traditional javascript popup instead. Just enable debug above and visit your page. Note that you may need to refresh your page for it to render correctly in this mode, and remember that <b>every visitor to your site will see the popup!!</b>').'</p>
			 <h3>'.$this->l('Recommended steps to use this tool').'</h3>
			 <ol>
				<li>1. '.$this->l('If you haven\'t already, then install the FireBug Add-on to Firefox.').'</li>
				<li>2. '.$this->l('Enable the Console in FireBug by clicking on the down arrow beside "Console" and selecting \'Enable\'.').'</li>
				<li>3. '.$this->l('In the settings above enable the smarty debugging in Prestashop by ticking the \'Debug\' option and clicking update.').'</li>
				<li>4. '.$this->l('*At the FireBug console prompt (>>>) enter: <i>Smarty_debug();</i> <b>or</b> <i>Smarty_debug(true);</i> (both case-sensitive) after each page load to display debug data.').'</li>
				<li>5. '.$this->l('Enjoy viewing all you ever needed to know about your module or theme\'s template internals ;)').'</li>
				<li>6. '.$this->l('<b>Disable the \'Debug\' option in this module as soon as you are finished your debug session.</b>').'</li>
			</ol><br />
			<p>'.$this->l('*Note: Using <i>Smarty_debug(true);</i> enables grouping so that some of the elements can be collapsed to improve readability.').'</p>
			<p>'.$this->l('Inspiration and major credit goes to ').'<a class="lnk" href="http://www.garrickcheung.com/">Garrick Cheung</a> | <a class="lnk" href="http://www.phphulp.nl/php/print/5/1540/0/scripts/">Hipska</a>.</p>
			<br />
			<h3><i>Like this module? Want more? Then why not consider donating to the <a class="lnk" href="http://www.ecartservice.net/" title="Paul R Campbell">author</a>, posting a relevant link to our <a class="lnk" href="http://www.ecartservice.net/" title="ecartservice.net">site</a> or
			<a class="lnk" href="http://digg.com/submit?phase=2&url=http%3A%2F%2Fwww.ecartservice.net%2Ffree-prestashop-modules%2F&title=Free%20Prestashop%20Modules&bodytext=Free%20PrestaShop%20Modules%0D%0A%20%20%20%20%20%20%20%20%20%20%20%0D%0AHere%20at%20eCartService%20we%27re%20dedicated%20to%20getting%20you%C2%A0%20the%20most%20from%20your%20PrestaShop%20installation%2C%20and%20provide%20these%20useful%20tools%20to%20help%20deliver%20higher%20conversions%20for%20your%20store.">digg</a> our free modules page?</i></h3>
			<p>All three would be even better :)</p>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
					<input type="hidden" name="cmd" value="_donations">
					<input type="hidden" name="business" value="donations@ecartservice.net">
					<input type="hidden" name="item_name" value="Open Source Development and Support">
					<input type="hidden" name="no_shipping" value="0">
					<input type="hidden" name="no_note" value="1">
					<input type="hidden" name="currency_code" value="GBP">
					<input type="hidden" name="tax" value="0">
					<input type="hidden" name="lc" value="GB">
					<input type="hidden" name="bn" value="PP-DonationsBF">
					<input type="image" src="https://www.paypal.com/en_GB/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online.">
					<img alt="" border="0" src="https://www.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1">
				</form>
		</fieldset>';
	}

	public function hookHeader()
	{
		global $smarty;

		$smartyState = (Configuration::get($this->name.'_checkbox')=="true" ? true : false);

    if (!Configuration::get('PS_FORCE_SMARTY_2'))
    {
      $debug_template = (Configuration::get($this->name.'_fbcheckbox')=="true" ? 'fb.Debug.tpl' : 'js.Debug.tpl');
      $smarty->setDebugging($smartyState);
      $smarty->setDebugTemplate(_PS_MODULE_DIR_.$this->name.'/'.$debug_template);
      $smarty->debugging_ctrl = ($_SERVER['SERVER_NAME'] == 'localhost') ? 'URL' : 'NONE';
    }
    else
    {
      $debug_template = (Configuration::get($this->name.'_fbcheckbox')=="true" ? 'sm2.fb.Debug.tpl' : 'sm2.js.Debug.tpl');
      $smarty->debugging = $smartyState;
      $smarty->debug_tpl = _PS_MODULE_DIR_.$this->name.'/'.$debug_template;
      $smarty->debugging_ctrl = ($_SERVER['SERVER_NAME'] == 'localhost') ? 'URL' : 'NONE';
    }
  }

}
// End of: smartydebug.php
