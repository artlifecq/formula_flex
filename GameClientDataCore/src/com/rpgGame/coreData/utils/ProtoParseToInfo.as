package com.rpgGame.coreData.utils
{
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	
	import app.message.PrizeProto;

	/**
	 *
	 * 吧服务端传的proto转换成客户端自定义的info
	 * 
	 * 注意 一般情况下一些简单的proto是可以拿来直接使用的，不用再自定义info，然后转换
	 * 
	 * @author fly.liuyang
	 * 创建时间：2014-5-27 下午4:43:32
	 * 
	 */
	public class ProtoParseToInfo
	{
		public function ProtoParseToInfo()
		{
		}
		
		/**
		 * 解析一个任务奖励数据
		 * @param prizeProto
		 * @return 
		 * 
		 */		
		public static function decodePrizeProto(prizeProto:PrizeProto):PrizeInfo
		{
			var prizeInfo:PrizeInfo = new PrizeInfo();
			prizeInfo.converData(prizeProto);
			return prizeInfo;
		}
		
		public static function getPrizeInfoVectItem( prizeVect:Vector.<PrizeInfo> ):Vector.<ClientItemInfo>
		{
			var itemInfoList:Vector.<ClientItemInfo> = new Vector.<ClientItemInfo>();
			var len:int = prizeVect.length;
			var prize:PrizeInfo;
			for( var i:int = 0; i < len; i++ )
			{
				prize = prizeVect[ i ];
				itemInfoList = itemInfoList.concat( prize.itemInfoList );
			}
			
			return itemInfoList;
		}
	}
}