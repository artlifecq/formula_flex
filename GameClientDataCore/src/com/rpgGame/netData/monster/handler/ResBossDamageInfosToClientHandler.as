package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResBossDamageInfosToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResBossDamageInfosToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBossDamageInfosToClientMessage = ResBossDamageInfosToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}