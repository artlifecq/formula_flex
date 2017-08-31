package com.rpgGame.app.ui.main.chat {
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.chat.ChatGoodsManager;
	import com.rpgGame.app.manager.chat.ChatInputManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.chat.ChatSpeakHistoryManager;
	import com.rpgGame.app.manager.chat.FaceGroupManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.debug.ClientCommend;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.main.chat.laba.VipChatCanvas;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.core.events.SceneInteractiveEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.utils.ColorUtils;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	
	import flash.geom.Point;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.Radio;
	import feathers.controls.ScrollBar;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollPolicy;
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.RelativePosition;
	import feathers.layout.VerticalLayout;
	import feathers.themes.GuiThemeStyle;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
	import org.mokylin.skin.mainui.chat.chat_Skin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class ChatBar extends SkinUI {
		private static const MINX : int = 336;
		private static const MINY : int = -200;
		private static const MAXX : int = 500;
		private static const MAXY : int = 100;
		
		private static const DEFAULT_CHAT_TEXT:String = "输入内容，点击发送";
		
		/**
		 * 世界:0 帮会:1 队伍:2 私聊:3 当前:4 喇叭:5
		 * */
		private static const CHANNEL_TYPES:Array=[EnumChatChannelType.CHAT_CHANNEL_WORLD,
			EnumChatChannelType.CHAT_CHANNEL_PARTY,EnumChatChannelType.CHAT_CHANNEL_TEAM,EnumChatChannelType.CHAT_CHANNEL_SILIAO,
			EnumChatChannelType.CHAT_CHANNEL_NORMAL,EnumChatChannelType.CHAT_CHANNEL_LABA];
		private static const CHANNEL_NUM:int=6;
		
		private static const CHANNEL_ZHONGHE:Array=[0,1,2,3,4,5];
		private static const CHANNEL_SHEJIAO:Array=[0,1,2,3,4,5];
		private static const CHANNEL_GEREN:Array=[3,4,5];
		private static const CHANNEL_ITEMS:Array=[CHANNEL_ZHONGHE,CHANNEL_SHEJIAO,CHANNEL_GEREN];
		
		private var _skin : chat_Skin;
		
		// 初始位置
		private var _initScaleX : int;
		private var _initScaleY : int;
		private var _initBgWidth : int;
		private var _initBgHeight : int;
		private var _initVScollerHeight : int;
		private var _initVScollerWidth : int;
		private var _initInputBgWidth : int;
		private var _initSendX : int;
		private var _initGroupButtomRightX : int;
		private var _initGroupTopY : int;
		private var _initBgY : int;
		
		
		private var _curWidth : int;
		
		// 调整大小
		private var _isAdjustSize : Boolean;
		private var _tween : TweenLite;
		
		// 聊天输入框
		private var _inputText : RichTextArea3D;
		
		/**当前输入的频道*/
		private var _curSendChannel:int;
		private var _vipChatCanvas:VipChatCanvas;
		private var _curShowTab:int;
		private var testRole:SceneRole;
		
		
		public function ChatBar() {
			this._skin = new chat_Skin();
			super(this._skin);
			
			this._initScaleX = this._skin.btn_scale.x;
			this._initScaleY = this._skin.btn_scale.y;
			this._initBgWidth = this._skin.bg.width;
			this._initBgHeight = this._skin.bg.height;
			
			this._initVScollerHeight =_initBgHeight;
			this._initVScollerWidth =_initBgWidth;
			this._initInputBgWidth = this._skin.inputbg.width;
			this._initSendX = this._skin.btn_send.x;
			this._initGroupTopY = this._skin.tab_Type.y;
			
			//现在不要拉伸 先屏蔽掉
			this._skin.btn_scale.visible=false;
			GuiThemeStyle.setScrollerStyle(_skin.listBar,ScrollBarSkin_chat);
			_skin.listBar.verticalScrollBarPosition = RelativePosition.LEFT;
			_skin.listBar.horizontalScrollPolicy =ScrollPolicy.OFF;
			_skin.listBar.verticalScrollPolicy = ScrollPolicy.ON;
			_skin.listBar.scrollBarDisplayMode=ScrollBarDisplayMode.FIXED;
			_skin.listBar.itemRendererType = ChatBarItemRender;
			_skin.listBar.dataProvider = new ListCollection();
			_skin.listBar.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreateList);
			var layout:VerticalLayout = new VerticalLayout();
			layout.useVirtualLayout = true;
			layout.gap =8;
			layout.hasVariableItemDimensions = true;
			_skin.listBar.layout = layout;
			_skin.btn_lock.isSelected=true;
			setListIstoOrKeep();
			
			this._initBgY = this._skin.bg.y;		
			
			var defaultFormat : TextFormat = new TextFormat(Fontter.FONT_Hei);
			defaultFormat.color = 0xded8c7;
			defaultFormat.size = 14;
			defaultFormat.align = TextFormatAlign.LEFT;
			defaultFormat.letterSpacing = 1;
			defaultFormat.leading = 0
			
			this._inputText = new RichTextArea3D(this._skin.inputbg.width-50, this._skin.inputbg.height, ColorUtils.getDefaultStrokeFilter());
//			this._inputText.maxChars = ChatCfgData.MAX_CHAR_LENGTH;
			this._inputText.isEditable = true;
			this._inputText.x = this._skin.inputbg.x;
			this._inputText.y = this._skin.inputbg.y+3;
			this._inputText.text = "";
			this._inputText.defaultTextFormat = defaultFormat;
			this._skin.grp_buttom.addChild(this._inputText);
			this._skin.grp_buttom.addChild(this._skin.btn_face);
			this._skin.grp_buttom.addChild(this._skin.btn_location);
			this._curWidth = this._skin.bg.width;
			
			this._isAdjustSize = false;
			
			//            this._skin.btn_dangqian.gotoAndStop(1);
			
			this._skin.btn_open.x=this._skin.btn_send.x+this._skin.btn_send.width;
			
			this.setOpenOrClose(true);
			
			//初始化喇叭显示框
			_vipChatCanvas = new VipChatCanvas(_skin.grp_laba,_skin.grp_laba_bg);
			_vipChatCanvas.displayVIPChat(false);
			
			//初始化按钮Tips
			TipTargetManager.show( _skin.btn_location, TargetTipsMaker.makeSimpleTextTips("添加当前位置信息"));
			TipTargetManager.show( _skin.btn_send, TargetTipsMaker.makeSimpleTextTips("按回车键发送消息"));
			//mouseOut();
			initChatChannel();
			initTabBar();
			initEvent();
		}
		
		private function onCreateList(e:Event):void
		{
			_skin.listBar.removeEventListener(FeathersEventType.CREATION_COMPLETE,onCreateList);
			var vb:ScrollBar=(e.currentTarget as List).getVerticalScrollBar() as ScrollBar;
			vb.alwaysVisible=true;
			vb.thumbAutoResize=false;
			setGroubState(false);
		}			
		
		private function initEvent():void
		{
			//MouseListenerUtil.addEventListener( this, null, mouseOver, mouseOut );			
			
			EventManager.addEvent(ChatEvent.SWITCH_PRIVATE_CHANNEL,onSwitchPrivateChannel);
			EventManager.addEvent(ChatEvent.SEND_SUCCESS, onSendSuccess);
			
			this._inputText.addEventListener(FeathersEventType.FOCUS_OUT,onFocueOut);			
			this.addEventListener(TouchEvent.TOUCH, this.onTouchEventHandler);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyboardEventHandler);
			
			EventManager.addEvent(ChatEvent.SHOW_GOODS,onShowGoods);
			
			EventManager.addEvent(SceneInteractiveEvent.SELECTED_SCENE_ROLE, showTest);
			
			/*	
			//测试飘字代码
			EventManager.addEvent(MapEvent.UPDATE_MAP_ROLE_ADD, onadd);
			setInterval(function():void{
			var hp:int=(10000*Math.random()+5000);
			FightFaceHelper.showAttChange(EnumHurtType.ADDHP,hp);
			},1000);*/
		}
		
		private function onFocueOut():void
		{
			// TODO Auto Generated method stub
			if(!_inputText.isInputFocus&&!_ismouseIn)
			{
				setGroubState(false);
			}
		}
		
		private function onShowGoods(item:ClientItemInfo=null):void
		{
			if(item==null)
			{
				GameLog.addError( "物品展示错误引发的异常！ " );
				return;
			}
			if(_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = "";
			}
			var key:String = ChatGoodsManager.addItemInfo(item);
			var goodsCode:String = RichTextCustomUtil.getItemCode(key,item.name,item.quality);
			_inputText.appendRichText(goodsCode);
			_inputText.setFocus();
			_inputText.textfield.setSelection(_inputText.width,_inputText.width);
			setGroubState(true);
		}
		
		private function showTest(role:SceneRole):void
		{
			testRole=role;
		}
		
		/**
		 * 自己的消息发送成功了
		 * @param infos
		 * 
		 */		
		private function onSendSuccess( info:ResChatMessage ):void 
		{
			if(info.type==EnumChatChannelType.CHAT_CHANNEL_SYSTEM){
				return;	
			}
			if(info.type==EnumChatChannelType.CHAT_CHANNEL_LABA)
			{
				if(!_skin.grp_laba.visible) _vipChatCanvas.displayVIPChat(true);
				_vipChatCanvas.addOneChuanYin(info);
			}
			
			if(isCanShowMsg(info.type))
				showChatMsg( info );
		}
		
		/**
		 * 判断当前消息是否能显示
		 * */
		private function isCanShowMsg(type:int):Boolean
		{
			switch(_curShowTab)
			{
				case 0: return ChatManager.isShowInAll(type);
				case 1: return ChatManager.isShowInSheHui(type);
				case 2: return ChatManager.isShowInGeRen(type);
			}
			return false;
		}
		
		/**
		 * 显示一条消息
		 * @param info
		 * 
		 */		
		private function showChatMsg( info:ResChatMessage ):void
		{
			_skin.listBar.dataProvider.addItem(info);
			if (_skin.listBar.dataProvider.length > ChatManager.MAX_CHATSHOWITEMCACEHE)
			{
				_skin.listBar.dataProvider.removeItemAt(0);
			}
			scrollToBottom();
			//			_skin.listBar.dataProvider.updateAll();
		}
		
		/**
		 * 刷新显示 频道改变后的内容显示
		 * */
		private function updateShowMsg():void
		{
			_skin.listBar.dataProvider.removeAll();
			var msgs:Vector.<ResChatMessage>;
			switch(_curShowTab)
			{
				case 0: 
					msgs=ChatManager.zongheHearsayMsg;
					break;
				case 1: 
					msgs=ChatManager.shejiaoHearsayMsg;
					break;
				case 2: 
					msgs=ChatManager.gerenHearsayMsg;
					break;
			}
			if(msgs==null) return;
			for(var i:int=0;i<msgs.length;i++)
			{
				_skin.listBar.dataProvider.addItem(msgs[i]);
			}
			scrollToBottom();
		}
		
		private function scrollToBottom() : void
		{
			if(!iskeepOrto)
			{
//				_skin.listBar.scrollToBottom(0);
				_skin.listBar.scrollToDisplayIndex(_skin.listBar.dataProvider.length-1);
			}
		}
		
		private function onSwitchPrivateChannel(targetID:Number, targetName:String):void
		{
			if(changeCurrChannel(3)){
				ChatManager.currentSiLiaoTargetID = targetID;
				ChatManager.currentSiLiaoTargetName = targetName;
				var siLiaoTag:String ="你对" + targetName +  "说 :";			
				this._inputText.setFocus();
				this._inputText.text=siLiaoTag;
				_inputText.textfield.setSelection(_inputText.width,_inputText.width);
				setGroubState(true);
			}
		}
		
		
		private function mouseOut():void
		{
			if( this._skin.btn_open.visible){
				return;
			}
			_skin.grp_buttom.visible=false;
			_skin.tab_Type.visible=false;
			_skin.btn_lock.visible=false;
			_skin.lb_tishi.visible=false;
			_skin.grp_laba.visible=false;
//			_skin.btn_scale.visible=false;
			_skin.btns.visible=false;
		}
		
		private function mouseOver():void
		{
			_skin.grp_buttom.visible=true;
			_skin.tab_Type.visible=true;
			_skin.btn_lock.visible=true;
			_skin.lb_tishi.visible=true;
			_skin.grp_laba.visible=true;
//			_skin.btn_scale.visible=true;
			_skin.btns.visible=true;
		}
		
		private function initChatChannel():void
		{
			_skin.btnDang.isSelected=true;
			changeCurrChannel(4);
		}
		
		private function initTabBar():void
		{
			_skin.tab_Type.addEventListener(Event.SELECT,onChangeSelected);
			_skin.tab_Type.selectedIndex=0;
			onChangeSelected();
		}
		
		private function onChangeSelected(event:Event=null):void
		{
			_curShowTab=_skin.tab_Type.selectedIndex;
			updateShowMsg();
		}
		
		public function resize(w : int, h : int) : void {
			this.x = 0;
			this.y = h - this.height;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void {
			CONFIG::netDebug {
				NetDebug.LOG("[ChatBar] [onTouchTarget] targetName:" + target.name);
			}
				
				switch(target){
					case this._skin.btnShi:
					case this._skin.btnBang:
					case this._skin.btnDui:
					case this._skin.btnSi:
					case this._skin.btnDang:
					case this._skin.btn_laba2:
						var channelBtnIndex:int=_skin.btns.getChildIndex(target);
						if(channelBtnIndex!=-1){
							changeCurrChannel(channelBtnIndex);
							return;
						}
				}
				switch (target) {
					case this._skin.btn_send:
						this.sendMsg();
						break;
					case this._skin.btn_open:
						this.setOpenOrClose(true);
						break;
					case this._skin.btn_close:
						this.setOpenOrClose(false);
						break;
					case _skin.btn_lock:
						setListIstoOrKeep();
						break;
					//					case _skin.btn_location:
					//						onAddLocation();
					//						break;
				}
		}
		
		/**
		 *设置当前频道 
		 * @param type
		 * 
		 */
		private function changeCurrChannel(type:int):Boolean
		{
			var pingdao:int=parseInt(CHANNEL_TYPES[type]);
			if(isCanSelect(pingdao))
			{
				var name:String=ChatUtil.getChannelTitle(pingdao);
				_skin.lb_pindao.text=name;
				_skin.lb_pindao.color=ChatUtil.getChannelColor(pingdao);
				_curSendChannel=pingdao;
				return true;
			}else{
				(_skin.btns.getChildAt(CHANNEL_TYPES.indexOf(_curSendChannel)) as Radio).isSelected=true;
			}
			return false;
		}	
		
		private function isCanSelect(type:int):Boolean
		{
			switch(type)
			{
				case EnumChatChannelType.CHAT_CHANNEL_WORLD:
					if(MainRoleManager.actorInfo.totalStat.level>=50) return true;
					else {
						NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, "50级开放世界聊天");
						return false;
					}
				case EnumChatChannelType.CHAT_CHANNEL_LABA:
					if(MainRoleManager.actorInfo.totalStat.level>=50) return true;
					else {
						NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, "50级开放喇叭");
						return false;
					}
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO:
					if(MainRoleManager.actorInfo.totalStat.level>=60) return true;
					else {
						NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, "60级开放私聊");
						return false;
					}
				case EnumChatChannelType.CHAT_CHANNEL_KUA_FU:
					if(MainRoleManager.actorInfo.totalStat.level>=90) return true;
					else {
						NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, "90级开放跨服聊天");
						return false;
					}
				case EnumChatChannelType.CHAT_CHANNEL_PARTY:
					if(!GuildManager.instance().haveGuild){
						NoticeManager.showNotifyById(60010);
					}
					return GuildManager.instance().haveGuild;
				case EnumChatChannelType.CHAT_CHANNEL_TEAM:
					if(!TeamManager.ins.hasTeam){
						NoticeManager.showNotifyById(13023);
					}
					return TeamManager.ins.hasTeam;
			}
			return true;
		}
		
		private var _ismouseIn:Boolean;
		private function onTouchEventHandler(e : TouchEvent) : void 
		{
			var mousePoint : Point = this.globalToLocal(new Point(Starling.current.nativeStage.mouseX, Starling.current.nativeStage.mouseY))
			
			var currentTarget:DisplayObject = e.currentTarget as DisplayObject;
			var touch:Touch = e.getTouch( currentTarget );
			if( touch == null || !hitTest(mousePoint) )
			{
				if(!this._inputText.isInputFocus)
				{
					setGroubState(false);
					this._inputText.removeFocus() ;				
				}
				_ismouseIn=false;
			}else{
				setGroubState(true);
				_ismouseIn=true;
				//				this._inputText.setFocus();
			}
			
			// 调整大小
//			touch = e.getTouch(this._skin.btn_scale, TouchPhase.BEGAN);
//			if (touch) {
//				this.setAdjustSizeState(true);
//				return;
//			}
			
			
			touch=e.getTouch(_skin.btn_face,TouchPhase.ENDED);
			if(touch != null)
			{
				onShowFaceListView();
			}
			
			touch = e.getTouch(_skin.btn_location,TouchPhase.ENDED);
			if(touch != null)
			{
				onAddLocation();
			}
			
//			touch = e.getTouch(this._skin.btn_scale, TouchPhase.ENDED);
//			if (touch) {
//				this.setAdjustSizeState(false);
//			}
			if (this._isAdjustSize) {
				this.adjustSize();
			}
			
			/*	touch = e.getTouch(Starling.current.stage,TouchPhase.ENDED);
			if(touch){
			hideSelectChannel();
			}*/
		}
		
		private function setGroubState(bool:Boolean):void
		{
			var vb:ScrollBar=_skin.listBar.getVerticalScrollBar() as ScrollBar;
			if(vb){
				vb.visible=bool;
			}
			if(bool){
				_skin.bg.alpha=1;
//				_skin.btn_scale.alpha=1;
			}else {
				_skin.bg.alpha=0;
//				_skin.btn_scale.alpha=0;
			}
			_inputText.visible=bool;
			_skin.btn_lock.visible=bool;
			_skin.btn_face.visible=bool;
			_skin.btn_location.visible=bool;
			_skin.inputbg.visible=bool;
			_skin.btn_send.visible=bool;
			_skin.btns.visible=bool;
			_skin.tab_Type.visible=bool;
			_skin.lb_pindao.visible=bool;
		}
		
		/**
		 * 添加坐标到输入文本
		 * 
		 */
		private function onAddLocation():void
		{
			//国家名称暂时不要
			//			var countryName : String = "[" + CountryNameCfgData.getCountryNameById(MainRoleManager.actorInfo.countryId) + "]";
			var sceneID:String = MapDataManager.currentScene.sceneId.toString();
			var xy:String = int(MainRoleManager.actor.x) + "," + int(MainRoleManager.actor.z);
			var posName:String =  MapDataManager.currentScene.name + "(" + xy + ")";
			var locationCode:String =RichTextCustomUtil.getTextLinkCode(posName,0x55bb17,RichTextCustomLinkType.POSITION_TYPE,sceneID + "," + xy);	
			if(_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = "";
			}
			_inputText.appendRichText(locationCode);
			_inputText.setFocus();
			setGroubState(true);
		}
		
		private function onShowFaceListView():void
		{
			var point:Point = _skin.btn_face.localToGlobal(new Point());
			FaceGroupManager.instance.showOrHide(onAddFace,point.x,point.y);
		}
		
		/**
		 * 添加表情
		 * @param faceInfo
		 * 
		 */
		private function onAddFace(faceInfo : FaceInfo):void
		{
			if(_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = faceInfo.str;
			}
			else
			{
				_inputText.appendRichText(faceInfo.str);
			}
		}
		
		
		private function onKeyboardEventHandler(e : KeyboardEvent) : void {
			do {
				if (this._inputText.isInputFocus) {
					switch (e.keyCode) {
						case Keyboard.ENTER:
							if(_inputText.text!=null&&"" != this._inputText.text)
								this.sendMsg();
							else{
								if(!_ismouseIn){
									_inputText.removeFocus();
									setGroubState(false);
								}
								else{
									_inputText.removeFocus();
								}
							}
							break;
						case Keyboard.UP:
							break;
						case Keyboard.DOWN:
							break;
						default:										
					}			
					break;
				}
				else{
					switch (e.keyCode) {
						case Keyboard.ENTER:
							this._inputText.setFocus();
							setGroubState(true);
							break;
					}
				}
			} while(false);
		}
		
		private function setAdjustSizeState(value : Boolean) : void {
			this._isAdjustSize = value;
		}
		
		private function adjustSize() : void {
			var p : Point = new Point(Starling.current.nativeStage.mouseX,
				Starling.current.nativeStage.mouseY);
			var lp : Point = this.globalToLocal(p);
			if (lp.x < MINX) {
				lp.x = MINX;
			} else if (lp.x > MAXX) {
				lp.x = MAXX;
			}
			if (lp.y < MINY) {
				lp.y = MINY;
			} else if (lp.y > MAXY) {
				lp.y = MAXY;
			}
			var sp : Point = new Point(lp.x - this._skin.grp_txt.x, lp.y - this._skin.grp_txt.y);
			var dx : int = sp.x - this._initScaleX;
			var dy : int = sp.y - this._initScaleY;
			CONFIG::netDebug {
				NetDebug.LOG("[ChatBar] [adjustSize] [ox:" + this._skin.btn_scale.x + ", oy:" + this._skin.btn_scale.y + ", nx:" + sp.x + ", ny:" + sp.y + "]");
			}
				this._skin.btn_scale.x = sp.x;
			this._skin.btn_scale.y = sp.y;
			
			this._skin.bg.width = this._initBgWidth + dx;
			this._skin.bg.height = this._initBgHeight - dy;
			this._skin.bg.y = this._initBgY + dy;
			this._skin.tab_Type.y = this._initGroupTopY + dy;
			
			this._skin.inputbg.width = this._initInputBgWidth + dx;
			this._inputText.setSize(this._skin.inputbg.width-50, this._skin.inputbg.height);
			this._skin.btn_send.x = this._initSendX + dx;
			this._curWidth = this._skin.bg.width;
			
			this._skin.btn_open.x=this._skin.btn_send.x+this._skin.btn_send.width;
			this._skin.btn_face.x=this._skin.btn_send.x-this._skin.btn_face.width-3;
			this._skin.btn_location.x=this._skin.btn_face.x-this._skin.btn_location.width;
			
			this._skin.btn_lock.x= this._skin.bg.width-45;
			this._skin.btn_lock.y=  this._skin.tab_Type.y ;
			
			this._skin.lb_tishi.y=this._skin.tab_Type.y-23;
			this._skin.grp_laba.y=this._skin.tab_Type.y-53;
			this._skin.grp_laba_bg.width=this._skin.bg.width;
			
			this._skin.listBar.width= this._skin.bg.width;
			this._skin.listBar.height=this._skin.bg.height-108;
			this._skin.listBar.y=this._skin.btn_scale.y+31;
			this._skin.listBar.dataProvider.updateAll();
			this._skin.listBar.scrollToBottom(0);
			trace("list的x:"+this._skin.listBar.x);
		}
		
		private function setOpenOrClose(isOpen : Boolean) : void {
			if (this._tween) {
				this._tween.kill();
			}
			var targetX : int = 0;
			if (!isOpen) {
				targetX = -this._curWidth;
			}
			var ispen:int=isOpen?1:0;
			if(isOpen)
			{
				this._tween = TweenLite.to(this, 0.5, {x : targetX,onStart :onopenShow,onStartParams:[ispen]});
			}
			else
			{
				this._tween = TweenLite.to(this, 0.5, {x : targetX,onComplete :oncloseShow,onCompleteParams:[ispen]});
			}
		}
		
		private function onopenShow(...arg):void
		{
			var isOpen:Boolean=arg[0]==1?true:false;
			this._skin.btn_close.visible = isOpen;
			this._skin.btn_open.visible = !isOpen;
		}
		
		private function oncloseShow(...arg):void
		{
			var isOpen:Boolean=arg[0]==1?true:false;
			this._skin.btn_close.visible = isOpen;
			this._skin.btn_open.visible = !isOpen;
		}
		
		private var iskeepOrto:Boolean=false;
		private function setListIstoOrKeep():void
		{
//			_skin.btn_lock.isSelected=!_skin.btn_lock.isSelected;
			iskeepOrto=!_skin.btn_lock.isSelected;
		}
			
		private function sendMsg() : void 
		{
			if("" == this._inputText.text )
			{
				return;
			}
			
			this._inputText.removeFocus() ;
			
			
			if(ChatManager.sendGMMsg(_inputText.text))
			{
				return;
			}
			if (ClientCommend.doCommand(_inputText.text)) 
			{
				//_inputText.text="";
				return;
			}
			var sendMsg:String = _inputText.text;
			if(sendMsg == DEFAULT_CHAT_TEXT)
			{
				NoticeManager.showNotify( DEFAULT_CHAT_TEXT );
				return;
			}
			
			sendMsg = ChatInputManager.replaceSpecialInfo(sendMsg);
			
			if(ChatSpeakHistoryManager.getLastSend() == sendMsg)
			{
				NoticeManager.mouseFollowNotify("请勿重复发言");
				return;
			}
			
			//			_curSendChannel=8;//测试用来发系统和传闻消息的
			//			ChatManager.currentSiLiaoTargetName=MainRoleManager.actorInfo.name;
			
			ChatManager.reqSendChat( sendMsg, _curSendChannel,  ChatManager.currentSiLiaoTargetName );
			_inputText.text="";
			//AvatarManager.callEquipmentChange(MainRoleManager.actor);
		}
		
		private function updateScroller() : void {
			//			this._skin.vscrollbar.addChild(this._chatText);
			if(!iskeepOrto)
			{
				//				var scrollerPos : int = Math.max(0, this._chatText.height - this._skin.vscrollbar.height);
				CONFIG::netDebug {
					NetDebug.LOG("[ChatBar] [UpdateScroller] scrollerPos:" + scrollerPos + ", height:" + this._chatText.height + ", x:" + this._chatText.x);
				}
					//					this._skin.vscrollbar.scrollToPosition(0, scrollerPos, 0.3);
			}
		}
	}
}