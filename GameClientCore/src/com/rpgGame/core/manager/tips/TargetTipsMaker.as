package com.rpgGame.core.manager.tips
{
	import com.rpgGame.core.view.ui.tip.vo.BaseTipsInfo;
	import com.rpgGame.core.view.ui.tip.vo.TextTipsData;
	import com.rpgGame.coreData.type.TipType;
	
	import flash.geom.Point;

	/**
	 * 
	 * @author luguozheng
	 * 
	 */	
	public class TargetTipsMaker
	{
		public function TargetTipsMaker()
		{
		}
		
		/**
		 * 得到一个文本TIPS的数据类
		 * @param info
		 * @param dynamicData
		 * @param dynamicFunc
		 * @param point
		 * @return 
		 * 
		 */		
		public static function makeSimpleTextTips( info:String, dynamicData:Array = null, dynamicFunc:Function = null, point:Point = null  ):BaseTipsInfo
		{
			var tipsData:TextTipsData = new TextTipsData( info, dynamicData, dynamicFunc );
			
			var tipsInfo:BaseTipsInfo = new BaseTipsInfo();
			tipsInfo.tipsType = TipType.TXT_TIP;
			tipsInfo.data = tipsData;
			tipsInfo.isDynamic = (dynamicFunc != null);
			tipsInfo.point = point;
			return tipsInfo;
		}
		
		/**
		 * 得到一个TIPS面板所用的数据类
		 * @param tipsType
		 * @param tipsData
		 * @param isDynamic
		 * @param point
		 * @return 
		 * 
		 */		
		public static function makeTips( tipsType:int, tipsData:*, isDynamic:Boolean = false, point:Point = null  ):BaseTipsInfo
		{
			var info:BaseTipsInfo = new BaseTipsInfo();
			info.tipsType = tipsType;
			info.data = tipsData;
			info.isDynamic = isDynamic;
			info.point = point;
			return info;
		}
		
		//------------------------------------------------------
		
	}
}