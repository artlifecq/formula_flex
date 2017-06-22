package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCWarChessMessage;
	import org.game.netCore.net.Handler;

	public class SCWarChessHandler extends Handler {
	
		public override function action(): void{
			var msg: SCWarChessMessage = SCWarChessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}