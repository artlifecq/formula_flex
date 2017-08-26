package com.gameClient.alert
{
	import flash.display.Sprite;
	import flash.display.Stage;

	/**
	 *2d ui层主要是处理鼠标点击 
	 * @author Administrator
	 * 
	 */	
	public class Game2dLayer extends Sprite
	{
		private static var _ins:Game2dLayer=new Game2dLayer();
		public function Game2dLayer()
		{
			super();
		}
		public function init(sta:Stage):void
		{
			sta.addChild(this);
		}
		public static function get ins():Game2dLayer
		{
			return _ins;
		}

	}
}