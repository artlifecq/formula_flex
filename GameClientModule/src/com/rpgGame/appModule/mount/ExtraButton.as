package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.manager.mount.HorseExtraItemInfo;
	
	import feathers.controls.Button;
	import com.rpgGame.app.manager.mount.MountShowData;

	public class ExtraButton
	{
		private var _button:Button;
		private var _type:int;
		public function ExtraButton(button:Button,type:int)
		{
			_button = button;
			_type = type;
		}
		private var _mountShowData:MountShowData;
		private var _horseExtraItem:HorseExtraItemInfo;
		public function refeash(mountShowData:MountShowData):void
		{
			_mountShowData = mountShowData;
			_horseExtraItem = _mountShowData.getOpenLevelBytype(_type);
			_button.visible = _horseExtraItem.getMaxByLevel(_mountShowData.mountLevel)>0;
		}
	}
}