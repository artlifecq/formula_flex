package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_GCD;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class GCDCfgData
	{
		private static var gcdMap:HashMap = new HashMap();
		
		public function GCDCfgData()
		{
		}
		
		public static function setup(data:ByteArray ):void
		{
			var arr : Array = data.readObject();
			for each(var info : Q_GCD in arr) {
				gcdMap.add(info.id,info.cd);
			}
		}
		
		/**
		 * 得到公共CD
		 * @param gcdId
		 * @return 
		 * 
		 */		
		public static function getGcd( gcdId:int ):int
		{
			if( gcdMap.getValue( gcdId ) == null )
				return 0;
			
			return gcdMap.getValue( gcdId );
		}
		
	}
}