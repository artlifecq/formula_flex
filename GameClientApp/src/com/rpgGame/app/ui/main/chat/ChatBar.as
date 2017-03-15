package com.rpgGame.app.ui.main.chat {
    import com.rpgGame.app.manager.AvatarManager;
    import com.rpgGame.app.manager.chat.ChatGoodsManager;
    import com.rpgGame.app.manager.chat.ChatInputManager;
    import com.rpgGame.app.manager.chat.ChatManager;
    import com.rpgGame.app.manager.chat.ChatSpeakHistoryManager;
    import com.rpgGame.app.manager.chat.FaceGroupManager;
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.richText.RichTextCustomLinkType;
    import com.rpgGame.app.richText.RichTextCustomUtil;
    import com.rpgGame.app.richText.component.RichTextArea3D;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.app.ui.main.chat.laba.VipChatCanvas;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.events.ChatEvent;
    import com.rpgGame.core.events.SceneInteractiveEvent;
    import com.rpgGame.core.manager.tips.TargetTipsMaker;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ChatCfgData;
    import com.rpgGame.coreData.clientConfig.FaceInfo;
    import com.rpgGame.coreData.info.MapDataManager;
    import com.rpgGame.coreData.info.item.ClientItemInfo;
    import com.rpgGame.coreData.type.chat.EnumChatChannelType;
    import com.rpgGame.coreData.utils.ColorUtils;
    import com.rpgGame.netData.chat.message.ResChatMessage;
    import com.rpgGame.netData.player.message.ResPlayerDieMessage;
    
    import flash.geom.Point;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import flash.ui.Keyboard;
    
    import feathers.controls.Button;
    import feathers.controls.Scroller;
    import feathers.controls.text.Fontter;
    import feathers.core.ToggleGroup;
    
    import gs.TweenLite;
    
    import org.client.mainCore.manager.EventManager;
    import org.mokylin.skin.mainui.chat.chat_Skin;
    
    import starling.core.Starling;
    import starling.display.DisplayObject;
    import starling.events.Event;
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
		
		
		private static const CHANNEL_TYPES:Array=[EnumChatChannelType.CHAT_CHANNEL_LABA,EnumChatChannelType.CHAT_CHANNEL_WORLD,
			EnumChatChannelType.CHAT_CHANNEL_PARTY,EnumChatChannelType.CHAT_CHANNEL_TEAM,EnumChatChannelType.CHAT_CHANNEL_SILIAO,
			EnumChatChannelType.CHAT_CHANNEL_NORMAL];
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
        private var _initVScollerY : int;
        private var _initVScollerX : int;
        
        
        private var _curWidth : int;
        
        // 调整大小
        private var _isAdjustSize : Boolean;
        private var _tween : TweenLite;
        
        // 聊天内容显示框
        private var _chatText : RichTextArea3D;
        // 聊天输入框
        private var _inputText : RichTextArea3D;

        private var _toggleGroup:ToggleGroup;
        private var _channelBtns:Vector.<Button>;
        private var _channelItems:Vector.<Button>;
		
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
//            this._initGroupButtomRightX = this._skin.grp_buttomR.x;
            this._initGroupTopY = this._skin.grp_top.y;
			
			this._skin.vscrollbar.x=0;
			
            this._initVScollerY = this._skin.vscrollbar.y;
            this._initVScollerX = this._skin.vscrollbar.x;
            this._initBgY = this._skin.bg.y;
			
			this.alpha=0.5;
            
            
            var defaultFormat : TextFormat = new TextFormat(Fontter.FONT_Hei);
            defaultFormat.color = 0xded8c7;
            defaultFormat.size = 14;
            defaultFormat.align = TextFormatAlign.LEFT;
            defaultFormat.letterSpacing = 1;
            defaultFormat.leading = 5;
            
            this._chatText = new RichTextArea3D(this._initBgWidth, 0, ColorUtils.getDefaultStrokeFilter());
            this._chatText.setConfig(RichTextCustomUtil.cloneChatUnitConfigVec());
            this._chatText.wordWrap = false;
            this._chatText.multiline = true;
            this._chatText.defaultTextFormat = defaultFormat;
            this._chatText.text = "";
            this._chatText.x = 0;//this._skin.vscrollbar.width;
		
            this._skin.vscrollbar.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
            this._skin.vscrollbar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
            this._skin.vscrollbar.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
            this._skin.vscrollbar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
            this._skin.vscrollbar.addChild(this._chatText);
            this._skin.vscrollbar.width = this._initBgWidth - this._initVScollerX;
            this._chatText.setSize(this._skin.vscrollbar.width - this._chatText.x -10, 0);
            
            this._inputText = new RichTextArea3D(this._skin.inputbg.width, this._skin.inputbg.height, ColorUtils.getDefaultStrokeFilter());
            this._inputText.maxChars = ChatCfgData.MAX_CHAR_LENGTH;
            this._inputText.isEditable = true;
            this._inputText.x = this._skin.inputbg.x;
            this._inputText.y = this._skin.inputbg.y+3;
            this._inputText.text = "";
            this._inputText.defaultTextFormat = defaultFormat;
            this._skin.grp_buttom.addChild(this._inputText);
            
            this._curWidth = this._skin.bg.width;
            
            this._isAdjustSize = false;
            
//            this._skin.btn_dangqian.gotoAndStop(1);
            
			this._skin.btn_open.x=this._skin.btn_send.x+this._skin.btn_send.width;
			
            this.setOpenOrClose(true);
			
			//初始化喇叭显示框
			_vipChatCanvas = new VipChatCanvas(_skin.grp_laba);
			_vipChatCanvas.displayVIPChat(false);
			
			//初始化按钮Tips
			TipTargetManager.show( _skin.btn_location, TargetTipsMaker.makeSimpleTextTips("添加当前位置信息"));
			TipTargetManager.show( _skin.btn_send, TargetTipsMaker.makeSimpleTextTips("按回车键发送消息"));
			//mouseOut();
			initChatChannel();
			initTabBar();
			initEvent();
        }
		
		private function initEvent():void
		{
			//MouseListenerUtil.addEventListener( this, null, mouseOver, mouseOut );			
			
			EventManager.addEvent(ChatEvent.SWITCH_PRIVATE_CHANNEL,onSwitchPrivateChannel);
			EventManager.addEvent(ChatEvent.SEND_SUCCESS, onSendSuccess);
			
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
		
		private function onShowGoods(item:ClientItemInfo):void
		{
			if(_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = "";
			}
			var key:String = ChatGoodsManager.addItemInfo(item);
			var goodsCode:String = RichTextCustomUtil.getItemCode(key,item.name,item.quality);
			_inputText.appendRichText(goodsCode);
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
			if(info.type==EnumChatChannelType.CHAT_CHANNEL_HEARSAY||info.type==EnumChatChannelType.CHAT_CHANNEL_SYSTEM){
				return;	
			}
			showChatMsg( info );
		}
		
		/**
		 * 显示一条消息
		 * @param info
		 * 
		 */		
		private function showChatMsg( info:ResChatMessage ):void
		{
			_chatText.appendRichText( ChatUtil.getHTMLChatMessage( info) );
			updateScroller();
			_inputText.text="";
		}
		
		private function onSwitchPrivateChannel(targetID:Number, targetName:String):void
		{
			changeCurrChannel(EnumChatChannelType.CHAT_CHANNEL_SILIAO);
			
			ChatManager.currentSiLiaoTargetID = targetID;
			ChatManager.currentSiLiaoTargetName = targetName;
			var siLiaoTag:String ="你悄悄对 " + targetName +  " 说:";
		}
		
		
		private function mouseOut():void
		{
			if( this._skin.btn_open.visible){
				return;
			}
			_skin.grp_buttom.visible=false;
			_skin.grp_top.visible=false;
			_skin.btn_lock.visible=false;
			_skin.lb_tishi.visible=false;
			_skin.grp_laba.visible=false;
			_skin.btn_scale.visible=false;
			_skin.grp_select.visible=false;
			hideSelectChannel();
		}
		
		private function mouseOver():void
		{
			_skin.grp_buttom.visible=true;
			_skin.grp_top.visible=true;
			_skin.btn_lock.visible=true;
			_skin.lb_tishi.visible=true;
			_skin.grp_laba.visible=true;
			_skin.btn_scale.visible=true;
			_skin.grp_select.visible=true;
		}
		
		private function initChatChannel():void
		{
			_skin.select_bg.visible=false;
			_skin.grp_channel.visible=false;
			_channelBtns=new Vector.<Button>();
			_channelBtns.push(_skin.btn_laba);
			_channelBtns.push(_skin.btn_shijie);
			_channelBtns.push(_skin.btn_banghui);
			_channelBtns.push(_skin.btn_duiwu);
			_channelBtns.push(_skin.btn_siliao);
			_channelBtns.push(_skin.btn_dangqian);
			
			_channelItems=new Vector.<Button>();
			_channelItems.push(_skin.select_laba);
			_channelItems.push(_skin.select_shijie);
			_channelItems.push(_skin.select_banghui);
			_channelItems.push(_skin.select_duiwu);
			_channelItems.push(_skin.select_siliao);
			_channelItems.push(_skin.select_dangqian);
			
			changeCurrChannel(5);
		}
		
		private function initTabBar():void
		{
			_toggleGroup=new ToggleGroup();
			_toggleGroup.addItem(_skin.btn_zonghe);
			_toggleGroup.addItem(_skin.btn_shejiao);
			_toggleGroup.addItem(_skin.btn_geren);
			_toggleGroup.addEventListener(Event.CHANGE,onChangeSelected);
			_toggleGroup.selectedIndex=0;
			onChangeSelected();
		}
		
		private function onChangeSelected(event:Event=null):void
		{
			var elementsContent:Array=[];
			var list:Array=CHANNEL_ITEMS[_toggleGroup.selectedIndex];
			var num:int=list.length;
			var i:int;
			clearBtns();
			for(i=0;i<num;i++){
				var btn:Button=_channelItems[list[i]];
				if(i==0){
					btn.y=7;
				}else{
					btn.y=elementsContent[i-1].y+elementsContent[i-1].height+2;
				}
				elementsContent.push(btn);
				_skin.grp_channel.addChild(btn);
			}
			_skin.select_bg.height=_skin.grp_channel.height;
			_skin.select_bg.y=_skin.btn_laba.y-_skin.select_bg.height;
			_curShowTab=_toggleGroup.selectedIndex;
		}
		
		private function clearBtns():void
		{
			var num:int=_channelItems.length;
			for(var i:int=0;i<num;i++){
				var btn:Button=_channelItems[i];
				if(btn.parent){
					btn.removeFromParent();
				}
			}
		}
		
		private function setChatType(type:int):void
		{
			_toggleGroup.selectedIndex=type;
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
					case this._skin.btn_dangqian:
					case this._skin.btn_siliao:
					case this._skin.btn_duiwu:
					case this._skin.btn_banghui:
					case this._skin.btn_shijie:
					case this._skin.btn_laba:
						toggleSelectChannel();
						return;
				}
				
				if(target is Button){
					var channelBtnIndex:int=_channelItems.indexOf(Button(target));
					if(channelBtnIndex!=-1){
						toggleSelectChannel();
						changeCurrChannel(channelBtnIndex);
						return;
					}
				}
				
			hideSelectChannel();
				
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
            }
        }
		
		/**
		 *设置当前频道 
		 * @param type
		 * 
		 */
		private function changeCurrChannel(type:int):void
		{
			var num:int=_channelBtns.length;
			for(var i:int=0;i<num;i++){
				_channelBtns[i].visible=false;
			}
			
			_channelBtns[type].visible=true;
			_curSendChannel=CHANNEL_TYPES[type];
		}
		
		private function toggleSelectChannel():void
		{
			var showState:Boolean=_skin.select_bg.visible;
			_skin.grp_channel.visible=_skin.select_bg.visible=!showState;
		}
		
		private function hideSelectChannel():void
		{
			_skin.grp_channel.visible=_skin.select_bg.visible=false;
		}
		
        private function onTouchEventHandler(e : TouchEvent) : void 
		{
			var mousePoint : Point = this.globalToLocal(new Point(Starling.current.nativeStage.mouseX, Starling.current.nativeStage.mouseY))
			
			var currentTarget:DisplayObject = e.currentTarget as DisplayObject;
			var touch:Touch = e.getTouch( currentTarget );
			if( touch == null || !hitTest(mousePoint) )
			{
				this.alpha=0.5;
			}else{
				this.alpha=1;
			}
			
            // 调整大小
            touch = e.getTouch(this._skin.btn_scale, TouchPhase.BEGAN);
            if (touch) {
                this.setAdjustSizeState(true);
				return;
            }
			
			
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
			
            touch = e.getTouch(this._skin.btn_scale, TouchPhase.ENDED);
            if (touch) {
                this.setAdjustSizeState(false);
            }
            if (this._isAdjustSize) {
                this.adjustSize();
            }
			
		/*	touch = e.getTouch(Starling.current.stage,TouchPhase.ENDED);
			if(touch){
				hideSelectChannel();
			}*/
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
			var locationCode:String = RichTextCustomUtil.getTextLinkCode(posName,-1,RichTextCustomLinkType.POSITION_TYPE,sceneID + "," + xy);
			if(_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = "";
			}
			_inputText.appendRichText(locationCode);
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
                           this.sendMsg();
                            break;
                        case Keyboard.UP:
                            break;
                        case Keyboard.DOWN:
                            break;
                        default:
                            
                    }
                    break;
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
            this._skin.vscrollbar.width = this._initBgWidth + dx - this._initVScollerX;
            this._skin.bg.y = this._initBgY + dy;
            this._skin.vscrollbar.y = this._initVScollerY + dy;
            this._chatText.setSize(this._skin.vscrollbar.width - this._chatText.x -10, 0);
            
