package game.rpgGame.login.util
{


	/**
	 * 随机名
	 * @author fly.liuyang
	 *
	 */
	public class RandomNick
	{
		private static var _firstNameArr : Array;
		private static var _middleFlagArr : Array;
		private static var _maleNameArr : Array;
		private static var _femaleNameArr : Array;

		/**
		 * 初始化数据
		 * @param firstNameArr			姓
		 * @param middleFlagArr			中间符号
		 * @param maleLastNameArr		男名
		 * @param feMaleLastNameArr		女名
		 *
		 */
		public static function setup(firstNameArr : Array, middleFlagArr : Array, maleLastNameArr : Array, feMaleLastNameArr : Array) : void
		{
			_firstNameArr = firstNameArr;
			_middleFlagArr = middleFlagArr;
			_maleNameArr = maleLastNameArr;
			_femaleNameArr = feMaleLastNameArr;
		}

		/**
		 * 随机名字
		 * @param isMan		是否是男性
		 * @return
		 * @author 卢国征
		 */
		public static function randomNick(isMan : Boolean) : String
		{
			if (!_firstNameArr)
				return "";
			var firstNameIndex : int = randRange(0, _firstNameArr.length - 1);
			var firstNameStr : String = _firstNameArr[firstNameIndex];
			var lastName : String = "";

			if (isMan)
			{
				var manLastIndex : int = randRange(0, _maleNameArr.length - 1);
				lastName = _maleNameArr[manLastIndex];
			}
			else
			{
				var femaleLastIndex : int = randRange(0, _femaleNameArr.length - 1);
				lastName = _femaleNameArr[femaleLastIndex];
			}

			return firstNameStr + lastName;
		}

		/**
		 * 获取一个区间内的一个随机数
		 * @param min	最小值
		 * @param max	最大值
		 * @return
		 * @author 卢国征
		 */
		public static function randRange(min : Number, max : Number) : Number
		{
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
	}
}
