package com.rpgGame.appModule.activety
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.sender.SpecialActivitySender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.cfg.PanelCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.clientConfig.Q_panel;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.common.alert.AlertActiveyOpen;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *活动开启面板 
	 * @author dik
	 * 
	 */
	public class ActOpenPanel extends SkinUIPanel
	{
		private var _skin:AlertActiveyOpen;

		private var actInfo:ActivetyInfo;
		
		public function ActOpenPanel()
		{
			_skin=new AlertActiveyOpen();
			super(_skin);
		}
		
		override public function show(data : * = null, openTable:int=0, parentContiner : DisplayObjectContainer = null) : void
		{
			actInfo=data as ActivetyInfo;
			_skin.icons.styleName="ui/icon/activity/open/"+actInfo.actCfg.q_activity_id+".png";
			_skin.labContent.htmlText=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,actInfo.actCfg.q_activity_name)+"活动已开始，是否前往？";
			super.show(data,openTable,parentContiner);
			
			EventManager.addEvent(ActivityEvent.CLOSE_ACTIVITY_NOTICE,closeAct);
		}
		
		private function closeAct(data:*=null):void
		{
			if(actInfo.actCfg.q_activity_id==data){
				AppManager.hideApp(AppConstant.ACTIVETY_OPEN);
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btn_ok){
				switch(actInfo.actCfg.q_activity_id)
				{
					/*case 1:
					{
						Mgr.d1v1Mgr.autoJoin();
						break;
					}
					case 2:
					{
						Mgr.nineTowerMgr.autoJoin();
						break;
					}	*/
					default:
					{
						if(actInfo.actCfg.q_notice_trans){
							var panelCfg:Q_panel=PanelCfgData.getPanelCfg(actInfo.actCfg.q_notice_trans);
							var funcCfg:Q_newfunc=NewFuncCfgData.getFuncCfgByPanelId(panelCfg.id);
							AppManager.showAppNoHide(AppConstant.getAppNameByPanelId(panelCfg.main_id),actInfo,funcCfg.q_id);
						}else{
							SpecialActivitySender.reqJoinAct(actInfo.actCfg.q_activity_id);
						}						
						break;
					}
				}
				this.hide()
			}
		}
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(ActivityEvent.CLOSE_ACTIVITY_NOTICE,closeAct);
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x = sw-this.width;
			this.y = sh-this.height-50;;
		}
	}
}