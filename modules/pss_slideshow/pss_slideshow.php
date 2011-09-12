<?php
/**
 * Customizable slide show to be displayed in home page.
 * Uses jquery plugin cross slide v0.3.7
 *
 * See LICENCE.txt for terms of use
 * History :
 * 	@version 1.0 : slide show on home page with only a single defined fade effect
 */

// Set to '1' to display debug help
if (!defined('_PSS_SLIDESHOW_DEBUG_')) define('_PSS_SLIDESHOW_DEBUG_', '0');

class pss_slideshow extends Module
{
	private $maxImageSize = 2000000;
	
	// absolute URL to this module
	private $absoluteUrl;
	// absolute path (in OS sense) to this module
	private $absolutePath;
	// the admin URL to get configuration screen for current module
	private $confUrl;
	// config default set
	private $_config = array(
		'PRESTASCOPE_SLIDE_SHOW_VERSION' 	=> '1.0',
		'PRESTASCOPE_SLIDE_SHOW_ACTIVATED' 	=> 1,
		'PRESTASCOPE_SLIDE_SHOW_WIDTH' 		=> 550,
		'PRESTASCOPE_SLIDE_SHOW_HEIGHT' 	=> 336,
		'PRESTASCOPE_SLIDE_SHOW_FADE' 		=> 2,
		'PRESTASCOPE_SLIDE_SHOW_SLEEP' 		=> 5,
		'PRESTASCOPE_SLIDE_SHOW_JQUERY' 	=> 1,
	);

