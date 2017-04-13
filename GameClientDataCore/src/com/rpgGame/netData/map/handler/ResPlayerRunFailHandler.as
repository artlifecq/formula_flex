package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResPlayerRunFailMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerRunFailHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerRunFailMessage = ResPlayerRunFailMessage(this.message);
			//TODO 添加消息处理
		}
	}
}