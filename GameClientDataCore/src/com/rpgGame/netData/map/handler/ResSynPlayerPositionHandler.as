package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResSynPlayerPositionMessage;
	import org.game.netCore.net.Handler;

	public class ResSynPlayerPositionHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSynPlayerPositionMessage = ResSynPlayerPositionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}