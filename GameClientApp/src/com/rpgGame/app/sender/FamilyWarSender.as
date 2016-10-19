package com.rpgGame.app.sender
{
	import app.cmd.KingWarModuleMessages;
	import com.game.engine3D.vo.SenderReferenceSet;
	
	import app.cmd.KingWarModuleMessages;

	public class FamilyWarSender extends BaseSender
	{
		public function FamilyWarSender()
		{
			super();
		}
		private static const REQ_BID_RANK_TIME : Number = 5000;
		private static var _reqBidRank : SenderReferenceSet = new SenderReferenceSet("onReqBidRank",onReqBidRank, REQ_BID_RANK_TIME);
		/**
		 * 竞标
		 * varint64 加价
		 */	
		public static function familyWarBid(bid:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(bid);
//			send(NpcModuleMessages.C2S_ON_CLICK_NPC,_bytes);
			send(KingWarModuleMessages.C2S_KING_WAR_BID,_bytes);
		}
		
		public static function addReqGetBidRank(ref : Object) : void
		{
			_reqBidRank.addRef(ref);
		}
		
		public static function removeReqGetBidRank(ref : Object) : void
		{
			_reqBidRank.removeRef(ref);
		}
		
		private static function onReqBidRank():void
		{
			familyWarBidRank();
		}
		/**
		 * 请求竞价排名，需要的时候才来
		 */
		public static function familyWarBidRank():void
		{
			_bytes.clear();
			send(KingWarModuleMessages.C2S_KING_WAR_BID_RANK,_bytes);
		}
		/**
		 * 请求进入副本
		 */
		public static function familyWarEnterDungeon():void
		{
			_bytes.clear();
			send(KingWarModuleMessages.C2S_TRY_ENTER_KING_WAR_DUNGEON,_bytes);
		}
		/**
		 * 请求家族战副本排行，只有在圣旨那里才需要来请求，别的时候服务器都会主动推送的
		 */
		public static function familyWarDungeonRank():void
		{
			_bytes.clear();
			send(KingWarModuleMessages.C2S_KING_WAR_DUNGEON_RANK,_bytes);
		}
		/**
		 * 请求战场广播
		 */
		public static function getFamilyWarBroadcast():void
		{
			_bytes.clear();
			send(KingWarModuleMessages.C2S_KING_WAR_BROADCAST,_bytes);
		}
		/**请求王帮奖励**/
		public static function getCountryKingFamilyPrize():void
		{
			_bytes.clear();
			send(KingWarModuleMessages.C2S_COLLECT_COUNTRY_KING_GUILD_PRIZE,_bytes);
		}
	}
}