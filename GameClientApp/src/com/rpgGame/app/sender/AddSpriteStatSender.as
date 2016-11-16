package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.AddSpriteStatCfgData;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	
	import app.cmd.AddSpriteStatModuleMessages;
	
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 * 人物属性加点消息发送
	 * @author wewell
	 * moduleId = 105
	 */	
	public class AddSpriteStatSender  extends BaseSender
	{
		
		/**
		 * 加属性点
		 *
		 * varint32 属性id[StatType]
		 * varint32 加的属性点数量
		 */
		public static function addSpriteStat(statType:int, value:int):void
		{
			var by:ByteBuffer = new ByteBuffer();
			by.writeVarint32(statType);
			by.writeVarint32(value);
			SocketConnection_protoBuffer.send(AddSpriteStatModuleMessages.C2S_ADD_SPRITE_STAT, by);
		}
		
		/**
		 * 自动加属性点
		 */
		public static function autoAddSpriteStat():void
		{
			var by:ByteBuffer = new ByteBuffer();
			SocketConnection_protoBuffer.send(AddSpriteStatModuleMessages.C2S_AUTO_ADD_SPRITE_STAT, by);
		}
		
		/**
		 * 清空属性点
		 *
		 * if(level < 免费洗点等级){
		 * } else {
		 *      洗点消耗UpgradeProto
		 * }
		 */
		public static function clearSpriteStat(itemListVo:UpgradeItemListVo=null):void
		{
			var by:ByteBuffer = new ByteBuffer();
			if(MainRoleManager.actorInfo.level >= AddSpriteStatCfgData.freeClearSpriteStatPointLevel && itemListVo != null)
			{
				by.writeBytes(itemListVo.getByte());
			}
			SocketConnection_protoBuffer.send(AddSpriteStatModuleMessages.C2S_CLEAR_SPRITE_STAT, by);
		}
	}
}