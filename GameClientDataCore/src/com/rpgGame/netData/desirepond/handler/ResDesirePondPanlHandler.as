package com.rpgGame.netData.desirepond.handler{

	import com.rpgGame.netData.desirepond.message.ResDesirePondPanlMessage;
	import org.game.netCore.net.Handler;

	public class ResDesirePondPanlHandler extends Handler {
	
		public override function action(): void{
			var msg: ResDesirePondPanlMessage = ResDesirePondPanlMessage(this.message);
			//TODO 添加消息处理
		}
	}
}