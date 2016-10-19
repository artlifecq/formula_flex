package com.rpgGame.app.sender
{
	import app.cmd.RelationModuleMessages;

	/**
	 *
	 * 好友协议发送
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-9 上午10:05:12
	 *
	 */
	public class FriendSender extends BaseSender
	{
		public function FriendSender()
		{
			super();
		}

		/**
		 * 请求好友数据. 只请求一次. 后面不需要附带数据.
		 */
		public static function reqRelations() : void
		{
			_bytes.clear();
			send(RelationModuleMessages.C2S_GET_RELATIONS, _bytes);
		}

		/**
		 * 添加 好友
		 * @param id
		 *
		 */
		public static function reqAddFriend(id : Number) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			send(RelationModuleMessages.C2S_ADD_FRIEND, _bytes);
		}

		public static function reqReplyAddFriend(id : Number, result : Boolean) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			_bytes.writeBoolean(result);
			send(RelationModuleMessages.C2S_REPLY_ADD_FRIEND, _bytes);
		}

		/**
		 * 删除好友
		 *
		 * 附带varint64 的好友id
		 */
		public static function reqRemoveFriend(id : Number) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			send(RelationModuleMessages.C2S_REMOVE_FRIEND, _bytes);
		}

		/**
		 * 添加屏蔽列表
		 * @param id
		 *
		 */
		public static function reqAddBlack(id : Number) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			send(RelationModuleMessages.C2S_ADD_BLACK, _bytes);
		}

		/**
		 *客户端请求
		 * @param id
		 *
		 */
		public static function reqRemoveBlack(id : Number) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			send(RelationModuleMessages.C2S_REMOVE_BLACK, _bytes);
		}
		/**
		 *  编辑心情
		 *
		 * utf 心情
		 *
		 */
		public static function editorMood(str:String):void
		{
			_bytes.clear();
			_bytes.writeUTF(str);
			send(RelationModuleMessages.C2S_EDITOR_MOOD, _bytes);
		}
	}
}
