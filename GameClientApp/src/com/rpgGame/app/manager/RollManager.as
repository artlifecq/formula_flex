package com.rpgGame.app.manager {
    import com.rpgGame.app.manager.time.SystemTimeManager;
    import com.rpgGame.core.events.SystemEvent;
    import com.rpgGame.coreData.UNIQUEID;
    
    import org.client.mainCore.manager.EventManager;
    
    import starling.core.Starling;

    public class RollManager {
		private static var _instance:RollManager
		public static function getinstance():RollManager
		{
			if(_instance == null)
			{
				_instance = new RollManager();
				_instance.reset();
			}
			return _instance;
		}
        public static const ROLL_STARTROLL:int =UNIQUEID.NEXT;
		public static const ROLL_STARTRESET:int = UNIQUEID.NEXT;
		public static const ROLL_USE:int = UNIQUEID.NEXT;
        
		public static const RoleState_User:int = 1;
		public static const RoleState_CD:int = 2;
		public static const RoleState_Normal:int = 0;
		
        public static const TOTAL_TIMES : int = 3;
        public static const CD_TIMES : int = 15000;
		public static const USE_TIMES : int = 15000;
        private var _curCount : int;
        private var _beginUseTime :Number = -1;
		private var _currentState:int;
		public function RollManager():void
		{
			if(_instance!=null)
				throw new Error("老大，这是单例，别在初始化了");
		}
        public function canUseRoll() : Boolean 
		{
			if(_currentState == RoleState_CD)
				return false;
			else
				return curCount>0;
        }
		
		public function useRoll():Boolean
		{
			if(_currentState == RoleState_CD)
				return false;
			else if(_currentState == RoleState_User && curCount<=0)
				return false;
 			if(curCount ==TOTAL_TIMES)
			{
				_beginUseTime = SystemTimeManager.curtTm;
				refeash();
				EventManager.dispatchEvent(RollManager.ROLL_STARTROLL);
			} 
			_curCount --;
			EventManager.dispatchEvent(RollManager.ROLL_USE);
			return true;
		}
		
		public function get   passTime():Number
		{
			return SystemTimeManager.curtTm - _beginUseTime;
		}
        
		public function get currentState():int
		{
			return _currentState;
		}
		
		public function get curCount():int
		{
			return _curCount;
		}
		
		public function refeash():void
		{
			var curpassTime : Number =  passTime;
			if((curpassTime>=0)&&(curpassTime<USE_TIMES))
			{
				_currentState = RoleState_User;
			}else if((curpassTime>=USE_TIMES)&&(curpassTime<(USE_TIMES+CD_TIMES)))
			{
				_currentState = RoleState_CD;
				_curCount =Math.floor( (curpassTime-USE_TIMES)/(CD_TIMES/TOTAL_TIMES));
			}else{
				reset();
			}
		}
		
        private function reset() : void {
			_currentState = RoleState_Normal;
			_curCount = TOTAL_TIMES;
			_beginUseTime = -1;
			EventManager.dispatchEvent(RollManager.ROLL_STARTRESET);
        }
    }
}
