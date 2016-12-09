package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResStartBlockMessage;
	import org.game.netCore.net.Handler;

	public class ResStartBlockHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStartBlockMessage = ResStartBlockMessage(this.message);
			//TODO 添加消息处理
		}
	}
}