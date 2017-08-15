package com.rpgGame.app.ui.main.activityBar.item
{
    import com.game.engine3D.display.InterObject3D;
    import com.rpgGame.app.manager.FunctionOpenManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.time.SystemTimeManager;
    import com.rpgGame.app.ui.main.buttons.IOpen;
    import com.rpgGame.app.utils.TimeData;
    import com.rpgGame.app.utils.TimeUtil;
    import com.rpgGame.core.events.ActivityEvent;
    import com.rpgGame.core.manager.tips.TargetTipsMaker;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
    
    import gs.TweenMax;
    
    import org.client.mainCore.manager.EventManager;
    
    import starling.display.DisplayObject;
    
    import utils.TimerServer;

    public class ActivityButtonBase extends SkinUI implements IOpen
    {
        public var type:int;
		public var row:int;
        public var order:uint;
        private var _title:String;
        protected var tipReady:String;
        protected var tipRuning:String;
        private var _openTimeData:TimeData;
        private var _openTime:Number = 0;
        private var _endTime:Number = 0;
        private var _openTimeStr:String;
        private var _duration:Number;
        private var _openTimeAdvance:int;
		private var _isDown:Boolean;
		private var _TimeFun:Function;
        private var _runing:Boolean;
        private var _effect3D:InterObject3D;
		protected var _openState:Boolean=true;

        public function ActivityButtonBase(skin)
        {
            super(skin);
			
        }
		
		private var _info:FunctionBarInfo;
		public function get info():FunctionBarInfo
		{
			return _info;
		}
		
		public function set info(value:FunctionBarInfo):void
		{
			_info = value;
		}
		
		public function canOpen():Boolean
		{
			if(!_openState){
				return false;
			}
			if(FunctionOpenManager.getOpenLevelByFunBarInfo(_info)>MainRoleManager.actorInfo.totalStat.level)
				return false;
			return true;
		}
		
		public function set styleClass(cl:Class):void
		{
			
		}
        public function get openTimeData():TimeData
        {
            return _openTimeData;
        }

        public function set skin(cl:Class):void
        {
        }
		
        public function get runing():Boolean
        {
            return _runing;
        }

        public function set title(value:String):void
        {
            _title = value;
        }
		
		override protected function onShow():void
		{
			super.onShow();
			playEffect();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			stopEffect();
		}
        public function playEffect():void
        {
			if(_info.showEft==0)
				return ;
			if(this.parent == null)
				return ;
            if (!_effect3D)
            {
                _effect3D = playInter3DAt(ClientConfig.getEffect(_info.effect_name), 42, 45, 0);
            }
            else
            {
                _effect3D.start();
            }
        }

        public function stopEffect():void
        {
            if (_effect3D)
            {
                _effect3D.stop();
            }
        }

        public function get isHasEffect():Boolean
        {
            return _effect3D!=null ? true : false;
        }

        public function get title():String
        {
            return _title;
        }

        public function get openTime():Number
        {
            return _openTime;
        }

        public function get endTime():Number
        {
            return _endTime;
        }

        public function get duration():Number
        {
            return _duration;
        }

        public function setTips(target:DisplayObject, tipReady:String, tipRuning:String):void
        {
            this.tipReady = tipReady;
            this.tipRuning = tipRuning;
            if (target != null)
            {
                TipTargetManager.show(target, TargetTipsMaker.makeSimpleTextTips("$", null, dynamicTips));
            }
        }

        protected function dynamicTips():Array
        {
            var tip:String = "";
            if (runing == true)
            {
				tip = tipRuning;
            }
            else
            {
				tip = tipReady;
            }
            if (tip == null || tip == "")
            {
				tip = "点击参与" + title;
            }
            return [tip];
        }

        public function onActivityData(data:Object):void
        {
        }

        public function onActivityOpen(data:Object=null):void
        {
			_openState=true;
			onActivityData(data);
			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY,_info);
        }

        public function onActivityClose():void
        {
			_openState=false;
			clearTime();
			EventManager.dispatchEvent(ActivityEvent.CLOSE_ACTIVITY,_info);
			this.onTextColse();
        }
		
        public function onActivityUpdate():Boolean
        {
            return true;
        }

        protected function onTextStart(second:int):String
        {
            return "<font color='#ffe258'>即将开启\n" + TimeUtil.format3TimeType(second) + "</font>";
        }

        protected function onTextRuning():String
        {
            return "";
        }

        protected function onTextEnd(second:int):String
        {
            return "<font color='#4efd6f'>" + TimeUtil.format3TimeType(second) + "</font>";
        }
		
		protected function onTextRuningTime(second:int):String
		{
			return "<font color='#4efd6f'>" + TimeUtil.format3TimeType(second) + "</font>";
		}
        protected function onTextColse():String
        {
            return "";
        }

		/**
		 * 启动活动时间
		 * @param time 时间
		 * @param isdown 是否倒计时
		 * 
		 */
        public function setupActTime(time:int,isdown:Boolean = true):void
        {
            _openTime = time;
		/*	if (isNaN(openTime))
			{
				_openTimeStr = openTime + "";
				_openTimeData = new TimeData(openTime + "");
				_openTime = _openTimeData.getCheackNextTime(duration);
				clearTime();
			}else{
				_openTime = openTime;
			}
            _duration = duration;
            _endTime = _openTime + _duration;
			
            _openTimeAdvance = openTimeAdvance;*/
			_isDown = isdown;
			if(_isDown)
			{
				_TimeFun = updatedownTime;
			}
			else{
				_TimeFun = updtaupTime;
			}
			if(!TimerServer.has(updateTime))
				TimerServer.addLoop(updateTime,1000);
        }

        public function clearTime():void
        {
            _openTime = 0;
            _runing = false;
			if(TimerServer.has(updateTime))
				TimerServer.remove(updateTime);
        }

        public function debugInfo():void
        {
            trace(this.debugTime);
        }

        public function get debugTime():String
        {
            return _title + "\t开启日期：" + TimeUtil.changeTimeToSpecStr(_openTime) 
				+ "\t持续" + TimeUtil.timeFormatCH(_duration * 0.001, 3) 
				+ "\t结束日期：" + TimeUtil.changeTimeToSpecStr(_openTime + _duration) 
				+ "\t预告" + TimeUtil.timeFormatCH(_openTimeAdvance * 0.001, 3) 
				+ "\t服务器时间：" + TimeUtil.changeTimeToSpecStr(SystemTimeManager.curtTm) + "\t" + _openTimeStr;
        }

        public function updateTime():void
        {
			if (_openTime >= 0)
			{
				_TimeFun();
			}else {//一直开启
				this.onTextEmpty();
			}
        }
		
		protected function updatedownTime():void
		{
		/*	var currTime :Number = SystemTimeManager.curtTm;
			var timeSpacer:Number = _openTime - currTime;
			var endSpacer:Number;
			if (currTime < _openTime)
			{	
				if (_openTimeAdvance > 0 && currTime >= (_openTime - _openTimeAdvance))
				{
					this.onTextStart(timeSpacer * 0.001);
				}
				else
				{
					onActivityClose();
				}
			}
			else if (currTime >= _openTime && _duration <= 0)
			{
				_runing = true;
				this.onTextRuning();
			}
			else if (currTime >= _openTime && currTime <= (_openTime + _duration))
			{
				_runing = true;
				endSpacer = _endTime - currTime;
				this.onTextEnd(endSpacer * 0.001);
			}
			else
			{
				if (_openTimeData != null)
				{
					_openTime = _openTimeData.getCheackNextTime(_duration);
				}
				onActivityClose();
			}*/
			_openTime--;
			if(_openTime<=0){
				onActivityClose();
			}else{
				this.onTextRuningTime(_openTime);
			}
		}
		 
		protected function updtaupTime():void
		{
			_openTime++;
			this.onTextRuningTime(_openTime);
		}
		
		protected function onTextEmpty():void
		{
			
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