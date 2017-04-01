package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.ResWorshipValueMessage;
	import org.game.netCore.net.Handler;

	public class ResWorshipValueHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWorshipValueMessage = ResWorshipValueMessage(this.message);
			//TODO 添加消息处理
		}
	}
}