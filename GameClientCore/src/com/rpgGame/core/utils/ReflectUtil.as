package com.rpgGame.core.utils
{
	import com.gameClient.log.GameLog;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;

	/**
	 * 反射工具类 
	 * @author fly.liuyang
	 * 
	 */	
	public class ReflectUtil
	{
		public static function getClassFromAppDomain(reflectName:String,appDomain:ApplicationDomain = null):Class
		{
			appDomain = appDomain == null ? ApplicationDomain.currentDomain : appDomain;
			var cls:Class
			try
			{
				var clsObj:Object = appDomain.getDefinition(reflectName);
				if(clsObj)
				{
					cls = clsObj as Class;
				}
			} 
			catch(error:Error) 
			{
				GameLog.add(new Error(),"未定义的反射名称：" + reflectName);
			}
			return cls;
		}
		
		private static function getInstanceFromAppDomain(classType:Class,reflectName:String,appDomain:ApplicationDomain = null):*
		{
			var cls:Class = getClassFromAppDomain(reflectName,appDomain);
			if(cls != null)
			{
				var instance:* = new cls();
				if(instance is classType)
				{
					try
					{
						return new cls() as classType;
					}catch(error:Error)
					{
						GameLog.add(new Error(),"类型转换失败，" + cls + " 无法转换成：" + classType);
					}
				}else
				{
					GameLog.add(new Error(),"类型转换失败，" + cls + " 无法转换成：" + classType);
				}
			}
			return null;
		}
		
		public static function getObjectFromAppDomain(reflectName:String,appDomain:ApplicationDomain = null):*
		{
			var cls:Class = getClassFromAppDomain(reflectName,appDomain);
			if(cls != null)
			{
				return new cls();
			}
			return null;
		}
		
		public static function getSpriteFromAppDomain(reflectName:String,appDomain:ApplicationDomain = null):Sprite
		{
			return getInstanceFromAppDomain(Sprite,reflectName,appDomain);
		}
		
		public static function getMovieClipFromAppDomain(reflectName:String,appDomain:ApplicationDomain = null):MovieClip
		{
			return getInstanceFromAppDomain(MovieClip,reflectName,appDomain);
		}
		
		public static function getBitmapDataFromAppDomain(reflectName:String,appDomain:ApplicationDomain = null):BitmapData
		{
			return getInstanceFromAppDomain(BitmapData,reflectName,appDomain);
		}
	}
}
