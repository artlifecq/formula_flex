package com.rpgGame.app.manager
{
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.coreData.cfg.NewFuncCfgData;
    import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
    import com.rpgGame.coreData.clientConfig.Q_newfunc;
    
    import org.client.mainCore.ds.HashMap;

    public class FunctionOpenManager 
    {

        public static var funcBits:Object = null;
        private static var _statusMap:HashMap = new HashMap();
		
		
		
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