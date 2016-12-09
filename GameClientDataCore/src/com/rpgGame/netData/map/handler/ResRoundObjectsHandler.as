package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundObjectsMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundObjectsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundObjectsMessage = ResRoundObjectsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}