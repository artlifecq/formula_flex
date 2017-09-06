package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 
	 * @author 新功能开启配置数据
	 * 
	 */
	public class NewFuncCfgData
	{
		private static var _map:HashMap;
		private static var _btnMap:HashMap;
		private static var _panelMap:HashMap;
		
		private static var _noticeList:Vector.<Q_newfunc>;
		
		public static function setup( byte:ByteArray ):void
		{
			var _list:Array = byte.readObject();
			_map = new HashMap();
			_btnMap=new HashMap();
			_panelMap=new HashMap();
			_noticeList=new Vector.<Q_newfunc>();
			for each ( var info:Q_newfunc in _list )
			{
				_map.add( info.q_id.toString(), info);
				if(info.q_need_notice!=0){
					_noticeList.push(info);
				}
				if(info.q_open_btn!=0){
					var btnInfo:Q_newfunc=_btnMap.getValue(info.q_open_btn);
					if(!btnInfo){
						_btnMap.add(info.q_open_btn,info);
					}else{
						if(btnInfo.q_level>info.q_level){
							_btnMap.add(info.q_open_btn,info);//以开启等级最低的为标准
						}
					}
				}
				if(info.q_open_panel!=0){
					_panelMap.add(info.q_open_panel,info);
				}
			}
			
			_noticeList.sort(sortByLv);
		}
		
		/**
		 *根据按钮id获取新功能配置 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getFuncCfgByBtnId(id:int):Q_newfunc
		{
			return _btnMap.getValue(id);
		}
		
		/**
		 *根据面板id获取功能配置 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getFuncCfgByPanelId(id:int):Q_newfunc
		{
			return _panelMap.getValue(id);
		}
		
		private static function sortByLv(a:Q_newfunc,b:Q_newfunc):int
		{
			if(a.q_level<b.q_level){
				return -1;
			}else if(a.q_level>b.q_level){
				return 1;
			}
			return 0;
		}
		
		/**
		 *获取所有的功能信息列表 
		 * @return 
		 * 
		 */
		public static function getAllFuncList():Array
		{
			return _map.getValues();
		}
		
		/**
		 *预告信息列表 
		 * @return 
		 * 
		 */
		public static function get noticeList():Vector.<Q_newfunc>
		{
			return _noticeList;
		}
		
		/**
		 *获取功能配置 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getFuncCfg(id:int):Q_newfunc
		{
			return _map.getValue(id);
		}
	}
}