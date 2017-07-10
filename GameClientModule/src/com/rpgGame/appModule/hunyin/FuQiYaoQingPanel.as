package com.rpgGame.appModule.hunyin
{
	import com.rpgGame.app.sender.HunYinSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.HunYinUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.marriage.message.SCNoticeZoneMessage;
	
	import org.mokylin.skin.app.hunyin.AlertFuQiTips;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class FuQiYaoQingPanel extends SkinUIPanel
	{
		private var _skin:AlertFuQiTips;
		private var _msg:SCNoticeZoneMessage;
		public function FuQiYaoQingPanel()
		{
			_skin=new AlertFuQiTips();
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show();
			_msg=data as SCNoticeZoneMessage;
			_skin.lbInfo.htmlText=HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,"你的伴侣正在挑战")+HunYinUtil.getzoneText(_msg.zoneModelId)+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,"夫妻副本+\n+是否传送进副本");
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btn_ok:
					HunYinSender.upCSNoticeZoneMessage(_msg.zoneId,1);
					hide();
					break;
				case _skin.btnClose:
					HunYinSender.upCSNoticeZoneMessage(_msg.zoneId,0);
					hide();
					break;
			}			
		}
	}
}