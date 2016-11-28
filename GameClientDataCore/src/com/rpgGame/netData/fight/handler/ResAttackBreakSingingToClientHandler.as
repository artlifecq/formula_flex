package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResAttackBreakSingingToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResAttackBreakSingingToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAttackBreakSingingToClientMessage = ResAttackBreakSingingToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}