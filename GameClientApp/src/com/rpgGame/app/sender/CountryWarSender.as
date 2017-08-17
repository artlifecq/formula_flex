package com.rpgGame.app.sender
{
	import flash.utils.ByteArray;

	/**
	 * 国战发送协议
	 * @author GuoDong.Zhang
	 * 
	 */
	public class CountryWarSender extends BaseSender
	{
		private static var _countryWarDetailReqed : Boolean = false;

		public function CountryWarSender()
		{
		}

		public static function get countryWarDetailReqed() : Boolean
		{
			return _countryWarDetailReqed;
		}

		/**
		 * 国战宣战
		 */
		public static function reqCountryWarInfo(targetCountryID : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(targetCountryID);
//			send(CountryWarModuleMessages.C2S_COUNTRY_WAR_DECLARE_WAR, _bytes);
		}

		/**
		 * 请求国战详细信息
		 */
		public static function reqCountryWarDetail() : void
		{
			_bytes.clear();
//			send(CountryWarModuleMessages.C2S_GET_COUNTRY_WAR_DETAIL, _bytes);
			_countryWarDetailReqed = true;
		}
		
		/**
		 * 参战,要求玩家必须开启功能FunctionType.FUNC_COUNTRY_WAR
		 */
		public static function reqJoinCountryWar(bytes:ByteArray) : void
		{
			_bytes.clear();
			_bytes.writeBytes(bytes);
//			send(CountryWarModuleMessages.C2S_JOIN_COUNTRY_WAR, _bytes);
		}
		
		/**
		 * 请求下本人的战车
		 */
		public static function reqDownFromZhanChe() : void
		{
			_bytes.clear();
//			send(CountryWarModuleMessages.C2S_DOWN_FROM_ZHAN_CHE, _bytes);
		}
		
		/**
		 * 搭乘车
		 */
		public static function reqOldDriverTakeMe(oldDriverID:Number) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(oldDriverID);
//			send(CountryWarModuleMessages.C2S_OLD_DRIVER_TAKE_ME, _bytes);
		}
		
		/**
		 * 我要下车
		 */
		public static function reqOldDriverLetMeLeave() : void
		{
			_bytes.clear();
//			send(CountryWarModuleMessages.C2S_OLD_DRIVER_LET_ME_LEAVE, _bytes);
		}
		
		/**
		 * 国战支持
		 */
		public static function reqSupport() : void
		{
			_bytes.clear();
//			send(CountryWarModuleMessages.C2S_SUPPORT, _bytes);
		}
		
		/**
		 * 进入观战的场景
		 */
		public static function reqEnterWatchScene(sceneID:int,countryID:int,targetRoleID:Number = 0) : void
		{
			trace("!!!!!!!!!reqEnterWatchScene:sceneID=",sceneID,"countryID=",countryID,"targetRoleID=",targetRoleID);
			_bytes.clear();
			_bytes.writeVarint32(sceneID);
			_bytes.writeVarint32(countryID);
			if(targetRoleID > 0)
			{
				_bytes.writeVarint64(targetRoleID);
			}
//			send(CountryWarModuleMessages.C2S_ENTER_WATCH_SCENE, _bytes);
		}
		
		/**
		 * 请求离开观战场景
		 */
		public static function reqLeaveWatchScene() : void
		{
			_bytes.clear();
//			send(CountryWarModuleMessages.C2S_LEAVE_WATCH_SCENE, _bytes);
		}
		
		/**
		 * 变更观战位置以及观战的人
		 * 传坐标时ID设为0即可
		 */
		public static function reqChangeWatchPos(targetRoleID:Number,tx:int = 0,ty:int = 0) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(targetRoleID);
			if(targetRoleID == 0)
			{
				_bytes.writeVarint32(tx);
				_bytes.writeVarint32(ty);
			}
//			send(CountryWarModuleMessages.C2S_CHANGE_WATCH_POS, _bytes);
		}
		
		/**
		 * 我想知道某个官员人在哪个位置
		 */
		public static function reqGetHeroPosition(targetRoleID:Number) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(targetRoleID);
//			send(CountryWarModuleMessages.C2S_GET_HERO_POSITION, _bytes);
		}
		
		/**
		 * 开启或者关闭弹幕
		 */
		public static function reqTryOpenOrCloseDanMu(isOpen:Boolean) : void
		{
			_bytes.clear();
			_bytes.writeBoolean(isOpen);
//			send(CountryWarModuleMessages.C2S_TRY_OPEN_OR_CLOSE_DAN_MU, _bytes);
		}
		
		/**
		 * 尝试发送弹幕
		 */
		public static function reqSendDanMu(content:String) : void
		{
			_bytes.clear();
			_bytes.writeUTFBytes(content);
//			send(CountryWarModuleMessages.C2S_SEND_DAN_MU, _bytes);
		}
		
		/**
		 * 请求被观战的国家的官员,请求不要过于频繁,cd5秒
		 */
		public static function reqGetWatchWarCountryOffice():void
		{
			_bytes.clear();
//			send(CountryWarModuleMessages.C2S_GET_WATCH_WAR_COUNTRY_OFFICE, _bytes);
		}
		
	}
}
