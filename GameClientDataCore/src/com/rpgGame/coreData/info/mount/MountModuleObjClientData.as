package com.rpgGame.coreData.info.mount
{
	

	/**
	 * MountModuleObjClientProto
	 * @author 陈鹉光
	 * 
	 */	
	public class MountModuleObjClientData
	{
		/** 英雄坐骑数据 **/
		public var mountInfoDataVec:Vector.<MountInfoData>;
		
		public function MountModuleObjClientData()
		{
		}
		
		/**
		 * 英雄坐骑模块数据 
		 * @param data
		 * 
		 */		
//		public function setConfig( data:MountModuleObjClientProto ):void
//		{
//			if( data == null )
//				return;
//			
//			var info:MountInfoData;
//			mountInfoDataVec = new Vector.<MountInfoData>();
//			for each ( var slot:SlotMountProto in data.slotMounts ) 
//			{
//				info = new MountInfoData();
//				info.idx = slot.idx;
//				info.mountStatus = slot.mountStatus;
//				info.isRiding = slot.isRiding;
//				
//				info.setMountEquipData( slot.equipedMount.mountEquipments );
//				info.setInfoData( slot.equipedMount.mount );
//				mountInfoDataVec.push( info );
//			}
//		}
	}
}