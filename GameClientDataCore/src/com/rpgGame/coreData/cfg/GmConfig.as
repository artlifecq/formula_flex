package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.GmInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class GmConfig
	{
		private static var allConfig:HashMap;
		
		public static function setup( data:ByteArray ):void
		{
			allConfig = new HashMap();
			
			var arr : Array = data.readObject();
			var len:int = arr.length;
			var pageVect:Vector.<GmInfo>;
			var info : GmInfo
			for(var i:int = 0; i < len ; i++)
			{
				info = arr[i];
				pageVect = allConfig.getValue( info.pageName );
				if( pageVect == null )
				{
					pageVect = new Vector.<GmInfo>();
					allConfig.add( info.pageName, pageVect );
				}
				
				addConfig( pageVect, info );
			}
			
		}
		
		/**
		 * 按类型添加到组中，类型小的在前
		 * @param pageVect
		 * @param info
		 * 
		 */		
		private static function addConfig( pageVect:Vector.<GmInfo>, info:GmInfo ):void
		{
			var len:int = pageVect.length;
			var type:int = 0;
			for( var i:int = 0; i < len; i++)
			{
				type = pageVect[i].type;
				
				if( info.type < type )//类型相同
				{
					pageVect.splice( i , 0, info );
					return;
				}
			}
		
			//----------添加在最后
			pageVect.push( info );
		}
		
		
		public static function getAllConfig():HashMap
		{
			return allConfig;
		}
	}
}