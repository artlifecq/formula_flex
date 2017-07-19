package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.manager.mount.ZhanQiExtraItemInfo;
	import com.rpgGame.app.manager.mount.ZhanQiManager;
	import com.rpgGame.app.manager.mount.ZhanQiShowData;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.type.TipType;
	
	import flash.geom.Point;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	
	public class ZhanQiExtraButton
	{
		private var _button:Button;
		private var _type:int;
		private var _lab:Label;
		public function ZhanQiExtraButton(button:Button,type:int,lab:Label)
		{
			_button = button;
			_type = type;
			_lab=lab;
			_button.addEventListener(Event.TRIGGERED,triggeedHandler);
		}
		
		private var _zhanqiShowData:ZhanQiShowData;
		private var _zhanqiExtraItem:ZhanQiExtraItemInfo;
		public function refeash(zhanqiShowData:ZhanQiShowData):void
		{
			_zhanqiShowData = zhanqiShowData;
			_zhanqiExtraItem = _zhanqiShowData.getOpenLevelBytype(_type);
			_button.visible = _zhanqiExtraItem.getMaxByLevel(_zhanqiShowData.zhanqiLevel)>0;
			_lab.visible = _zhanqiExtraItem.getMaxByLevel(_zhanqiShowData.zhanqiLevel)>0;
			TipTargetManager.remove(_button);
			TipTargetManager.show(_button,TargetTipsMaker.makeTips(TipType.EXTARITEM_TIP,[_zhanqiShowData,_type],false,new Point(_button.x,_button.y)));
		}
		
		private function triggeedHandler(e:Event):void
		{
			ZhanQiManager.instance().useExtraItemZhanQi(_zhanqiShowData,_type);
		}
	}
}