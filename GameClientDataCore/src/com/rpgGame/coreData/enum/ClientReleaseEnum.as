package com.rpgGame.coreData.enum
{
	/**
	 * 客户端发布版本类型 
	 * @author Carver
	 * 
	 */	
	public class ClientReleaseEnum
	{
		public static const UN_DECODE:uint = 0;//不加密
		public static const AOTU_DECODE:uint = 1;//自动通过页面带过来的参数加密
		public static const OUTNET_TEST:uint = 2;//外网测试
		public static const DECODE_TEST:uint = 3;//测试本地加密素材
	}
}