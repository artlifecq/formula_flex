package  com.rpgGame.coreData.type
{
	
	

	/**
	 * 门派类型
	 * 
	 * wuxi update on 2011-10-15 18:24:43
	 * 将傲剑之前的门派类型数据改成了江湖的门派数据
	 */		
	public class JobType
	{ 
		/**
		 * 男
		 * */
		public static const NAN:int = 1;
		/**
		 * 女
		 * */
		public static const NV:int = 2;
		
		/**
		 * @private
		 * 映射关系
		 */	
		private static var mapping:Array = [
			[NAN, 	  	"男"],
			[NV, 	  	"女"]
		];
	}
}