package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.HeroSearchManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.heroSearch.HeroSearchData;

	import app.cmd.SearchByHeroNameModuleMessages;

	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	public class HeroSearchCmdListener extends BaseBean
	{
		public function HeroSearchCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection_protoBuffer.addCmdListener(SearchByHeroNameModuleMessages.S2C_SEARCH_ERROR, searchError);
			SocketConnection_protoBuffer.addCmdListener(SearchByHeroNameModuleMessages.S2C_SEARCH_SUCCESS, searchSuccess);
			SocketConnection_protoBuffer.addCmdListener(SearchByHeroNameModuleMessages.S2C_SEARCH_HERO_ID_BY_NAME_FAIL, searchHeroError);
			SocketConnection_protoBuffer.addCmdListener(SearchByHeroNameModuleMessages.S2C_SEARCH_HERO_ID_BY_NAME, searchHeroSuccess);

			finish();
		}

		/**
		 * 搜索失败. 不管是只搜离线或者只搜在线, 如果错误, 都是返回这条消息, 附带varint32 错误码
		 *
		 * 1. 发来的字符不符合条件 (空或者大于7个字符)
		 * 2. 频率过快 (仅测试用, 返回个错误码. 正式的时候过快就踢掉)
		 * 3. 服务器内部错误. 不要主动重试, 就提示玩家, 让玩家过会手动再重试. 出这个错时, 也需要等待1秒才能再请求
		 */
		private function searchError(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			switch (failID)
			{
				case 1:
					NoticeManager.showHint(EnumHintInfo.HERO_SEARCH_FAIL1);
					break;
				case 2:
					NoticeManager.showHint(EnumHintInfo.HERO_SEARCH_FAIL2);
					break;
				case 3:
					NoticeManager.showHint(EnumHintInfo.HERO_SEARCH_FAIL3);
					break;
			}
		}

		/**
		 * 根据英雄名字查询英雄ID失败，附带byte错误码
		 * 1. 发来的字符不符合条件 (空或者大于7个字符)
		 * 2. 频率过快 (仅测试用, 返回个错误码. 正式的时候过快就踢掉)
		 * 3. 服务器内部错误. 不要主动重试, 就提示玩家, 让玩家过会手动再重试. 出这个错时, 也需要等待1秒才能再请求
		 */
		private function searchHeroError(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			switch (failID)
			{
				case 1:
					NoticeManager.showHint(EnumHintInfo.HERO_SEARCH_FAIL1);
					break;
				case 2:
					NoticeManager.showHint(EnumHintInfo.HERO_SEARCH_FAIL2);
					break;
				case 3:
					NoticeManager.showHint(EnumHintInfo.HERO_SEARCH_FAIL3);
					break;
			}
		}

		private var _heroSearchDatas : Vector.<HeroSearchData> = null;

		/**
		 * 返回搜索结果. 不管是只搜离线或者只搜在线, 都是返回这条消息
		 *
		 * 读取方法
		 *
		 * varint32 客户端类型
		 *
		 * bool 是否还有更多没返回 (如果是false, 表示所有名字中带这个字符的都在这条消息里了)
		 *
		 * while(byteArray.available){
		 *  varint64 id
		 *  UTF 名字
		 *
		 *  var levelAndOnline:int = byteArray.readVarint32();
		 *
		 *  var isOnline:Boolean = (levelAndOnline & 0x1) == 1; // 是否在线
		 *  var level:int = levelAndOnline >>> 1; // 等级     *
		 *
		 *  varint32 玩家所属国家
		 * }
		 */
		private function searchSuccess(buffer : ByteBuffer) : void
		{
			var reqType : int = buffer.readVarint32();
			var hasMore : Boolean = buffer.readBoolean();
			if (!_heroSearchDatas)
				_heroSearchDatas = new Vector.<HeroSearchData>();
			var heroData : HeroSearchData;
			var levelAndOnline : int;
			while (buffer.bytesAvailable)
			{
				heroData = new HeroSearchData();
				heroData.heroId = buffer.readVarint64();
				heroData.heroName = buffer.readUTF();

				levelAndOnline = buffer.readVarint32();
				heroData.isOnline = (levelAndOnline & 0x1) == 1; // 是否在线
				heroData.level = levelAndOnline >>> 1; // 等级
				heroData.countryId = buffer.readVarint32();
				_heroSearchDatas.push(heroData);
			}
			if (!hasMore)
			{
				HeroSearchManager.searchSuccess(reqType, _heroSearchDatas);
				_heroSearchDatas = null;
			}
		}

		/**
		 * 根据英雄名字查询英雄ID成功
		 * varint32 客户端类型
		 * 后面没有数据可以读，书名搜不到
		 * while(byteArray.available){
		 *      varint64 英雄ID，0表示英雄不存在
		 *      varint32 国家ID (英雄ID=0时表示不存在就不发此数据)
		 * }
		 */
		private function searchHeroSuccess(buffer : ByteBuffer) : void
		{
			var reqType : int = buffer.readVarint32();

			var heroSearchDatas : Vector.<HeroSearchData> = new Vector.<HeroSearchData>;
			var heroData : HeroSearchData;
			while (buffer.bytesAvailable)
			{
				var heroId : Number = buffer.readVarint64();
				if (heroId > 0)
				{
					heroData = new HeroSearchData();
					heroData.heroId = heroId;
					heroData.countryId = buffer.readVarint32();
					heroSearchDatas.push(heroData);
				}
			}

			HeroSearchManager.searchSuccess(reqType, heroSearchDatas);
		}
	}
}
