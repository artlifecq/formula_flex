package com.rpgGame.netData.desirepond.handler{

	import com.rpgGame.netData.desirepond.message.ResDesireSuccessMessage;
	import org.game.netCore.net.Handler;

	public class ResDesireSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResDesireSuccessMessage = ResDesireSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}