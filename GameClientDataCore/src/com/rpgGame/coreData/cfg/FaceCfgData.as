package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	
	import flash.utils.ByteArray;
	import flash.utils.getDefinitionByName;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 表情配置 
	 * @author mandragora
	 * 
	 */	
	public class FaceCfgData
	{
		public function FaceCfgData()
		{
		}
		private static var _faceMap:HashMap = new HashMap();
		private static var _moodMap:HashMap = new HashMap();
		private static var _moodBigMap:HashMap = new HashMap();
		
		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_faceMap = new HashMap();
			for each (var info : FaceInfo in arr)
			{
				info.faceClass = getDefinitionByName("org.mokylin.skin.mc."+info.key) as Class;
				if(isFace(info))
				{
					_faceMap.add(info.key, info);
				}
				else if(isMood(info))
				{
					_moodMap.add(info.key, info);
				}
				else if(isMoodBig(info))
				{
					_moodBigMap.add(info.key,info);
				}
			}
		}
		/**
		 * 用来映射表情的皮肤类，只会执行一次。
		 * @return 
		 * 
		 */		
		public static function getAllFace():Array
		{
			return _faceMap.getValues();
		}
		
		public static function sortByIndex(dataInfo1 : FaceInfo, dataInfo2 : FaceInfo) : int
		{
			if (dataInfo1.index < dataInfo2.index)
				return -1;
			
			if (dataInfo1.index > dataInfo2.index)
				return 1;
			
			return 0;
		}
		
		public static function getFaceInfoByKey(key:String):FaceInfo
		{
			return _faceMap.getValue(key);
		}
		
		public static function checkHasFace(str:String):Boolean
		{
			var arr:Array = _faceMap.getValues();
			var len:int = arr.length;
			for(var i:int = 0; i < len; i++)
			{
				var info:FaceInfo = arr[i];
				if(str.indexOf(info.str) >= 0)
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 获取所有心情数据
		 * @return 
		 * 
		 */
		public static function getAllMoodInfo():Array
		{
			return _moodMap.getValues();
		}
		
		/**
		 * 获取对应心情数据
		 * @param key
		 * @return 
		 * 
		 */
		public static function getMoodInfoByKey(key:String):FaceInfo
		{
			return _moodMap.getValue(key);
		}
		
		/**
		 * 获取对应心情大动画数据
		 * @param key
		 * @return 
		 * 
		 */
		public static function getMoodBigInfoByKey(index:int):FaceInfo
		{
			index += 100;
			return _moodBigMap.getValue("UIMovieClipSkin_FACE_" + index);
		}
		
		/**
		 * 是否是表情数据
		 * @param faceInfo
		 * @return 
		 * 
		 */
		public static function isFace(faceInfo:FaceInfo):Boolean
		{
			return (faceInfo.index <100);
		}
		
		/**
		 * 是否是心情数据
		 * @param faceInfo
		 * @return 
		 * 
		 */
		public static function isMood(faceInfo:FaceInfo):Boolean
		{
			return (faceInfo.index >= 100 && faceInfo.index < 200);
		}
		
		/**
		 * 是否是心情大动画数据
		 * @param faceInfo
		 * @return 
		 * 
		 */
		public static function isMoodBig(faceInfo:FaceInfo):Boolean
		{
			return (faceInfo.index >= 200);
		}
	}
}