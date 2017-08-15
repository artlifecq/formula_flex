package com.rpgGame.app.ui.alert
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.sender.HunYinSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.marriage.message.SCNoticeByDivorceMessage;
	import com.rpgGame.netData.marriage.message.SCProposalResultMessage;
	import com.rpgGame.netData.marriage.message.SCTargetProposalMessage;
	
	import org.mokylin.skin.app.hunyin.AlertJieHun;
	
	import starling.display.DisplayObject;
	
	public class QiuHunTiShiPanelExt extends SkinUIPanel
	{
		private var _skin:AlertJieHun;
		private var _type:int;
		private var _msg:*;
		private var _name:String;
		public function QiuHunTiShiPanelExt()
		{
			_skin=new AlertJieHun();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.btn_ok.visible=false;
			_skin.btn_jieshou.visible=false;
			_skin.btn_jujue.visible=false;
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case _skin.btn_ok:					
					btnOkHandler();
					break;
				case _skin.btn_jieshou:
					var msg:SCTargetProposalMessage=_msg as SCTargetProposalMessage;
					HunYinSender.upCSTargetProposalResultMessage(1,msg.targetId);
					Mgr.hunyinMgr.RefusedAllQiuHun();
					hide();
					break;
				case _skin.btn_jujue:
					msg=_msg as SCTargetProposalMessage;
					HunYinSender.upCSTargetProposalResultMessage(0,msg.targetId);
					hide();
					break;
				case _skin.btnClose:
					if(_type==2)
					{
						msg=_msg as SCTargetProposalMessage;
						HunYinSender.upCSTargetProposalResultMessage(0,msg.targetId);
					}
					hide();
					break;
			}
		}
		
		/**
		 * type(1:求婚 2:被求婚 4:被离婚提示 5:离婚 6:求婚反馈 7:拒绝副本邀请 8:离婚反馈)
		 * */
		public static function showJieHunPanel(type:int,msg:*,name:String=""):QiuHunTiShiPanelExt
		{
			var panel:QiuHunTiShiPanelExt=new QiuHunTiShiPanelExt();
			panel._type=type;
			panel._msg=msg;
			panel._name=name;
			panel.setData();
			if(panel) panel.show();
			return panel;
		}
		
		public function updateShow(type:int,msg:*,name:String=""):void
		{
			_type=type;
			_msg=msg;
			_name=name;
			setData();
		}
		
		private function setData():void
		{
			var str:String;
			var istsr:String="";
			switch(_type)
			{
				case 1:
					_skin.btn_ok.visible=true;
					_skin.btn_jieshou.visible=false;
					_skin.btn_jujue.visible=false;
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"是否向")+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,_name)+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"玩家求婚");
					_skin.lbInfo1.htmlText=str;
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,"求婚消耗")+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"100")+HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,"元宝，求婚失败不予退还");
					_skin.lbInfo2.htmlText=str;
					break;
				case 2:
					_skin.btn_ok.visible=false;
					_skin.btn_jieshou.visible=true;
					_skin.btn_jujue.visible=true;
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"是否接受")+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,(_msg as SCTargetProposalMessage).targetName)+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"的求婚");
					_skin.lbInfo1.htmlText=str;
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_RED_TEXT,"被求婚不会消耗元宝");
					_skin.lbInfo2.htmlText=str;
					break;
				case 4:
					_skin.btn_ok.visible=true;
					_skin.btn_jieshou.visible=false;
					_skin.btn_jujue.visible=false;
					var ms1:SCNoticeByDivorceMessage =_msg as SCNoticeByDivorceMessage;
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,ms1.name)+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"和你离婚了");
					_skin.lbInfo1.htmlText=str;
					_skin.lbInfo2.visible=false;
					break;
				case 5:
					_skin.btn_ok.visible=true;
					_skin.btn_jieshou.visible=false;
					_skin.btn_jujue.visible=false;
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"百年修得同船渡，千年修得共枕眠\n是否与")+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,_name)+
					HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"玩家离婚");
					_skin.lbInfo1.htmlText=str;
					_skin.lbInfo2.visible=false;
					break;
				case 6:
					_skin.btn_ok.visible=true;
					_skin.btn_jieshou.visible=false;
					_skin.btn_jujue.visible=false;
					var ms:SCProposalResultMessage=_msg as SCProposalResultMessage;
					istsr=ms.result==0?"拒绝":"接受";
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,ms.targetName)+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,istsr+"了你的求婚");
					_skin.lbInfo1.htmlText=str;
					_skin.lbInfo2.visible=false;
					break;
				case 7:
					_skin.btn_ok.visible=true;
					_skin.btn_jieshou.visible=false;
					_skin.btn_jujue.visible=false;
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,istsr+"您的伴侣正忙，请稍后再邀请");
					_skin.lbInfo1.htmlText=str;
					_skin.lbInfo2.visible=false;
					break;
				case 8:
					_skin.btn_ok.visible=true;
					_skin.btn_jieshou.visible=false;
					_skin.btn_jujue.visible=false;
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,istsr+"您已离婚");
					_skin.lbInfo1.htmlText=str;
					_skin.lbInfo2.visible=false;
					break;
			}
		}
		
		private function btnOkHandler():void
		{
			switch(_type)
			{
				case 1:
					HunYinSender.upCSProposalMessage(_name);
					AppManager.hideApp(AppConstant.HUNYIN_QIUHUN);
					hide();
					break;
				case 5:
					HunYinSender.upCSDivorceMessage();
					AppManager.hideApp(AppConstant.HUNYIN_JIEHUN);
					hide();
					break;
				default:
					hide();
					break;
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			if(Mgr.hunyinMgr.marriageInfos==null||Mgr.hunyinMgr.marriageInfos.state==5||Mgr.hunyinMgr.marriageInfos.state==10)
				Mgr.hunyinMgr.chakeNextQiuHunMsg();
		}
	}
}