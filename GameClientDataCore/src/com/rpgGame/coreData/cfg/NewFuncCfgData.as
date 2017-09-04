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
		
		private static var _noticeList:Vector.<Q_newfunc>;
		private static var _btnListMap:HashMap;
		
		public static function setup( byte:ByteArray ):void
		{
			var _list:Array = byte.readObject();
			_map = new HashMap();
			_noticeList=new Vector.<Q_newfunc>();
			_btnListMap=new HashMap();
			for each ( var info:Q_newfunc in _list )
			{
				_map.add( info.q_id.toString(), info);
				if(info.q_need_notice!=0){
					_noticeList.push(info);
				}
				if(info.q_open_btn){
					var list:Vector.<Q_newfunc>=_btnListMap.getValue(info.q_btn_type);
					if(!list){
						list=new Vector.<Q_newfunc>();
						_btnListMap.add(info.q_btn_type,list);
					}
				}
			}
			
			_noticeList.sort(sortByLv);
			
			var typelist:Array=_btnListMap.getValues();
			for(var i:int=0;i<typelist.length;i++){
				list=typelist[i];
				list.sort(sortByOrder);
			}
		}
		
		private static function sortByOrder(a:Q_newfunc,b:Q_newfunc):int
		{
			if(a.q_btn_order<b.q_btn_order){
				return -1;
			}else if(a.q_btn_order>b.q_btn_order){
				return 1;
			}
			return 0;
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
		
		/**
		 *获取功能按钮配置 
		 * @param type
		 * @return 
		 * 
		 */
		public static function getFuncBtnList(type:int):Vector.<Q_newfunc>
		{
			return _btnListMap.getValue(type);
		}
	}
}