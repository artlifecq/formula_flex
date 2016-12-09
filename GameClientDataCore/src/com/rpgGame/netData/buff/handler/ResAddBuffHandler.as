package com.rpgGame.netData.buff.handler{

	import com.rpgGame.netData.buff.message.ResAddBuffMessage;
	import org.game.netCore.net.Handler;

	public class ResAddBuffHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAddBuffMessage = ResAddBuffMessage(this.message);
			//TODO 添加消息处理
		}
	}
}