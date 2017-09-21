package app.message
{
	public class EnumBuff
	{
		public static const VIP1:int=12;
		public static const VIP2:int=13;
		public static const VIP3:int=14;
		public function EnumBuff()
		{
		}
		public static function isVip(buffId:int):Boolean
		{
			return VIP1==buffId||VIP2==buffId||VIP3==buffId;
		}
	}
}