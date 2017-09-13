package com.rpgGame.app.manager
{
    import com.game.engine3D.manager.Stage3DLayerManager;
    import com.game.engine3D.utils.TimeUtil;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.ui.TipsInfoView2D;
    import com.rpgGame.core.events.SystemEvent;
    import com.rpgGame.coreData.cfg.ClientConfig;
    
    import flash.system.System;
    import flash.utils.getTimer;
    
    import org.client.mainCore.manager.EventManager;
    import org.client.mainCore.utils.Tick;

	/**
	 * 游戏性能监控 
	 * @author NEIL
	 * 
	 */	
    public class GamePerformsManager 
    {
        private static const ADJUST_DISPLAY_AVERAGE_SAMP:int = 60;
        private static const ADJUST_DISPLAY_INTERVAL:int = 10000;
        private static const ADJUST_VIEW_INTERVAL:int = 5000;

        private static var _serverHeroCounts:Array = [20, 50, 100, 200];
        private static var _serverHeroCountIndex:int = 0;
        private static var _lastViewAdjustAverageFps:int = 0;
        private static var _isRunning:Boolean = false;
        private static var _lastTime:int;
        private static var _totalMem:Number;
        private static var _currDisplayAdjustTime:int = 0;
        private static var _canAdjustDisplay:Boolean = false;
        private static var _autoDisplayAdjust:Boolean = false;
        private static var _nextTooHighedTipTime:int = 0;
        private static var _memCheckTime:int = 0;
        private static var _adjustDisplayCheckTime:int = 0;
        private static var _adjustViewCheckTime:int = 0;
		
        private static var _kernelCheckTime:int = 0;
		private static var _kernelCheckInterval:int = 1800000;
        public static var canAdjustView:Boolean = true;

        public static function init():void
        {
            _kernelCheckTime = getTimer();
            _kernelCheckInterval = 600000;
            Tick.addCallback(onTick);
        }

        public static function resume():void
        {
            _isRunning = true;
            reset();
        }

        public static function reset():void
        {
            if (!_isRunning)
            {
                return;
            }
            var lastTime:int = getTimer();
            _lastTime = lastTime;
            _memCheckTime = lastTime;
            resetDisplayAdjust();
            resetViewAdjust();
//            readMemory();
        }

        private static function resetViewAdjust():void
        {
            _adjustViewCheckTime = getTimer();
            _lastViewAdjustAverageFps = 0;
            _serverHeroCountIndex = 0;
            SceneManager.serverHeroCount = _serverHeroCounts[_serverHeroCountIndex];
        }

        private static function resetDisplayAdjust():void
        {
            var resetTime:int = getTimer();
            _adjustDisplayCheckTime = resetTime;
            _currDisplayAdjustTime = resetTime;
            _canAdjustDisplay = true;
        }

        public static function pause():void
        {
            _isRunning = false;
        }

        private static function readMemory():void
        {
            _totalMem = Math.round((System.totalMemory * 0.001) * 0.001);
        }

        private static function onTick(inv:uint=0):void
        {
            if (!_isRunning)
            {
                return;
            }
            var currentTime:int = getTimer();
            var diffTime:int = (currentTime - _lastTime);
            if (diffTime >= 1000)
            {
                _lastTime = currentTime;
//                readMemory();
                if (_autoDisplayAdjust)
                {
                    checkDisplayAdjust(currentTime);
                }
                checkViewAdjust(currentTime);
//                checkMemory(currentTime);
            }
        }

        private static function checkMemory(currTime:int):void
        {
            var diffTime:int = (currTime - _memCheckTime);
            if (diffTime > 60000)
            {
                if (_totalMem > 1800)
                {
                    if (currTime > _nextTooHighedTipTime)
                    {
                        TipsInfoView2D.showAlert2D("检测到您的内存使用量过高，为保证游戏的流畅度和稳定，请不要开3个端以上嘛！亲爱的！");
                        _nextTooHighedTipTime = (currTime + TimeUtil.HOUR_MICRO_SECONDS);
                    }
                }
                _memCheckTime = currTime;
            }
        }

        private static function checkKernel(currTime:int):void
        {
            var diffTime:int = (currTime - _kernelCheckTime);
            if (diffTime > _kernelCheckInterval)
            {
                _kernelCheckTime = currTime;
                if (!ClientConfig.isWeiDuan && Stage3DLayerManager.isOpenGL)
                {
                    TipsInfoView2D.showKernelAlert2D();
                }
                if (_kernelCheckInterval == 600000)
                {
                    _kernelCheckInterval = 1200000;
                }
                else if (_kernelCheckInterval == 1200000)
				{
					_kernelCheckInterval = 1800000;
				}
            }
        }

		/**
		 * 调整同屏显示多少个玩家 
		 * @param currTime
		 * 
		 */		
        private static function checkViewAdjust(currTime:int):void
        {
            var frameRate:int;
            var fps:int;
            if (!canAdjustView)
            {
                return;
            }
            var diffTime:int = (currTime - _adjustViewCheckTime);
            if (diffTime > 5000)
            {
                _adjustViewCheckTime = currTime;
				frameRate = Stage3DLayerManager.frameRate;
                if (frameRate >= 50)
                {
					fps = seconds_10_averageFps;
                    if (fps < _lastViewAdjustAverageFps)
                    {
                        if (fps > 40)
                        {
                            _serverHeroCountIndex = 2;
                            _lastViewAdjustAverageFps = 40;
                        }
                        else if (fps > 25)
						{
							_serverHeroCountIndex = 1;
							_lastViewAdjustAverageFps = 25;
						}
						else
						{
							_serverHeroCountIndex = 0;
							_lastViewAdjustAverageFps = 0;
						}
                    }
                    else if (_serverHeroCountIndex == 3)
					{
						_lastViewAdjustAverageFps = 50;
					}
					else if (_serverHeroCountIndex == 2)
					{
						_lastViewAdjustAverageFps = 40;
					}
					else if (_serverHeroCountIndex == 1)
					{
						_lastViewAdjustAverageFps = 25;
					}
					else
					{
						_lastViewAdjustAverageFps = 0;
					}
                    if (fps > 50)
                    {
                        if (_serverHeroCountIndex == 2)
                        {
                            _serverHeroCountIndex = 3;
                        }
                    }
                    else if (fps > 40)
					{
						if (_serverHeroCountIndex == 1)
						{
							_serverHeroCountIndex = 2;
						}
					}
					else if (fps > 25)
					{
						if (_serverHeroCountIndex == 0)
						{
							_serverHeroCountIndex = 1;
						}
					}
					else
					{
						_serverHeroCountIndex = 0;
					}
                }
                else
                {
                    _serverHeroCountIndex = 3;
                }
                SceneManager.serverHeroCount = _serverHeroCounts[_serverHeroCountIndex];
            }
        }

		
		/**
		 * 动态调整游戏的渲染品质 
		 * @param currTime
		 * 
		 */		
        private static function checkDisplayAdjust(currTime:int):void
        {
            var diffTime:int;
            var frameRate:int;
            var fps:Number;
            if (_canAdjustDisplay)
            {
				frameRate = Stage3DLayerManager.frameRate;
                if (frameRate >= 50)
                {
					diffTime = (currTime - _adjustDisplayCheckTime);
                    if (diffTime > (60 * 1000))
                    {
						fps = minute_1_averageFps;
                        if (fps > 0)
                        {
                            if (fps < 30)
                            {
                                reducedDisplayPerforms();
                            }
                            else
                            {
                                improveDisplayPerforms();
                            }
                        }
                        _adjustDisplayCheckTime = currTime;
                        _currDisplayAdjustTime = currTime;
                        _canAdjustDisplay = false;
                    }
                }
            }
            else
            {
				diffTime = (currTime - _currDisplayAdjustTime);
                if (diffTime > 10000)
                {
                    _adjustDisplayCheckTime = currTime;
                    _currDisplayAdjustTime = currTime;
                    _canAdjustDisplay = true;
                }
            }
        }

        private static function reducedDisplayPerforms():void
        {
            var canReduce:Boolean;
            if (DisplaySetUpManager.autoSetting == true)
            {
				canReduce = DisplaySetUpManager.reducedPerforms();
                if (canReduce)
                {
                    EventManager.dispatchEvent(SystemEvent.DISPLAY_SET_UP_CHANGE);
                }
            }
        }

        private static function improveDisplayPerforms():void
        {
            var canImprove:Boolean;
            if (DisplaySetUpManager.autoSetting == true)
            {
				canImprove = DisplaySetUpManager.improvePerforms();
                if (canImprove)
                {
                    EventManager.dispatchEvent(SystemEvent.DISPLAY_SET_UP_CHANGE);
                }
            }
        }

        private static function getAverageFps(samp:int):Number
        {
            return Stage3DLayerManager.getAverageFps(samp);
        }

        public static function get currentFps():int
        {
            return Stage3DLayerManager.fps;
        }

        public static function get totalMemory():Number
        {
            return _totalMem;
        }

        public static function get seconds_10_averageFps():Number
        {
            return getAverageFps(10);
        }

        public static function get minute_1_averageFps():Number
        {
            return getAverageFps(60);
        }

        public static function get minute_5_averageFps():Number
        {
            return getAverageFps(300);
        }

        public static function get minute_10_averageFps():Number
        {
            return getAverageFps(600);
        }

        public static function get autoDisplayAdjust():Boolean
        {
            return _autoDisplayAdjust;
        }

        public static function set autoDisplayAdjust(value:Boolean):void
        {
            if (_autoDisplayAdjust == value)
            {
                return;
            }
            _autoDisplayAdjust = value;
            resetDisplayAdjust();
        }
    }
}