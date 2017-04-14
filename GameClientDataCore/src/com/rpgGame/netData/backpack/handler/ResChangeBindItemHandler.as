package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResChangeBindItemMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeBindItemHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeBindItemMessage = ResChangeBindItemMessage(this.message);
			//TODO 添加消息处理
		}
	}
}