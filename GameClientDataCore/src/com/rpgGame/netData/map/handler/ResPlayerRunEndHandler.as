package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResPlayerRunEndMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerRunEndHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerRunEndMessage = ResPlayerRunEndMessage(this.message);
			//TODO 添加消息处理
		}
	}
}