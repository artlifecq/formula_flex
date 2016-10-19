package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;

	/**
	 * 坐骑装备仓库管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountEquipManager extends GoodsContainerMamager
	{
		private static var _ins:MountEquipManager;
		
		public function MountEquipManager()
		{
			super(ItemContainerID.MOUNT_EQUIP);
		}
		
		public static function get instance():MountEquipManager
		{
			if(_ins == null)
				_ins = new MountEquipManager();
			_ins.curUnlockIndex = BackPackManager.instance.curUnlockIndex;
			return _ins;
		}
	}
}