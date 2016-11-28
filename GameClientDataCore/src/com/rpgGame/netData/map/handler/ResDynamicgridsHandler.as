package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResDynamicgridsMessage;
	import org.game.netCore.net.Handler;

	public class ResDynamicgridsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResDynamicgridsMessage = ResDynamicgridsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}