package com.rpgGame.netData.equip.handler{

	import com.rpgGame.netData.equip.message.WearEquipItemMessage;
	import org.game.netCore.net.Handler;

	public class WearEquipItemHandler extends Handler {
	
		public override function action(): void{
			var msg: WearEquipItemMessage = WearEquipItemMessage(this.message);
			//TODO 添加消息处理
		}
	}
}