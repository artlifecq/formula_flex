package com.rpgGame.coreData.type.item
{
	import flash.utils.Dictionary;

	public class EquipmentPos
	{
		//客户端位置
		/** 时装 **/
		public static const POS_FASHION:int = 0;
		/** 项链 **/
		public static const POS_NECKLACE:int = 1;
		/** 武器 **/
		public static const POS_WEAPON:int = 2;
		/** 副武器 **/
		public static const POS_SECOND_WEAPON:int = 3;
		/** 戒指 **/
		public static const POS_LEFT_RING:int = 4;
		/** 戒指 **/
		public static const POS_RIGHT_RING:int = 5;
		
		/** 头盔 **/
		public static const POS_HELM:int = 6;
		/** 衣服 **/
		public static const POS_ARMOR:int = 7;
		/** 腰带 **/
		public static const POS_BELT:int = 8;
		/** 左手镯 **/
		public static const POS_LEFT_BRACER:int = 9;
		/** 右手镯 **/
		public static const POS_RIGHT_BRACER:int = 10;
		/** 鞋子 **/
		public static const POS_SHOE:int = 11;
		
		//服务端存储位置,临时，需要等服务端按UI给定位置一一对应
		/** 武器 **/
		private static const SERVER_POS_WEAPON:int = 0;
		/** 副武器 **/
		private static const SERVER_POS_SECOND_WEAPON:int = 1;
		/** 衣服 **/
		private static const SERVER_POS_ARMOR:int = 2;
		/** 头盔 **/
		private static const SERVER_POS_HELM:int = 3;
		/** 腰带 **/
		public static const SERVER_POS_BELT:int = 4;
		/** 左手护腕 **/
		private static const SERVER_POS_LEFT_BRACER:int = 5;
		/** 右手护腕 **/
		private static const SERVER_POS_RIGHT_BRACER:int = 6;
		/** 鞋子 **/
		private static const SERVER_POS_SHOE:int = 7;
		/** 项链 **/
		private static const SERVER_POS_NECKLACE:int = 8;
		/** 戒指 **/
		private static const SERVER_POS_LEFT_RING:int = 9;
		/** 戒指 **/
		private static const SERVER_POS_RIGHT_RING:int = 10;
		/** 时装**/
		public static const SERVER_POS_FASHION:int = 11;
		
		private static var serverPosMap:Object;
		private static var clientPosMap:Object;
		public static function getServerPos(clientPos:int):int
		{
			if(serverPosMap == null)
			{
				serverPosMap = {}
				serverPosMap[POS_WEAPON] = SERVER_POS_WEAPON;
				serverPosMap[POS_SECOND_WEAPON] = SERVER_POS_SECOND_WEAPON;
				serverPosMap[POS_ARMOR] = SERVER_POS_ARMOR;
				serverPosMap[POS_HELM] = SERVER_POS_HELM;
				serverPosMap[POS_BELT] = SERVER_POS_BELT;
				serverPosMap[POS_LEFT_BRACER] = SERVER_POS_LEFT_BRACER;
				serverPosMap[POS_RIGHT_BRACER] = SERVER_POS_RIGHT_BRACER;
				serverPosMap[POS_SHOE] = SERVER_POS_SHOE;
				serverPosMap[POS_NECKLACE] = SERVER_POS_NECKLACE;
				serverPosMap[POS_LEFT_RING] = SERVER_POS_LEFT_RING;
				serverPosMap[POS_RIGHT_RING] = SERVER_POS_RIGHT_RING;
				serverPosMap[POS_FASHION] = SERVER_POS_FASHION;
			}
			return serverPosMap[clientPos];
		}
		
		public static function getClientPos(serverPos:int):int
		{
			if(clientPosMap == null)
			{
				clientPosMap = {}
				clientPosMap[SERVER_POS_WEAPON] = POS_WEAPON;
				clientPosMap[SERVER_POS_SECOND_WEAPON] = POS_SECOND_WEAPON;
				clientPosMap[SERVER_POS_ARMOR] = POS_ARMOR;
				clientPosMap[SERVER_POS_HELM] = POS_HELM;
				clientPosMap[SERVER_POS_BELT] = POS_BELT;
				clientPosMap[SERVER_POS_LEFT_BRACER] = POS_LEFT_BRACER;
				clientPosMap[SERVER_POS_RIGHT_BRACER] = POS_RIGHT_BRACER;
				clientPosMap[SERVER_POS_SHOE] = POS_SHOE;
				clientPosMap[SERVER_POS_NECKLACE] = POS_NECKLACE;
				clientPosMap[SERVER_POS_LEFT_RING] = POS_LEFT_RING;
				clientPosMap[SERVER_POS_RIGHT_RING] = POS_RIGHT_RING;
				clientPosMap[SERVER_POS_FASHION] = POS_FASHION;
			}
			return clientPosMap[serverPos];
		}
		

		/** 骏骑鞍 **/
		public static const POS_SADDLE:int = 20;
		/** 骏骑镫 **/
		public static const POS_STIRRUP:int = 21;
		/** 骏骑缰绳 **/
		public static const POS_REIN:int = 22;
		/** 骏骑蹄 **/
		public static const POS_HOOF:int = 23;
		/** 骏骑面甲 **/
		public static const POS_VISOR:int = 24;
		/** 骏骑鞭 **/
		public static const POS_WHIP:int = 25;
	}
}