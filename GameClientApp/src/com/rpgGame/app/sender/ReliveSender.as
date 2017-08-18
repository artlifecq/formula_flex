package com.rpgGame.app.sender
{
	import org.game.netCore.connection.SocketConnection_protoBuffer;

	public class ReliveSender extends BaseSender
	{
		public function ReliveSender()
		{
		}
		
		/**
		 * 英雄请求复活
		 *
		 * 附带varint32 复活类型
		 *
		 * 0. 表示回城复活
		 * 1. 表示花钱原地复活
		 * 2. 表示花钱原地完美复活
		 * 3. 表示信春哥
		 * 4. 表示伤不起
		 * 5. 表示跑得快
		 */
		public static function reqSceneRequestRelive( type:int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(type);
//			SocketConnection_protoBuffer.send(SceneModuleMessages.C2S_REQUEST_RELIVE, _bytes);
		}
		
	}
}