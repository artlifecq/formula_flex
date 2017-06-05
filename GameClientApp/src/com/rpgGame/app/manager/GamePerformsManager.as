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

    public class GamePerformsManager 
    {

        private static const ADJUST_DISPLAY_AVERAGE_SAMP:int = 60;
        private static const ADJUST_DISPLAY_INTERVAL:int = 10000;
        private static const ADJUST_VIEW_INTERVAL:int = 5000;

        private static var _kernelCheckInterval:int = 1800000;
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
        public static var canAdjustView:Boolean = true;


        public static function init():void
        {
            var _local1:int = getTimer();
            _kernelCheckTime = _local1;
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
            var _local1:int = getTimer();
            _lastTime = _local1;
            _memCheckTime = _local1;
            resetDisplayAdjust();
            resetViewAdjust();
            readMemory();
        }

        private static function resetViewAdjust():void
        {
            var _local1:int = getTimer();
            _adjustViewCheckTime = _local1;
            _lastViewAdjustAverageFps = 0;
            _serverHeroCountIndex = 0;
            SceneManager.serverHeroCount = _serverHeroCounts[_serverHeroCountIndex];
        }

        private static function resetDisplayAdjust():void
        {
            var _local1:int = getTimer();
            _adjustDisplayCheckTime = _local1;
            _currDisplayAdjustTime = _local1;
            _canAdjustDisplay = true;
        }

        public static function pause():void
        {
            _isRunning = false;
        }

        private static function readMemory():void
        {
            _totalMem = Math.round(((System.totalMemory * 0.001) * 0.001));
        }

        private static function onTick(inv:uint=0):void
        {
            if (!_isRunning)
            {
                return;
            }
            var _local3:int = getTimer();
            var _local2:int = (_local3 - _lastTime);
            if (_local2 >= 1000)
            {
                _lastTime = _local3;
                readMemory();
                if (_autoDisplayAdjust)
                {
                    checkDisplayAdjust(_local3);
                }
                checkViewAdjust(_local3);
                checkMemory(_local3);
            }
        }

        private static function checkMemory(currTime:int):void
        {
            var _local2:int = (currTime - _memCheckTime);
            if (_local2 > 60000)
            {
                if (_totalMem > 1300)
                {
                    if (currTime > _nextTooHighedTipTime)
                    {
                        TipsInfoView2D.showAlert2D("检测到您的内存使用量过高，为保证游戏的流畅度和稳定，请重启浏览器再进入游戏。");
                        _nextTooHighedTipTime = (currTime + TimeUtil.HOUR_MICRO_SECONDS);
                    }
                }
                _memCheckTime = currTime;
            }
        }

        private static function checkKernel(currTime:int):void
        {
            var _local2:int = (currTime - _kernelCheckTime);
            if (_local2 > _kernelCheckInterval)
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

        private static function checkViewAdjust(currTime:int):void
        {
            var _local3:int;
            var _local2:int;
            if (!canAdjustView)
            {
                return;
            }
            var _local4:int = (currTime - _adjustViewCheckTime);
            if (_local4 > 5000)
            {
                _adjustViewCheckTime = currTime;
                _local3 = Stage3DLayerManager.frameRate;
                if (_local3 >= 50)
                {
                    _local2 = seconds_10_averageFps;
                    if (_local2 < _lastViewAdjustAverageFps)
                    {
                        if (_local2 > 40)
                        {
                            _serverHeroCountIndex = 2;
                            _lastViewAdjustAverageFps = 40;
                        }
                        else if (_local2 > 25)
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
                    if (_local2 > 50)
                    {
                        if (_serverHeroCountIndex == 2)
                        {
                            _serverHeroCountIndex = 3;
                        }
                    }
                    else if (_local2 > 40)
					{
						if (_serverHeroCountIndex == 1)
						{
							_serverHeroCountIndex = 2;
						}
					}
					else if (_local2 > 25)
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

        private static function checkDisplayAdjust(currTime:int):void
        {
            var _local4:int;
            var _local3:int;
            var _local2:Number;
            if (_canAdjustDisplay)
            {
                _local3 = Stage3DLayerManager.frameRate;
                if (_local3 >= 50)
                {
                    _local4 = (currTime - _adjustDisplayCheckTime);
                    if (_local4 > (60 * 1000))
                    {
                        _local2 = 0;
                        _local2 = minute_1_averageFps;
                        if (_local2 > 0)
                        {
                            if (_local2 < 40)
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
                _local4 = (currTime - _currDisplayAdjustTime);
                if (_local4 > 10000)
                {
                    _adjustDisplayCheckTime = currTime;
                    _currDisplayAdjustTime = currTime;
                    _canAdjustDisplay = true;
                }
            }
        }

        private static function reducedDisplayPerforms():void
        {
            var _local1:Boolean;
            if (DisplaySetUpManager.autoSetting == true)
            {
                _local1 = DisplaySetUpManager.reducedPerforms();
                if (_local1)
                {
                    EventManager.dispatchEvent(SystemEvent.DISPLAY_SET_UP_CHANGE);
                }
            }
        }

        private static function improveDisplayPerforms():void
        {
            var _local1:Boolean;
            if (DisplaySetUpManager.autoSetting == true)
            {
                _local1 = DisplaySetUpManager.improvePerforms();
                if (_local1)
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