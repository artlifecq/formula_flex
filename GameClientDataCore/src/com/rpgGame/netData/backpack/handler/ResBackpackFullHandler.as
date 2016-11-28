package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResBackpackFullMessage;
	import org.game.netCore.net.Handler;

	public class ResBackpackFullHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBackpackFullMessage = ResBackpackFullMessage(this.message);
			//TODO 添加消息处理
		}
	}
}