package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResAttackVentToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResAttackVentToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAttackVentToClientMessage = ResAttackVentToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}