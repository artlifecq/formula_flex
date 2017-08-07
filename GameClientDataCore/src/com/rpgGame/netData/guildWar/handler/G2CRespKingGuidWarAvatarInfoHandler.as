package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.G2CRespKingGuidWarAvatarInfoMessage;
	import org.game.netCore.net.Handler;

	public class G2CRespKingGuidWarAvatarInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: G2CRespKingGuidWarAvatarInfoMessage = G2CRespKingGuidWarAvatarInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}