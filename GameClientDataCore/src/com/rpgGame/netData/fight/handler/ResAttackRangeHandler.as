package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResAttackRangeMessage;
	import org.game.netCore.net.Handler;

	public class ResAttackRangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAttackRangeMessage = ResAttackRangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}