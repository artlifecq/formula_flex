package com.rpgGame.app.manager
{
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.app.manager.guild.GuildManager;
    import com.rpgGame.app.manager.pop.UIPopManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.ui.OpenPanel;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.events.FunctionOpenEvent;
    import com.rpgGame.coreData.cfg.NewFuncCfgData;
    import com.rpgGame.coreData.cfg.PanelCfgData;
    import com.rpgGame.coreData.clientConfig.Q_newfunc;
    import com.rpgGame.coreData.clientConfig.Q_panel;
    import com.rpgGame.coreData.enum.EmFunctionID;
    
    import org.client.mainCore.ds.HashMap;
    import org.client.mainCore.manager.EventManager;

    public class FunctionOpenManager 
    {
        public static var funcBits:Object = null;
        private static var openedMap:HashMap = new HashMap();
		public static var needShowOpenMode:Boolean = true;
		
		/**
		 * 检查已经开启的新功能,并通知消息 
		 * @param level
		 * @param isdispatch
		 * 
		 */
		public static function openFunctionByLevel(level:int,isdispatch:Boolean):void
		{
			var funcLists:Array = NewFuncCfgData.getAllFuncList();
			var itemlist:Vector.<int> = new Vector.<int>();
			var num:int=funcLists.length;
			for(var i:int=0;i<num;i++){
				var info :Q_newfunc=funcLists[i];
				if(openedMap.getValue(info.q_id))
					continue;
				if(info.q_level > level)
					continue;
				openedMap.add(info.q_id,info);
				itemlist.push(info.q_id);
			}
			
			if(isdispatch)
			{
				if(needShowOpenMode)
				{
					if(itemlist.length>0)
					{
						UIPopManager.showAlonePopUI(OpenPanel,itemlist.concat());
					}
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
		public static function functionIsOpen(id:int):Boolean
		{
			var bool:Boolean = openedMap.getValue(id) as Q_newfunc != null;
			if(bool)
			{
				switch(id)
				{
					case EmFunctionID.EM_BANGHUI_INFO:
					case EmFunctionID.EM_BANGHUI_CHENGYUAN:
					case EmFunctionID.EM_BANGHUI_UPLEVEL:
						if(GuildManager.instance().haveGuild)
						{
							return true;
						}
						else 
						{
							return false;
						}
						break;
					case EmFunctionID.EM_BANGHUI_SPELL:
						if(GuildManager.instance().haveGuild||GuildManager.instance().havePersonSkill)
						{
							return true;
						}
						return false;
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
			var infos:Vector.<Q_newfunc> = NewFuncCfgData.noticeList;
			var length:int = infos.length;
			var noticeInfo:Q_newfunc; 

			for(var i:int = 0;i<length;i++)
			{
				var data:Q_newfunc = infos[i];
				if(data.q_level <= level)
					continue;
				noticeInfo = data;
				break;
			}
			
			if(noticeInfo){
				AppManager.showAppNoHide(AppConstant.NOTIVE_FUNCTION,noticeInfo);
			}else{
				AppManager.hideApp(AppConstant.NOTIVE_FUNCTION);
			}
		}
		
		
		public static function checkOpenByLevel(level:int):Boolean
		{
			return level<=MainRoleManager.actorInfo.totalStat.level;
		}
		
		public static function checkOpenByFunId(id:int):Boolean
		{
			var func:Q_newfunc = NewFuncCfgData.getFuncCfg(id);
			if(func == null)
				return false;
			return checkOpenByLevel(func.q_level);
		}
		
		
		/**
		 *通过功能id打开面板 
		 * @param id
		 * 
		 */
		public static function openPanelByFuncID(id:int,data:Object=null):void
		{
			var funcCfg:Q_newfunc=NewFuncCfgData.getFuncCfgByPanelId(id);
			if(!funcCfg){
				return;
			}
			var panelCfg:Q_panel=PanelCfgData.getPanelCfg(funcCfg.q_open_panel);
			if(!panelCfg){
				return;
			}
			
			var minlevel:int =funcCfg.q_level;
			if(!checkOpenByLevel(minlevel))//未达到开启等级
			{
				NoticeManager.showNotifyById(90203,null,funcCfg.q_id,minlevel);
				return ;
			}
			
			AppManager.showApp(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
		}
		
		
		/**
		 *通过功能信息打开面板 
		 * @param info
		 * 
		 */
		public static function openPanelByFuncInfo(funcCfg:Q_newfunc,data:Object=null):void
		{
			var minlevel:int =funcCfg.q_level;
			if(!checkOpenByLevel(minlevel))//未达到开启等级
			{
				NoticeManager.showNotifyById(90203,null,funcCfg.q_id,minlevel);
				return ;
			}
			
			var panelCfg:Q_panel=PanelCfgData.getPanelCfg(funcCfg.q_open_panel);
			if(!panelCfg){
				return;
			}
			AppManager.showApp(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
		}
		
		/**
		 * 通过面板信息打开
		 * @param panelCfg
		 * 
		 */
		public static function openModeByPanelInfo(panelCfg:Q_panel,data:Object=null):void
		{
			if(!panelCfg){
				return;
			}
			var funcCfg:Q_newfunc=NewFuncCfgData.getFuncCfgByPanelId(panelCfg.id);
			if(!funcCfg){
				return;
			}
			var minlevel:int =funcCfg.q_level;
			if(!checkOpenByLevel(minlevel))//未达到开启等级
			{
				NoticeManager.showNotifyById(90203,null,funcCfg.q_id,minlevel);
				return ;
			}
			AppManager.showApp(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
		}
    }
}