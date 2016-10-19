package com.rpgGame.coreData.info.scene
{
	import com.rpgGame.coreData.info.upgrade.AmountInfo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	
	import app.message.AmountType;
	import app.message.ReliveCostProto;
	import app.message.ReliveTypeDataProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 复活
	 * @author mandragra
	 * 
	 */	
	public class ReliveCostData
	{
		public var costMap:HashMap;
		public var reliveType : int;
		public var lifePercent : int;
		public var manaPercent : int;
		public var freeTimes:int;
		/**最大复活次数，超过这个次数就没有配置了**/
		private var maxRelive : int;
		public function ReliveCostData()
		{
			costMap = new HashMap();
		}
		
		/**
		 * 设置花费
		 * @param Cost
		 * 
		 */		
		public function setData( data:ReliveTypeDataProto ):void
		{
			var amount : AmountInfo;
			var costProto : ReliveCostProto;
			freeTimes = data.freeTimes;
			reliveType = data.reliveType;
			lifePercent = data.lifePercent;
			manaPercent = data.manaPercent;
			
			var len:int = data.allReliveCost.length;
			for( var i:int = 0; i < len; i++ )
			{
				costProto = data.allReliveCost[i];
				if(!costProto)
					continue;
				amount = new AmountInfo();
				amount.setSomeType(AmountType.MONEY,costProto.moneyCost);
				if(costProto.reliveTimes > maxRelive)
					maxRelive = costProto.reliveTimes;
				costMap.add(costProto.reliveTimes,amount);
			}
		}
		
		public function getCostAmountInfoByIndex( index:int ):AmountInfo
		{
			if( costMap.length <= 0 )
				return null;
			var i : int = index;
			var amount : AmountInfo;
			while(maxRelive >= i)
			{
				amount = costMap.getValue(i);
				if(amount)
					break;
				i++;
			}
			return amount;
		}
	}
}