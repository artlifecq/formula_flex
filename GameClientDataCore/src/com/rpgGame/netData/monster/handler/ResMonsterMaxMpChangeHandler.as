package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterMaxMpChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterMaxMpChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterMaxMpChangeMessage = ResMonsterMaxMpChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}