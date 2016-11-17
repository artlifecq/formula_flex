package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	
	import flash.utils.ByteArray;
	
	import app.cmd.AddSpriteStatModuleMessages;
	import app.message.SpriteStatProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	
	/**
	 * 
	 * 人物属性加点消息处理  ModuleID==105
	 * @author wewell
	 *
	 */
	public class AddSpriteStatCmdListener  extends BaseBean
	{
		public function AddSpriteStatCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection_protoBuffer.addCmdListener(AddSpriteStatModuleMessages.S2C_ADD_SPRITE_STAT_FAIL, onAddSpriteStatFail);
			SocketConnection_protoBuffer.addCmdListener(AddSpriteStatModuleMessages.S2C_ADD_SPRITE_STAT, onAddSpriteStat);
			
			SocketConnection_protoBuffer.addCmdListener(AddSpriteStatModuleMessages.S2C_AUTO_ADD_SPRITE_STAT_FAIL, onAutoAddSpriteStatFail);
			SocketConnection_protoBuffer.addCmdListener(AddSpriteStatModuleMessages.S2C_AUTO_ADD_SPRITE_STAT, onAutoAddSpriteStat);
			
			SocketConnection_protoBuffer.addCmdListener(AddSpriteStatModuleMessages.S2C_CLEAR_SPRITE_STAT_FAIL, onClearSpriteStatFail);
			SocketConnection_protoBuffer.addCmdListener(AddSpriteStatModuleMessages.S2C_CLEAR_SPRITE_STAT, onClearSpriteStat);
			
			finish();
		}
		
		private function onAddSpriteStat(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			var value:int = buffer.readVarint32();
			MainRoleManager.actorInfo.spriteStat.addStatValue(type, value);
			MainRoleManager.actorInfo.usedSpriteStatPoint += value;
			EventManager.dispatchEvent(MainPlayerEvent.STAT_CHANGE);
		}
		
		private function onAddSpriteStatFail(buffer:ByteBuffer):void
		{
			var code:int = buffer.readVarint32();
			switch(code)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.ADD_SPRITE_STAT_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.ADD_SPRITE_STAT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.ADD_SPRITE_STAT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.ADD_SPRITE_STAT_FAIL4 );
					break;
			}
		}
		
		private function onAutoAddSpriteStatFail(buffer:ByteBuffer):void
		{
			var code:int = buffer.readVarint32();
			switch(code)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.AUTO_ADD_SPRITE_STAT_FAIL1);
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.AUTO_ADD_SPRITE_STAT_FAIL2);
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.AUTO_ADD_SPRITE_STAT_FAIL3);
					break;
			}
		}
		
		private function onAutoAddSpriteStat(buffer:ByteBuffer):void
		{
			var used:int = buffer.readVarint32();
			var ssp:SpriteStatProto = new SpriteStatProto();
			var bytes:ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			ssp.mergeFrom(bytes);
			MainRoleManager.actorInfo.usedSpriteStatPoint += used;
			MainRoleManager.actorInfo.spriteStat.setData(ssp);
			EventManager.dispatchEvent(MainPlayerEvent.STAT_CHANGE);
		}
		
		private function onClearSpriteStatFail(buffer:ByteBuffer):void
		{
			var code:int = buffer.readVarint32();
			switch(code)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.CLEAR_SPRITE_STAT_FAIL1);
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.CLEAR_SPRITE_STAT_FAIL2);
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.CLEAR_SPRITE_STAT_FAIL3);
					break;
			}
		}
		
		private function onClearSpriteStat(buffer:ByteBuffer):void
		{
			MainRoleManager.actorInfo.spriteStat.clearStatValue();
			MainRoleManager.actorInfo.usedSpriteStatPoint = 0;
			EventManager.dispatchEvent(MainPlayerEvent.STAT_CHANGE);
		}
		
	}
}