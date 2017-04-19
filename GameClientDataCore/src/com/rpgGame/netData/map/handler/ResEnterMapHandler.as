package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResEnterMapMessage;
	import org.game.netCore.net.Handler;

	public class ResEnterMapHandler extends Handler {
	
		public override function action(): void{
			var msg: ResEnterMapMessage = ResEnterMapMessage(this.message);
			//TODO 添加消息处理
		}
	}
}