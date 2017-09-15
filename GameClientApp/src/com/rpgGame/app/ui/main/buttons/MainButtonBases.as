package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mainbtn;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.enum.EmOpenType;
	
	import away3d.events.Event;
	
	import feathers.controls.ButtonState;
	
	import gs.TweenMax;
	
	public class MainButtonBases extends IconButton implements IOpen
	{
		private var _funcInfo:Q_newfunc;
		protected var _btnInfo:Q_mainbtn;
		
		protected var _openState:Boolean=true;
	
		
		public function get info():Q_mainbtn
		{
			return _btnInfo;
		}
		
		public function set info(value:Q_mainbtn):void
		{
			_btnInfo = value;
			if(_btnInfo.q_click_type==EmOpenType.OPEN_PANEL){
				_funcInfo=NewFuncCfgData.getFuncCfgByPanelId(int(_btnInfo.q_click_arg));
			}else{
				_funcInfo=NewFuncCfgData.getFuncCfgByBtnId(_btnInfo.q_id);
			}
		}
		
		public function canOpen():Boolean
		{
			if(_funcInfo)
				return _funcInfo.q_level<=MainRoleManager.actorInfo.totalStat.level;
			return true;
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
			FunctionOpenManager.openByBtnInfo(_btnInfo);
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