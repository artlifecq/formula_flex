package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterAIStepChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterAIStepChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterAIStepChangeMessage = ResMonsterAIStepChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}