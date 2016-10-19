package  com.rpgGame.coreData.type
{
	
	/**
	 * 性别类型
	 */		
	public class SexType
	{ 
		/**
		 * 男
		 * */
		public static const MALE:int = 1;
		/**
		 * 女
		 * */
		public static const FEMALE:int = 2;
		
		public static const Name_MALE:String = "男";
		public static const Name_FEMALE:String = "女";
		
		public static function getName(sex:int):String
		{
			if(sex == MALE)return Name_MALE;
			else if(sex == FEMALE)return Name_FEMALE;
			return null;
		}
	}
}

