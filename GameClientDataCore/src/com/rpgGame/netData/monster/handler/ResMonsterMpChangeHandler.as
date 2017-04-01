package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterMpChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterMpChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterMpChangeMessage = ResMonsterMpChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}