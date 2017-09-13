package com.rpgGame.app.ui.main.activityBar.item
{
	import org.mokylin.skin.common.YuanDian_Skin;
	
	import starling.display.Sprite;

	/**
	 * 带红点数字的按钮
	 * @author YT
	 */
	public class ActivityPointNumButton extends ActivityButton
	{
		private var _lableContent:Sprite;
		private var _labSkin:YuanDian_Skin;
		public function ActivityPointNumButton()
		{
			super();
			init();
		}
		private function init():void
		{
			_labSkin = new YuanDian_Skin();
			_lableContent = new Sprite();
			_lableContent.y = 12;
			_lableContent.x = 55;
			_lableContent.visible=false;
			_labSkin.toSprite(_lableContent);
			this.addChild(_lableContent);
		}
		public function setNum(num:int):void
		{
			_lableContent.visible = num>0;
			_labSkin.lbnum.text = num.toString();
			
		}
	}
}