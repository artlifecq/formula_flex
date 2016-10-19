package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.mount.MountEvent;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.MountBeastCardInfo;
	import com.rpgGame.coreData.info.mount.MountInfoData;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 坐骑传承管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountInheritManager extends MountBaseManager
	{
		private static var _ins:MountInheritManager;
		/** 是否是传承面板 **/
		public static var isInheritPanel:Boolean;
		
		public function MountInheritManager()
		{
			super(ItemContainerID.MOUNT_INHERTIT);
		}
		
		public static function get instance():MountInheritManager
		{
			if(_ins == null)
				_ins = new MountInheritManager();
			return _ins;
		}
		
		/**
		 * 坐骑传承成功 
		 * @param idx 继承的坐骑
		 * @param inheritNewVitality 继承的坐骑新的根骨
		 * @param inheritNewVitalityExp 继承的坐骑新的根骨经验
		 * @param isInheritMountVitalityExp 是否继承根骨经验
		 * @param isInheritMountSpell 是否继承技能
		 * @param mountIdx 坐骑槽下标（或者可能是物品在背包的下标）
		 * @param isBackPack 坐骑是来自背包还是坐骑槽
		 */		
		public static function onSetMountInherit( idx:int, inheritNewVitality:int, inheritNewVitalityExp:int, isInheritMountVitalityExp:Boolean, isInheritMountSpell:Boolean, index:int, isBackPack:Boolean ):void
		{
			if( isBackPack )//来自背包
			{
				updateMountBreadCarInfo( idx, inheritNewVitality, inheritNewVitalityExp, isInheritMountVitalityExp, isInheritMountSpell, index )
			}
			else
			{
				updateMountInfo( idx, inheritNewVitality, inheritNewVitalityExp, isInheritMountVitalityExp, isInheritMountSpell, index );
			}
		}
		
		/**
		 * 传承消耗坐骑是来自兽牌
		 * @param idx 继承的坐骑
		 * @param inheritNewVitality 继承的坐骑新的根骨
		 * @param inheritNewVitalityExp 继承的坐骑新的根骨经验
		 * @param isInheritMountVitalityExp 是否继承根骨经验
		 * @param isInheritMountSpell 是否继承技能
		 * @param index 背包的位置
		 * 
		 */		
		private static function updateMountBreadCarInfo( idx:int, inheritNewVitality:int, inheritNewVitalityExp:int, isInheritMountVitalityExp:Boolean, isInheritMountSpell:Boolean, index:int ):void
		{
			var itemInfo:ItemInfo = BackPackManager.instance.getItemInfoByIndex( index );
			if( itemInfo == null )
				return;
			
			var mountBreastCardInfo:MountBeastCardInfo = itemInfo as MountBeastCardInfo;
			if( mountBreastCardInfo == null )
				return;
			
			var slotMountVec:Vector.<MountInfoData> = MountManager.getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec == null || slotMountVec.length <= 0 )
				return;
			
			var baseSpell:HashMap = mountBreastCardInfo.spellMap;//兽牌的技能
			var i:int;
			for each ( var inheritMountData:MountInfoData in slotMountVec)//更新被传承坐骑的数据
			{
				if( inheritMountData.idx == idx )//被传承的坐骑
				{
					if( isInheritMountVitalityExp )//是否继承根骨经验
					{
						inheritMountData.vitality = inheritNewVitality;
						inheritMountData.vitalityExp = inheritNewVitalityExp;
						EventManager.dispatchEvent( MountEvent.MOUNT_GENGU_INHERIT, inheritMountData );
					}
					
					if( isInheritMountSpell )//是否继承技能
					{
						for ( i = 0; i < inheritMountData.spellMap.length; i++) 
						{
							inheritMountData.spellMap.add( i, baseSpell.getValue(i) );
						}
						EventManager.dispatchEvent( MountEvent.MOUNT_SPELL_INHERIT, inheritMountData );
					}
				}
			}
			
			//重新设置兽牌的数据信息
			mountBreastCardInfo.vitality = 0;
			mountBreastCardInfo.vitalityExp = 0;
			for ( i = 0; i < mountBreastCardInfo.spellMap.length; i++) 
			{
				mountBreastCardInfo.spellMap.remove( i );
			}
			BackPackManager.instance.setItemByIndex( index, setMountBreastCardInfo(mountBreastCardInfo) );
			EventManager.dispatchEvent( MountEvent.MOUNT_BASE_MOUNT_BREAST_CARD_SUCCESS, mountBreastCardInfo );
		}
		
		/**
		 * 重新设置兽牌的数据 
		 * @param mountBreastCardInfo
		 * @return 
		 * 
		 */		
		private static function setMountBreastCardInfo( mountBreastCardInfo:MountBeastCardInfo ):MountBeastCardInfo
		{
			var mountCardInfo:MountBeastCardInfo = new MountBeastCardInfo();//mountBreastCardInfo;
			//基础属性
			mountCardInfo.bornStat = mountBreastCardInfo.bornStat;
			//成长属性
			mountCardInfo.growthStat = mountBreastCardInfo.growthStat;
			//转化率属性
			mountCardInfo.growthTransStat = mountBreastCardInfo.growthTransStat;
			mountCardInfo.spells = mountBreastCardInfo.spells;
			mountCardInfo.id = mountBreastCardInfo.id;
			mountCardInfo.exp = mountBreastCardInfo.exp;
			mountCardInfo.hungerDegree = mountBreastCardInfo.hungerDegree;
			mountCardInfo.isBreed = mountBreastCardInfo.isBreed;
			mountCardInfo.mountLevel = mountBreastCardInfo.level;
			mountCardInfo.lifeTime = mountBreastCardInfo.lifeTime;
			mountCardInfo.sex = mountBreastCardInfo.sex;
			mountCardInfo.unidentified = mountBreastCardInfo.unidentified;
			mountCardInfo.vitality = mountBreastCardInfo.vitality;
			mountCardInfo.vitalityExp = mountBreastCardInfo.vitalityExp;
			//设置坐骑的技能数据
			var i:int;
			for ( i = 0; i < mountCardInfo.spells.spellBookId.length; i++) 
			{
				mountCardInfo.spellMap.add( i, mountCardInfo.spells.spellBookId[i] );
			}
			
			mountCardInfo.setContainerId( ItemContainerID.MOUNT_INHERTIT );
			return mountCardInfo;
		}
		
		/**
		 * 传承消耗坐骑是来自坐骑槽 
		 * @param idx 继承的坐骑
		 * @param inheritNewVitality 继承的坐骑新的根骨
		 * @param inheritNewVitalityExp 继承的坐骑新的根骨经验
		 * @param isInheritMountVitalityExp 是否继承根骨经验
		 * @param isInheritMountSpell 是否继承技能
		 * @param mountIdx 坐骑槽下标
		 * 
		 */		
		private static function updateMountInfo( idx:int, inheritNewVitality:int, inheritNewVitalityExp:int, isInheritMountVitalityExp:Boolean, isInheritMountSpell:Boolean, mountIdx:int ):void
		{
			var slotMountVec:Vector.<MountInfoData> = MountManager.getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec == null || slotMountVec.length <= 0 )
				return;
			
			var i:int;
			var baseSpell:HashMap = new HashMap();
			for each ( var basrMountData:MountInfoData in slotMountVec) //先更新消耗坐骑的数据
			{
				if( basrMountData.idx == mountIdx )//传承消耗坐骑
				{
					if( isInheritMountVitalityExp )//是否继承根骨经验
					{
						basrMountData.vitality = 0;
						basrMountData.vitalityExp = 0;
						EventManager.dispatchEvent( MountEvent.MOUNT_GENGU_INHERIT_BASE_MOUNT, basrMountData );
					}
					
					if( isInheritMountSpell )//是否继承技能
					{
						baseSpell = basrMountData.spellMap.clone();
						for ( i = 0; i < basrMountData.spellMap.length; i++) 
						{
							basrMountData.spellMap.remove( i );
						}
						EventManager.dispatchEvent( MountEvent.MOUNT_SPELL_INHERIT_BASE_MOUNT, basrMountData );
					}
				}
			}
			
			for each ( var inheritMountData:MountInfoData in slotMountVec) //再更新被传承坐骑的数据
			{
				if( inheritMountData.idx == idx )//被传承的坐骑
				{
					if( isInheritMountVitalityExp )//是否继承根骨经验
					{
						inheritMountData.vitality = inheritNewVitality;
						inheritMountData.vitalityExp = inheritNewVitalityExp;
						EventManager.dispatchEvent( MountEvent.MOUNT_GENGU_INHERIT, inheritMountData );
					}
					
					if( isInheritMountSpell )//是否继承技能
					{
						for ( i = 0; i < inheritMountData.spellMap.length; i++) 
						{
							inheritMountData.spellMap.add( i, baseSpell.getValue(i) );
						}
						EventManager.dispatchEvent( MountEvent.MOUNT_SPELL_INHERIT, inheritMountData );
					}
				}
			}
		}
	}
}