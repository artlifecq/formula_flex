package com.rpgGame.app.cmdlistener.familyWar
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.familyWar.FamilyWarManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangFamilyWar;
	
	import flash.utils.ByteArray;
	
	import app.cmd.KingWarModuleMessages;
	import app.message.KingWarBroadcastProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 * 王城战 
	 * @author Mandragora
	 * 
	 */
	public class FamilyWarCmdListener extends BaseBean
	{
		public function FamilyWarCmdListener()
		{
		}
		
		override public function start():void
		{
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_BID,onFamilyWarBid);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_STATUS,onFamilyWarStatus);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_BID_FAIL,onFamilyWarBidFail);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_BID_END_TIME_CHANGED_BROADCAST,onFamilyWarEndTimeChange);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_BID_END_BROADCAST,onFamilyWarBroadcast);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_BID_RANK,onFamilyWarBidRank);
//			SocketConnection.addCmdListener(FamilyWarModuleMessages.S2C_KING_CHANGED,onKingChange);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_TRY_ENTER_KING_WAR_DUNGEON,onEnterFamilyWarDungeon);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_TRY_ENTER_KING_WAR_DUNGEON_FAIL,onEnterFamilyWarDungeonFail);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_DUNGEON_INFO,onFamilyWarDungeonInfo);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_DUNGEON_RANK,onFamilyWarDungeonRank);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_DUNGEON_RANK_FAIL,onFamilyWarDungeonRankFail);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_DUNGEON_STATUS,onFamilyWarDungeonStatus);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_SCENE,onFamilyWarSceneBroadcast);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_SCENE_BROADCAST,onFamilyWarSceneoneBroadcast);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_WORLD_BROADCAST,onFamilyWarWordBroadcast);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_BROADCAST_FAIL,onFamilyWarSceneBroadcastFail);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_DUNGEON_END,onFamilyWarDungeonEnd);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_KING_WAR_CAN_RELIVE_TIME_CHANGED,onFamilyWarCanReliveTimeChange);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_COLLECT_COUNTRY_KING_GUILD_PRIZE,onGetKingFamilyPrize);
			SocketConnection_protoBuffer.addCmdListener(KingWarModuleMessages.S2C_COLLECT_COUNTRY_KING_GUILD_PRIZE_FAIL,onGetKingFamilyPrizeFail);
			
			finish();
		}
		
		/**
		 * proto:
		 *
		 *      KING_WAR_config.proto
		 *      KING_WAR_client.proto
		 *
		 * ----------------------------------------
		 *
		 * 家族战状态，已压缩，上线时，会推送一次，去锁
		 *
		 * varint64 本次竞标开始时间
		 * 根据这个，客户端计算本次王城战开始时间，本次王城战结束时间
		 * varint64 本次竞标结束时间
		 *
		 * varint64 本次竞标底价
		 *
		 * bool 竞标结束了
		 *
		 * if(竞标结束了){
		 *      上次竞标前几名
		 *      while(buffer.readable()){
		 *          UTF8 帮派名
		 *      }
		 *
		 *      读取帮派名以后，加入列表
		 *
		 *      列表长度为1，进攻帮派是该帮派，防守帮派是国王所在帮派
		 *      列表长度为2，进攻帮派是第二个，防守帮派是第一个
		 *      其他，进攻帮派无，防守帮派是国王所在帮派
		 * }
		 *
		 */
		private function onFamilyWarStatus(buffer:ByteBuffer):void
		{
			FamilyWarManager.initFamilyWar(buffer);
		}
		/**
		 * 领取失败，返回varint32 错误码
		 *
		 * 1. 不是王帮成员
		 * 2. 已经领取过了
		 * 3. 背包空间不够
		 */
		private function onGetKingFamilyPrizeFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LanguageConfig.getText(LangFamilyWar.GetKingFamilyPrizeFail_1);
					break;
				case 2:
					msg = LanguageConfig.getText(LangFamilyWar.GetKingFamilyPrizeFail_2);
					break;
				case 3:
					msg = LanguageConfig.getText(LangFamilyWar.GetKingFamilyPrizeFail_3);
					break;
			}
			NoticeManager.showNotify(msg);
		}
		/**
		 * 领取成功
		 */
		private function onGetKingFamilyPrize(buffer:ByteBuffer):void
		{
			
		}
		
		/**
		 * 复活时间变更了
		 *
		 * varint64 复活cd结束时间，当当前时间<该事件时，客户端倒计时
		 */
		private function onFamilyWarCanReliveTimeChange(buffer:ByteBuffer):void
		{
			var reliveTime : Number= buffer.readVarint64();
			FamilyWarManager.reliveTimeChange(reliveTime);
		}
		/**
		 * 家族战结束
		 *
		 * varint32 国家
		 *
		 * varint64 下次比赛开始时间，该时间可以计算出竞标开始时间、下次竞标结束时间、王城战下次结束时间
		 *
		 * UTF8 进攻方帮派名，可能长度为0，根据这个名字显示玩家是不是可以来查看战报什么的
		 * UTF8 防守方帮派名，可能长度为0，根据这个名字显示玩家是不是可以来查看战报什么的
		 *
		 * UTF8 胜利的帮派名，可能长度为0
		 * bytes 胜利的帮派帮主，可能长度为0
		 */
		private function onFamilyWarDungeonEnd(buffer:ByteBuffer):void
		{
			var country : int = buffer.readVarint32();
			var next : Number = buffer.readVarint64();
			var jinGong : String = buffer.readUTF();
			var fangshou : String = buffer.readUTF();
			var win : String = buffer.readUTF();
			var winBoss : String = buffer.readUTFBytes(buffer.bytesAvailable);
			FamilyWarManager.familyWarEnd(country,next,jinGong,fangshou,win,winBoss);
		}
		/**
		 * 请求战场广播返回varint32错误码
		 *
		 * 1. 没有帮派
		 * 2. 当前没有广播可以请求
		 */
		private function onFamilyWarSceneBroadcastFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarSceneBroadcastFail_1);
					break;
				case 2:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarSceneBroadcastFail_2);
					break;
			}
			NoticeManager.showNotify(msg);
		}
		/**
		 * 战场广播返回，压缩
		 *
		 * while(buffer.readable()){
		 *      varint32 后面数据的长度
		 *      bytes KingWarBroadcastProto
		 * }
		 */
		private function onFamilyWarSceneBroadcast(buffer:ByteBuffer):void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var len : int;
			var datas : Array = [];
			while(bytes.bytesAvailable)
			{
				var temp : ByteArray = new ByteArray();
				len = bytes.readVarint32();
				bytes.readBytes(temp,0,len);
//				temp.writeBytes(bytes,0,len);
				var data : KingWarBroadcastProto = new KingWarBroadcastProto();
				data.mergeFrom(temp);
				datas.push(data);
			}
			FamilyWarManager.getAllSceneBroadcast(datas);
		}
		/**
		 * 世界广播
		 *
		 * bytes 解析成 KingWarBroadcastProto
		 */
		private function onFamilyWarWordBroadcast(buffer:ByteBuffer):void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var data : KingWarBroadcastProto = new KingWarBroadcastProto();
			data.mergeFrom(bytes);
			FamilyWarManager.addOneSceneBroadcast(data);
		}
		/**压缩  解析成 KingWarBroadcastProto**/
		private function onFamilyWarSceneoneBroadcast(buffer:ByteBuffer):void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var data : KingWarBroadcastProto = new KingWarBroadcastProto();
			data.mergeFrom(bytes);
			FamilyWarManager.addOneSceneBroadcast(data);
		}
		
		/**
		 * 副本状态
		 *
		 * varint64 进攻方积分
		 * varint64 防守方积分
		 *
		 * while(buffer.readable()){
		 *      varint32 怪物配置id
		 *      UTF8 怪物所属帮派名，为空表示中立
		 *      varint32 怪物血量百分比
		 * }
		 */
		private function onFamilyWarDungeonStatus(buffer:ByteBuffer):void
		{
			FamilyWarManager.dungeonStatusChange(buffer);
		}
		/**
		 * 家族战副本排行错误码
		 *
		 * 1. 没有帮派
		 * 2. 当前没有排行榜可以请求
		 */
		private function onFamilyWarDungeonRankFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarDungeonRankFail_1);
					break;
				case 2:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarDungeonRankFail_2);
					break;
			}
			NoticeManager.showNotify(msg);
		}
		/**
		 * 杀人排行榜，已经压缩，附带排行榜数据
		 *
		 * while(buffer.readable()){
		 *      UTF8 英雄名称
		 *      UTF8 所属帮派名
		 *      varint64 杀人数
		 * }
		 */
		private function onFamilyWarDungeonRank(buffer:ByteBuffer):void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			FamilyWarManager.updateDungeonRank(bytes);
		}
		
		/**
		 * 副本信息，进入副本就会发送
		 *
		 * varint64 战斗开始时间，在此之前不可以移动，不可以放技能
		 * varint64 战斗结束时间
		 *
		 * UTF8 进攻方帮派名
		 * bytes 防守方帮派名
		 */
		private function onFamilyWarDungeonInfo(buffer:ByteBuffer):void
		{
			var start : Number = buffer.readVarint64();
			FamilyWarManager.warStartTimeChange(start);
			var endTime : Number = buffer.readVarint64();
			FamilyWarManager.warEndTimeChange(endTime);
			var jingong : String = buffer.readUTF();
			var fangShou : String = buffer.readUTFBytes(buffer.bytesAvailable);
			FamilyWarManager.updateFamilyWarBroadcast(jingong,fangShou);
		}
		/**
		 * 进入失败，返回varint32错误码
		 *
		 * 1. 不属于进攻方/防守方
		 * 2. 当前未开启
		 * 3. 当前已经死亡了
		 * 4. 没在普通场景中
		 * 5. 战斗状态中
		 * 6. 当前没到复活时间
		 */
		private function onEnterFamilyWarDungeonFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LanguageConfig.getText(LangFamilyWar.EnterFamilyWarDungeonFail_1);
					break;
				case 2:
					msg = LanguageConfig.getText(LangFamilyWar.EnterFamilyWarDungeonFail_2);
					break;
				case 3:
					msg = LanguageConfig.getText(LangFamilyWar.EnterFamilyWarDungeonFail_3);
					break;
				case 4:
					msg = LanguageConfig.getText(LangFamilyWar.EnterFamilyWarDungeonFail_4);
					break;
				case 5:
					msg = LanguageConfig.getText(LangFamilyWar.EnterFamilyWarDungeonFail_5);
					break;
				case 6:
					msg = LanguageConfig.getText(LangFamilyWar.EnterFamilyWarDungeonFail_6);
					break;
			}
			NoticeManager.showNotify(msg);
		}
		/**
		 * 进入副本成功
		 */
		private function onEnterFamilyWarDungeon(buffer:ByteBuffer):void
		{
			trace("进入副本成功，可能需要打开某些面板");
//			AppManager.showApp(AppConstant.KING_WAR_DUNGEON_INFO_PANEL);
//			AppManager.showApp(AppConstant.KING_WAR_DUNGEON_KILL_RANK_PANEL);
		}
		
