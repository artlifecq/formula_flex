package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResTreeAndMonsterRewardInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResTreeAndMonsterRewardInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTreeAndMonsterRewardInfoMessage = ResTreeAndMonsterRewardInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}