package com.rpgGame.coreData.cfg
{
	import app.message.GcdGroupProto;
	import app.message.GcdGroupsConfig;
	
	import org.client.mainCore.ds.HashMap;

	public class GCDCfgData
	{
		private static var gcdMap:HashMap = new HashMap();
		
		public function GCDCfgData()
		{
		}
		
		public static function setConfig( gcdConfig:GcdGroupsConfig ):void
		{
			if(!gcdConfig)
				return;
			var len:int = gcdConfig.gcd.length;
			var gcd:GcdGroupProto;
			for( var i:int = 0; i < len; i++ )
			{
				gcd = gcdConfig.gcd[i];
				gcdMap.add( gcd.id, gcd.cd );
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