package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.MainBtnCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mainbtn;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import away3d.events.Event;
	
	import feathers.controls.ButtonState;
	
	import gs.TweenMax;
	
	public class MainButtonBases extends IconButton implements IOpen
	{
		private var _info:Q_newfunc;
		protected var _btnInfo:Q_mainbtn;
		
		protected var _openState:Boolean=true;
	
		
		public function get info():Q_newfunc
		{
			return _info;
		}
		
		public function set info(value:Q_newfunc):void
		{
			_info = value;
			_btnInfo=MainBtnCfgData.getMainBtnCfg(_info.q_open_btn);
		}
		
		public function canOpen():Boolean
		{
			return _info.q_level<=MainRoleManager.actorInfo.totalStat.level;
		}
		
		private var _needPlayFirstAm:Boolean = false;

		public function get needPlayFirstAm():Boolean
		{
			return _needPlayFirstAm;
		}

		public function set needPlayFirstAm(value:Boolean):void
		{
			_needPlayFirstAm = value;
		}

		public function MainButtonBases():void
		{
			super();
			this.width=this.height=60;//默认设置为60
		}
		
		override protected function feathersControl_addedToStageHandler(event:Event):void
		{
			super.feathersControl_addedToStageHandler(event);
			onShow();
		}
		
		protected function onShow():void
		{
			this.visible = !_needPlayFirstAm;
		}
		
		
		override public function get width():Number
		{
			if(needPlayFirstAm)
				return 0;
			else
				return super.width;
		}
		
		override public function get height():Number
		{
			if(needPlayFirstAm)
				return 0;
			else
				return super.height;
		}
		
		override protected function feathersControl_removedFromStageHandler(event:Event):void
		{
			super.feathersControl_removedFromStageHandler(event);
			onHite();
		}
		
		protected function onHite():void
		{
			
		}
		
		override protected function initialize():void
		{
			if (_btnInfo.q_btn_tips)
			{
				TipTargetManager.show(this, TargetTipsMaker.makeSimpleTextTips(_btnInfo.q_btn_tips));
			}
		}
		override protected function changeState(state:String):void
		{
			var oldState:String = this._currentState;
			if(oldState === state)
			{
				return;
			}
			super.changeState(state);
			if(state == ButtonState.DOWN)
			{
				triggeredHanadler();
//				run();
			}
		}
		
		protected function triggeredHanadler():void
		{
			FunctionOpenManager.openPanelByFuncInfo(_info);
		}
		
		private var _tweenmax:TweenMax;
		public function runAnimation():void
		{
			if(_tweenmax!=null)
			{
				_tweenmax.restart();
				return ;
			}
			var lasty:Number = this.y;
			_tweenmax = TweenMax.to(this,0.1,{repeat:5,y:lasty-10,onComplete:onTweenFlyComplete,onCompleteParams:[this,lasty]});
		}
		
		private function onTweenFlyComplete(display:IOpen,lastY:Number):void
		{
			_tweenmax = null;
			display.y = lastY;
		}
	}
}