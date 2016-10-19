package com.rpgGame.coreData.info.upgrade
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.lang.LangMisc;
	
	import app.message.UpgradeProto;

	/**
	 *
	 * 进阶需要的物品金钱信息
	 * @author fly.liuyang
	 * 创建时间：2014-11-5 下午11:36:54
	 * 
	 */
	public class UpgradeProtoInfo
	{
		/** 祝福值上限 **/
		public var blessMaxAmount:int = 0; 
		/** 概率描述 **/
		public var rateDesc:String = ""; 
		/**
		 * 概率  * / 10000 
		 */		
		public var rate : int;
		/** 各种货币消耗 **/
		public var amountInfo:AmountInfo = new AmountInfo(); 
		/** 物品消耗 **/
		public var goodsInfoVect:Vector.<UpgradeGoodsInfo> = new Vector.<UpgradeGoodsInfo>();
		/**
		 * 消耗数量 
		 */		
		private var _count : int = 1;
		
		public function UpgradeProtoInfo( upgradeProto:UpgradeProto = null )
		{
			setProto( upgradeProto );
		}
		
		
		public function setProto( upgradeProto:UpgradeProto ):void
		{
			if( upgradeProto == null )
				return;
			
			goodsInfoVect.length = 0;
			
			amountInfo.setData( upgradeProto.amountCost );
			blessMaxAmount = upgradeProto.blessMaxAmount;
			rateDesc = upgradeProto.rateDesc;
			rate = upgradeProto.rate;
			
			var len:int = upgradeProto.goodsInfo.length;
			var upgradeGoodsInfo:UpgradeGoodsInfo;
			for( var i:int = 0; i < len; i++ )
			{
				upgradeGoodsInfo = new UpgradeGoodsInfo( upgradeProto.goodsInfo[i] );
				goodsInfoVect.push( upgradeGoodsInfo );
			}
		}
		
		/**
		 * 得到第一个物的消耗品名字
		 * @return 
		 * 
		 */		
		public function getFristItemName():String
		{
			if( goodsInfoVect.length <= 0 )
				return LanguageConfig.getText( LangMisc.NOTHING_INFO );
			
			return ItemCfgData.getItemName( goodsInfoVect[0].cfgId );
		}
		
		/**
		 * 得到第一个物的消耗品ID
		 * @return 
		 * 
		 */		
		public function getFristItemCfgid():int
		{
			if( goodsInfoVect.length <= 0 )
				return -1;
			
			return goodsInfoVect[0].cfgId;
		}
		/**
		 * 获得第一个物品的消耗数量 
		 * @return 
		 * 
		 */		
		public function getFristItemCount():int
		{
			if( goodsInfoVect.length <= 0 )
				return -1;
			return goodsInfoVect[0].upgradeGoodsCount;
		}

		public function get count():int
		{
			return _count;
		}
		/**
		 * value不能小于1
		 * @param value
		 * 
		 */
		public function set count(value:int):void
		{
			if(value<1)
				value = 1;
			var len:int = goodsInfoVect.length;
			var upgradeGoodsInfo:UpgradeGoodsInfo;
			for( var i:int = 0; i < len; i++ )
			{
				upgradeGoodsInfo = goodsInfoVect[i];
				upgradeGoodsInfo.upgradeGoodsCount = upgradeGoodsInfo.upgradeGoodsCount / _count * value;
			}
			_count = value;
		}

	}
}