//            this._skin.grp_buttomR.x = this._initGroupButtomRightX + dx;
            this._skin.grp_top.y = this._initGroupTopY + dy;
            
            this._skin.inputbg.width = this._initInputBgWidth + dx;
            this._inputText.setSize(this._skin.inputbg.width, this._skin.inputbg.height);
            this._skin.vscrollbar.height =this._skin.bg.height-this._inputText.height*2-5;
            this._skin.btn_send.x = this._initSendX + dx;
            
            this._curWidth = this._skin.bg.width;
			
			
			
			this._skin.btn_open.x=this._skin.btn_send.x+this._skin.btn_send.width;
			this._skin.btn_face.x=this._skin.btn_send.x-this._skin.btn_face.width-3;
			this._skin.btn_location.x=this._skin.btn_face.x-this._skin.btn_location.width;
			
			this._skin.btn_lock.x= this._skin.bg.width-45;
			this._skin.btn_lock.y=  this._skin.grp_top.y ;
			
			this._skin.lb_tishi.y=this._skin.grp_top.y-23;
			this._skin.grp_laba.y=this._skin.grp_top.y-53;
			this._skin.grp_laba_bg.width=this._skin.bg.width;
            
            this.updateScroller();
        }
        
        private function setOpenOrClose(isOpen : Boolean) : void {
            if (this._tween) {
                this._tween.kill();
            }
            var targetX : int = 0;
            if (!isOpen) {
                targetX = -this._curWidth;
            }
            this._tween = TweenLite.to(this, 0.5, {x : targetX});
            this._skin.btn_close.visible = isOpen;
            this._skin.btn_open.visible = !isOpen;
        }
        
        
        private function sendMsg() : void 
		{
			var ms:ResPlayerDieMessage=new ResPlayerDieMessage();
			ms.attackername="111";
			ms.time=new Date().getTime()/1000;
			AppManager.showApp(AppConstant.DIE_PANEL,ms);
			
			
			if("" == this._inputText.text )
			{
				return;
			}
			
			this._inputText.removeFocus() ;
			
			
			if(ChatManager.sendGMMsg(_inputText.text))
			{
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
			ChatManager.currentSiLiaoTargetName=MainRoleManager.actorInfo.name;
			ChatManager.reqSendChat( sendMsg, _curSendChannel,  ChatManager.currentSiLiaoTargetName );
			
			AvatarManager.callEquipmentChange(MainRoleManager.actor);
        }
        
        private function updateScroller() : void {
            this._skin.vscrollbar.addChild(this._chatText);
            var scrollerPos : int = Math.max(0, this._chatText.height - this._skin.vscrollbar.height);
            CONFIG::netDebug {
                NetDebug.LOG("[ChatBar] [UpdateScroller] scrollerPos:" + scrollerPos + ", height:" + this._chatText.height + ", x:" + this._chatText.x);
            }
            this._skin.vscrollbar.scrollToPosition(0, scrollerPos, 0.3);
        }
    }
}