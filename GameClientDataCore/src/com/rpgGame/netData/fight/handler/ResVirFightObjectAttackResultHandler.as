package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResVirFightObjectAttackResultMessage;
	import org.game.netCore.net.Handler;

	public class ResVirFightObjectAttackResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResVirFightObjectAttackResultMessage = ResVirFightObjectAttackResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}