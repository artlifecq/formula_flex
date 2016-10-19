package com.rpgGame.coreData.enum
{
	

	/**
	 * alert框 不再提示的数据保存类型，是当前登录有效还是一直有效存在so里 
	 * @author fly
	 * 
	 */	
	public class PromptSaveType
	{
		
		/** 只在当前游戏周期有效下线重新失效*/		
		public static const THIS_LOGIN:int = 1;
		/** 存在so里，在当前电脑里有效*/		
		public static const SHARED_OBJECT:int = 2;
		
	}
}