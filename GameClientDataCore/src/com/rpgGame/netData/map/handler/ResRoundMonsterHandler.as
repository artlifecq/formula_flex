package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRoundMonsterMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundMonsterHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundMonsterMessage = ResRoundMonsterMessage(this.message);
			//TODO 添加消息处理
		}
	}
}