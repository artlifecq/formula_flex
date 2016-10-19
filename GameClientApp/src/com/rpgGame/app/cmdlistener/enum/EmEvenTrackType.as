package com.rpgGame.app.cmdlistener.enum
{
	import com.rpgGame.coreData.rEnum;

	public class EmEvenTrackType
	{
		/**偷经**/
		public static const TOU_JING:uint = rEnum.ENUM_START();
		/**密信**/
		public static const SECRET_MESSAGE:uint = rEnum.next;
		/**运镖**/
		public static const YUN_BIAO:uint = rEnum.next;
		
		public function EmEvenTrackType()
		{
		}
	}
}