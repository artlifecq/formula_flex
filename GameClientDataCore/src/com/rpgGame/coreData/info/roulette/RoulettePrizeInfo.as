package com.rpgGame.coreData.info.roulette
{
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	
	import app.message.GoodsWrapperProto;
	import app.message.RoulettePrizeProto;

	/**
	 * 一条转盘奖励物品信息 
	 * @author wewell@163.com
	 * 
	 */	
	public class RoulettePrizeInfo
	{
		// 转盘经验加成百分比奖励
		public var expMultiple:Number;
		public var itemInfo:ItemInfo;
		
		public function RoulettePrizeInfo()
		{
		}
		
		public function converRoulettePrizeData(data:RoulettePrizeProto):void
		{
			if( data == null )
				return;
			
			if(data.hasGoods)
			{
				itemInfo = ItemUtil.wrapperProtoToItemInfo(data.goods as GoodsWrapperProto);
			}
			
			expMultiple = data.exp.per;
		}
		
	}
}