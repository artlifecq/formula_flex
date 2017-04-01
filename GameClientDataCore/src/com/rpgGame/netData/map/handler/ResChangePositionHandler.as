package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResChangePositionMessage;
	import org.game.netCore.net.Handler;

	public class ResChangePositionHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangePositionMessage = ResChangePositionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}