package com.rpgGame.appModule.activety
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.sender.SpecialActivitySender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
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
		
		override public function show(data : * = null, openTable : String = "", parentContiner : DisplayObjectContainer = null) : void
		{
			actInfo=data as ActivetyInfo;
			_skin.icons.styleName="ui/common/icon/activity/open/"+actInfo.actCfg.q_activity_id+".png";
			_skin.labContent.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,actInfo.actCfg.q_activity_name)+"活动已开始，是否前往？";
			super.show(data,openTable,parentContiner);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btn_ok){
				switch(actInfo.actCfg.q_activity_id)
				{
					case 1:
					{
						Mgr.d1v1Mgr.autoJoin();
						break;
					}
					case 2:
					{
						Mgr.nineTowerMgr.autoJoin();
						break;
					}	
					default:
					{
						if(actInfo.actCfg.q_notice_trans){
							var list:Array=JSONUtil.decode(actInfo.actCfg.q_notice_trans);
							AppManager.showAppNoHide(list[0],actInfo,list[1]);//跳到对应标签的对应活动
						}else{
							SpecialActivitySender.reqJoinAct(actInfo.actCfg.q_activity_id);
						}						
						break;
					}
				}
				this.hide()
			}
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x = sw-this.width;
			this.y = sh-this.height-50;;
		}
	}
}