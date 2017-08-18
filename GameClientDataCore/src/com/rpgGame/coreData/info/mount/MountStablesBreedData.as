package com.rpgGame.coreData.info.mount
{
	
	
	/**
	 * 马厩繁育信息 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountStablesBreedData
	{
		/** 马厩繁育状态 **/
		public var stablesBreedType:int;
		/** 出生时间（繁育时长） **/
		public var bornTime:Number;
		/** 邀请的对象 **/
		public var inviteTargetId:Number;
		/** 邀请的过期时间 **/
		public var inviteExpireTime:Number;
		/** 名字 **/
		public var name:String;
		
		public function MountStablesBreedData()
		{
			
		}
		
		/**
		 * 设置数据 
		 * @param data
		 * 
		 */		
//		public function setData( data:StablesBreedProto ):void
//		{
//			stablesBreedType = data.type;
//			switch( stablesBreedType )
//			{
//				case StablesBreedType.INVITE://邀请0
//					if( data.inviteTargetId != null )
//					{
//						inviteTargetId = data.inviteTargetId.toNumber();
//					}
//					if( data.inviteExpireTime != null )
//					{
//						inviteExpireTime = data.inviteExpireTime.toNumber();
//					}
//					break;
//				case StablesBreedType.WAIT_LOCK://等待锁定1
//					break;
//				case StablesBreedType.MAKE_LOVE://生宝宝中2
//					if( data.bornTime != null )
//					{
//						bornTime = data.bornTime.toNumber();
//					}
//					break;
//				case StablesBreedType.CANCEL://取消繁育3
//					break;
//				default:
//					break;
//			}
//		}
	}
}