package com.rpgGame.app.ui.main.activityBar.item
{
    import com.game.engine3D.display.InterObject3D;
    import com.game.mainCore.core.manager.TimerManager;
    import com.rpgGame.app.manager.FunctionOpenManager;
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
    import com.rpgGame.coreData.type.activity.ActivityOpenStateType;
    
    import gs.TweenMax;
    
    import org.client.mainCore.manager.EventManager;
    
    import starling.animation.IAnimatable;
    import starling.core.Starling;
    import starling.display.DisplayObject;

    public class ActivityButtonBase extends SkinUI implements IOpen,IAnimatable
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
        private var _duration:int;
        private var _openTimeAdvance:int;
		private var _isDown:Boolean;
		private var _TimeFun:Function;
        private var _runing:Boolean;
        private var _effect3D:InterObject3D;
		protected var _activityState:int

        public function ActivityButtonBase(skin)
        {
            super(skin);
			_activityState = ActivityOpenStateType.OPEN;
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
			if(!FunctionOpenManager.getOpenLevelByFunBarInfo(_info))
				return false;
			if(_activityState == ActivityOpenStateType.CLOSE)
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

        public function playEffect():void
        {
            if (!_effect3D)
            {
                _effect3D = playInter3DAt(ClientConfig.getEffect("tx_quan"), 42, 30, 0);
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

        public function onActivityOpen():void
        {
			_activityState = ActivityOpenStateType.OPEN;
			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY,_info);
        }

        public function onActivityClose():void
        {
			if(Starling.juggler.contains(this))
				Starling.juggler.remove(this);
			clearTime();
			_activityState = ActivityOpenStateType.CLOSE;
			EventManager.dispatchEvent(ActivityEvent.CLOSE_ACTIVITY,_info);
			this.onTextColse();
        }
		
        public function onActivityUpdate():Boolean
        {
            return true;
        }

        protected function onTextStart(second:int):String
        {
            return "<font color='#ffe258'>即将开启\n" + TimeUtil.intTimeActivityString(second) + "</font>";
        }

        protected function onTextRuning():String
        {
            return "<font color='#4efd6f'>进行中</font>";
        }

        protected function onTextEnd(second:int):String
        {
            return "<font color='#4efd6f'>进行中\n" + TimeUtil.intTimeActivityString(second) + "</font>";
        }
		
		protected function onTextRuningTime(second:int):String
		{
			return "<font color='#4efd6f'>活动持续\n" + TimeUtil.intTimeActivityString(second) + "</font>";
		}
        protected function onTextColse():String
        {
            return "";
        }

		/**
		 * 设置活动时间 
		 * @param openTime 开启时间点
		 * @param duration 持续时间点
		 * @param openTimeAdvance 提前预告时间点
		 * @param isdown 是否倒计时
		 * 
		 */
        public function setTimeData(openTime:Number, duration:int=0, openTimeAdvance:int=0,isdown:Boolean = true):void
        {
            _openTime = 0;
			if (isNaN(openTime))
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
			if(_openTime <_endTime)
			{
				Starling.juggler.add(this);
			}
            _openTimeAdvance = openTimeAdvance;
			_isDown = isdown;
			if(_isDown)
				_TimeFun = updatedownTime;
			else
				_TimeFun = updtaupTime;
        }

        public function clearTime():void
        {
            _openTime = 0;
            _runing = false;
			if(Starling.juggler.contains(this))
				Starling.juggler.remove(this);
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

        public function advanceTime(time:Number):void
        {
			if (_openTime > 0)
			{
				_TimeFun(time);
			}else {//一直开启
				this.onTextEmpty();
				_activityState = ActivityOpenStateType.OPEN;
			}
        }
		
		protected function updatedownTime(time:Number):void
		{
			var currTime :Number = SystemTimeManager.curtTm;
			var timeSpacer:Number = _openTime - currTime;
			var endSpacer:Number;
			if (currTime < _openTime)
			{	
				if (_openTimeAdvance > 0 && currTime >= (_openTime - _openTimeAdvance))
				{
					this.onTextStart(timeSpacer * 0.001);
					_activityState = ActivityOpenStateType.OPEN_COUNTDOWN;
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
				_activityState = ActivityOpenStateType.CLOSE_COUNTDOWN;
			}
			else if (currTime >= _openTime && currTime <= (_openTime + _duration))
			{
				_runing = true;
				endSpacer = _openTime + _duration - currTime;
				this.onTextEnd(endSpacer * 0.001);
				_activityState = ActivityOpenStateType.CLOSE_COUNTDOWN;
			}
			else
			{
				if (_openTimeData != null)
				{
					_openTime = _openTimeData.getCheackNextTime(_duration);
				}
				onActivityClose();
			}
		}
		 
		protected function updtaupTime(time:Number):void
		{
			var currTime :Number = SystemTimeManager.curtTm - _openTime;
			_runing = true;
			this.onTextRuningTime(currTime*0.001);
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