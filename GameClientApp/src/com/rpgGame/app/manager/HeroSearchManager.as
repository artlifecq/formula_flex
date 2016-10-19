package com.rpgGame.app.manager
{
	import com.rpgGame.app.sender.HeroSearchSender;
	import com.rpgGame.app.ui.main.chat.ChatUtil;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.events.SearchHeroEvent;
	import com.rpgGame.coreData.info.heroSearch.HeroSearchData;
	
	import app.cmd.SearchByHeroNameModuleMessages;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 按名字搜索
	 * @author 卢国征
	 *
	 */
	public class HeroSearchManager
	{
		/**最近一次搜索到英雄**/
		public static var curSearchHeroData : Vector.<HeroSearchData> = new Vector.<HeroSearchData>;
		public static var curReqType : int = 0;

		public function HeroSearchManager()
		{
		}

		/**
		 * 根据名字模糊搜索玩家. 需要包含离线玩家.
		 * 客户端需要限制1秒钟只能搜索1次(包括只搜索在线玩家). 且是从服务器返回了之后开始计时. 不然踢掉
		 * 返回错误不算, 可以马上再发
		 * 附带
		 * UTFBytes 名字 (需要已经前后去空, 并且不能为空. 长度限制14个字节(中文2字节, 英文1字节))
		 */
		public static function searchWithOffline(reqType : int, name : String) : void
		{
			name = ChatUtil.trim(name); //去空格
			name = ChatUtil.getStrByByteLen(name, 14); //限制长度

			if (name == "")
				return;

			HeroSearchSender.searchWithOffline(reqType, name);
		}

		/**
		 * 同上, 不包含离线玩家
		 * 不包含离线玩家的请求. 队伍模块使用
		 */
		public static function searchWithoutOffline(reqType : int, name : String,isOnlyMyCounry:Boolean = true) : void
		{
			name = ChatUtil.trim(name); //去空格
			name = ChatUtil.getStrByByteLen(name, 14); //限制长度

			if (name == "")
				return;

			HeroSearchSender.searchWithoutOffline(reqType, name,isOnlyMyCounry);
		}

		/**
		 * 搜索成功后
		 * @param heroSearchDatas
		 *
		 */
		public static function searchSuccess(reqType : int, heroSearchDatas : Vector.<HeroSearchData>) : void
		{
			curSearchHeroData = heroSearchDatas;
			curReqType = reqType;
			
			EventManager.dispatchEvent(SearchHeroEvent.SEARCH_SUCCESS);

			ReqLockUtil.lockReq(SearchByHeroNameModuleMessages.C2S_SEARCH_WITH_OFFLINE, 1000);
			ReqLockUtil.lockReq(SearchByHeroNameModuleMessages.C2S_SEARCH_WITHOUT_OFFLINE, 1000);
		}

		public static function getHeroID(heroName:String):Number
		{
			if(curSearchHeroData)
			{
				var len : int = curSearchHeroData.length;
				var listItemData : HeroSearchData;
				for (var i : int = 0; i < len; i++)
				{
					listItemData = curSearchHeroData[i];
					if(listItemData.heroName == heroName)
					{
						return listItemData.heroId;
					}
				}
			}
			return 0;
		}
		
	}
}