	function __construct()
	{
		global $protocol;
		
		$this->name = 'pss_slideshow';
		$this->tab = 'front_office_features';
		$this->author = 'Prestascope';
		$this->version = 1.0;

		parent::__construct();
		
		$this->displayName = $this->l('Home page slideshow');
		$this->description = $this->l('Display a highly customizable slideshow in homepage');
		
		// full url & path to current module
		// Use Tools::getHttpHost(false, true).__PS_BASE_URI__
		$this->absoluteUrl = $this->is_https()?'https':'http'.'://'.$_SERVER['HTTP_HOST']. _MODULE_DIR_ . $this->name . '/';
		$this->absolutePath = _PS_ROOT_DIR_.DIRECTORY_SEPARATOR.'modules'.DIRECTORY_SEPARATOR.$this->name.DIRECTORY_SEPARATOR;
		
		// the admin URL to get configuration for current module
		$tab = Tools::getValue('tab');
		$token = Tools::getValue('token');
		$mainParts = explode('?', $_SERVER['REQUEST_URI']);
		$this->confUrl = $mainParts[0].'?tab=AdminModules&amp;configure='.$this->name.'&amp;token='.$token;
		
		if (_PSS_SLIDESHOW_DEBUG_)
		{
			echo '$this->absoluteUrl : '.$this->absoluteUrl.'<br />';
			echo '$this->absolutePath : '.$this->absolutePath.'<br />';
			echo '$this->_path : '.$this->_path.'<br />';
			echo '$this->confUrl : '.$this->confUrl.'<br />';
		}
	}
	private function is_https()
	{
		return strtolower(substr($_SERVER["SERVER_PROTOCOL"],0,5))=='https'? true : false;
	}
	function install()
	{
		if (!parent::install() || 
			!$this->registerHook('home') ||
			!$this->registerHook('header') ||
			!$this->_installConfig() ||
			!$this->_installDb())
			return false;
		
		return true;
	}
	public function uninstall() {
		if(!parent::uninstall() || 
			!$this->_uninstallConfig() || 
			!$this->_uninstallDb())
			return false;
		return true;
	}
	private function _installConfig() {
		foreach ($this->_config as $key => $value) {
			Configuration::updateValue($key, $value);
		}
		return true;
	}
	private function _uninstallConfig() {
		foreach ($this->_config as $key => $value) {
			Configuration::deleteByName($key);
		}
		return true;
	}
	private function _installDb() {
		//create slideshow table
		Db::getInstance()->Execute(
			'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'prestascope_slideshow` (
			`id_slide` int(10) unsigned NOT NULL auto_increment,
			`image_name` varchar(128) NOT NULL,
			`href` varchar(255) NOT NULL,
			`order` tinyint(1) NOT NULL default \'0\',
			PRIMARY KEY  (`id_slide`)
			) ENGINE=InnoDB  DEFAULT CHARSET=utf8;'
		);
		// insert two slides as example
		Db::getInstance()->Execute(
			"INSERT INTO `" . _DB_PREFIX_ . "prestascope_slideshow` (`id_slide`, `image_name`, `href`, `order`) VALUES(1, 'example1.jpg', 'http://www.photo-libre.fr/mer_photo.htm', 0);"
		);
		Db::getInstance()->Execute(
			"INSERT INTO `" . _DB_PREFIX_ . "prestascope_slideshow` (`id_slide`, `image_name`, `href`, `order`) VALUES(2, 'example2.jpg', 'http://www.photo-libre.fr/rural_photo.htm', 1);"
		);
		return true;
	}
	private function _uninstallDb() {
		// drop slideshow table
		Db::getInstance()->Execute(
			"DROP TABLE `" . _DB_PREFIX_ . "prestascope_slideshow`"
		);
		return true;
	}
	/* *****************************************************************************************
	 *
	 *						FUNCTION TO DISPLAY BO FORMS AND MANAGE ACTIONS
	 *
	 * ***************************************************************************************** */
	/**
	 * Deal with BO configuration form user actions
	 */
	public function getContent()
	{
		// default display
		// Could be also 'unitForm' to display form to edit / add a slide
		$display = 'mainForm';
		
		// empty errors buffer
		$this->_errors = array();

		// the beginning of the HTML to display
		$this->_html = '<h2>'.$this->displayName.'</h2>';

		// get the slide id if any available
		$idSlide = Tools::getValue('id_slide');

		// >>>>>>>>>>> PRIORITY TO ACTION <<<<<<<<<<<<<
		$action = Tools::getValue('action');
		if ($action)
		{
			if (_PSS_SLIDESHOW_DEBUG_) echo 'DEBUG : Action='.$action.' & idSlide='.$idSlide.'<br />';
			// >>> Action DELETE
			if ($action=='delete')
			{
				// this function logs its own errors in the class _errors array
				if ($this->deleteSlide($idSlide))
					$this->_html .= '<div class="conf ok">'.$this->l('Deleted successfully').'</div>';
			}
			// >>> Action UP or DOWN
			else if ($action=='down' || $action=='up')
			{
				// this function logs its own errors in the class _errors array
				if ($this->moveSlide($idSlide, $action))
					$this->_html .= '<div class="conf ok">'.$this->l('Moved successfully').'</div>';
			}
			// >>> Action ADD
			else if ($action=='add')
			{
				// check user inputs
				if (!isset($_FILES['image_slide']))
					$this->_errors[] = $this->l('Please, provide an image file');
				else if (intVal($_FILES['image_slide']['error']) != 0)
				{
					if (intVal($_FILES['image_slide']['error']) == UPLOAD_ERR_NO_FILE)
						$this->_errors[] = $this->l('Please, provide an image file');
					else
						$this->_errors[] = $this->l('An error has occured while uploading the file').' (code='.$_FILES['image_slide']['error'].')';
				}
				else if ($_FILES['image_slide']['tmp_name'] == NULL)
					$this->_errors[] = $this->l('Please, provide an image file');

				// if no error, then proceed
				if (count($this->_errors)==0)
				{
					if ($this->addSlide())
						$this->_html .= '<div class="conf ok">'.$this->l('Slide added successfully').'</div>';
				}
				
				// in case of error, display the same form
				if (count($this->_errors)>0)
					$display = 'unitForm';
			}
			// >>> Action EDIT
			else if ($action=='edit')
			{
				if ($_FILES['image_slide'] && intVal($_FILES['image_slide']['error']) != UPLOAD_ERR_OK && intVal($_FILES['image_slide']['error']) != UPLOAD_ERR_NO_FILE)
					$this->_errors[] = $this->l('An error has occured while uploading the file').' (code='.$_FILES['image_slide']['error'].')';
				else if ($this->updateSlide($idSlide))
					$this->_html .= '<div class="conf ok">'.$this->l('Slide updated successfully').'</div>';

				// in case of error, display the same form
				if (count($this->_errors)>0)
					$display = 'unitForm';
			}
			// >>> Action UPDATE CONF
			else if ($action=='updateConf')
			{
				// check user inputs
				if (!isset($_POST['image_width']) || !Validate::isUnsignedInt($_POST['image_width']))
					$this->_errors[] = $this->l('Images width field should be an unsigned integer');
				if (!isset($_POST['image_height']) || !Validate::isUnsignedInt($_POST['image_height']))
					$this->_errors[] = $this->l('Images height field should be an unsigned integer');
				if (!isset($_POST['fade']) || !Validate::isUnsignedFloat($_POST['fade']))
					$this->_errors[] = $this->l('Transition time field should be an unsigned float');
				if (!isset($_POST['sleep']) || !Validate::isUnsignedFloat($_POST['sleep']))
					$this->_errors[] = $this->l('Sleep time field should be an unsigned float');
					
				// if no error, then update
				if (count($this->_errors)==0)
				{
					Configuration::updateValue('PRESTASCOPE_SLIDE_SHOW_ACTIVATED', pSQL($_POST['activated'])==1?1:0);
					Configuration::updateValue('PRESTASCOPE_SLIDE_SHOW_WIDTH', pSQL($_POST['image_width']));
					Configuration::updateValue('PRESTASCOPE_SLIDE_SHOW_HEIGHT', pSQL($_POST['image_height']));
					Configuration::updateValue('PRESTASCOPE_SLIDE_SHOW_FADE', pSQL($_POST['fade']));
					Configuration::updateValue('PRESTASCOPE_SLIDE_SHOW_SLEEP', pSQL($_POST['sleep']));
					Configuration::updateValue('PRESTASCOPE_SLIDE_SHOW_JQUERY', pSQL($_POST['jquery'])==1?1:0);
					$this->_html .= '<div class="conf ok">'.$this->l('Updated successfully').'</div>';
				}	
			}
		}
		// >>>>>>>>>>> if no action, may be a display to show <<<<<<<<<<<<<
		else
		{
			$display = Tools::getValue('display');
			if (_PSS_SLIDESHOW_DEBUG_) echo 'DEBUG : Display='.$display.'<br />';
		}	
		
		// display errors if any
		if (count($this->_errors)>0)
		{
			foreach ($this->_errors as $error)
				$this->_html .= '<div class="alert error">'.$error.'</div>';
		}

		// display form according to current display context
		if ($display == 'unitForm')
			return $this->_displayFormEdit($idSlide);
		else	
			return $this->_displayMainForm();
	}

	/**
	 * Build the BO configuration main form
	 */
	private function _displayMainForm()
	{

		// ------------------------------------------------------------
		// the slide show image list

		// get sorted images from database
		$slides = Db::getInstance()->ExecuteS('
			SELECT * FROM `'._DB_PREFIX_.'prestascope_slideshow` ORDER BY `order`'
		);
		$this->_html .= '
			<fieldset>
				<legend><img src="'.$this->_path.'logo.gif" />'.$this->l('Slide list').'</legend>
					<div style="margin-bottom:15px; font-size:12px;"><a href="'.$this->confUrl.'&amp;display=unitForm"><img src="../img/admin/add.gif" alt="'.$this->l('Add').'" title="'.$this->l('Add').'"></a>'.$this->l('Add a new slide').'</div>';
		if (count($slides)>0)
		{
			$this->_html .= '
					<table class="table" cellpadding="0" cellspacing="0">
						<tr class="nodrag nodrop">
							<th>Id</th>
							<th>Image</th>
							<th>'.$this->l('Link').'</th>
							<th>Actions</th>
						</tr>
					';
			for ($i=0;$i<count($slides);$i++)
			{
				$slide = $slides[$i];
				$this->_html .= '
					<tr>
						<td class="pointer center">'.$slide['id_slide'].'</td>
						<td class="pointer left">'.$slide['image_name'].'</td>
						<td class="pointer left">'.$slide['href'].'</td>
						<td class="center" style="white-space: nowrap;">'.
						'<a href="'.$this->confUrl.'&amp;action=delete&amp;id_slide='.$slide['id_slide'].'" onclick="return confirm(\''.$this->l('Delete slide and its image').' ?\');">
								<img src="../img/admin/delete.gif" alt="'.$this->l('Delete').'" title="'.$this->l('Delete').'">
						 </a>'.
						'<a href="'.$this->confUrl.'&amp;display=unitForm&amp;id_slide='.$slide['id_slide'].'"><img src="../img/admin/edit.gif" alt="'.$this->l('Edit').'" title="'.$this->l('Edit').'"></a>'.
						($i>0?'<a href="'.$this->confUrl.'&amp;action=up&amp;id_slide='.$slide['id_slide'].'"><img border="0" src="../img/admin/up.gif" alt="'.$this->l('Up').'" title="'.$this->l('Up').'"></a>':'<img border="0" src="../img/admin/up_d.gif">').
						($i<(count($slides)-1)?'<a href="'.$this->confUrl.'&amp;action=down&amp;id_slide='.$slide['id_slide'].'"><img border="0" src="../img/admin/down.gif" alt="'.$this->l('Down').'" title="'.$this->l('Down').'"></a>':'<img border="0" src="../img/admin/down_d.gif">').
						'</td>
					</tr>';
			}
			$this->_html .= '
					</table>';
		} 
		else 
		{
			$this->_html .= $this->l('No slide to list');
		}
		$this->_html .= '
			</fieldset>
			<div style="height:20px;"></div>';

		// ------------------------------------------------------------
		// the slide show general settings
		$this->_html .= '
		<form method="post" action="'.$this->confUrl.'">
			<input type="hidden" name="action" value="updateConf" />
			<fieldset>
				<legend><img src="'.$this->_path.'logo.gif" />'.$this->l('General settings').'</legend>
				<label>'.$this->l('Activated').' :</label>
				<div class="margin-form">
					<input type="checkbox" name="activated" id="ss_activated" value="1" '.(Configuration::get('PRESTASCOPE_SLIDE_SHOW_ACTIVATED') == 1 ? 'checked' : '').' />
					&nbsp;<label for="ss_activated" class="t">'.$this->l('display the slide show if activated').'</label>
				</div>
				<div class="clear"></div>
				<label>'.$this->l('Viewport').' :</label>
				<div class="margin-form">
					'.$this->l('Width').' : <input type="text" name="image_width" value="'.Configuration::get('PRESTASCOPE_SLIDE_SHOW_WIDTH').'" style="width:50px;" />&nbsp;px
					&nbsp;&nbsp;/&nbsp;&nbsp;
					'.$this->l('Height').' : <input type="text" name="image_height" value="'.Configuration::get('PRESTASCOPE_SLIDE_SHOW_HEIGHT').'" style="width:50px;" />&nbsp;px
				</div>
				<div class="clear"></div>
				<label>'.$this->l('Transition time').' :</label>
				<div class="margin-form">
					<input type="text" name="fade" value="'.Configuration::get('PRESTASCOPE_SLIDE_SHOW_FADE').'" style="width:30px;" />&nbsp;s
				</div>
				<div class="clear"></div>
				<label>'.$this->l('Sleep time').' :</label>
				<div class="margin-form">
					<input type="text" name="sleep" value="'.Configuration::get('PRESTASCOPE_SLIDE_SHOW_SLEEP').'" style="width:30px;" />&nbsp;s
					<p>'.$this->l('The time between two transitions').'</p>
				</div>
				<div class="clear"></div>
				<label>'.$this->l('Header option').' :</label>
				<div class="margin-form">
					<input type="checkbox" name="jquery" id="ss_jquery" value="1" '.(Configuration::get('PRESTASCOPE_SLIDE_SHOW_JQUERY') == 1 ? 'checked' : '').' />
					&nbsp;<label for="ss_jquery" class="t">'.$this->l('Include JQuery plugin crossslide').'</label>
					<p>'.$this->l('If your images doesn\'t animate, then try to check this option').'</p>
				</div>
				<div class="clear"></div>
				<div class="margin-form clear pspace"><input type="submit" name="submitUpdate" value="'.$this->l('Update').'" class="button" /></div>
			</fieldset>
		</form>';

		return $this->_html;
	}
	/**
	 * Build the BO form to edit / add a slide
	 * @param $idSlide : the slide id to edit / if null then display the form to create a new slide
	 */
	private function _displayFormEdit($idSlide)
	{
		// load the slide informations
		if ($idSlide)
			$slide = $this->loadSlide($idSlide);

		// ------------------------------------------------------------
		// the slide show add image panel
		$this->_html .= '
		<form method="post" action="'.$this->confUrl.'" enctype="multipart/form-data">
			<input type="hidden" name="action" value="'.($idSlide?'edit':'add').'" />
			<input type="hidden" name="id_slide" value="'.$idSlide.'" />
			<fieldset>
				<legend><img src="'.$this->_path.'logo.gif" />'.$this->l('Add new slide').'</legend>
				<label>'.$this->l('Image file').' :</label>
				<div class="margin-form">
					<!-- MAX_FILE_SIZE mut be before the file input -->
					<input type="hidden" name="MAX_FILE_SIZE" value="'.$this->maxImageSize.'" />
					<input type="file" id="image_slide" name="image_slide" style="width:400px;" >
					<p>'.($idSlide?$this->l('Current image is').' : '.$slide['image_name'].'<br />':'').$this->l('Filesize').':'.($this->maxImageSize / 1000).''.$this->l('Kb max.').'</p>
				</div>
				<div class="clear"></div>
				<label>'.$this->l('Optional link').' :</label>
				<div class="margin-form">
					<input type="text" name="image_href" style="width:400px;" value="'.($idSlide?$slide['href']:'').'">
					<p>'.$this->l('This link will be active when image is displayed').'</p>
				</div>
				<div class="clear"></div>
				<div class="margin-form clear pspace">
					<input type="submit" name="submitSlide" value="'.($idSlide?$this->l('Update'):$this->l('Add')).'" class="button" />
					<input type="button" value="'.$this->l('Back').'" class="button" onclick="javascript:document.location.href=\''.$this->confUrl.'\'"/>
				</div>
			</fieldset>
		</form>
		<div style="height:20px;"></div>';
		
		return $this->_html;
	}
	/* *****************************************************************************************
	 *
	 *								HOOKS
	 *
	 * ***************************************************************************************** */
	/**
	 * HOOK HEADER : includes in <head></head> part the slideshow div css 
	 */
	function hookHeader($params)
	{
		global $smarty;
		
		$smarty->assign(array(
			'absoluteUrl' => $this->absoluteUrl,
			'includeJQuery' => Configuration::get('PRESTASCOPE_SLIDE_SHOW_JQUERY')
		));
		return $this->display(__FILE__, 'header.tpl');
	}
	/**
	 * HOOK HOME : displays the slideshow in home page
	 */
	function hookHome($params)
	{
		global $smarty;
		
		// the path to the img sub directory of module
		$imgPath = $this->absoluteUrl . 'img/';
		
		// get sorted images from database
		$slides = Db::getInstance()->ExecuteS('
			SELECT * FROM `'._DB_PREFIX_.'prestascope_slideshow` ORDER BY `order`'
		);

		// change the image name by its full path
		foreach ($slides as &$slide) // by reference to update the element in the array (php V5.0 or +)
		{
			$slide['image_name'] = $imgPath.$slide['image_name'];
		}
		
		// publish slides to template
		$smarty->assign(array(
			'activated' => Configuration::get('PRESTASCOPE_SLIDE_SHOW_ACTIVATED'),
			'conf_width' => Configuration::get('PRESTASCOPE_SLIDE_SHOW_WIDTH'),
			'conf_height' => Configuration::get('PRESTASCOPE_SLIDE_SHOW_HEIGHT'),
			'conf_fade' => Configuration::get('PRESTASCOPE_SLIDE_SHOW_FADE'),
			'conf_sleep' => Configuration::get('PRESTASCOPE_SLIDE_SHOW_SLEEP'),
			'slides' => $slides
		));
		
		return $this->display(__FILE__, 'animation.tpl');
	}
	/* *****************************************************************************************
	 *
	 *						TOOLS TO MANAGE SLIDES
	 *
	 * ***************************************************************************************** */
	/**
	 * Delete a slide and also its image
	 */
	private function deleteSlide($idSlide) 
	{
		// load the slide to be deleted
		$slide = $this->loadSlide($idSlide);
		if (!$slide)
			return false;

		// delete slide from db
		if (!Db::getInstance()->Execute(
			"DELETE FROM `" . _DB_PREFIX_ . "prestascope_slideshow` WHERE id_slide=".$idSlide
		))
		{
			$this->_errors[] = $this->l('Unable to delete the slide').' '.$idSlide.$this->l('in database');
			return false;
		}
		
		// delete also image file
		if (!$this->deleteSlideImage($slide['image_name']))
			return false;
			
		return true;
	}
	/**
	 * Move up or down a slide
	 * @param $direction : one of 'up' or 'down'
	 */
	private function moveSlide($idSlide, $direction) 
	{
		$idSwapSlide = null;
		$orderSwapSlide = null;

		// load the slide to be moved
		$slide = $this->loadSlide($idSlide);
		if (!$slide)
			return false;
		
		// get the other 
		if ($direction=='down')
		{
			$slides = Db::getInstance()->ExecuteS(
				"SELECT * FROM `"._DB_PREFIX_."prestascope_slideshow` WHERE id_slide<>".$idSlide." AND `order`>".$slide['order']." ORDER BY `order` LIMIT 1"
			);
			if (count($slides)==1)
			{
				$idSwapSlide = $slides[0]['id_slide'];
				$orderSwapSlide = $slides[0]['order'];
			}
		}
		else if ($direction=='up')
		{
			$slides = Db::getInstance()->ExecuteS(
				"SELECT * FROM `"._DB_PREFIX_."prestascope_slideshow` WHERE id_slide<>".$idSlide." AND `order`<".$slide['order']." ORDER BY `order` DESC LIMIT 1"
			);
			if (count($slides)==1)
			{
				$idSwapSlide = $slides[0]['id_slide'];
				$orderSwapSlide = $slides[0]['order'];
			}
		}

		// swap if some slide to swap with
		if ($idSwapSlide != null)
		{
			$query = "UPDATE `" . _DB_PREFIX_ . "prestascope_slideshow` SET `order`=".$slide['order']." WHERE id_slide=".$idSwapSlide;
			Db::getInstance()->Execute($query);
			$query = "UPDATE `" . _DB_PREFIX_ . "prestascope_slideshow` SET `order`=".$orderSwapSlide." WHERE id_slide=".$slide['id_slide'];
			Db::getInstance()->Execute($query);
		}
	
		return true;
	}
	/**
	 * Load all this slide info in a single array
	 * Returns null if not found
	 */
	private function loadSlide($idSlide)
	{
		// load the slide to be deleted
		$slides = Db::getInstance()->ExecuteS(
			"SELECT * FROM `"._DB_PREFIX_."prestascope_slideshow` WHERE id_slide=".$idSlide
		);
		if (count($slides)==0)
		{
			$this->_errors[] = $this->l('Unable to find the slide').' (id='.$idSlide.') '.$this->l('in database');
			return false;
		}
		return $slides[0];
	}
	/**
	 * Add a new slide with POST values
	 */
	private function addSlide()
	{
		// if the uploaded file has been moved successfully, then proceed in db
		if ($this->moveUploadedSlideImage())
		{
			// get image link if any
			$href = Tools::getValue('image_href');
			if (strlen(trim($href))==0)
				$href = '';
			
			// insert slide
			$query = "INSERT INTO `" . _DB_PREFIX_ . "prestascope_slideshow` (
					image_name, 
					href, 
					`order`
					) SELECT '".
					$_FILES['image_slide']['name']."', '".
					$href."', ".
					"MAX(`order`)+1 FROM `" . _DB_PREFIX_ . "prestascope_slideshow`";
			Db::getInstance()->Execute($query);
			return true;
		}
	}
	/**
	 * Update a slide with POST values
	 */
	private function updateSlide($idSlide)
	{
		$updateImage = false;
		
		// load the slide to be moved
		$slide = $this->loadSlide($idSlide);
		if (!$slide)
			return false;
		
		// if some image is provided, 
		if ($_FILES['image_slide']['tmp_name'] != NULL) {
			// then move it to the module img folder
			if ($this->moveUploadedSlideImage())
			{
				// and delete previous image (only if the new has been moved)
				if (!$this->deleteSlideImage($slide['image_name']))
					return false;
			}
			else
				return false;
			$updateImage = true;
		}
			
		// ok to update the slide in db
		// get image link if any
		$href = Tools::getValue('image_href');
		if (strlen(trim($href))==0)
			$href = '';
		
		// update slide
		$query = "UPDATE `" . _DB_PREFIX_ . "prestascope_slideshow` SET
				".($updateImage?"image_name='".$_FILES['image_slide']['name']."',":"")." 
				href='".$href."' 
				WHERE id_slide=".$idSlide;
		Db::getInstance()->Execute($query);
		return true;
	}
	/**
	 * Move an uploaded image to the module img/ folder
	 */
	private function moveUploadedSlideImage()
	{
		// replace some special characters from the file name to be sure it will be compatible with HTML source integration
		$_FILES['image_slide']['name'] = self::prepareFilename($_FILES['image_slide']['name']);
		
		// the path to copy the image file
		$imgName = $this->absolutePath . 'img'. DIRECTORY_SEPARATOR . $_FILES['image_slide']['name'];
		
		// move the uploaded file
		if (!move_uploaded_file($_FILES['image_slide']['tmp_name'], $imgName))
		{
			$this->_errors[] = $this->l('Error while copying uploaded file');
			return false;
		}
		return true;
	}
	/**
	 * Delete the image name from the module img folder
	 */
	private function deleteSlideImage($imageName)
	{
		// this slide's image
		$slideImage = $this->absolutePath . 'img'. DIRECTORY_SEPARATOR . $imageName;

		if (!unlink($slideImage))
		{
			$this->_errors[] = $this->l('Unable to delete the slide image').' : '.$slideImage;
			return false;
		}
		return true;
	}
	/**
	 * replace some characters to avoid in the image file name (storage usually on linux OS)
	 */
	public static function prepareFilename($name) {
		// split to check only the name without the extension
		$parts = explode('.', $name);
		$name = strtr($parts[0] , 
			"ŒÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÈÉÊËèéêëÌÍÎÏìíîïÙÚÛÜùúûüÿÑñÇç()[]' &?!/,°.´:;*+\"" , 
			"oAAAAAAaaaaaaOOOOOOooooooEEEEeeeeIIIIiiiiUUUUuuuuyNnCc-------------------" );
		return strtolower($name).'.'.$parts[1];
	}

}

?>
