package com.rpgGame.app.sender
{
	import app.cmd.MazeModuleMessages;

	public class MazeSender extends BaseSender
	{
		public function MazeSender()
		{
			super();
		}

		/**
		 * 请求传送
		 *
		 * varint32 传送门的下标,就是我发给你的配置中的第几个传送门
		 */
		public static function tryTrans(index : int) : void
		{
//			if (ReqLockUtil.isReqLocked(MazeModuleMessages.C2S_TRY_TRANSPORT))
//				return;
//			ReqLockUtil.lockReq(MazeModuleMessages.C2S_TRY_TRANSPORT, 5000);

			_bytes.clear();
			_bytes.writeVarint32(index);
			send(MazeModuleMessages.C2S_TRY_TRANSPORT, _bytes);
		}

		public static function getLastRank() : void
		{
			_bytes.clear();
			send(MazeModuleMessages.C2S_GET_LAST_RANK, _bytes);
		}
	}
}
