package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	
	/**
	 * 坐骑槽位管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountSlotManager extends GoodsContainerMamager
	{
		private static var _ins:MountSlotManager;
		
		public function MountSlotManager()
		{
			super(ItemContainerID.MOUNT_SLOT);
		}
		
		public static function get instance():MountSlotManager
		{
			if(_ins == null)
				_ins = new MountSlotManager();
			return _ins;
		}
	}
}