package com.rpgGame.netData.fate.handler{

	import com.rpgGame.netData.fate.message.ResFateYiDuiHuanMessage;
	import org.game.netCore.net.Handler;

	public class ResFateYiDuiHuanHandler extends Handler {
	
		public override function action(): void{
			var msg: ResFateYiDuiHuanMessage = ResFateYiDuiHuanMessage(this.message);
			//TODO 添加消息处理
		}
	}
}