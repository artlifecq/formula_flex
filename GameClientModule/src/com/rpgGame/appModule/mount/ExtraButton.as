package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.manager.mount.HorseExtraItemInfo;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.type.TipType;
	
	import flash.geom.Point;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.Label;

	public class ExtraButton
	{
		private var _button:Button;
		private var _lable:Label;
		private var _type:int;
		public function ExtraButton(button:Button,lable:Label,type:int)
		{
			_button = button;
			_type = type;
			_lable = lable;
			_button.addEventListener(Event.TRIGGERED,triggeedHandler);
		}
		private var _mountShowData:MountShowData;
		private var _horseExtraItem:HorseExtraItemInfo;
		public function refeash(mountShowData:MountShowData):void
		{
			_mountShowData = mountShowData;
			_horseExtraItem = _mountShowData.getOpenLevelBytype(_type);
			_canShow = _horseExtraItem.getMaxByLevel(_mountShowData.mountLevel)>0
			_button.visible = _canShow;
			_lable.visible = _canShow;
			var haveCount:int = _horseExtraItem.bagHaveCount();
			_lable.text = haveCount.toString();
			_lable.color = haveCount>0?0xffffff:0xff0d0d;
			TipTargetManager.remove(_button);
			TipTargetManager.show(_button,TargetTipsMaker.makeTips(TipType.EXTARITEM_TIP,[_mountShowData,_type],false,new Point(_button.x,_button.y)));
		}
		private function triggeedHandler(e:Event):void
		{
			HorseManager.instance().useExtraItemHorse(_mountShowData,_type);
		}
		
		private var _canShow:Boolean;

		public function get canShow():Boolean
		{
			return _canShow;
		}

		
	}
}