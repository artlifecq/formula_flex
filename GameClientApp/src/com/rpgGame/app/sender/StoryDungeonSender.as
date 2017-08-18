package com.rpgGame.app.sender
{
	

	/**
	 *
	 * 剧情副本消息发送
	 * @author L.L.M.Sunny
	 * 创建时间：2016-7-22 下午1:50:25
	 *
	 */
	public class StoryDungeonSender extends BaseSender
	{
		public function StoryDungeonSender()
		{
			super();
		}

		/**
		 * 请求进入剧情副本
		 *
		 * varint64 点击的npcid
		 */
		public static function tryEnterStoryDungeon(roleId : Number) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(roleId);
//			send(StoryModuleMessages.C2S_TRY_ENTER_STORY_DUNGEON, _bytes);
		}

		/**
		 * 执行某个事件,该事件没有返回
		 *
		 * varint32 事件
		 */
		public static function runEvent(triggerId : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(triggerId);
//			send(StoryModuleMessages.C2S_RUN_EVENT, _bytes);
		}

		/**
		 * 执行某个删除对象的事件,该消息没有返回
		 *
		 * varint32 事件
		 *
		 * varint32 后面的目标的id数量,最多为50,超过,不处理
		 * while(i->后面的目标的id数量){
		 *      varint64 目标在场景中得id
		 * }
		 */
		public static function removeMonsterObjEvent(triggerId : int, roleIds : Array) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(triggerId);
			var len : int = roleIds.length;
			_bytes.writeVarint32(len);
			for each (var id : Number in roleIds)
			{
				_bytes.writeVarint64(id);
			}
//			send(StoryModuleMessages.C2S_REMOVE_MONSTER_OBJ_EVENT, _bytes);
		}

		/**
		 * 冻结或者解冻场景
		 *
		 * bool true(冻结)/false(解除冻结)
		 */
		public static function frozenDungeon(isFreeze : Boolean) : void
		{
			_bytes.clear();
			_bytes.writeBoolean(isFreeze);
//			send(StoryModuleMessages.C2S_FROZEN_DUNGEON, _bytes);
		}
	}
}
