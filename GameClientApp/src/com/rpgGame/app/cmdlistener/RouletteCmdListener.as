package com.rpgGame.app.cmdlistener
{
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	/**
	 *
	 * 大轮盘状态侦听
	 * @author wewell@163.com
	 *
	 */
	public class RouletteCmdListener extends BaseBean
	{
		public function RouletteCmdListener()
		{
			super();
		}
		
		
		override public function start() : void
		{
//			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_ROULETTE, onRoulette);
//			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_COLLECT_ROULETTE_PRIZE , onColletPrize);
//			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_COLLECT_ROULETTE_PRIZE_FAIL  , onColletPrizeFail);
			
			//
			finish();
		}
		
		/**
		 * 大转盘
		 * 
		 * varint32 奖励id
		 * varint32 奖励下标
		 * 
		 * varint32 后面数据长度
		 * bytes 解析成 RoulettePrizes
		 * 
		 * bytes 解析成PrizeProto
		 */
		private function onRoulette(buffer : ByteBuffer):void
		{
			var cfgId:int = buffer.readVarint32();
			var indexId:int = buffer.readVarint32();
		}
		
		/**
		 * 领取奖励成功
		 * 
		 * varint32 奖励id
		 * 
		 * 删除密信转盘
		 */
		private function onColletPrize(buffer : ByteBuffer):void
		{
			
		}
		
		/**
		 * 领取转盘奖励失败，返回varint32错误码
		 * 
		 * 1. 没有奖励可以领取
		 */
		private function onColletPrizeFail(buffer : ByteBuffer):void
		{
			
		}
		
	}
}


