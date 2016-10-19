package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.SpellManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	
	import flash.utils.ByteArray;
	
	import app.cmd.SpellModuleMessages;
	import app.message.SpellProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 * 技能学习与升级
	 * @author luguozheng
	 * 
	 */	
	public class SpellCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(SpellModuleMessages.S2C_LEARNED_OR_UPGRADED_ACTIVE_SPELL,onLearnedOrUpgradedActiveSpell);
			SocketConnection.addCmdListener(SpellModuleMessages.S2C_LEARN_OR_UPGRADE_SPELL_FAIL,onLearnedOrUpgradeActiveSpellFail);
			
			SocketConnection.addCmdListener(SpellModuleMessages.S2C_CLEAR_SPELLS_FAILURE,onClearSpellsFailure);
			SocketConnection.addCmdListener(SpellModuleMessages.S2C_CLEAR_SPELLS_SUCCESS,onClearSpellsSuccess);
			
			SocketConnection.addCmdListener(SpellModuleMessages.S2C_OBTAIN_SPELL_POINT,onObtainSpellPoint);
			
			finish();
		}	
		
		/**
		 * 获得新的技能点
		 * varint32 新的总的获得的技能点数
		 */
		private function onObtainSpellPoint(buffer:ByteBuffer):void
		{
			SpellManager.onObtainSpellPoint( buffer.readVarint32() );
		}
		
		/**
		 * 请求洗点成功
		 * 客户端将当前使用的技能点点数重置为0，将当前已经学习的技能重置
		 */
		private function onClearSpellsSuccess(buffer:ByteBuffer):void
		{
			SpellManager.onClearSpellsSuccess();
		}
		
		/**
		 * 请求洗点失败，返回varint32错误码
		 * 1.当前没有学习过任何一个职业的技能，无法洗点
		 * 2.物品不够
		 */
		private function onClearSpellsFailure(buffer:ByteBuffer):void
		{
			var failID:int = buffer.readVarint32();
			
			NoticeManager.showHint( "SPELL_CLEAR_FAIL" + failID );
		}
		
		/**
		 * 学习或升级技能失败, 后面附带varint32 的错误码
		 * 1. 发送的spellType不存在
		 * 2. 技能已经升到满级
		 * 3. 学习的等级不够
		 * 4. 银两不够
		 * 5. 经验不够
		 * 6. 物品不够
		 * 7. 不是你这职业能学的
		 * 8. 技能点不够
		 * 9. 前置技能没学会
		 * 10. 学习的前置技能消耗的技能点不够
		 * 11. 绑银不够
		 * 12. 已经学习了其他系的技能，不能学习该系
		 */
		private function onLearnedOrUpgradeActiveSpellFail(buffer:ByteBuffer):void
		{
			var failID:int = buffer.readVarint32();
			
			NoticeManager.showHint( "SPELL_LEARN_UPGRADE_FAIL" + failID );
		}
		
		/**
		 *  学习或升级技能成功, 后面附带技能的proto SpellProto
		 */
		private function onLearnedOrUpgradedActiveSpell(buffer:ByteBuffer):void
		{
			var bytes:ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			var spellProto:SpellProto = new SpellProto();
			spellProto.mergeFrom(bytes);
			
			SpellManager.onLearnedOrUpgradedActiveSpell( spellProto );
		}
	}
}