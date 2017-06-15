package com.rpgGame.appModule.activety
{
	import com.rpgGame.app.manager.Mgr;
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
			_skin.icons.styleName="ui/common/icon/activity/open/"+actInfo.cfg.q_activity_id+".png";
			_skin.labContent.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,actInfo.cfg.q_activity_name)+"活动已开始，是否前往？";
			super.show(data,openTable,parentContiner);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btn_ok){
				//巅峰对决特殊处理
				if (1==actInfo.cfg.q_activity_id) 
				{
					Mgr.d1v1Mgr.autoJoin();
				}
				else
				{
					AppManager.showAppNoHide(actInfo.cfg.q_notice_trans,actInfo);
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