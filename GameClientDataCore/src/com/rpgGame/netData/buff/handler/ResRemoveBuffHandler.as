package com.rpgGame.netData.buff.handler{

	import com.rpgGame.netData.buff.message.ResRemoveBuffMessage;
	import org.game.netCore.net.Handler;

	public class ResRemoveBuffHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRemoveBuffMessage = ResRemoveBuffMessage(this.message);
			//TODO 添加消息处理
		}
	}
}