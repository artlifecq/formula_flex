package com.rpgGame.app.manager {
    import com.rpgGame.app.manager.time.SystemTimeManager;
    import com.rpgGame.app.ui.main.buff.BuffBar;
    import com.rpgGame.coreData.UNIQUEID;
    import com.rpgGame.coreData.info.buff.BuffData;
    
    import org.client.mainCore.manager.EventManager;
	/**
	 * 翻滚管理器
	 * @author jsj
	 * 
	 */
    public class DodgeManager {
		private static var _instance:DodgeManager;
		
		private var _reduceTime:Number = 0;

		public function set reduceTime(value:Number):void
		{
			_reduceTime = value;
		}

		public static function getinstance():DodgeManager
		{
			if(_instance == null)
			{
				_instance = new DodgeManager();
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
        private static const CD_TIMES : int = 15000;
		public static const USE_TIMES : int = 15000;
        private var _curCount : int;
        private var _beginUseTime :Number = -1;
		private var _currentState:int;
		public function DodgeManager():void
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
				EventManager.dispatchEvent(DodgeManager.ROLL_STARTROLL);
			} 
			_curCount --;
			if(_curCount ==0)
			{
				_beginUseTime = SystemTimeManager.curtTm - USE_TIMES;
				//
				LostSkillManager.instance().checkRoll3Complete();
			}
			EventManager.dispatchEvent(DodgeManager.ROLL_USE);
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
			}else if((curpassTime>=USE_TIMES)&&(curpassTime<(USE_TIMES+cdTimes)))
			{
				_currentState = RoleState_CD;
				_curCount =Math.floor( (curpassTime-USE_TIMES)/(cdTimes/TOTAL_TIMES));
			}else{
				reset();
			}
		}
		
		
		public function get cdTimes():int
		{
			return CD_TIMES - _reduceTime;
		}
        private function reset() : void {
			_currentState = RoleState_Normal;
			_curCount = TOTAL_TIMES;
			_beginUseTime = -1;
			EventManager.dispatchEvent(DodgeManager.ROLL_STARTRESET);
        }
    }
}
