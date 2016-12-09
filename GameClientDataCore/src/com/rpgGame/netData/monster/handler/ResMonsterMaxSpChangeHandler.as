package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterMaxSpChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterMaxSpChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterMaxSpChangeMessage = ResMonsterMaxSpChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}