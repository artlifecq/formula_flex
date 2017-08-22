package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	
	import org.mokylin.skin.app.fuben.FuBenTanKuang1;
	import org.mokylin.skin.app.fuben.FuBen_JinRuTime;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	/**
	* 副本进入倒计时框
	* @author yt
	* 
	*/
	public class MultyEnterTimePanel extends SkinUIPanel
	{
		private var _skin :FuBen_JinRuTime;
		public function MultyEnterTimePanel()
		{
			_skin=new FuBen_JinRuTime();
			super(_skin);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			var name:String="";
			var fighttype:int=int(data);
			switch(fighttype)
			{
				case 2:
					name="ui/app/fuben/jijiangjinrufuben.png";
					break;
				case 12:
					name="ui/app/fuben/jijiangjinrufuben.png";
					break;
				case 19:
					name="ui/app/fuben/jijiangjinruzhanchang.png";
					break;
			}
			_skin.name.styleName=name;
			setTime();
			
		}
		private var remainTime:int;
		private function setTime():void
		{
			var rTime:int=GlobalSheetData.getSettingInfo(849)!=null?GlobalSheetData.getSettingInfo(849).q_int_value:15;
			if(rTime<=0){
				_skin.numTime.label="0";
			}else{
				remainTime=rTime;
				_skin.numTime.label=remainTime.toString();
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.numTime.label=remainTime.toString();
			if(remainTime==0){
				hide();
				TimerServer.remove(updateTime);
			}
		}
		override public function hide():void 
		{
			super.hide();
			TimerServer.remove(updateTime);
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=sw/2-this.width/2;
			this.y=sh/6;
		}
	}
}