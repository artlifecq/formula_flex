package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.maze.MazeManager;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.coreData.lang.LangMaze;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import app.cmd.MazeModuleMessages;
	import app.message.MazeAllRankProto;
	import app.message.MazeHeroInfoProto;
	import app.message.MazeRankProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;
	
	public class MazeCmdListener extends BaseBean
	{
		public function MazeCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_MAZE_WILL_START,mazeWillStart);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_TRY_ENTER_DUNGEON,tryEnterDungeon);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_TRY_ENTER_DUNGEON_FAIL,tryEnterDungeonFail);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_GET_LAST_RANK,getLastRank);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_DUNGEON_INFO,dungeonInfo);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_RANK_BROADCAST,rankBroadcast);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_COLLECT_FLOOR_PRIZE,collectFloorPrize);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_COLLECT_FLOOR_PRIZE_FAIL,collectFloorPrizeFail);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_COLLECT_FLOOR_PRIZE_AND_ENTER_NEXT,collectFloorPrizeAndEnterNext);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_MAZE_END,mazeEnd);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_TRY_TRANSPORT,tryTransport);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_TRY_TRANSPORT_FAIL,tryTransportFail);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_MAZE_FINISH_RANK,mazeFinishRank);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_DUNGEON_TIME_INFO,mazeInfo);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_MAZE_BOSS_BEEN_KILLED,mazeBossBeenKilled);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_MAZE_FLOOR_COUNTRY_TOP_BROADCAT,mazeFloorCountryTopBroadcast);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_MAZE_FLOOR_TOP_BROADCAT,mazeFloorTopBroadcast);
			SocketConnection.addCmdListener(MazeModuleMessages.S2C_MAZE_SB_FLOOR_CHANGE_BROADCAT,mazeFloorChange);
			
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
			finish();
		}
		/**
		 * 有玩家层数变化了
		 *
		 * bool 上升还是下降
		 * varint32 变化层数,正值,如果下降,客户端自己改变为负值
		 * bytes 玩家名字
		 */
		private function mazeFloorChange(buffer:ByteBuffer):void
		{
			var country : int = buffer.readVarint32();
			var isup : Boolean = buffer.readBoolean();
			var floor : int = buffer.readVarint32();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			if(isup)
			{
				NoticeManager.showNotify(LangMaze.mazeUpFloorBroadcast,CountryManager.getCountryName(country),name,floor);
			}else
			{
				NoticeManager.showNotify(LangMaze.mazeLostFloorBroadcast,CountryManager.getCountryName(country),name,floor);
			}
		}
		/**
		 * 某国某人在某一层拿了个第一名
		 *
		 * varint32 玩家所属国家
		 * varint32 层数
		 * varint32 排名
		 * bytes 玩家名字
		 */
		private function mazeFloorTopBroadcast(buffer:ByteBuffer):void
		{
			var country : int = buffer.readVarint32();
			var floor:int = buffer.readVarint32();
			var rank : int = buffer.readVarint32();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			/**  [$]$成为本国第$位到达迷宫$层的勇士！ */
			NoticeManager.showNotify(LangMaze.mazePlayerGetFloorRank,
				CountryManager.getCountryName(country),
				name,
				rank,
				floor);
		}
		/**
		 * 某国某人在某一层拿了个某国第一名
		 *
		 * varint32 国家
		 * varint32 层数
		 * varint32 排名
		 * bytes 玩家名字
		 */
		private function mazeFloorCountryTopBroadcast(buffer:ByteBuffer):void
		{
			var country : int = buffer.readVarint32();
			var floor:int = buffer.readVarint32();
			var rank : int = buffer.readVarint32();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			if(country != CountryManager.getSelfCountryId())
				return;
			/**  [$]$成为第$位到达迷宫$层的勇士！获得额外经验 */
			NoticeManager.showNotify(LangMaze.mazeSelfCountryPlayerGetFloorFirst,
				CountryManager.getCountryName(country),
				name,
				rank,
				floor);
		}
		/**
		 * 地图切换缓存 
		 * 
		 */		
		private function onSwitchCmp():void
		{
			MazeManager.enterDungeonOrFloor();
			MazeManager.mazeWaitStart();
			MazeManager.mazeWaitGetPrize();
		}
		
		private function mazeBossBeenKilled(buffer:ByteBuffer):void
		{
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.showNotify(LangMaze.mazeBossBeenKill,name);
		}
		/**
		 * 迷宫信息
		 *
		 * varint64 开启时间
		 * varint64 结束时间
		 */
		private function mazeInfo(buffer:ByteBuffer):void
		{
			var startTime : Number = buffer.readVarint64();
			var endTime : Number = buffer.readVarint64();
			MazeManager.dungeonInfo(startTime,endTime);
		}
		/**
		 * 通关排名
		 *
		 * varint32 国家
		 * varint32 排名
		 */
		private function mazeFinishRank(buffer:ByteBuffer):void
		{
			var country : int = buffer.readVarint32();
			var rank : int = buffer.readVarint32();
			var playerName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			//[$]$到达迷宫20层！恭喜[$]获得迷宫第$名!开始挑战$
			NoticeManager.showNotify(LangMaze.mazeFinish,
				CountryManager.getCountryName(country),
				playerName,
				CountryManager.getCountryName(country),
				rank,
				HtmlTextUtil.getTextColor(MazeManager.getRankColor(rank),MazeManager.getRankColorName(rank)));
		}
		/**
		 * 传送失败,返回varint32错误码
		 *
		 * 1.当前已经死亡
		 * 2.击晕状态中
		 * 3.当前不在活动期间
		 * 4.没在迷宫副本中
		 * 5.未知的迷宫传送门
		 * 6.距离传送门过远
		 *
		 * 100.服务器bug
		 */
		private function tryTransportFail(buffer:ByteBuffer):void
		{
			ReqLockUtil.unlockReq(MazeModuleMessages.C2S_TRY_TRANSPORT);
			
			var fail : int = buffer.readVarint32();
			NoticeManager.showNotify("tryTransportFail"+fail);
		}
		/**
		 * 请求传送成功,等待切换场景
		 */
		private function tryTransport(buffer:ByteBuffer):void
		{
			ReqLockUtil.unlockReq(MazeModuleMessages.C2S_TRY_TRANSPORT);
			
			trace("切换成功了");
		}
		/**
		 * 迷宫副本结束了
		 *
		 *
		 * bytes MazeRankProto
		 */
		private function mazeEnd(buffer:ByteBuffer):void
		{
			var mazeAllRank : MazeRankProto= new MazeRankProto();
			var bytebuffer : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytebuffer);
			mazeAllRank.mergeFrom(bytebuffer);
			
			MazeManager.mazeEnd(mazeAllRank);
		}
		/**
		 * 领取迷宫奖励并且进入下一层,同时算是完成了
		 *
		 * varint32 领取的npc的配置id
		 */
		private function collectFloorPrizeAndEnterNext(buffer:ByteBuffer):void
		{
			var npc : int = buffer.readVarint32();
			MazeManager.collectFloorPrizeAndEnterNext(npc);
		}
		/**
		 * 领取层级奖励失败,返回varint32错误码
		 *
		 * 1.没在迷宫副本中
		 * 2.当前不在活动期间
		 * 3.已经领取奖励了
		 * 4.背包已满
		 *
		 * 100. 服务器bug
		 */
		private function collectFloorPrizeFail(buffer:ByteBuffer):void
		{
			var fail : int = buffer.readVarint32();
			NoticeManager.showNotify("collectFloorPrizeFail"+fail);
		}
		/**
		 * 领取迷宫奖励
		 *
		 * varint32 领取的npc的配置id
		 */
		private function collectFloorPrize(buffer:ByteBuffer):void
		{
			var getPrizeNpc : int = buffer.readVarint32();
			MazeManager.collectFloorPrize(getPrizeNpc);
		}
		/**
		 * 排行广播
		 *
		 * 已经压缩
		 *
		 * bytes MazeAllRankProto
		 */
		private function rankBroadcast(buffer:ByteBuffer):void
		{
			var mazeAllRank : MazeAllRankProto= new MazeAllRankProto();
			var bytebuffer : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytebuffer);
			bytebuffer.uncompress();
			mazeAllRank.mergeFrom(bytebuffer);
			MazeManager.rankBroadcast(mazeAllRank);
		}
		/**
		 * 副本信息
		 *
		 * bytes MazeHeroInfoProto
		 */
		private function dungeonInfo(buffer:ByteBuffer):void
		{
			var heroInfo : MazeHeroInfoProto = new MazeHeroInfoProto();
			heroInfo.mergeFrom(buffer);
			MazeManager.dungeonInfoChange(heroInfo);
		}
		/**
		 * 返回上次排行数据
		 *
		 * 已压缩
		 *
		 * bytes MazeAllRankProto
		 */
		private function getLastRank(buffer:ByteBuffer):void
		{
			var mazeAllRank : MazeAllRankProto= new MazeAllRankProto();
			var bytebuffer : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytebuffer);
			bytebuffer.uncompress();
			mazeAllRank.mergeFrom(bytebuffer);
			MazeManager.getLastRank(mazeAllRank);
		}
		/**
		 * 请求进入副本失败,返回varint32错误码
		 *
		 * 1.但是英雄不在普通场景中
		 * 2.你已经死了
		 * 3.功能没开启(你等级过低,还没有开启该功能)
		 * 4.当前没在活动时间
		 *
		 * 100.服务器bug
		 *
		 * 其他条件以后再加
		 */
		private function tryEnterDungeonFail(buffer:ByteBuffer):void
		{
			var fail : int = buffer.readVarint32();
			NoticeManager.showNotify("tryEnterDungeonFail"+fail);
		}
		/**
		 * 进入副本成功
		 */
		private function tryEnterDungeon(buffer:ByteBuffer):void
		{
			NoticeManager.showNotify(LangMaze.enterDungeon);
		}
		/**
		 * 迷宫即将开启
		 *
		 * varint64 开启时间
		 * varint64 结束时间
		 *
		 * varint32 召唤id 客户端在召唤结束之前,可以发送该召唤id到服务器进行传送,玩家必须开放功能FUNC_MAZE
		 * varint64 召唤结束时间
		 */
		private function mazeWillStart(buffer:ByteBuffer):void
		{
			var start : Number = buffer.readVarint64();
			var end : Number = buffer.readVarint64();
			var callId : int = buffer.readVarint32();
			var callEnd : Number = buffer.readVarint64();
			
			MazeManager.mazeWillStart(start,end,callId,callEnd);
		}
	}
}