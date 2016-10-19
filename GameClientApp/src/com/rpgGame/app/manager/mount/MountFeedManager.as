package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.sender.MountSender;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.cfg.mount.MountMiscData;
	import com.rpgGame.coreData.info.mount.MountInfoData;

	/**
	 * 坐骑喂养管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountFeedManager extends GoodsContainerMamager
	{
		private static var _ins:MountFeedManager;
		
		public function MountFeedManager()
		{
			super(ItemContainerID.MOUNT_FEED);
		}
		
		public static function get instance():MountFeedManager
		{
			if(_ins == null)
				_ins = new MountFeedManager();
			_ins.curUnlockIndex = BackPackManager.instance.curUnlockIndex;
			return _ins;
		}
		
		/**
		 * 坐骑喂养 
		 * @param index 坐骑槽(第几个坐骑)
		 * @param backpackIndex 背包中的位置
		 * @param num 喂养个数
		 * @param itemID 物品的id，防止喂错了
		 * 
		 */		
		public static function mountFeed( index:int, backpackIndex:int, num:int, itemID:int ):void
		{
			MountSender.requestMountFeed( index, backpackIndex, num, itemID );
		}
		
		/**
		 * 坐骑是否饥饿 
		 * @param data
		 * @return 
		 * 
		 */		
		public static function mountIsHunger( data:MountInfoData ):Boolean
		{
			return ( MountMiscData.maxHungerDegree - data.hungerDegree > 0 );
		}
		
	}
}