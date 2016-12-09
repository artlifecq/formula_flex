package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResAddPrivateItemMessage;
	import org.game.netCore.net.Handler;

	public class ResAddPrivateItemHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAddPrivateItemMessage = ResAddPrivateItemMessage(this.message);
			//TODO 添加消息处理
		}
	}
}