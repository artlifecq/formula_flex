package com.rpgGame.netData.skill.handler{

	import com.rpgGame.netData.skill.message.ResSkillRemoveMessage;
	import org.game.netCore.net.Handler;

	public class ResSkillRemoveHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSkillRemoveMessage = ResSkillRemoveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}