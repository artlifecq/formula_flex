package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.SCCancelSkillMessage;
	import org.game.netCore.net.Handler;

	public class SCCancelSkillHandler extends Handler {
	
		public override function action(): void{
			var msg: SCCancelSkillMessage = SCCancelSkillMessage(this.message);
			//TODO 添加消息处理
		}
	}
}