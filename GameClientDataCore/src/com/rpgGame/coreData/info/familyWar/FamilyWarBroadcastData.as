package com.rpgGame.coreData.info.familyWar
{
	
	/**
	 * 战场广播数据 
	 * @author Mandragora
	 * 
	 */
	public class FamilyWarBroadcastData
	{
		public function FamilyWarBroadcastData()
		{
		}
		public var time : Number;
		private var seizeCrystalg : SeizeCrystalgData;
		private var continueKilling : ContinueKillingData;
//		public function setData(data:KingWarBroadcastProto):void
//		{
//			if(data.time)
//				time = data.time.toNumber();
//			if(data.hasContinueKilling)
//				continueKilling = new ContinueKillingData(data.continueKilling);
//			if(data.hasSeizeCrystal)
//				seizeCrystalg = new SeizeCrystalgData(data.seizeCrystal);
//		}
		
		public function getMsg():String
		{
			if(continueKilling)
				return continueKilling.getMsg();
			if(seizeCrystalg)
				return seizeCrystalg.getMsg();
			return "";
		}
	}
}

/**
 * // 副本内飘字——（阵营名）角色名成功夺取了（水晶名），阵营名离获取胜利更近一步。
 * @author Mandragora
 * 
 */
class SeizeCrystalgData
{
//	public function SeizeCrystalgData(data:SeizeCrystalProto)
//	{
//		setData(data);
//	}
	/**
	 *	optional string family_name = 1; // 阵营名
	 optional string name = 2; // 角色名
	 optional string target_family_name = 3; // 目标阵营名
	 optional string target_name = 4; // 目标角色名 
	 */	
	public var familyName : String;
	public var name : String;
	public var crystal_name : String;
//	public function setData(data:SeizeCrystalProto):void
//	{
//		familyName = data.guildName;
//		name = data.name;
//		crystal_name = data.crystalName;
//	}
	
	public function getMsg():String
	{
		return "（"+familyName+"）"+name+"名成功夺取了（"+crystal_name+"），阵营名离获取胜利更近一步";
	}
}

/**
 * // 副本内飘字——（阵营名）角色名击杀了（阵营名）最后一名被击杀的角色名，已经不可一世。
 * @author Mandragora
 * 
 */
class ContinueKillingData
{
//	public function ContinueKillingData(data:ContinueKillingProto)
//	{
//		setData(data);
//	}
	/**
	 *	optional string family_name = 1; // 阵营名
		optional string name = 2; // 角色名
		optional string target_family_name = 3; // 目标阵营名
		optional string target_name = 4; // 目标角色名 
	 */	
	public var familyName : String;
	public var name : String;
	public var targetFamilyName : String;
	public var targetName : String;
//	public function setData(data:ContinueKillingProto):void
//	{
//		familyName = data.guildName;
//		name = data.name;
//		targetName = data.targetName;
//		targetFamilyName = data.targetGuildName;
//	}
	
	public function getMsg():String
	{
		return "（"+familyName+"）"+name+"击杀了（"+targetFamilyName+"）"+targetName+"，已经不可一世";
	}
}