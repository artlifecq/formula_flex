package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResChangeMapMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeMapHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeMapMessage = ResChangeMapMessage(this.message);
			//TODO 添加消息处理
		}
	}
}