//		private function onKingChange(buffer:ByteBuffer):void
//		{
//			var oldKing : String = buffer.readUTF();
//			var newKing: String = buffer.readUTF();
//			FamilyWarManager.kingChange(oldKing,newKing);
//		}
		
		/**
		 * 请求竞价排名失败，返回varint32错误码
		 *
		 * 1. 没有加入家族
		 * 2. 没有权限
		 * 3. 当前没在竞标阶段
		 */
		private function onFamilyWarBidRankFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidRankFail_1);
					break;
				case 2:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidRankFail_2);
					break;
				case 3:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidRankFail_3);
					break;
			}
			NoticeManager.showNotify(msg);
		}
		
		/**
		 * 返回竞价排名，已经压缩，第一个就是第一名，第二个就是第二名
		 *
		 * while(buffer.readable()){
		 *      UTF8 帮派名
		 *      varint64 出价
		 * }
		 */
		private function onFamilyWarBidRank(buffer:ByteBuffer):void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			FamilyWarManager.updateBidRank(bytes);
		}
		
		/**
		 * 竞标结束广播
		 *
		 * varint64 下次竞标的起始价格
		 *
		 * 竞标前几名
		 * while(buffer.readable()){
		 *     UTF8 帮派名
		 * }
		 *
		 * 读取帮派名以后，加入列表
		 *
		 * 列表长度为1，进攻帮派是该帮派，防守帮派是国王所在帮派
		 * 列表长度为2，进攻帮派是第二个，防守帮派是第一个
		 * 其他，进攻帮派无，防守帮派是国王所在帮派
		 *
		 */
		private function onFamilyWarBroadcast(buffer:ByteBuffer):void
		{
			var arr : Array = [];
			var bidMin : Number = buffer.readVarint64();
			FamilyWarManager.setBidMin(bidMin);
			while(buffer.bytesAvailable)
			{
				arr.push(buffer.readUTF());
			}
			FamilyWarManager.bidEndUpdateFamilyWar(arr);
			
		}
		
		/**
		 * 竞标成功导致竞标结束时间变更的广播，如果需要提示，就提示，不需要，修改S2C_KING_WAR_STATUS返回的数据
		 *
		 * varint64 新的本次竞标结束时间
		 */
		private function onFamilyWarEndTimeChange(buffer:ByteBuffer):void
		{
			var endTime : Number = buffer.readVarint64();
			FamilyWarManager.endTimeChange(endTime);
		}
		/**
		 * 竞标失败，返回varint32错误码
		 *
		 * 1. 没有加入家族
		 * 2. 没有权限
		 * 3. 当前无法竞标
		 * 4. 竞标的建设令牌一次太少了
		 * 5. 帮派建设令牌不够
		 * 6. 帮主等级不够
		 * 7. 王帮无法竞标
		 */
		private function onFamilyWarBidFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidFail_1);
					break;
				case 2:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidFail_2);
					break;
				case 3:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidFail_3);
					break;
				case 4:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidFail_4);
					break;
				case 5:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidFail_5);
					break;
				case 6:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidFail_6);
					break;
				case 7:
					msg = LanguageConfig.getText(LangFamilyWar.FamilyWarBidFail_7);
					break;
			}
			NoticeManager.showNotify(msg);
		}
		/**
		 * 竞标成功
		 *
		 * varint64 新的总共出价
		 * varint32 新的排名
		 *
		 * if(buffer.readable()){
		 *      varint64 新的本次竞标结束时间
		 * }
		 */
		private function onFamilyWarBid(buffer:ByteBuffer):void
		{
			var count : Number = buffer.readVarint64();
			var rank : int = buffer.readVarint32();
			FamilyWarManager.updateBid(count,rank);
			if(buffer.bytesAvailable)
			{
				var endTime : Number = buffer.readVarint64();
				FamilyWarManager.endTimeChange(endTime);
			}
			GuildSender.getGuildBaseData();
		}
	}
}