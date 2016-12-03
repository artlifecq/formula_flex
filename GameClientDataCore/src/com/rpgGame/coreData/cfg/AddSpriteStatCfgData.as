package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	
	import app.message.AddSpriteStatConfig;

	/**
	 * 洗点相关，可能以后不用了 
	 * @author NEIL
	 * 
	 */	
	public class AddSpriteStatCfgData
	{
		// <该等级免费洗点
		public static var freeClearSpriteStatPointLevel:int;
		
		// 能够使用属性点加哪些属性[StatType]
		public static var canUseSpriteStatPointType:Array;
		
		// 洗点消耗道具
		public static var clearSpriteStatInfo:UpgradeProtoInfo;
		
		// 属性简写名对应的属性类型
		public static const StatTypeNameMap:Object =
		{
//				"ll":StatType.LI_LIANG,
//				"mj":StatType.MIN_JIE,
//				"zl":StatType.ZHI_LI,
//				"js":StatType.JING_SHENG,
//				"tz":StatType.TI_ZHI
		}
		
		public static function setConfig(data:AddSpriteStatConfig):void
		{
			freeClearSpriteStatPointLevel = data.freeClearSpriteStatPointLevel;
			canUseSpriteStatPointType = data.canUseSpriteStatPointType;
			
			clearSpriteStatInfo = new UpgradeProtoInfo();
			clearSpriteStatInfo.setProto( data.clearSpriteStatPointCost );
		}
	}
}