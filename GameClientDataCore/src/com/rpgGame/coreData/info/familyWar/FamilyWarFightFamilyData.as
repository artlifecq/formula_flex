package com.rpgGame.coreData.info.familyWar
{
	import app.message.KingWarPartyType;
	

	/**
	 * 正在打王城战的帮派的数据 
	 * @author Mandragora
	 * 
	 */	
	public class FamilyWarFightFamilyData
	{
		public var name : String;
		/**积分**/
		public var jifen:Number;
		/**是中立还是进攻/防守方**/
		public var PartyType : int;
		public function FamilyWarFightFamilyData()
		{
		}
		
		public function getTypeName():String
		{
			switch(PartyType)
			{
				case KingWarPartyType.ATTACK:
					return "进攻";
				case KingWarPartyType.DEFENCE:
					return "防守";
				case KingWarPartyType.NEUTRALITY:
					return "中立";
			}
			return "";
		}
	}
}