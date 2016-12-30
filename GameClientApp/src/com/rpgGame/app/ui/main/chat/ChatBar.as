package com.rpgGame.app.ui.main.chat {
    import com.rpgGame.app.manager.chat.ChatManager;
    import com.rpgGame.app.richText.RichTextCustomUtil;
    import com.rpgGame.app.richText.component.RichTextArea3D;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ChatCfgData;
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
        
        // 偏移
        private var _gapGroupTopX : int;
        private var _gapGroupButtomLeftX : int;
        private var _gapGroupButtomRightX : int;
        private var _gapTypeX : int;
        private var _gapInputbgX : int;
        private var _gapSendX : int;
        
        private var _curWidth : int;
        
        // 调整大小
        private var _isAdjustSize : Boolean;
        private var _tween : TweenLite;
        
        // 聊天内容显示框
        private var _chatText : RichTextArea3D;
        // 聊天输入框
        private var _inputText : RichTextArea3D;
        
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
            this._initGroupButtomRightX = this._skin.grp_buttomR.x;
            this._initGroupTopY = this._skin.grp_top.y;
            this._initVScollerY = this._skin.vscrollbar.y;
            this._initVScollerX = this._skin.vscrollbar.x;
            this._initBgY = this._skin.bg.y;
            
            this._gapGroupTopX = this._skin.grp_top.x - this._skin.grp_txt.x;
            this._gapGroupButtomLeftX = this._skin.grp_buttomL.x - this._skin.grp_txt.x;
            this._gapGroupButtomRightX = this._skin.grp_buttomR.x - this._skin.grp_txt.x;
            this._gapTypeX = this._skin.btn_type.x + (this._skin.grp_buttom.x - this._skin.grp_txt.x);
            this._gapInputbgX = this._skin.inputbg.x + (this._skin.grp_buttom.x - this._skin.grp_txt.x);
            this._gapSendX = this._skin.btn_send.x + (this._skin.grp_buttom.x - this._skin.grp_txt.x);
            
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
            this._chatText.text = "test";
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
            this._inputText.text = "test12345678901234567890123456789012345678901234567890";
            this._inputText.defaultTextFormat = defaultFormat;
            this._skin.grp_buttom.addChild(this._inputText);
            
            this._curWidth = this._skin.bg.width;
            
            this._isAdjustSize = false;
            
            this._skin.btn_type.gotoAndStop(1);
            
            this.addEventListener(TouchEvent.TOUCH, this.onTouchEventHandler);
            Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyboardEventHandler);
            
            this.setOpenOrClose(true);
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
                            "" == this._inputText.text ? this._inputText.removeFocus() : this.sendMsg();
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
            
            this._skin.grp_buttomR.x = this._initGroupButtomRightX + dx;
            this._skin.grp_top.y = this._initGroupTopY + dy;
            
            this._skin.inputbg.width = this._initInputBgWidth + dx;
            this._inputText.setSize(this._skin.inputbg.width, this._skin.inputbg.height);
            this._skin.btn_send.x = this._initSendX + dx;
            
            this._curWidth = this._skin.bg.width;
            this._gapGroupButtomRightX = this._skin.grp_buttomR.x - this._skin.grp_txt.x;
            this._gapSendX = this._skin.btn_send.x + (this._skin.grp_buttom.x - this._skin.grp_txt.x);
            
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
            this._tween = TweenLite.to(this._skin.grp_txt, 0.5, {x : targetX, onUpdate : onUpdateDisplayObjectsPos});
            this._skin.btn_close.visible = isOpen;
            this._skin.btn_open.visible = !isOpen;
        }
        
        private function onUpdateDisplayObjectsPos() : void {
            this._skin.grp_top.x = this._skin.grp_txt.x + this._gapGroupTopX;
            this._skin.grp_buttomL.x = this._skin.grp_txt.x + this._gapGroupButtomLeftX;
            this._skin.grp_buttomR.x = this._skin.grp_txt.x + this._gapGroupButtomRightX;
            this._skin.btn_type.x = this._skin.grp_txt.x + this._gapTypeX;
            this._skin.inputbg.x = this._skin.grp_txt.x + this._gapInputbgX;
            this._skin.btn_send.x = this._skin.grp_txt.x + this._gapSendX;
            this._inputText.x = this._skin.inputbg.x;
        }
        
        private function sendMsg() : void {
            this._chatText.appendRichText(this._inputText.text);
            ChatManager.sendGMMsg(this._inputText.text);
            this._inputText.text = "";
            this.updateScroller();
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