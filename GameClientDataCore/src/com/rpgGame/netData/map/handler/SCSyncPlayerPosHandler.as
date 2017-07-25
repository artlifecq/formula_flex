package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.SCSyncPlayerPosMessage;
	import org.game.netCore.net.Handler;

	public class SCSyncPlayerPosHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSyncPlayerPosMessage = SCSyncPlayerPosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}