package com.rpgGame.app.ui.main.head
{
	import com.game.mainCore.core.utils.TextFormatUtil;
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.core.utils.MouseListenerUtil;
	import com.rpgGame.core.utils.PKModeUtil;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;
	
	public class PkModelSelectItem extends Sprite
	{
		private var _menuBG:UIAsset;
		private var _text:Label;
		private var _pkMode:int;
		public function PkModelSelectItem()
		{
			initView();
		}
		private function initView():void
		{
			_menuBG = new UIAsset();
			_menuBG.styleName = "ui/common/kang/xuanzhong/xuanzhong.png";
			addChild( _menuBG );
			_menuBG.width = 360;
			_menuBG.visible = false;
			//--------------------------
			
			_text = new Label();
			_text.fontSize = 14;
			_text.width = 360;
			addChild(_text);
			
//			_text.y = 2;
			
			addEvent();
		}
		private function addEvent():void
		{
			MouseListenerUtil.addEventListener( this, clickItem, rollOver, rollOut );
		}
		private function clickItem():void
		{
			PKMamager.HeroSetPKMode(_pkMode);
		}
		/**
		 * 设置数据 
		 * @param pkmode
		 * 
		 */		
		public function setData( pkmode:int ):void{
			_pkMode = pkmode;
			_text.htmlText = getPKModeMoreInfo(pkmode);
		}
	
		/**
		 * 得到PK模式的详细描述 （如：【和平模式】您的攻击不会对任何玩家造成伤害）
		 * @param pkMode
		 * @return 
		 * 
		 */		
		public function getPKModeMoreInfo(pkMode:int):String
		{
			var infoStr:String = PKModeUtil.getPKModeDesc(_pkMode);
			var color:uint = PKModeUtil.getPKModeColor(_pkMode);
			infoStr = TextFormatUtil.getColorText(infoStr,color);
			return infoStr;
		}
		private function rollOut():void
		{
			_menuBG.visible = false;
		}
		
		private function rollOver():void
		{
			_menuBG.visible = true;
		}
	}
}