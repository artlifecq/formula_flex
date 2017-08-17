package com.rpgGame.app.sender
{
	

	public class HeroSearchSender extends BaseSender
	{
		/**
		 * 根据名字模糊搜索玩家. 需要包含离线玩家.
		 * 客户端需要限制1秒钟只能搜索1次(包括只搜索在线玩家). 且是从服务器返回了之后开始计时. 不然踢掉
		 * 返回错误不算, 可以马上再发
		 *
		 * 附带
		 * varint32 客户端类型
		 * boolean true(本国)/false(他国)
		 * UTFBytes 名字 (需要已经前后去空, 并且不能为空. 长度限制7个字符(中英文都算一个字符))
		 */
		public static function searchWithOffline(reqType : int, name : String,isMyCountry:Boolean = true) : void
		{
//			if (ReqLockUtil.isReqLocked(SearchByHeroNameModuleMessages.C2S_SEARCH_WITH_OFFLINE))
//				return;
//			ReqLockUtil.lockReq(SearchByHeroNameModuleMessages.C2S_SEARCH_WITH_OFFLINE, 1000);

			_bytes.clear();
			_bytes.writeVarint32(reqType);
			_bytes.writeBoolean(isMyCountry);
			_bytes.writeUTFBytes(name);
//			SocketConnection_protoBuffer.send(SearchByHeroNameModuleMessages.C2S_SEARCH_WITH_OFFLINE, _bytes);
		}

		/**
		 * 同上, 不包含离线玩家
		 * 不包含离线玩家的请求. 队伍模块使用
		 */
		public static function searchWithoutOffline(reqType : int, name : String,isMyCountry:Boolean = true) : void
		{
//			if (ReqLockUtil.isReqLocked(SearchByHeroNameModuleMessages.C2S_SEARCH_WITHOUT_OFFLINE))
//				return;
//			ReqLockUtil.lockReq(SearchByHeroNameModuleMessages.C2S_SEARCH_WITHOUT_OFFLINE, 1000);

			_bytes.clear();
			_bytes.writeVarint32(reqType);
			_bytes.writeBoolean(isMyCountry);
			_bytes.writeUTFBytes(name);
//			SocketConnection_protoBuffer.send(SearchByHeroNameModuleMessages.C2S_SEARCH_WITHOUT_OFFLINE, _bytes);
		}

		public static function searchHeroIdByName(reqType : int, name : String) : void
		{
//			if (ReqLockUtil.isReqLocked(SearchByHeroNameModuleMessages.C2S_SEARCH_HERO_ID_BY_NAME))
//				return;
//			ReqLockUtil.lockReq(SearchByHeroNameModuleMessages.C2S_SEARCH_HERO_ID_BY_NAME, 1000);

			_bytes.clear();
			_bytes.writeVarint32(reqType);
			_bytes.writeUTFBytes(name);
//			SocketConnection_protoBuffer.send(SearchByHeroNameModuleMessages.C2S_SEARCH_HERO_ID_BY_NAME, _bytes);
		}
	}
}
