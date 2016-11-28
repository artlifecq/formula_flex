package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResAttackBeautyMessage;
	import org.game.netCore.net.Handler;

	public class ResAttackBeautyHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAttackBeautyMessage = ResAttackBeautyMessage(this.message);
			//TODO 添加消息处理
		}
	}
}