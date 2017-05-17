package com.rpgGame.app.ui.main.activityBar.item
{
    import com.game.engine3D.display.InterObject3D;
    import com.rpgGame.app.manager.time.SystemTimeManager;
    import com.rpgGame.app.utils.TimeData;
    import com.rpgGame.app.utils.TimeUtil;
    import com.rpgGame.core.events.ActivityEvent;
    import com.rpgGame.core.manager.tips.TargetTipsMaker;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.type.activity.ActivityOpenStateType;
    
    import feathers.controls.StateSkin;
    
    import org.client.mainCore.manager.EventManager;
    
    import starling.display.DisplayObject;

    public class ActivityButtonBase extends SkinUI 
    {

        public var type:String;
        public var order:uint;
        public var onClick:Function;
        private var _title:String;
        protected var tipReady:String;
        protected var tipRuning:String;
        private var _openTimeData:TimeData;
        private var _openTime:Number = 0;
        private var _endTime:Number = 0;
        private var _openTimeStr:String;
        private var _duration:int;
        private var _openTimeAdvance:int;
        private var _runing:Boolean;
        private var _effect3D:InterObject3D;

        public function ActivityButtonBase(skin:StateSkin=null)
        {
            super(skin);
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
        }

        public function onActivityClose():void
        {
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

        protected function onTextColse():String
        {
            return "";
        }

        public function setTimeData(openTime:Number, duration:int=0, openTimeAdvance:int=0):void
        {
            _openTime = 0;
			if (isNaN(openTime))
			{
				_openTimeStr = openTime + "";
				_openTimeData = new TimeData(openTime + "");
				_openTime = _openTimeData.getCheackNextTime(duration);
			}
			else
			{
				_openTime = openTime;
			}
            _duration = duration;
            _endTime = _openTime + _duration;
            _openTimeAdvance = openTimeAdvance;
        }

        public function clearTime():void
        {
            onActivityClose();
            _openTime = 0;
            _runing = false;
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

        public function updateTime(currTime:Number):int
        {
            var timeSpacer:int;
            var endSpacer:Number;
            _runing = false;
            var activityStateType:uint = ActivityOpenStateType.CLOSE;
            if (_openTime > 0)
            {
				timeSpacer = _openTime - currTime;
                if (currTime / 1000 == _openTime / 1000)
                {
                    EventManager.dispatchEvent(ActivityEvent.NOTICE, type);
					activityStateType = ActivityOpenStateType.CLOSE_COUNTDOWN;
                }
                if (currTime < _openTime)
                {
                    if (_openTimeAdvance > 0 && currTime >= (_openTime - _openTimeAdvance))
                    {
                        this.onTextStart(timeSpacer * 0.001);
						activityStateType = ActivityOpenStateType.OPEN_COUNTDOWN;
                    }
                    else
                    {
                        this.onTextColse();
						activityStateType = ActivityOpenStateType.CLOSE;
                    }
                }
                else if (currTime >= _openTime && _duration <= 0)
				{
					_runing = true;
					this.onTextRuning();
					activityStateType = ActivityOpenStateType.CLOSE_COUNTDOWN;
				}
				else if (currTime >= _openTime && currTime <= (_openTime + _duration))
				{
					_runing = true;
					endSpacer = _openTime + _duration - currTime;
					this.onTextEnd(endSpacer * 0.001);
					activityStateType = ActivityOpenStateType.CLOSE_COUNTDOWN;
				}
				else
				{
					if (_openTimeData != null)
					{
						_openTime = _openTimeData.getCheackNextTime(_duration);
					}
					this.onTextColse();
				}
            }else {//一直开启
				this.onTextEmpty();
				activityStateType = ActivityOpenStateType.OPEN;
			}
            if (activityStateType != ActivityOpenStateType.CLOSE && !onActivityUpdate())
            {
				activityStateType = ActivityOpenStateType.CLOSE;
            }
            return activityStateType;
        }
		
		protected function onTextEmpty():void
		{
			
		}

        public function checkCanOpen():Boolean
        {
            return true;
        }
    }
}