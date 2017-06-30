package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.HorseSender;
	import com.rpgGame.core.events.mount.MountEvent;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.mount.MountInfoData;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 坐骑技能管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountSpellsManager extends MountBaseManager
	{
		private static var _ins:MountSpellsManager;
		/** 当前选中需要学习技能的坐骑 **/
		private static var _curLeanSkillMountData:MountInfoData;
		/** 是否选择了需要学习技能的坐骑 **/
		public static var isSelectLeanSkillMount:Boolean = true; 
		/** 学习坐骑技能成功了，是哪个技能槽 **/
		public static var spellIndex:int;
		
		public function MountSpellsManager()
		{
			super(ItemContainerID.MOUNT_SPELLS);
		}
		
		public static function get instance():MountSpellsManager
		{
			if(_ins == null)
			{
				_ins = new MountSpellsManager();
			}
			return _ins;
		}
		
		/**
		 * 坐骑技能学习 
		 * @param idx 哪个槽位的坐骑
		 * @param backpackIndex 物品在背包中的索引
		 * 
		 */		
		public static function requestMountLearnSpell( idx:int, backpackIndex:int ):void
		{
//			MountSender.requestMountLearnSpell( idx, backpackIndex );
		}
		
		/**
		 * 学习技能成功 
		 * @param idx 哪个坐骑
		 * @param mountSpellIndex 技能槽
		 * @param skillBooksId 技能书id
		 * 
		 */		
		public static function MountLearnSpellSuccess( idx:int, mountSpellIndex:int, skillBooksId:int ):void
		{
			spellIndex = mountSpellIndex
			var slotMountVec:Vector.<MountInfoData> = MountManager.getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec == null )
				return;
			
			for each (var mountInfoData:MountInfoData in slotMountVec) 
			{
				if( mountInfoData.idx != idx )
					continue;
				
				mountInfoData.spellIndex = mountSpellIndex;
				var len:int = mountInfoData.spells.spellBookId.length;
				for (var i:int = 0; i < len; i++) 
				{
					if( i != mountSpellIndex )
						continue;
					
					mountInfoData.spellMap.add( i, skillBooksId );
					EventManager.dispatchEvent( MountEvent.MOUNT_LEARN_SPELL_SUCCESS, mountInfoData );
				}
				
			}
		}
		

		/** 当前选中需要学习技能的坐骑 **/
		public static function get curLeanSkillMountData():MountInfoData
		{
			return _curLeanSkillMountData;
		}

		/**
		 * @private
		 */
		public static function set curLeanSkillMountData(value:MountInfoData):void
		{
			_curLeanSkillMountData = value;
		}

	}
}