package com.rpgGame.coreData.info.task.daily
{
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.utils.ProtoParseToInfo;
	
	import app.message.TouZhuConfig.TouZhuPrize;

	/**
	 * 偷猪的奖励
	 * @author luguozheng
	 * 
	 */	
	public class TouZhuPrizeData
	{
		/** 玩家要去偷的猪的id, 即怪物id **/
		public var zhuId:int;
		/** 偷猪的奖励 **/
		public var prize:PrizeInfo;
		
		public function TouZhuPrizeData( touzhuprize:TouZhuPrize )
		{
			if( touzhuprize == null )
				return;
			
			zhuId = touzhuprize.zhuId;
			prize = ProtoParseToInfo.decodePrizeProto( touzhuprize.prize );
		}
	}
}