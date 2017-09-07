package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_panel;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 游戏面板表.xlsx
	 * 游戏面板配置数据
	 * @author dik
	 * 
	 */
	public class PanelCfgData
	{
		private static var _map:HashMap=new HashMap();
		
		public function PanelCfgData()
		{
		}
		
		public static function setup( byte:ByteArray ):void
		{
			var _list:Array = byte.readObject();
			for each ( var info:Q_panel in _list )
			{
				_map.add(info.id,info);
			}
		}
		
		/**
		 *获取面板配置信息 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getPanelCfg(id:int):Q_panel
		{
			return _map.getValue(id);
		}
	}
}