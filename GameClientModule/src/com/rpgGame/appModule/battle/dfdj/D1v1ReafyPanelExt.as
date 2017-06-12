package com.rpgGame.appModule.battle.dfdj
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import flash.utils.getTimer;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.zhanchang.ZhanDouKaiQi_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	public class D1v1ReafyPanelExt extends SkinUIPanel
	{
		private var _skin:ZhanDouKaiQi_Skin;
		private var _timer:GameTimer;
		private var _endTime:int;
		public function D1v1ReafyPanelExt()
		{
			_skin=new ZhanDouKaiQi_Skin();
			this.dragAble=false;
			this.escExcuteAble=false;
			super(_skin);
			_timer=new GameTimer("D1v1ReafyPanelExt");
			_timer.onUpdate=onTimer
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(_endTime-getTimer())/1000;
			if (left>=0) 
			{
				_skin.numLevel.label=left+"";
			}
			else
			{
				_timer.stop();
				hide();
			}
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			_endTime=getTimer()+int(data)*1000;
			_timer.start();
		}
		override protected function onHide():void
		{
			_timer.stop();
		}
	}
}