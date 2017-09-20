package com.rpgGame.coreData.cfg.active
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.clientConfig.Q_special_activities;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *活动大厅配置数据 
	 * @author dik
	 * 
	 */
	public class ActivetyCfgData
	{
		private static var _jixianVo:JiXianVo;
		private static var _typeMap:HashMap;
		private static var _infoMap:HashMap;
		
		public function ActivetyCfgData()
		{
		}
		
		public static function getTypes():Array
		{
			return _typeMap.keys();
		}
		
		public static function setup( data:ByteArray ):void
		{
			var arr : Array = data.readObject();
			var num:int=arr.length;
			var info:Q_special_activities;
			_typeMap=new HashMap();
			_infoMap=new HashMap();
			for(var i:int=0;i<num;i++){
				info=arr[i];
				addCfg(info);
			}
		}
		
		public static function get jixianVo():JiXianVo
		{
			if(_jixianVo==null) _jixianVo=new JiXianVo();
			return _jixianVo;
		}
		
		/**
		 *添加配置 
		 * @param cfg
		 * 
		 */
		private static function addCfg(cfg:Q_special_activities):void
		{
			var typeList:Vector.<ActivetyInfo>=_typeMap.getValue(cfg.q_activity_type);
			var info:ActivetyInfo;
			if(!typeList){
				typeList=new Vector.<ActivetyInfo>();
				_typeMap.add(cfg.q_activity_type,typeList);
			}
			if(cfg.q_activity_type==1){
				info=new BossActInfo();			
			}else{
				info=new ActivetyInfo();
			}
			info.actCfg=cfg;
			_infoMap.add(cfg.q_activity_id,info);
			typeList.push(info);
		}
		
		/**
		 *获取指定类型的活动列表 
		 * @param type
		 * @return 
		 * 
		 */
		public static function sortTypeList(type:int):void
		{
			var list:Vector.<ActivetyInfo>= _typeMap.getValue(type);
			if(list){
				list=list.sort(sortListByID);
//				list=list.sort(sortListByState);
			}
		}
		
		/**
		 *更新击杀者 
		 * 
		 */
		public static function updateBossKiller(id:int,killer:String):void
		{
			if(id == jixianVo.activityid)
			{
				jixianVo.killName = killer;
			}
			else
			{
				var bossInfo:BossActInfo=getActInfoById(id) as BossActInfo;
				if(bossInfo){
					bossInfo.killerName=killer;
				}
			}
		}
		
		public static function getTypeList(type:int):Vector.<ActivetyInfo>
		{
			return _typeMap.getValue(type);
		}
		
		/**
		 *排序所有数据 
		 * 
		 */
		public static function sortAllDatas():void
		{
			var keys:Array=_typeMap.keys();
			for each(var key:int in keys){
				var list:Vector.<ActivetyInfo>=_typeMap.getValue(key);
				if(!list){
					continue;
				}
				list=list.sort(sortListByID);
//				list=list.sort(sortListByState);
			}
		}
		
		private static function sortListByID(infoA:ActivetyInfo,infoB:ActivetyInfo):int
		{
			if(infoA.info==null||infoB.info==null){
				return 0;
			}
			if(infoA.actCfg.q_order<infoB.actCfg.q_order){
				return -1;
			}else if(infoA.actCfg.q_order>infoB.actCfg.q_order){
				return 1;
			}
			return 0;
		}
	/*	
		private static function sortListByState(infoA:ActivetyInfo,infoB:ActivetyInfo):int
		{
			if(infoA.info==null||infoB.info==null){
				return 0;
			}
			if(infoA.info.joinState>infoB.info.joinState){
				return -1;
			}else if(infoA.info.joinState<infoB.info.joinState){
				return 1;
			}
			return 0;
		}	*/
		
		/**
		 *根据活动id获取活动信息 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getActInfoById(id:int):ActivetyInfo
		{
			return _infoMap.getValue(id);
		}
		
		public static function getActInfoTextById(id:int):String
		{
			var info:ActivetyInfo=ActivetyCfgData.getActInfoById(id);
			if(info==null)
				return "";
			var desObj:Array=JSONUtil.decode(info.actCfg.q_text);
			
			if(!desObj){
				desObj=[];
			}
			var num:int=desObj.length;
			var text:String="";
			for(var i:int=0;i<num;i++){
				var obj:Object=desObj[i];
				var des:String=obj.des;
				if(obj.reId){
					var list:Array=des.split("$");
					text+=list[0];
					text+=list[1]+"\n";
				}else{
					text+=obj.des+"\n";
				}
			}
			
			return text;
		}
	}
}