package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterSpChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterSpChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterSpChangeMessage = ResMonsterSpChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}