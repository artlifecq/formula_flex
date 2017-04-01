package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterSpeedChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterSpeedChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterSpeedChangeMessage = ResMonsterSpeedChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}