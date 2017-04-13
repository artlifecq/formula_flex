package com.rpgGame.netData.equip.handler{

	import com.rpgGame.netData.equip.message.ResEquipInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResEquipInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResEquipInfoMessage = ResEquipInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}