package com.rpgGame.app.manager
{
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.ui.main.buttons.MainButtonBases;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.coreData.cfg.FuncionBarCfgData;
    import com.rpgGame.coreData.cfg.FunctionNoticeCfgData;
    import com.rpgGame.coreData.cfg.NewFuncCfgData;
    import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
    import com.rpgGame.coreData.clientConfig.Q_funcNotice;
    import com.rpgGame.coreData.clientConfig.Q_newfunc;
    
    import org.client.mainCore.ds.HashMap;

    public class FunctionOpenManager 
    {
        public static var funcBits:Object = null;
        private static var _statusMap:HashMap = new HashMap();
		
		public static function openFunctionByLevel(level:int):void
		{
			var map:HashMap = NewFuncCfgData.map;
			var infos:Array = map.getValues();
			var itemlist:Vector.<int> = new Vector.<int>();
			for each(var info :Q_newfunc in infos)
			{
				if(info.q_level == level)
					itemlist.push(info.q_id);
			}
			if(itemlist.length>0)
				AppManager.showAppNoHide(AppConstant.OPEN_FUNCTION,itemlist);
			else
				AppManager.hideApp(AppConstant.OPEN_FUNCTION);
			
			openNoticeByLevel(level);
		}
		
		
		public static function openNoticeByLevel(level:int):void
		{
			var arr:Array = FunctionNoticeCfgData.list;
			var length:int = arr.length;
			var found:Q_funcNotice; 

			for(var i:int = 0;i<length;i++)
			{
				var data:Q_funcNotice = arr[i];
				if(data.q_level > level)
					continue;
				var info1 :Q_newfunc = NewFuncCfgData.getdataById(data.q_newfunId);
				if(info1.q_level <= level)
					continue;
				if(data.q_level >= info1.q_level)
					continue;
				if(found==null)
					found = data;
				else if(found.q_id<info1.q_id){
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
    }
}