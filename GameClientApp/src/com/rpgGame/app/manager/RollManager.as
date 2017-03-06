package com.rpgGame.app.manager {
    import com.game.mainCore.core.timer.GameTimer;
    
    import flash.utils.getTimer;
    
    import gameEngine2D.NetDebug;

    import org.client.mainCore.manager.EventManager

    public class RollManager {
        public static const INSTANCE : RollManager = new RollManager();

        public static const EVENT_UPDATE : String = "ROLLMANAGEREVEN_UPDATE";
        public static const EVENT_STARTCD: String = "ROLLMANAGEREVEN_STARTCD";
        public static const EVENT_ENDCD: String = "ROLLMANAGEREVEN_ENDCD";
        public static const EVENT_UPDATECD: String = "ROLLMANAGEREVEN_UPDATECD";
        public static const EVENT_UPDATEUSECD: String = "ROLLMANAGEREVEN_UPDATEUSECD";
        
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
            EventManager.dispatchEvent(EVENT_UPDATE, this._curTimes);
            if (0 == this._curTimes) {
                this.startCd();
            }
            return true;
        }
        
        private function onTimer() : void {
            var curTime : int = getTimer();
            var idelTime : int = curTime - this._beginCdTime;
            if (this._isCd) {
                if (idelTime > CD_TIMES) {
                    this.endCd();
                } else {
                    EventManager.dispatchEvent(EVENT_UPDATECD, idelTime / 1000);
                }
            } else if (-1 != this._beginUseTime) {
                idelTime = curTime - this._beginUseTime;
                if (0 == this._curTimes) {
                    this.startCd();
                } else if (idelTime >= USE_TIMES) {
                    this.endCd();
                } else {
                    EventManager.dispatchEvent(EVENT_UPDATEUSECD, idelTime / 1000);
                }
            }
        }
        
        private function startCd() : void {
            this._isCd = true;
            this._beginCdTime = getTimer();
            EventManager.dispatchEvent(EVENT_UPDATE, this._curTimes);
            EventManager.dispatchEvent(EVENT_UPDATECD, 0);
            CONFIG::netDebug {
                NetDebug.LOG("RollManager start cd");
            }
        }
        
        private function endCd() : void {
            this._isCd = false;
            this._beginCdTime = -1;
            this._curTimes = TOTAL_TIMES;
            this._beginUseTime = -1;
            EventManager.dispatchEvent(EVENT_ENDCD);
            EventManager.dispatchEvent(EVENT_UPDATE, this._curTimes);
            EventManager.dispatchEvent(EVENT_UPDATEUSECD, 0);
            CONFIG::netDebug {
                NetDebug.LOG("RollManager end cd");
            }
        }
    }
}
