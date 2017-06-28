package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.MountSender;
	import com.rpgGame.core.events.mount.MountEvent;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.cfg.mount.MountConfigData;
	import com.rpgGame.coreData.cfg.mount.MountUnitData;
	import com.rpgGame.coreData.info.mount.MountInfoData;
	
	import app.message.MountStatus;
	import app.message.MountType;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 坐骑强化管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountIntensifyManager extends MountBaseManager
	{
		private static var _ins:MountIntensifyManager;
//		/** 是否选择了强化的坐骑 **/
//		public static var selectMountIsIntensify:Boolean = true; 
		/** 当前选中需要强化的坐骑 **/
		private static var _curIntensifyMountData:MountInfoData;
		/** 是否强化完成 **/
		private static var _isIntensify:Boolean = true;
		
		public function MountIntensifyManager()
		{
			super(ItemContainerID.MOUNT_INTENSIFY);
		}
		
		public static function get instance():MountIntensifyManager
		{
			if(_ins == null)
			{
				_ins = new MountIntensifyManager();
			}
			return _ins;
		}
		
		/**
		 * 坐骑强化 
		 * @param idx 坐骑槽(第几个坐骑)
		 * @param isUse 是否是使用背包中的物品
		 * @param indexOrMount (isUse==true是使用背包中的物品，传物品在背包中的索引位置；isUse==false是使用坐骑强化，传目标坐骑（坐骑槽idx）)
		 * 
		 */		
		public static function requestMountRefine( idx:int, isUse:Boolean, indexOrMountIdx:int ):void
		{
//			MountSender.requestMountRefine( idx, isUse, indexOrMountIdx );
		}
		
		/**
		 * 当前选择的坐骑是够能强化 
		 * @param mountInfoData
		 * @return 
		 * 
		 */		
		public static function isIntensifyMount( mountInfoData:MountInfoData ):Boolean
		{
			if( mountInfoData == null )
				return false;
			var mountUnitData:MountUnitData = MountConfigData.getMountDataById( mountInfoData.id );
			if( mountUnitData == null )
				return false;
			
			var isBool1:Boolean = (mountInfoData.mountStatus == MountStatus.FIGHTING || mountInfoData.mountStatus == MountStatus.TRAINING) ? true : false;
			var isBool2:Boolean = (mountUnitData.mountType == MountType.BABY || mountUnitData.mountType == MountType.VARIATION || mountUnitData.mountType == MountType.BREED) ? true : false;
			return ( isBool1 && isBool2 );
		}
		
		/**
		 * 坐骑强化完了
		 * @param id 哪个坐骑（哪个坐骑槽）
		 * @param isSucces vitality 新的根骨
		 * @param newBone 新的根骨经验
		 * 
		 */		
		public static function MountRefine( idx:int, newVitality:int, newVitalityExp:int ):void
		{
			var slotMountVec:Vector.<MountInfoData> = MountManager.getAllSlotMounts( MainRoleManager.actorID );
			for each (var data:MountInfoData in slotMountVec) 
			{
				if( data.idx != idx )
					continue;
				data.vitality = newVitality;
				data.vitalityExp = newVitalityExp;
				EventManager.dispatchEvent( MountEvent.MOUNT_INTENSIFY, data );
				EventManager.dispatchEvent( MountEvent.MOUNT_INTENSIFY_GRAY_FILTER, data );
			}
		}

		/**
		 * 根据坐骑id、根骨等级，获取根骨的经验 
		 * @param id
		 * @param vitality
		 * @return 
		 * 
		 */		
		public static function getGenGuExp( id:int, vitality:int ):int
		{
			var vitalityExp:int;
			var mountUnitData:MountUnitData = MountConfigData.getMountDataById( id );
			if( mountUnitData != null )
			{
				if( mountUnitData.vitalityExpHash != null && mountUnitData.vitalityExpHash.length > 0 )
				{
					vitalityExp = mountUnitData.vitalityExpHash.getValue( vitality );				
				}
			}
			return vitalityExp;
		}
		
		/** 当前选中需要强化的坐骑 **/
		public static function get curIntensifyMount():MountInfoData
		{
			return _curIntensifyMountData;
		}

		/**
		 * @private
		 */
		public static function set curIntensifyMount(value:MountInfoData):void
		{
			_curIntensifyMountData = value;
		}

		/** 是否强化完成 **/
		public static function get isIntensify():Boolean
		{
			return _isIntensify;
		}

		/**
		 * @private
		 */
		public static function set isIntensify(value:Boolean):void
		{
			_isIntensify = value;
		}


	}
}