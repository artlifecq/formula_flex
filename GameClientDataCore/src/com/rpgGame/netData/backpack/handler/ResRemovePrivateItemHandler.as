package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResRemovePrivateItemMessage;
	import org.game.netCore.net.Handler;

	public class ResRemovePrivateItemHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRemovePrivateItemMessage = ResRemovePrivateItemMessage(this.message);
			//TODO 添加消息处理
		}
	}
}