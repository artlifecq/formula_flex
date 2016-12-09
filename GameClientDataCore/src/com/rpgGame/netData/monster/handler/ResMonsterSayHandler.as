package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResMonsterSayMessage;
	import org.game.netCore.net.Handler;

	public class ResMonsterSayHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMonsterSayMessage = ResMonsterSayMessage(this.message);
			//TODO 添加消息处理
		}
	}
}