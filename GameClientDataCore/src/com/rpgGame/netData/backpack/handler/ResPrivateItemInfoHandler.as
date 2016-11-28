package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResPrivateItemInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResPrivateItemInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPrivateItemInfoMessage = ResPrivateItemInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}