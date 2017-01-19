package com.rpgGame.app.manager.tips
{
	import com.rpgGame.app.sender.ChatSender;
	import com.rpgGame.core.manager.tips.TipManager;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.info.item.GetShowItemVo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.type.TipType;
	
	import flash.geom.Point;
	
	import app.message.GoodsType;

	/**
	 *
	 * 由于客户端没有保存所有物品的静态配置信息，
	 * 所以显示的tip是的时候需要判断下本地有没有此物品的信息
	 * 如果没有就去服务端拉去一下，再显示tips
	 * 
	 * @author fly.liuyang
	 * 创建时间：2014-4-15 上午11:22:43
	 * 
	 */
	public class ItemTipManager
	{
		/** 等待显示tip是的iteminfo  */		
		private static var _waiteItemInfo:ItemInfo;
		/** 等待显示tips的itemcfgid  */		
		private static var _waiteTipsCfgId:int;
		/** 等待显示tips的坐标位置 */		
		private static var _waitePos:Point;
		private static var _waiteGetShowItemVo:GetShowItemVo
		
		/**
		 * 显示一个物品的tips 
		 *  
		 * 由于客户端没有保存所有物品的静态配置信息，
		 * 所以显示的tip是的时候需要判断下本地有没有此物品的信息
		 * 如果没有就去服务端拉去一下，再显示tips
		 * 
		 * @param cfgId
		 * @param itemInfo
		 * @param pos
		 * 
		 */		
		public static function showItemTips(cfgId:int,itemInfo:ItemInfo = null,pos:Point = null):void
		{
			if(ItemCfgData.hasItemCfg(cfgId))
			{
				if(itemInfo != null)
				{
					if(itemInfo.type == GoodsType.EQUIPMENT)
						TipManager.show(TipType.EQUIP_TIP,itemInfo,pos);
					else
						TipManager.show(TipType.ITEM_TIP,itemInfo,pos);
				}else
				{
					TipManager.show(TipType.ITEM_TIP,cfgId,pos);
				}
			}else
			{
				_waiteTipsCfgId = cfgId;
				_waiteItemInfo = itemInfo;
				_waitePos = pos;
//				ChatSender.sendToGetItmeInfo(cfgId);
			}
		}
		
		public static function showChatItemTips(cfgId:int,getShowItemVo:GetShowItemVo, pos:Point = null):void
		{
			if(ItemCfgData.hasItemCfg(cfgId))
			{
				showItemTips(getShowItemVo.cfgId,null,pos);
			}
			else
			{
				_waiteTipsCfgId = cfgId;
				_waiteGetShowItemVo = getShowItemVo;
				_waitePos = pos;
//				ChatSender.sendToGetItmeInfo(cfgId);
			}
		}

		public static function showWaitTip(cfgId:int):void
		{
			if(cfgId  == _waiteTipsCfgId)
			{
				if(_waiteGetShowItemVo)
				{
					_waiteGetShowItemVo.parseItemInfo();
					showChatItemTips(_waiteTipsCfgId,_waiteGetShowItemVo,_waitePos);
				}else
				{
					showItemTips(_waiteTipsCfgId,_waiteItemInfo,_waitePos)
				}
				_waiteTipsCfgId = 0;
				_waiteItemInfo = null;
				_waitePos = null;
				_waiteGetShowItemVo = null;
			}
		}
	}
}