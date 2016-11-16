package com.rpgGame.app.cmdlistener.scene
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangStoryDungeon;

	import app.cmd.StoryModuleMessages;

	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 剧情副本消息侦听
	 * @author L.L.M.Sunny
	 * 创建时间：2016-7-22 下午1:50:25
	 *
	 */
	public class StoryDungeonCmdListener extends BaseBean
	{
		public function StoryDungeonCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection_protoBuffer.addCmdListener(StoryModuleMessages.S2C_STORY_FAIL_MSG, onStoryFailMsg);
			SocketConnection_protoBuffer.addCmdListener(StoryModuleMessages.S2C_TRY_ENTER_STORY_DUNGEON, onTryEnterStoryDungeon);
			SocketConnection_protoBuffer.addCmdListener(StoryModuleMessages.S2C_FROZEN_DUNGEON, onFrozenDungeon);
			SocketConnection_protoBuffer.addCmdListener(StoryModuleMessages.S2C_DUNGEON_END, onDungeonEnd);
			//
			finish();
		}

		/**
		 * 通用的剧情副本失败消息
		 *
		 * 1.当前已经死亡
		 * 2.没在普通场景
		 * 3.没找到目标npc
		 * 4.距离npc过远
		 * 5.当前状态无法进入副本
		 * 6.当前没有该类型的任务
		 * 7.
		 * 8.
		 * 9.
		 *
		 * 100.服务器bug
		 */
		private function onStoryFailMsg(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangStoryDungeon.STORY_DUNGEON_FAIL_MSG_1;
					break;
				case 2:
					failReason = LangStoryDungeon.STORY_DUNGEON_FAIL_MSG_2;
					break;
				case 3:
					failReason = LangStoryDungeon.STORY_DUNGEON_FAIL_MSG_3;
					break;
				case 4:
					failReason = LangStoryDungeon.STORY_DUNGEON_FAIL_MSG_4;
					break;
				case 5:
					failReason = LangStoryDungeon.STORY_DUNGEON_FAIL_MSG_5;
					break;
				case 6:
					failReason = LangStoryDungeon.STORY_DUNGEON_FAIL_MSG_6;
					break;
				case 100:
					failReason = LangStoryDungeon.STORY_DUNGEON_FAIL_MSG_100;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 进入剧情副本成功,等待切换进入场景
		 */
		private function onTryEnterStoryDungeon(buffer : ByteBuffer) : void
		{
		}

		/**
		 * 解除冻结或者解冻场景
		 *
		 * bool true(冻结)/false(解除冻结)
		 */
		private function onFrozenDungeon(buffer : ByteBuffer) : void
		{
			var isFreeze : Boolean = buffer.readBoolean();
		}

		/**
		 * 副本结束
		 *
		 * bool true(通关成功)/false(通关失败)
		 */
		private function onDungeonEnd(buffer : ByteBuffer) : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if (!sceneData)
				return;
			var isSucceed : Boolean = buffer.readBoolean();
			if (isSucceed)
			{
				NoticeManager.showNotify(LangStoryDungeon.STORY_DUNGEON_SUCCEED, sceneData.name);
			}
			else
			{
				NoticeManager.showNotify(LangStoryDungeon.STORY_DUNGEON_FAIL, sceneData.name);
			}
		}
	}
}
