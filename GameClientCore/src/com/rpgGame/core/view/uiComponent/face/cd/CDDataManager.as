package com.rpgGame.core.view.uiComponent.face.cd
{
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	public class CDDataManager
	{
		private static var _cdCallBackMap:HashMap = new HashMap();
		private static var _map:HashMap = new HashMap();
		
		public function CDDataManager()
		{
		}
		
		/**
		 * 剩余时间
		 * @param $cdType
		 * @return 
		 * 
		 */		
		public static function getCdLostTm( $cdType:* ):uint
		{
			var cdData:CDData = _map.getValue($cdType);
			if(cdData)
			{
				return cdData.lostTm;
			}
			return 0;
		}
		
		/**
		 * 让CD转起来
		 * @param $cdType
		 * @param $cd
		 * @param $startTm
		 * 
		 */		
		public static function playCD( $cdType:* , $cd:Number, $startTm:Number = 0 ):void
		{
			var cdData:CDData = _map.getValue( $cdType );
			cdData = cdData  || new CDData( $cdType );
			cdData.startCallBack = cdStart;
			cdData.updateCallBack = cdUpdata;
			cdData.completeCallBack = cdComplete;
			cdData.play( $cd, $startTm );
			//
			_map.add( $cdType, cdData );
		}
		
		private static function cdStart( $cdData:CDData ):void
		{
			EventManager.dispatchEvent( CDDataEvent.START, $cdData );
		}
		
		private static function cdUpdata( $cdData:CDData ):void
		{
			EventManager.dispatchEvent( CDDataEvent.UPDATE, $cdData );
		}
		
		private static function cdComplete( $cdData:CDData ):void
		{
			EventManager.dispatchEvent( CDDataEvent.COMPLETE, $cdData );
			
			_map.remove( $cdData.id );
		}
	}
}