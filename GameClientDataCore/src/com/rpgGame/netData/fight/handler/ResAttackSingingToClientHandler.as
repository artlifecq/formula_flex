package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResAttackSingingToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResAttackSingingToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAttackSingingToClientMessage = ResAttackSingingToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}