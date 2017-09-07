package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_mainbtn;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 界面按钮表.xlsx
	 *游戏界面按钮配置数据 
	 * @author dik
	 * 
	 */
	public class MainBtnCfgData
	{
		private static var _map:HashMap=new HashMap();
		private static var _typeBtnMap:HashMap=new HashMap();
		
		public function MainBtnCfgData()
		{
		}
		
		public static function setup( byte:ByteArray ):void
		{
			var _list:Array = byte.readObject();
			for each (var info:Q_mainbtn in _list)
			{
				_map.add(info.q_id,info);
				var list:Vector.<Q_mainbtn>=_typeBtnMap.getValue(info.q_btn_type);
				if(!list){
					list=new Vector.<Q_mainbtn>();
					_typeBtnMap.add(info.q_btn_type,list);
				}
				list.push(info);
			}
			
			_list=_typeBtnMap.getValues();
			for(var i:int=0;i<_list.length;i++){
				list= _list[i];
				list.sort(sortByOrder);
			}
		}
		
		/**
		 *获取所有按钮列表 
		 * @return 
		 * 
		 */
		public static function getAllBtnList():Array
		{
			return _map.getValues();
		}
		
		private static function sortByOrder(a:Q_mainbtn,b:Q_mainbtn):int
		{
			if(a.q_btn_order<b.q_btn_order){
				return -1;
			}else if(a.q_btn_order>b.q_btn_order){
				return 1;
			}
			return 0;
		}
		
		/**
		 *获取主界面按钮配置数据 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getMainBtnCfg(id:int):Q_mainbtn
		{
			return _map.getValue(id);
		}
		
		/**
		 *获取指定按钮的配置列表 
		 * @param type
		 * @return 
		 * 
		 */
		public static function getBtnListByType(type:int):Vector.<Q_mainbtn>
		{
			return _typeBtnMap.getValue(type);
		}
	}
}