<?php


// 14 de Octubre del 2020
// Lb.php
// @brief el objeto legobox
// estoy inspirado : 11/agosto/2020 - 4:55am - la hydra y quimera estan en mis pies esas babosas

class Lb {

	public function Lb(){
		$this->get = new Get();
		$this->post = new Post();
		$this->request = new Request();
		$this->cookie = new Cookie();
		$this->session = new Session();
	}

	public function loadModule($module){
			if(!isset($_GET['module'])){
				Module::setModule($module);
				include "core/modules/".$module."/autoload.php";
				include "core/modules/".$module."/superboot.php";
				include "core/modules/".$module."/init.php";
			}else{
				Module::setModule($_GET['module']);
				if(Module::isValid()){
					include "core/modules/".$_GET['module']."/init.php";
				}else {
					Module::Error();
				}
			}

	}

}

?>