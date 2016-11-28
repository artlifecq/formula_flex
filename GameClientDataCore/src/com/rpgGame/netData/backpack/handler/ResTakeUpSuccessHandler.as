package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResTakeUpSuccessMessage;
	import org.game.netCore.net.Handler;

	public class ResTakeUpSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTakeUpSuccessMessage = ResTakeUpSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}