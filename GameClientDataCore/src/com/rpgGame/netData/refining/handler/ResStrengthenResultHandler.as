package com.rpgGame.netData.refining.handler{

	import com.rpgGame.netData.refining.message.ResStrengthenResultMessage;
	import org.game.netCore.net.Handler;

	public class ResStrengthenResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStrengthenResultMessage = ResStrengthenResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}