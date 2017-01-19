package com.rpgGame.app.manager {
    import com.game.mainCore.core.timer.GameTimer;
    
    import flash.utils.getTimer;
    
    import gameEngine2D.NetDebug;

    public class RollManager {
        public static const INSTANCE : RollManager = new RollManager();
        
        private static const TOTAL_TIMES : int = 3;
        private static const CD_TIMES : int = 15000;
        private static const USE_TIMES : int = 15000;
        
        private var _curTimes : int = TOTAL_TIMES;
        private var _beginUseTime : int = -1;
        private var _beginCdTime : int = -1;
        private var _timer : GameTimer = null;
        private var _isCd : Boolean = false;
        
        public function RollManager() {
        }
        
        public function init() : void {
            this._timer = new GameTimer("RollManager", 1000, 0, this.onTimer);
            this._timer.start();
        }
        
        public function canUseRoll() : Boolean {
            if (this._isCd) {
                CONFIG::netDebug {
                    NetDebug.LOG("RollManager is in cd");
                }
                return false;
            }
            if (0 == this._curTimes) {
                CONFIG::netDebug {
                    NetDebug.LOG("RollManager use times is zero");
                }
                return false;
            }
            if (-1 == this._beginUseTime) {
                this._beginUseTime = getTimer();
            }
            --this._curTimes;
            return true;
        }
        
        private function onTimer() : void {
            var curTime : int = getTimer();
            if (this._isCd) {
                if ((curTime - this._beginCdTime) > CD_TIMES) {
                    this.endCd();
                }
            } else if (-1 != this._beginUseTime) {
                if (0 == this._curTimes || (curTime - this._beginUseTime) >= USE_TIMES) {
                    this.startCd();
                }
            }
        }
        
        private function startCd() : void {
            this._isCd = true;
            this._beginCdTime = getTimer();
            CONFIG::netDebug {
                NetDebug.LOG("RollManager start cd");
            }
        }
        
        private function endCd() : void {
            this._isCd = false;
            this._beginCdTime = -1;
            this._curTimes = TOTAL_TIMES;
            this._beginUseTime = -1;
            CONFIG::netDebug {
                NetDebug.LOG("RollManager end cd");
            }
        }
    }
}