package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	

	/**
	 * 御马场、奇兽苑管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class YuMaQiShouManager
	{
		
		/** 御马场场景id **/
		public static const SCENE_ID:int = 22;
		/** 是否在活动时间内 **/
		private static var _isInActivity:Boolean;
		
		public function YuMaQiShouManager()
		{
			
		}
		
		/**
		 * 在御马场场景，并且在活动时间内 
		 * @return 
		 * 
		 */		
		public static function isInBiMaWenActivity():Boolean
		{
			return ( isInYuMaChangScene() && isInActivity);
		}
		
		/**
		 * 是否在御马场场景 
		 * @return 
		 * 
		 */		
		public static function isInYuMaChangScene():Boolean
		{
			var selfSceneId:int = MainRoleManager.actorInfo.mapID;
			return selfSceneId == SCENE_ID;
		}

		/** 是否在活动时间内 **/
		public static function get isInActivity():Boolean
		{
			return _isInActivity;
		}

		/**
		 * @private
		 */
		public static function set isInActivity(value:Boolean):void
		{
			_isInActivity = value;
		}

	}
}