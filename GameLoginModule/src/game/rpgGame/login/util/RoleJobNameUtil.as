package game.rpgGame.login.util
{
	

	/**
	 * 职业名字
	 * @author luguozheng
	 * 
	 */	
	public class RoleJobNameUtil
	{
		public function RoleJobNameUtil()
		{
		}
		
		/**
		 * 得到对应国家的名字
		 * @param type
		 * @return 
		 * @author 卢国征
		 */		
		public static function getCountryName( country:int ):String
		{
			switch( country )
			{
				case 1:
					return "扬州";
				case 2:
					return "益州";
				case 3:
					return "荆州";
				case 4:
					return "兖州";
				case 5:
					return "青州";
			}
			return "";
		}
	}
}