package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.game.engine2D.scene.StarlingLayerManager;
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.netData.zone.message.SCZoneCloseCountdownTimerMessage;
	
	import flash.utils.getTimer;
	
	import feathers.controls.UINumber;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.JiXianQieHuan2;
	
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;
	
	public class JiXianNoticeLeavePanelExt extends SkinUIPanel
	{
		private var _skin:JiXianQieHuan2;
		private var _effect3dCon:Inter3DContainer;
		private var _effect3d:InterObject3D;
		private var _endTime:int;
		private var _timeNum:UINumber;
		public function JiXianNoticeLeavePanelExt()
		{
			_skin=new JiXianQieHuan2();
			super(_skin);
			_effect3dCon=new Inter3DContainer();
			_effect3dCon.x=_skin.width/2;
			_effect3dCon.y=_skin.height/2;
			MCUtil.addBefore(this,_effect3dCon,_skin.grpWord1);
			this.changeMapClose=true;
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topLevel);
			var type:int=data.type;
			var total:int=data.time;
			_endTime=getTimer()+total*1000;
			_skin.grpWord1.visible=type==1;
			_skin.grpWord2.visible=type==2;
			if (_skin.grpWord1.visible) 
			{
				_timeNum=_skin.num1;
			}
			else
			{
				_timeNum=_skin.num2;
			}
			TimerServer.addSecTick(onTime);
			onTime();
		}
		private function onTime():void
		{
			var left:int=Math.ceil((_endTime-getTimer())/1000);
			if (left>0&&_timeNum) 
			{
				_timeNum.label=left+"";
			}
			else
			{
				
				TimerServer.remove(onTime);
				hide();
			}
		}
		override protected function onShow():void
		{
			super.onShow();
			if (!_effect3d) 
			{
				_effect3d=this._effect3dCon.playInter3DAt(ClientConfig.getEffect(EffectUrl.EFFECT_UI_WARN),0,0,0);
			}
		
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_effect3d) 
			{
				_effect3d.dispose();
				_effect3d=null;
			}
			TimerServer.remove(onTime);
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x=(sw-this.width)/2;
			this.y=250;
		}
	}
}