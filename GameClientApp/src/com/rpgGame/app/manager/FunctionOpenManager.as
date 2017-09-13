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
    import com.rpgGame.coreData.clientConfig.Q_mainbtn;
    import com.rpgGame.coreData.clientConfig.Q_map;
    import com.rpgGame.coreData.clientConfig.Q_newfunc;
    import com.rpgGame.coreData.clientConfig.Q_panel;
    import com.rpgGame.coreData.enum.EmFunctionID;
    import com.rpgGame.coreData.enum.EmOpenType;
    import com.rpgGame.coreData.enum.EmPanelID;
    import com.rpgGame.coreData.info.MapDataManager;
    import com.rpgGame.coreData.info.map.EnumMapType;
    
    import flash.net.URLRequest;
    import flash.net.navigateToURL;
    
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
				if(info.q_show_open!=0){
					itemlist.push(info.q_id);
				}
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
			var cfg:Q_newfunc=NewFuncCfgData.getFuncCfg(id);
			if(!cfg){
				return false;
			}
			return checkOpenByLevel(cfg.q_level);
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
				if(data.q_level <= level||data.q_need_notice==0)
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
		public static function openPanelByFuncID(id:int,data:Object=null,isAutoHide:Boolean=true):void
		{
			var funcCfg:Q_newfunc=NewFuncCfgData.getFuncCfg(id);
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
				NoticeManager.showNotifyById(90203,null,funcCfg.q_name,minlevel);
				return ;
			}
			if (!checkOtherCondicion(panelCfg.main_id)) 
			{
				return;
			}
			if(isAutoHide){
				AppManager.showApp(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
			}else{
				AppManager.showAppNoHide(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
			}
		}
		
		
		/**
		 *通过功能信息打开面板 
		 * @param info
		 * 
		 */
		public static function openPanelByFuncInfo(funcCfg:Q_newfunc,data:Object=null,isAutoHide:Boolean=true):void
		{
			var minlevel:int =funcCfg.q_level;
			if(!checkOpenByLevel(minlevel))//未达到开启等级
			{
				NoticeManager.showNotifyById(90203,null,funcCfg.q_name,minlevel);
				return ;
			}
			
			var panelCfg:Q_panel=PanelCfgData.getPanelCfg(funcCfg.q_open_panel);
			if(!panelCfg){
				return;
			}
			if (!checkOtherCondicion(panelCfg.main_id)) 
			{
				return;
			}
			if(isAutoHide){
				AppManager.showApp(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
			}else{
				AppManager.showAppNoHide(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
			}
		}
		/**
		 *通过面板id打开面板 
		 */
		public static function openPanelBypanelId(id:int,data:Object=null,isAutoHide:Boolean=true):void
		{
			var panelInfo:Q_panel=PanelCfgData.getPanelCfg(id);
			if(panelInfo!=null)
			{
				openModeByPanelInfo(panelInfo,data,isAutoHide);
			}
		}
		/**
		 * 通过面板信息打开
		 * @param panelCfg
		 * 
		 */
		public static function openModeByPanelInfo(panelCfg:Q_panel,data:Object=null,isAutoHide:Boolean=true):void
		{
			if(!panelCfg){
				return;
			}
			var funcCfg:Q_newfunc=NewFuncCfgData.getFuncCfgByPanelId(panelCfg.id);
			if(funcCfg){//有功能配置
				var minlevel:int =funcCfg.q_level;
				if(!checkOpenByLevel(minlevel))//未达到开启等级
				{
					NoticeManager.showNotifyById(90203,null,funcCfg.q_name,minlevel);
					return ;
				}
			}
			if (!checkOtherCondicion(panelCfg.main_id)) 
			{
				return;
			}
			if(isAutoHide){
				AppManager.showApp(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
			}else{
				AppManager.showAppNoHide(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
			}
		}
		
		private static function checkOtherCondicion(panelId:int):Boolean
		{
			switch(panelId)
			{
				case EmPanelID.ZU_DUI:
				{
					var map:Q_map=MapDataManager.currentScene.getData();
					if (map&&EnumMapType.MAP_TYPE_TOWERS==map.q_map_type)
					{
						NoticeManager.showNotifyById(13058);
						return false;
					}
					break;
				}
					
				default:
				{
					break;
				}
			}
			return true;
		}
		/**
		 *通过按钮信息打开 
		 * @param btnCfg
		 * @param data
		 * 
		 */
		public static function openByBtnInfo(btnCfg:Q_mainbtn,data:Object=null,isAutoHide:Boolean=true):void
		{
			if(btnCfg.q_click_type==EmOpenType.OPEN_URL){
				navigateToURL(new URLRequest(btnCfg.q_click_arg),"_blank");
			}else if(btnCfg.q_click_type==EmOpenType.OPEN_PANEL){
				var panelId:int=int(btnCfg.q_click_arg);
				var funcCfg:Q_newfunc=NewFuncCfgData.getFuncCfgByPanelId(panelId);
				if(!funcCfg){
					return;
				}
				var panelCfg:Q_panel=PanelCfgData.getPanelCfg(panelId);
				if(!panelCfg){
					return;
				}
				var minlevel:int =funcCfg.q_level;
				if(!checkOpenByLevel(minlevel))//未达到开启等级
				{
					NoticeManager.showNotifyById(90203,null,funcCfg.q_name,minlevel);
					return ;
				}
				if (!checkOtherCondicion(panelCfg.main_id)) 
				{
					return;
				}
				if(isAutoHide){
					AppManager.showApp(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
				}else{
					AppManager.showAppNoHide(AppConstant.getAppNameByPanelId(panelCfg.main_id),data,funcCfg.q_id);
				}
			}
		}
    }
}