package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResItemChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResItemChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResItemChangeMessage = ResItemChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}