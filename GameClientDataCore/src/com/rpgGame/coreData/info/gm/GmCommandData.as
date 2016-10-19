package com.rpgGame.coreData.info.gm
{
	import com.rpgGame.coreData.clientConfig.GmInfo;
	
	/**
	 * 
	 * @author luguozheng
	 * 
	 */	
	public class GmCommandData
	{
		/** 无参数**/
		public static const NO_PARAMETER:int = 1;
		/** 有参数**/
		public static const HAS_PARAMETER:int = 2;
		
		private var _gmInfo:GmInfo
		/**点击回调**/
		public var onClickHandler:Function;
		
		
		public function setData( $gmInfo:GmInfo ):void
		{
			_gmInfo = $gmInfo;
		}
		
		/**配置数据**/
		public function get gmInfo():GmInfo
		{
			return _gmInfo;
		}
		
	}
}