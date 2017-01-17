package com.rpgGame.app.ui.main.chat {
    import com.rpgGame.app.manager.chat.ChatDataManager;
    import com.rpgGame.app.manager.chat.ChatInputManager;
    import com.rpgGame.app.manager.chat.ChatManager;
    import com.rpgGame.app.manager.chat.ChatSpeakHistoryManager;
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.app.richText.RichTextCustomUtil;
    import com.rpgGame.app.richText.component.RichTextArea3D;
    import com.rpgGame.core.manager.tips.TargetTipsMaker;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ChatCfgData;
    import com.rpgGame.coreData.info.chat.ChatData;
    import com.rpgGame.coreData.info.chat.ChatInfo;
    import com.rpgGame.coreData.utils.ColorUtils;
    
    import flash.geom.Point;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import flash.ui.Keyboard;
    
    import feathers.controls.Scroller;
    import feathers.controls.text.Fontter;
    
    import gameEngine2D.NetDebug;
    
    import gs.TweenLite;
    
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
		
		/**当前输入的频道*/
		private var _curSendChannel:int;
		/**当前显示的页签*/
		private var _curShowTab:int;
        
        public function ChatBar() {
            this._skin = new chat_Skin();
            super(this._skin);
            
            this._initScaleX = this._skin.btn_scale.x;
            this._initScaleY = this._skin.btn_scale.y;
            this._initBgWidth = this._skin.bg.width;
            this._initBgHeight = this._skin.bg.height;
            this._initVScollerHeight = this._skin.vscrollbar.height;
            this._initVScollerWidth = this._skin.vscrollbar.width;
            this._initInputBgWidth = this._skin.inputbg.width;
            this._initSendX = this._skin.btn_send.x;
//            this._initGroupButtomRightX = this._skin.grp_buttomR.x;
            this._initGroupTopY = this._skin.grp_top.y;
            this._initVScollerY = this._skin.vscrollbar.y;
            this._initVScollerX = this._skin.vscrollbar.x;
            this._initBgY = this._skin.bg.y;
            
            
            var defaultFormat : TextFormat = new TextFormat(Fontter.FONT_Hei);
            defaultFormat.color = 0xded8c7;
            defaultFormat.size = 14;
            defaultFormat.align = TextFormatAlign.LEFT;
            defaultFormat.letterSpacing = 1;
            defaultFormat.leading = 5;
            
            this._chatText = new RichTextArea3D(this._initBgWidth - this._initVScollerWidth - this._initVScollerX, 0, ColorUtils.getDefaultStrokeFilter());
            this._chatText.setConfig(RichTextCustomUtil.cloneChatUnitConfigVec());
            this._chatText.wordWrap = true;
            this._chatText.multiline = true;
            this._chatText.defaultTextFormat = defaultFormat;
            this._chatText.text = "";
            this._chatText.x = this._initVScollerWidth;//this._skin.vscrollbar.width;
            this._skin.vscrollbar.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_LEFT;
            this._skin.vscrollbar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
            this._skin.vscrollbar.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
            this._skin.vscrollbar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
            this._skin.vscrollbar.addChild(this._chatText);
            this._skin.vscrollbar.width = this._initBgWidth - this._initVScollerX;
            this._chatText.setSize(this._skin.vscrollbar.width - this._chatText.x - 6, 0);
            
            this._inputText = new RichTextArea3D(this._skin.inputbg.width, this._skin.inputbg.height, ColorUtils.getDefaultStrokeFilter());
            this._inputText.maxChars = ChatCfgData.MAX_CHAR_LENGTH;
            this._inputText.isEditable = true;
            this._inputText.x = this._skin.inputbg.x;
            this._inputText.y = this._skin.inputbg.y;
            this._inputText.text = "";
            this._inputText.defaultTextFormat = defaultFormat;
            this._skin.grp_buttom.addChild(this._inputText);
            
            this._curWidth = this._skin.bg.width;
            
            this._isAdjustSize = false;
            
//            this._skin.btn_dangqian.gotoAndStop(1);
            
            this.addEventListener(TouchEvent.TOUCH, this.onTouchEventHandler);
            Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyboardEventHandler);
            
			this._skin.btn_open.x=this._skin.btn_send.x+this._skin.btn_send.width;
			
            this.setOpenOrClose(true);
			
			//初始化按钮Tips
			TipTargetManager.show( _skin.btn_location, TargetTipsMaker.makeSimpleTextTips("添加当前位置信息"));
			TipTargetManager.show( _skin.btn_send, TargetTipsMaker.makeSimpleTextTips("按回车键发送消息"));
			
			//初始化页签
			onChatTabsSetet();
			curShowTab = 0;
			
        }
		
		/**
		 * 处理页签设置后的更新
		 * 
		 */
		private function onChatTabsSetet():void
		{
		/*	var currentTab:int = _curShowTab;
			_chatBarSkin.tabBar.dataProvider = ChatManager.getChatAllTab();
			if(currentTab < _chatBarSkin.tabBar.dataProvider.length)
			{
				_chatBarSkin.tabBar.selectedIndex = currentTab;
			}
			updateBtnSetX();*/
		}
		
		private function updateBtnSetX():void
		{
			/*var tabArr:Array = 	_chatBarSkin.tabBar.dataProvider.data as Array;
			_chatBarSkin.btnSet.x = _chatBarSkin.tabBar.x+(_chatBarSkin.tabBar.btnWidth+1)*tabArr.length;*/
		}
		
		/**
		 * @private
		 */
		private function set curShowTab(value:int):void
		{
			if( _curShowTab == value )
				return;
			
			_curShowTab = value;
			
			updateCurrentChannelContent();
		}
		
		/**
		 * 更新当前频道的聊天内容
		 * 
		 */
		private function updateCurrentChannelContent():void
		{
			_chatText.text = "";
			
			var chatData:ChatData = ChatDataManager.GetInstance().getChatData( _curShowTab );
			if( chatData == null )
				return;
			
			var len:int = chatData.preData.length;
			var info:ChatInfo;
			for(var i:int = 0;i < len;i++)
			{
				info = chatData.preData[i];
				_chatText.appendRichText( ChatUtil.getChatMessageByChannel( info.channel ,info.realShowName + info.realShowMsg) );
			}
			updateScroller();
		}
		
        
        public function resize(w : int, h : int) : void {
            this.x = 0;
            this.y = h - this.height;
        }
        
        override protected function onTouchTarget(target:DisplayObject):void {
            CONFIG::netDebug {
                NetDebug.LOG("[ChatBar] [onTouchTarget] targetName:" + target.name);
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
            }
        }
        
        private function onTouchEventHandler(e : TouchEvent) : void {
            // 调整大小
            var touch : Touch = e.getTouch(this._skin.btn_scale, TouchPhase.BEGAN);
            if (touch) {
                this.setAdjustSizeState(true);
            }
			
            touch = e.getTouch(this._skin.btn_scale, TouchPhase.ENDED);
            if (touch) {
                this.setAdjustSizeState(false);
            }
            if (this._isAdjustSize) {
                this.adjustSize();
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
            this._skin.vscrollbar.height = this._initVScollerHeight - dy;
            this._skin.vscrollbar.width = this._initBgWidth + dx - this._initVScollerX;
            this._skin.bg.y = this._initBgY + dy;
            this._skin.vscrollbar.y = this._initVScollerY + dy;
            this._chatText.setSize(this._skin.vscrollbar.width - this._chatText.x - 6, 0);
            
//            this._skin.grp_buttomR.x = this._initGroupButtomRightX + dx;
            this._skin.grp_top.y = this._initGroupTopY + dy;
            
            this._skin.inputbg.width = this._initInputBgWidth + dx;
            this._inputText.setSize(this._skin.inputbg.width, this._skin.inputbg.height);
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
			ChatManager.reqSendChat( sendMsg, _curSendChannel, ChatManager.currentSiLiaoTargetID, ChatManager.currentSiLiaoTargetName );
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