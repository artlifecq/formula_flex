package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResCellTimeMessage;
	import org.game.netCore.net.Handler;

	public class ResCellTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResCellTimeMessage = ResCellTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}