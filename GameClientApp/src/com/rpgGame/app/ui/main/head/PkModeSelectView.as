package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.utils.MouseListenerUtil;
	import com.rpgGame.core.utils.PKModeUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.PKModeType;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;
	
	public class PkModeSelectView extends Sprite
	{
		private var _bg:UIAsset;
		private var _label:Label;
//		private var pkModeListVect:Vector.<PkModelSelectItem>;
		public function PkModeSelectView()
		{
			initView();
			addEvent();
		}
		
		private function addEvent():void
		{
			MouseListenerUtil.addEventListener( this, null, null, onRollOut );
			
		}
		
//		private function onClick():void
//		{
//			hide()
//		}
		
		private function onRollOut():void
		{
			hide();
		}
		
		public function hide():void
		{
			visible = false;
		}
		
		public function showOrHide():void
		{
			visible = !visible;
		}
			
		public function setLab():void
		{
			var color : int = PKModeUtil.getPKModeColor(MainRoleManager.actorInfo.pkMode);
			_label.text = getText();
			_label.color = color;
		}
		private function getText():String
		{
			var str:String = "当前攻击模式："+PKModeUtil.getPKModeName(MainRoleManager.actorInfo.pkMode);
			return str;
		}
		private function initView():void
		{
			_bg = new UIAsset();
			_bg.styleName = "ui/common/tip/tips_di.png";
			addChild(_bg);
			_label = new Label();
			_label.fontSize = 14;
			_label.x = 13;
			_label.y = 10;
			addChild(_label);
//			pkModeListVect = new Vector.<PkModelSelectItem>;
			
			var modeArr:Array = [PKModeType.PEACE,
				PKModeType.KIND_OR_EVIL,
				PKModeType.TEAM,
				PKModeType.FAMILY,
				PKModeType.GUILD,
				PKModeType.COUNTRY,
				PKModeType.ALLIANCE,
				PKModeType.DIFFERENT_SEVER];
			if(!ClientConfig.isBanShu)
			{
				modeArr.push(PKModeType.ALL);
			}
			_bg.setSize(390,30 + 26 * modeArr.length);
			
			var len:int = modeArr.length;
			var item:PkModelSelectItem;
			for (var i:int = 0; i < len; i++) 
			{
				item = new PkModelSelectItem();
				item.setData(modeArr[i]);
				addChild(item);
				item.y = (i) * 25 + 33;
				item.x = 13;
			}
		}
	}
}