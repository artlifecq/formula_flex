package com.rpgGame.app.manager
{
    import com.gameClient.utils.JSONUtil;
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.app.manager.guild.GuildManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.events.FunctionOpenEvent;
    import com.rpgGame.coreData.cfg.FuncionBarCfgData;
    import com.rpgGame.coreData.cfg.NewFuncCfgData;
    import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
    import com.rpgGame.coreData.clientConfig.Q_newfunc;
    import com.rpgGame.coreData.enum.EmFunctionID;
    
    import org.client.mainCore.ds.HashMap;
    import org.client.mainCore.manager.EventManager;

    public class FunctionOpenManager 
    {
        public static var funcBits:Object = null;
        private static var _statusMap:HashMap = new HashMap();
		public static var needShowOpenMode:Boolean = true;
		/**
		 * 检查已经开启的新功能,并通知消息 
		 * @param level
		 * @param isdispatch
		 * 
		 */
		public static function openFunctionByLevel(level:int,isdispatch:Boolean):void
		{
			var infos:Array = NewFuncCfgData.alldata();
			var itemlist:Vector.<String> = new Vector.<String>();
			for each(var info :Q_newfunc in infos)
			{
				if(_statusMap.getValue(info.q_id)!=null)
					continue;
				if(info.q_level > level)
					continue;
				_statusMap.add(info.q_id,info);
				itemlist.push(info.q_id);
			}
			if(isdispatch)
			{
				if(needShowOpenMode)
				{
					if(itemlist.length>0)
						AppManager.showAppNoHide(AppConstant.OPEN_FUNCTION,itemlist.concat());
					else
						AppManager.hideApp(AppConstant.OPEN_FUNCTION);
				}
				EventManager.dispatchEvent(FunctionOpenEvent.FUNCTIONOPENID,itemlist);
			}
			openNoticeByLevel(level);
		}
		
		
		/**
		 * 检查功能是否开启 
		 * @param id
		 * @return 
		 * 
		 */
		public static function functionIsOpen(id:String):Boolean
		{
			var bool:Boolean = _statusMap.getValue(id) as Q_newfunc != null;
			if(bool)
			{
				switch(id)
				{
					case EmFunctionID.EM_BANGHUI_INFO:
					case EmFunctionID.EM_BANGHUI_CHENGYUAN:
					case EmFunctionID.EM_BANGHUI_UPLEVEL:
					case EmFunctionID.EM_BANGHUI_COMBAT:
						bool = GuildManager.instance().haveGuild;
						break;
					case EmFunctionID.EM_BANGHUI_SPELL:
						if(GuildManager.instance().haveGuild)
							bool = true;
						else
							bool = GuildManager.instance().havePersonSkill;
						break;
				}
			}
			return bool;
		}
		
		/**
		 * 功能预告设置 
		 * @param level
		 * 
		 */
		public static function openNoticeByLevel(level:int):void
		{
			var infos:Vector.<Q_newfunc> = NewFuncCfgData.getSortList();
			var length:int = infos.length;
			var found:Q_newfunc; 

			for(var i:int = 0;i<length;i++)
			{
				var data:Q_newfunc = infos[i];
				if(data.q_level <= level)
					continue;
				if(found==null)
				{
					found = data;
					break;
				}
			}
			
			if(found!=null){
				AppManager.showAppNoHide(AppConstant.NOTIVE_FUNCTION,found);
			}else{
				AppManager.hideApp(AppConstant.NOTIVE_FUNCTION);
			}
		}
		
		public static function openFunctionById(id:String):void
		{
			AppManager.showApp(AppConstant.OPEN_FUNCTION,id);
		}
		
		public static function checkOpenByLevel(level:int):Boolean
		{
			return level<=MainRoleManager.actorInfo.totalStat.level;
		}
		
		public static function getOpenLevelByFunBarInfo(info:FunctionBarInfo):int
		{
			if(info.isshow==1)
				return int.MAX_VALUE;
			var list:Array = NewFuncCfgData.getListById(info.id);
			if(list==null)
				return int.MAX_VALUE;
			var value:int = int.MAX_VALUE;
			for each(var func:Q_newfunc in list)
			{
				value = Math.min(func.q_level,value);
			}
			return value;
		}
		
		public static function checkOpenBuyFunId(id:String):Boolean
		{
			var func:Q_newfunc = NewFuncCfgData.getdataById(id);
			if(func == null)
				return false;
			return checkOpenByLevel(func.q_level);
		}
		
		
		/**
		 * 打开功能面板 
		 * @param info
		 * @return 
		 * 
		 */
		public static function openFunctionId(info:Q_newfunc,data:Object = null,isAutoHide:Boolean = true):void
		{
			if(info==null)
				return ;
			if(!functionIsOpen(info.q_id.toString()))
			{
				return ;
			}
			var ids:Array = JSONUtil.decode(info.q_main_id) as Array;
			var modeInfo:FunctionBarInfo = FuncionBarCfgData.getActivityBarInfo(ids[0]);
			openModeByInfo(modeInfo,info.q_id.toString(),data,isAutoHide);
		}
		
		public static function openAppPaneById(id:String,data:Object = null,isAutoHide:Boolean = true,isError:Boolean = true):void
		{
			var info:Q_newfunc = NewFuncCfgData.getdataById(id);
			if(info==null)
			{
				if(isError)
					NoticeManager.showNotifyById(61040);
				return ;
			}
			openFunctionId(info,data,isAutoHide);
		}
		
		/**
		 * 打开面板
		 * @param info
		 * @param id 功能id
		 * @param data
		 * @param isAutoHide
		 * 
		 */
		public static function openModeByInfo(info:FunctionBarInfo,id:String= "",data:Object = null,isAutoHide:Boolean = true):void
		{
			if(info.clickarg=="")
				return ;
			var openId:String=id?id:"";
			if(info.clickType==1)
			{
				if(isAutoHide)
					AppManager.showApp(info.clickarg,data,openId);
				else
					AppManager.showAppNoHide(info.clickarg,data,openId);
			}
		}
    }
}