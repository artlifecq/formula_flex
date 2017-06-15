package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.SCSkillWarningInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCSkillWarningInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSkillWarningInfoMessage = SCSkillWarningInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}