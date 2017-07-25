package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class PetEvent
	{
		/**
		 *获得面板数据 
		 */		
		public static const GET_PETS_DATA:int=UNIQUEID.NEXT;
		
		public static const PET_DATA_CHANGE:int=UNIQUEID.NEXT;
		
		public static const PET_UP_RESULT:int=UNIQUEID.NEXT;
		
		public static const PET_ACTIVE:int=UNIQUEID.NEXT;
		
		public static const PET_LEVEL_CHANGE:int=UNIQUEID.NEXT;
		
		public static const PET_BUYNUM_CHANGE:int = UNIQUEID.NEXT;
	}
}