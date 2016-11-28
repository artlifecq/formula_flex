package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResAttackResultMessage;
	import org.game.netCore.net.Handler;

	public class ResAttackResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAttackResultMessage = ResAttackResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}