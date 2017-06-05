package com.rpgGame.app.manager
{
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.coreData.UNIQUEID;
    import com.rpgGame.coreData.cfg.NewFuncCfgData;
    import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
    import com.rpgGame.coreData.clientConfig.Q_newfunc;
    
    import org.client.mainCore.ds.HashMap;
    import org.client.mainCore.manager.EventManager;

    public class FunctionOpenManager 
    {
		public static const FUNCTIONOPENID:int = UNIQUEID.NEXT;
        public static var funcBits:Object = null;
        private static var _statusMap:HashMap = new HashMap();
		
		public static function openFunctionByLevel(level:int,isdisable:Boolean):void
		{
			var map:HashMap = NewFuncCfgData.map;
			var infos:Array = map.getValues();
			var itemlist:Vector.<int> = new Vector.<int>();
			for each(var info :Q_newfunc in infos)
			{
				if(info.q_level > level)
					continue;
				if(_statusMap.getValue(info.q_id)!=null)
					continue;
				_statusMap.add(info.q_id,info);
				itemlist.push(info.q_id);
			}
			if(isdisable)
			{
				if(itemlist.length>0)
					AppManager.showAppNoHide(AppConstant.OPEN_FUNCTION,itemlist);
				else
					AppManager.hideApp(AppConstant.OPEN_FUNCTION);
			}
			
			openNoticeByLevel(level);
			EventManager.dispatchEvent(FUNCTIONOPENID,itemlist);
		}
		
		
		/**
		 * 检查功能是否开启 
		 * @param id
		 * @return 
		 * 
		 */
		public static function functionIsOpen(id:int):Boolean
		{
			return _statusMap.getValue(id) as Q_newfunc != null;
		}
		
		public static function openNoticeByLevel(level:int):void
		{
			var map:HashMap = NewFuncCfgData.map;
			var infos:Array = map.getValues();
			var length:int = infos.length;
			var found:Q_newfunc; 

			for(var i:int = 0;i<length;i++)
			{
				var data:Q_newfunc = infos[i];
				if(data.q_notivelevel <= 0)
					continue;
				if(data.q_notivelevel > level)
					continue;
				if(data.q_level <= level)
					continue;
				
				if(found==null)
					found = data;
				else if(found.q_id<data.q_id){
					found = data;
				}
			}
			
			if(found!=null){
				AppManager.showAppNoHide(AppConstant.NOTIVE_FUNCTION,found);
			}else{
				AppManager.hideApp(AppConstant.NOTIVE_FUNCTION);
			}
		}
		
		public static function openFunctionById(id:int):void
		{
			AppManager.showApp(AppConstant.OPEN_FUNCTION,id);
		}
		
		public static function checkOpenByLevel(level:int):Boolean
		{
			return level<=MainRoleManager.actorInfo.totalStat.level;
		}
		
		public static function getOpenLevelByFunBarInfo(info:FunctionBarInfo):int
		{
			var list:Array = NewFuncCfgData.getListById(info.id);
			if(list==null)
				return 0;
			var value:int = int.MAX_VALUE;
			for each(var func:Q_newfunc in list)
			{
				value = Math.min(func.q_level,value);
			}
			return value;
		}
		
		public static function checkOpenBuyFunId(id:int):Boolean
		{
			var func:Q_newfunc = NewFuncCfgData.getdataById(id);
			if(func == null)
				return false;
			return checkOpenByLevel(func.q_level);
		}
		
		public static function openModeByInfo(info:FunctionBarInfo):void
		{
			if(info.clickarg=="")
				return ;
			if(info.clickType==1)
			{
				AppManager.showApp(info.clickarg);
			}
		}
    }
}