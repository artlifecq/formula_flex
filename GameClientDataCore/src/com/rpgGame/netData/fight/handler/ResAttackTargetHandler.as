package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResAttackTargetMessage;
	import org.game.netCore.net.Handler;

	public class ResAttackTargetHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAttackTargetMessage = ResAttackTargetMessage(this.message);
			//TODO 添加消息处理
		}
	}
}