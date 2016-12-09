package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.ResWorshipCountMessage;
	import org.game.netCore.net.Handler;

	public class ResWorshipCountHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWorshipCountMessage = ResWorshipCountMessage(this.message);
			//TODO 添加消息处理
		}
	}
}