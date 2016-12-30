package com.rpgGame.app.ui.tips
{
	
	import starling.display.Sprite;
	
	public class BaseTip extends Sprite
	{
		private var tipBGSkin:Object;//BaseTipsSkin;
		
		public function BaseTip()
		{
			createBg()
			touchable = false;
		}
		
		public function setBgSize( $width:int, $height:int ):void
		{
			tipBGSkin.imgBG.width = $width;
			tipBGSkin.imgBG.height = $height;	
		}	
		
		private function createBg():void
		{
//			tipBGSkin = new BaseTipsSkin();
			addChild( tipBGSkin.imgBG );
		}
		
		public function getBgWidth():int
		{
			return tipBGSkin.imgBG.width;
		}
		public function getBgHeight():int
		{
			return tipBGSkin.imgBG.height;
		}
	}
}