package com.rpgGame.appModule.hunyin
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	
	import away3d.events.Event;
	
	import feathers.controls.UIAsset;
	import feathers.events.FeathersEventType;
	
	import org.mokylin.skin.app.hunyin.QiuHun_Skin;
	
	import starling.display.DisplayObject;
	
	public class QiuHunPanelExt extends SkinUIPanel 
	{
		private var _skin:QiuHun_Skin;
		
		private var _icoList:Vector.<IconCDFace>;
		
		private var _modEftContaner:Inter3DContainer;		
		private var _jiezimoxing:InterObject3D;
		private var _eff:InterObject3D;
		private const JIEHUNJIEZIEFF:String="ring/qiuhunjiezhi_001/qiuhunjiezhi_001";
		
		private var _playerName:String = "";
		private static const DEFAULT_CHAT_TEXT:String = "输入选择求婚对象";
		private const boyText:String="求美女老婆一枚。";
		private const grilText:String="求帅哥老公一枚。";
		
		public function QiuHunPanelExt()
		{
			_skin=new QiuHun_Skin();
			super(_skin);
			_modEftContaner = new Inter3DContainer();
			_skin.container.addChild(_modEftContaner);
			initView();
			initMod();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.lbZhenHun: //征婚
					onlbZhenHunHandler();
					break;
				case _skin.btnQiuHun://求婚
					onBtnQiuHunHandler();
					break;
			}			
		}
		
		override protected function onShow():void
		{
			super.onShow();
			_skin.textInput.text = DEFAULT_CHAT_TEXT;
			_skin.textInput.color=StaticValue.A_UI_GRAY_TEXT;
			initEvent();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			closeEvent();
		}
		
		private function initEvent():void
		{
			_skin.textInput.addEventListener(FeathersEventType.FOCUS_IN,forceinHandler);
			_skin.textInput.addEventListener(FeathersEventType.FOCUS_OUT,forceoutHandler);
		}
		
		private function closeEvent():void
		{
			_skin.textInput.removeEventListener(Event.CHANGE,forceinHandler);
			_skin.textInput.removeEventListener(FeathersEventType.FOCUS_OUT,forceoutHandler);
		}
		
		private function initView():void
		{
			_icoList = new Vector.<IconCDFace>();
			var q_global:Q_global=GlobalSheetData.getSettingInfo(836);
			var prizearr:Array=JSONUtil.decode(q_global.q_string_value);
			for(var i:int = 0;i < 4;i ++)
			{
				var ico:IconCDFace = new IconCDFace(IcoSizeEnum.ICON_64);		
				ico.selectImgVisible = false;	
				_skin.container.addChild(ico);
				var uibg:UIAsset = _skin.container.getChildByName("icon"+(i+1)) as UIAsset;
				ico.bindBg(uibg);
				_icoList.push(ico);
				if(i<prizearr.length)
				{
					var iteminfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(prizearr[i].mod,prizearr[i].num);
					if(iteminfo!=null)
					{
						FaceUtil.SetItemGrid(ico,iteminfo);
					}
				}
			}
			_skin.textInput.text = DEFAULT_CHAT_TEXT;
		}
		
		
		/**初始化特效*/
		private function initMod():void
		{
			_jiezimoxing = new InterObject3D();
			var data:RenderParamData3D = new RenderParamData3D(RenderUnitID.HUNYIN_JIEZI,RenderUnitType.HUNYIN_JIEZI,ClientConfig.getAvatar(JIEHUNJIEZIEFF));
			data.animatorSourchPath=ClientConfig.getAvatar(JIEHUNJIEZIEFF);
			data.forceLoad=true;
			var unit : RenderUnit3D = _jiezimoxing.addRenderUnitWith(data, 0);
			unit.play();
			unit.addUnitAtComposite(unit);
			_jiezimoxing.x=400;
			_jiezimoxing.y=330;
			_modEftContaner.addChild3D(_jiezimoxing);
			
			_eff=_modEftContaner.playInter3DAt(ClientConfig.getEffect("ui_qiuhun"),397,357,0);
		}
		
		private function forceinHandler(evt:Event):void
		{
			_skin.textInput.text="";		
			_skin.textInput.color=StaticValue.A_UI_BEIGE_TEXT;
		}
		
		private function forceoutHandler(evt:Event):void
		{
			if(_skin.textInput.text == "")
			{
				_skin.textInput.text = DEFAULT_CHAT_TEXT;
				_skin.textInput.color=StaticValue.A_UI_GRAY_TEXT;
			}
		}	
		
		private function onlbZhenHunHandler():void
		{		
			var str:String=ItemUtil.getJobName(MainRoleManager.actorInfo.job)+" "+MainRoleManager.actorInfo.totalStat.getStatValue(CharAttributeType.LV)+"级,"
			if(MainRoleManager.actorInfo.sex==1) str+=boyText;
			else str+=grilText;
			var link:String=RichTextCustomUtil.getTextLinkCode("点击向我求婚",StaticValue.A_UI_GREEN_TEXT,RichTextCustomLinkType.QIUHUN,MainRoleManager.actorInfo.name+","+MainRoleManager.actorInfo.id);		
			ChatManager.reqSendChat( str+link, EnumChatChannelType.CHAT_CHANNEL_WORLD,  ChatManager.currentSiLiaoTargetName );
		}
		
		private function onBtnQiuHunHandler():void
		{
			if(_skin.textInput.text == ""||_skin.textInput.text == DEFAULT_CHAT_TEXT)
			{
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(92003));
				return;
			}
			Mgr.hunyinMgr.showQiuHunTiShiPanel(1,null,_skin.textInput.text);
		}
	}
}