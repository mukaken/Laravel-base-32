<?php

include_once path('app').'tests/application/models/testDI.php';

class AppleTest extends PHPUnit_Framework_TestCase
{
	protected $object;

	protected function setUp()
	{
		$this->object = Ioc::resolve('apple');
	}

	public function testGetName()
	{
		$this->assertEquals('Apple', $this->object->getName(), 'Apple::getNameテスト');
	}

	public function testGetMixName()
	{
		$this->assertEquals('AppleOrangeStub', $this->object->getMixName(), 'Apple::getMixNameテスト');
	}

}
