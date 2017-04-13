package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundNpcMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundNpcHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundNpcMessage = ResRoundNpcMessage(this.message);
			//TODO 添加消息处理
		}
	}
}