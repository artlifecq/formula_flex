package com.rpgGame.coreData.info.mount
{
	

	/**
	 * 繁育信息 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountStablesBreedSideData
	{
		/** 英雄id **/
		public var heroId:Number;
		/** 繁育的坐骑 **/
		public var mountInfoData:MountInfoData;
		/** 是否锁定了 **/
		public var isLock:Boolean;
		/** 我是不是被邀请的 **/
		public var isInvite:Boolean;
		/** 坐骑是不是交给了npc **/
		public var isToNpc:Boolean;
		
		public function MountStablesBreedSideData()
		{
		}
		
		/**
		 * 设置数据 
		 * @param data
		 * 
		 */		
//		public function setData( data:StablesBreedSideProto ):void
//		{
//			if( data == null )
//			{
//				isToNpc = false;
//				return;
//			}
//			
//			isToNpc = true;
//			heroId = data.heroId.toNumber();
//			mountInfoData = new MountInfoData();
//			mountInfoData.setInfoData( data.equipedMount.mount );
//			mountInfoData.setMountEquipData( data.equipedMount.mountEquipments );
//			isLock = data.isLocked;
//		}
	}
}