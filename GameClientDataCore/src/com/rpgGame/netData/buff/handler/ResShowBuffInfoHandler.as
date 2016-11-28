package com.rpgGame.netData.buff.handler{

	import com.rpgGame.netData.buff.message.ResShowBuffInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResShowBuffInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResShowBuffInfoMessage = ResShowBuffInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}