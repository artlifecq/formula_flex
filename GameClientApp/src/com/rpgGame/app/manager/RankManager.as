package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.RankEvent;
	import com.rpgGame.coreData.info.rank.BossHurtRankItemData;
	
	import app.message.MonsterHurtRankType;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 排行榜管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-01 上午10:05:12
	 *
	 */
	public class RankManager
	{
		/** 怪物id **/
		private static var _currBossId : Number = 0;
		/** 自己排名 **/
		private static var _selfRankIndex : int = 0;
		/** 自己伤害量 **/
		private static var _selfHurtCount : Number = 0;
		/** 所有伤害排行数据 **/
		private static var _personalHurtRankList : Array = [];

		public function RankManager()
		{
		}

		/**
		 * 怪物伤害排行更新，服务器定时主动推送 
		 * varint64 怪物id
		 * varint32 怪物配置id
		 * varint32 怪物掉落类型 MonsterHurtRankType，不同类型读取不同的数据 
		 * @param buffer
		 * 
		 */		
		public static function setPlunderHurtRank(buffer : ByteBuffer) : void
		{
			_currBossId = buffer.readVarint64();
			var monsterCfgId : int = buffer.readVarint32();
			var dropType : int = buffer.readVarint32();
			switch (dropType)
			{
				case MonsterHurtRankType.RANK_PERSONAL:
					var rankIndex : int = 0;
					var maxHurt : int = 0;
					_personalHurtRankList = [];
					_personalHurtRankList.length = 0;
					while (buffer.bytesAvailable > 0)
					{
						rankIndex++;
						var heroId : Number = buffer.readVarint64();
						var heroName : String = buffer.readUTF();
						var hurtCount : Number = buffer.readVarint64();
						if (rankIndex == 1)
						{
							maxHurt = hurtCount;
						}
						var itemData : BossHurtRankItemData = new BossHurtRankItemData();
						itemData.rankIndex = rankIndex;
						itemData.heroName = heroName;
						itemData.maxHurt = maxHurt;
						itemData.currHurt = hurtCount;
						itemData.id = heroId;
						_personalHurtRankList.push(itemData);
					}
//					AppManager.showAppNoHide(AppConstant.BOSS_HURT_RANK_PANEL);
					break;
				case MonsterHurtRankType.RANK_TEAM:
					while (buffer.bytesAvailable > 0)
					{
					}
					break;
				case MonsterHurtRankType.RANK_FAMILY:
					while (buffer.bytesAvailable > 0)
					{
					}
					break;
				case MonsterHurtRankType.RANK_COUNTRY:
					while (buffer.bytesAvailable > 0)
					{
					}
					break;
			}
			EventManager.dispatchEvent(RankEvent.PLUNDER_HURT_RANK_CHANGE);
		}

		/**
		 * 怪物伤害排行更新
		 * varint64 怪物id
		 * varint64 伤害量
		 *
		 * 客户端收到这个消息时，如果还没有收到怪物排行榜更新消息，此时客户端保存这个值
		 * 当怪物排行榜面板出现时，展示这个值
		 */		
		public static function setPlunderHurtRankSelfAmount(buffer : ByteBuffer) : void
		{
			var bossId : Number = buffer.readVarint64();
			if (bossId == _currBossId)
			{
				_selfHurtCount = buffer.readVarint64();
				EventManager.dispatchEvent(RankEvent.PLUNDER_HURT_RANK_SELF_AMOUNT_CHANGE);
			}
		}

		/**
		 * 重置伤害排行榜，客户端收到此消息，重置排行榜数据
		 * varint64 怪物id
		 *
		 * 怪物失去目标时，发送此消息
		 */
		public static function resetBossHurtRank(buffer : ByteBuffer) : void
		{
			var bossId : Number = buffer.readVarint64();
			if (bossId == _currBossId)
			{
				_currBossId = 0;
				_personalHurtRankList = [];
				_personalHurtRankList.length = 0;
				_selfRankIndex = 0;
				_selfHurtCount = 0;
				EventManager.dispatchEvent(RankEvent.PLUNDER_HURT_RANK_CHANGE);
				EventManager.dispatchEvent(RankEvent.PLUNDER_HURT_RANK_SELF_AMOUNT_CHANGE);
//				AppManager.hideApp(AppConstant.BOSS_HURT_RANK_PANEL);
			}
		}

		/**
		 * 获取伤害排行数据 
		 * @return 
		 * 
		 */		
		public static function get personalHurtRankList() : Array
		{
			return _personalHurtRankList;
		}

		/**
		 * 获取自己的排名 
		 * @return 
		 * 
		 */		
		public static function get selfRankIndex() : int
		{
			var arr:Array = personalHurtRankList;
			if( arr == null || arr.length <= 0 )
				return _selfRankIndex;
			
			for each (var itemData:BossHurtRankItemData in arr) 
			{
				if( itemData.id != MainRoleManager.actorID )
					continue;
				_selfRankIndex = itemData.rankIndex;
			}
			
			return _selfRankIndex;
		}

		/**
		 * 获取自己对怪物造成的伤害量
		 * @return 
		 * 
		 */		
		public static function get selfHurtCount() : Number
		{
			return _selfHurtCount;
		}
	}
}
