package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterHpRateChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterHpRateChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterHpRateChangeMessage = ResMonsterHpRateChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}