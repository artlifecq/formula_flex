package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 场景掉落物品事件
	 * @author luguozheng
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-04-15 上午10:05:12
	 *
	 */
	public class SceneDropGoodsEvent
	{
		/**
		 * 掉落物品数据初始化
		 */
		public static const DROP_GOODS_DATAS_INIT : int = UNIQUEID.NEXT;
		/**
		 * 掉落物品数据更新
		 */
		public static const DROP_GOODS_DATAS_UPDATE : int = UNIQUEID.NEXT;
		/**
		 * 移除掉落物品数据
		 */
		public static const REMOVE_DROP_GOODS_DATA : int = UNIQUEID.NEXT;
	}
}
