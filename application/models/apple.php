<?php

class Apple {
	function getName() {
		return 'Apple';
	}
	function getMixName() {
		$fruit = Ioc::resolve('today-fruit');
		return $this->getName().$fruit->getName();
	}
}