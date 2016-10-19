package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.chat.ChatDataManager;
	import com.rpgGame.app.manager.chat.ChatInputManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.chat.ChatSpeakHistoryManager;
	import com.rpgGame.app.manager.chat.FaceGroupManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.richText.component.RichTextConfig;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.main.chat.laba.VipChatCanvas;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ChatChannelChangeEvent;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ChatCfgData;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.chat.ChatData;
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import flash.utils.setTimeout;
	
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import feathers.controls.text.Fontter;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.FocusManager;
	import feathers.events.FeathersEventType;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.chat.ChatBarSkin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * 主界面聊天框
	 * @author GuoDong.Zhang
	 * 
	 */
	public class ChatBar extends SkinUI
	{
		private static const MIN_X:int = 300;
		private static const MIN_Y:int = -200;
		private static const MAX_X:int = 500;
		private static const MAX_Y:int = 100;
		private static const CONCISE_TIME:Number = 0.3;
		private static const FOLD_TIME:Number = 0.5;
		private static const DEFAULT_CHAT_TEXT:String = "输入内容，点击发送";
		/**用于临时改变频道按钮里的文字颜色*/
		private var _staticLabelRender:TextFieldTextRenderer;
		private var _chatBarSkin:ChatBarSkin;
		/**喇叭内容显示容器框*/
		private var _vipChatCanvas:VipChatCanvas;
		/**聊天内容显示文本*/
		private var _chatText:RichTextArea3D;
		/**输入框*/
		private var _inputText:RichTextArea3D;
		/**当前输入的频道*/
		private var _curSendChannel:int;
		/**当前显示的页签*/
		private var _curShowTab:int;
		/**频道列表浮窗*/
		private var _chatChannelMenuView:ChatChannelView;
		/**私聊输入框前特殊标签{你悄悄的对XX说}*/
		private var _currentPrivateTargetTag:String;
		
		private var _needMoveDisplayObjectsWhenFoldMode:Array;
		private var _normalWidth:int;
		private var _normalScrollerX:int;
		private var _normalScrollerY:int;
		private var _tweenLiteToFold:TweenLite;
		private var _tweenLiteToTimerConciseMode:TweenLite;
		
		private var _needMoveDisplayObjectsWhenConciseMode:Array;
		private var _showOrHideDisplayObjectsWhenConciseMode:Array;
		private var _initWidth:int;
		private var _initHeight:int;
		private var _gapVipCanvasY:int;
		private var _gapTabBarX:int;
		private var _gapTabBarY:int;
		private var _gapBtnSetX:int;
		private var _gapBtnSetY:int;
		private var _gapBgContentX:int;
		private var _gapBgContentY:int;
		private var _gapBtnScaleX:int;
		private var _gapBtnScaleY:int;
		private var _gapBtnChannelX:int;
		private var _gapBtnChannelY:int;
		private var _gapBgInputX:int;
		private var _gapBgInputY:int;
		private var _gapInputTextX:int;
		private var _gapInputTextY:int;
		private var _gapBtnFaceX:int;
		private var _gapBtnFaceY:int;
		private var _gapBtnLocationX:int;
		private var _gapBtnLocationY:int;
		private var _gapBtnSendX:int;
		private var _gapBtnSendY:int;
		private var _mouseOverThis:Boolean;
		private var _isChangeSizeStatus:Boolean;
		private var _initBgContentWidth:int;
		private var _initBgContentHeight:int;
		private var _initBtnScaleX:int;
		private var _initBtnScaleY:int;
		private var _initScrollerY:int;
		private const STATUS_NORMAL:int = 0;
		private const STATUS_CLOSE:int = 1;
		private const STATUS_CONCISE:int = 2;
		
		private var _status:int;
		
		
		public function ChatBar()
		{
			_chatBarSkin = new ChatBarSkin();
			super( _chatBarSkin );
			initPanel();
		}
		
		public function resize(sWidth:int, sHeight:int):void
		{
			if(_tweenLiteToFold)
			{
				_tweenLiteToFold.kill();
				_tweenLiteToFold = null;
			}
			x = 0;
			y = sHeight - _initHeight - 72;
		}
		
		private function initPanel():void
		{
			//初始化内容显示框
			var defaultFormat:TextFormat = new TextFormat(Fontter.FONT_Hei);
			defaultFormat.color = 0xded8c7;
			defaultFormat.size = 14;
			defaultFormat.align = TextFieldAutoSize.LEFT;
			defaultFormat.letterSpacing = 1;
			defaultFormat.leading = 5;
			_chatText = new RichTextArea3D( _chatBarSkin.scroller.width - 30,0,ColorUtils.getDefaultStrokeFilter());
			_chatText.setConfig(RichTextCustomUtil.cloneChatUnitConfigVec());
			_chatText.wordWrap = true;
			_chatText.multiline = true;
			_chatText.x = 3;
			_chatText.y = 6;
			_chatText.defaultTextFormat = defaultFormat;
			_chatBarSkin.scroller.width = _chatText.width + 25;
			_chatBarSkin.scroller.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			_chatBarSkin.scroller.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_chatBarSkin.scroller.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			_chatBarSkin.scroller.scrollBarDisplayMode = ScrollContainer.SCROLL_BAR_DISPLAY_MODE_FIXED;
			_chatBarSkin.scroller.addChild(_chatText);
			
			//初始化输入框
			_inputText = new RichTextArea3D(_chatBarSkin.bgInput.width,_chatBarSkin.bgInput.height,ColorUtils.getDefaultStrokeFilter());
			_inputText.maxChars = ChatCfgData.MAX_CHAR_LENGTH;
			_inputText.isEditable = true;
			_inputText.x = _chatBarSkin.bgInput.x;
			_inputText.y = _chatBarSkin.bgInput.y + 2;
			_inputText.text = DEFAULT_CHAT_TEXT;
			_inputText.defaultTextFormat = defaultFormat;
			_chatBarSkin.container.addChild( _inputText );
			
			//初始化页签
			onChatTabsSetet();
			curShowTab = 0;
			
			//初始化喇叭显示框
			_vipChatCanvas = new VipChatCanvas();
			addChildAt( _vipChatCanvas, 0 );
			_vipChatCanvas.x = 0;
			_vipChatCanvas.y = -10;
			
			//初始化频道按钮
			_chatBarSkin.btnChannel.labelOffsetX = -9;
//			setInputChannel(EnumChatChannelType.CHAT_CHANNEL_NORMAL);
			_chatBarSkin.btnChannel.labelFactory = function():TextFieldTextRenderer
			{
				var chatType:int = EnumChatChannelType.CHAT_CHANNEL_NORMAL;
				var labelRender:TextFieldTextRenderer = new TextFieldTextRenderer();
				labelRender.textFormat = new TextFormat();
				labelRender.selectedTextFormat = labelRender.textFormat;
				_staticLabelRender = labelRender;
				setTimeout(setInputChannel,10,chatType);	
				return labelRender;
			}
			
			//初始化按钮Tips
			TipTargetManager.show( _chatBarSkin.btnLocation, TargetTipsMaker.makeSimpleTextTips("添加当前位置信息"));
			TipTargetManager.show( _chatBarSkin.btnSend, TargetTipsMaker.makeSimpleTextTips("按回车键发送消息"));
			
			//初始化事件监听
			EventManager.addEvent(ChatEvent.SEND_SUCCESS, onSendSuccess);
			EventManager.addEvent(ChatEvent.GET_NEW_NORMAL_DATA, showChatMsg );
			EventManager.addEvent(ChatEvent.CHAT_TABS_SETING,onChatTabsSetet);
			EventManager.addEvent(ChatEvent.SWITCH_PRIVATE_CHANNEL,onSwitchPrivateChannel);
			_chatBarSkin.tabBar.addEventListener( Event.CHANGE, onCurrentChatTabChanged );
			EventManager.addEvent(ChatChannelChangeEvent.CHAT_CHANNEL_CHANGE_EVENT,onInputChannelChange);
			EventManager.addEvent(ChatEvent.SHOW_GOODS,onShowGoods);
			_inputText.addEventListener(FeathersEventType.FOCUS_IN,onInputFocusIn);
			_inputText.addEventListener(FeathersEventType.FOCUS_OUT,onInputFocusOut);
			this.addEventListener(TouchEvent.TOUCH,onTouchThis);
			Starling.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, onStageKeyDown );
			
			//初始化界面坐标数据
			_initWidth = _chatBarSkin.width;
			_normalWidth = _chatBarSkin.width;
			_initHeight = _chatBarSkin.height;
			_initBgContentWidth = _chatBarSkin.scroller.width;
			_initBgContentHeight = _chatBarSkin.scroller.height;
			_initBtnScaleX = _chatBarSkin.btnScale.x;
			_initBtnScaleY = _chatBarSkin.btnScale.y;
			_initScrollerY = _chatBarSkin.scroller.y;
			_normalScrollerX = _chatBarSkin.scroller.x;
			_normalScrollerY = _chatBarSkin.scroller.y;
			updateGap();
			_status = STATUS_NORMAL;
			startTimerToConciseMode(10);
			NoticeManager.initChatInfo();
		}
		
		private function onShowGoods(item:ItemInfo):void
		{
			if(_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = "";
			}
			var goodsCode:String = RichTextCustomUtil.getItemCode(item.cfgId,item.name,item.quality);
			_inputText.appendRichText(goodsCode);
			setTimeout(showInputText,10);
		}
		
		private function onSwitchPrivateChannel(targetID:Number, targetName:String):void
		{
			setInputChannel(EnumChatChannelType.CHAT_CHANNEL_SILIAO);
			ChatManager.currentSiLiaoTargetID = targetID;
			ChatManager.currentSiLiaoTargetName = targetName;
			var siLiaoTag:String ="你悄悄对 " + targetName +  " 说:";
			_currentPrivateTargetTag = RichTextCustomUtil.getTextLinkCode(siLiaoTag,-1);
			ChatInputManager.addSpecialInfo(_currentPrivateTargetTag,"");
			_inputText.text = _currentPrivateTargetTag;
			setTimeout(showInputText,10);
		}
		
		/**
		 * 处理页签设置后的更新
		 * 
		 */
		private function onChatTabsSetet():void
		{
			var currentTab:int = _curShowTab;
			_chatBarSkin.tabBar.dataProvider = ChatManager.getChatAllTab();
			if(currentTab < _chatBarSkin.tabBar.dataProvider.length)
			{
				_chatBarSkin.tabBar.selectedIndex = currentTab;
			}
			updateBtnSetX();
		}
		
		private function updateBtnSetX():void
		{
			var tabArr:Array = 	_chatBarSkin.tabBar.dataProvider.data as Array;
			_chatBarSkin.btnSet.x = _chatBarSkin.tabBar.x+(_chatBarSkin.tabBar.btnWidth+1)*tabArr.length;
		}
		
		private function onStageKeyDown(event:KeyboardEvent):void
		{
			if(_inputText.isInputFocus)
			{
				if(event.keyCode == Keyboard.ENTER)
				{
					if(_inputText.text == "")
					{
						_inputText.removeFocus();
					}
					else
					{
						sendChatMsg();
					}
				}
				else if(event.keyCode == Keyboard.UP)
				{
					var preText:String = ChatSpeakHistoryManager.getPre();
					if(preText)
					{
						_inputText.text = preText;
					}
				}
				else if(event.keyCode == Keyboard.DOWN)
				{
					var nextText:String = ChatSpeakHistoryManager.getNext();
					if(nextText)
					{
						_inputText.text = nextText;
					}
				}
			}
			else
			{
				if(event.keyCode == Keyboard.ENTER)
				{
					if(!(FocusManager.focus is TextInput) && !(FocusManager.focus is TextArea) && !(Starling.current.nativeStage.focus is TextField))
					{
						showInputText();
					}
				}
			}
		}
	
		private function onInputFocusOut(event:Event):void
		{
			if(_inputText.text == "")
			{
				_inputText.text = DEFAULT_CHAT_TEXT;
			}
			startTimerToConciseMode();
		}
		
		private function onInputFocusIn(event:Event):void
		{
			if(_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = "";
			}
			tweenToNormalMode();
		}
		
		private function startTimerToConciseMode(delay:Number = 2):void
		{
			if(_tweenLiteToTimerConciseMode)
			{
				_tweenLiteToTimerConciseMode.kill();
			}
			_tweenLiteToTimerConciseMode = TweenLite.delayedCall(delay,checkToConciseMode);
		}
		
		private function stopTimerToConciseMode():void
		{
			if(_tweenLiteToTimerConciseMode)
			{
				_tweenLiteToTimerConciseMode.kill();
			}
		}
		
		private function checkToConciseMode():void
		{
			if(!_inputText.isInputFocus && !checkMouseOverThis())
			{
				tweenToConciseMode();
			}
		}
		
		private function checkMouseOverThis():Boolean
		{
			var point:Point = new Point(Starling.current.nativeStage.mouseX,Starling.current.nativeStage.mouseY);
			return this.hitTest(this.globalToLocal(point));
		}
		
		private function onTouchThis(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(_chatBarSkin.btnFace,TouchPhase.BEGAN);
			if(touch != null)
			{
				onShowFaceListView();
			}
			else
			{
				touch = event.getTouch(_chatBarSkin.btnLocation,TouchPhase.BEGAN);
				if(touch != null)
				{
					onAddLocation();
				}
				else
				{
					//调整聊天框大小
					touch = event.getTouch(_chatBarSkin.btnScale,TouchPhase.BEGAN);
					if(touch != null)
					{
						startChangeSize();
					}
				}
			}
			touch = event.getTouch(Starling.current.stage,TouchPhase.ENDED);
			if(touch != null)
			{
				stopChangeSize();
			}
			
			if(_isChangeSizeStatus)
			{
				adjustSize();
			}
			else
			{
				//鼠标滑入、滑出聊天界面
				if(_status != STATUS_CLOSE)
				{
					touch = event.getTouch(this,TouchPhase.HOVER);
					if(_mouseOverThis && !checkMouseOverThis())
					{
						_mouseOverThis = false;
						startTimerToConciseMode();
					}
					else if(!_mouseOverThis && checkMouseOverThis())
					{
						_mouseOverThis = true;
						tweenToNormalMode();
					}
				}
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _chatBarSkin.btnSend:
					sendChatMsg();
					break;
				case _chatBarSkin.btnChannel:
					showOrHideInputChannelList();
					break;
				case _chatBarSkin.btnClose:
					tweenToClose();
					break;
				case _chatBarSkin.btnOpen:
					tweenToOpen();
					break;
				case _chatBarSkin.btnSet:
					AppManager.showApp(AppConstant.CHAT_SET_PANEL);
					break;
			}
		}
		
		private function startChangeSize():void
		{
			_isChangeSizeStatus = true;
		}
		
		private function stopChangeSize():void
		{
			_isChangeSizeStatus = false;
		}
		
		private function adjustSize():void
		{
			var point:Point = new Point(Starling.current.nativeStage.mouseX,Starling.current.nativeStage.mouseY);
			point = this.globalToLocal(point);
			point.x = Math.max(point.x,MIN_X);
			point.y = Math.max(point.y,MIN_Y);
			point.x = Math.min(point.x,MAX_X);
			point.y = Math.min(point.y,MAX_Y);
			var dx:int = point.x - _initBtnScaleX;
			var dy:int = point.y - _initBtnScaleY;
			_chatBarSkin.btnScale.x = point.x;
			_chatBarSkin.btnScale.y = point.y;
			_chatBarSkin.bgContentText.width = _chatBarSkin.scroller.width = _initBgContentWidth + dx;
			_chatBarSkin.bgContentText.height = _chatBarSkin.scroller.height = _initBgContentHeight - dy;
			_chatText.setSize( _chatBarSkin.scroller.width - 30 );
			updateScrollBar();
			_chatBarSkin.scroller.y = _initScrollerY + dy;
			//更新数据
			_normalWidth = _initWidth + dx;
			_normalScrollerY = _chatBarSkin.scroller.y;
			_gapBtnScaleX = _chatBarSkin.btnScale.x - _chatBarSkin.scroller.x;
			_gapBtnScaleY = _chatBarSkin.btnScale.y - _chatBarSkin.scroller.y;
			_gapBtnChannelX = _chatBarSkin.btnChannel.x - _chatBarSkin.scroller.x;
			_gapBtnChannelY = _chatBarSkin.btnChannel.y - _chatBarSkin.scroller.y;
			updateDisplayObjectsPosition(false);
		}
		
		private function updateGap():void
		{
			_normalScrollerY = _chatBarSkin.scroller.y;
			_gapVipCanvasY = _vipChatCanvas.y - _chatBarSkin.scroller.y;
			_gapTabBarX = _chatBarSkin.tabBar.x - _chatBarSkin.scroller.x;
			_gapTabBarY = _chatBarSkin.tabBar.y - _chatBarSkin.scroller.y;
			_gapBtnSetX = _chatBarSkin.btnSet.x - _chatBarSkin.tabBar.x;
			_gapBtnSetY = _chatBarSkin.btnSet.y - _chatBarSkin.tabBar.y;
			_gapBgContentX = _chatBarSkin.bgContentText.x - _chatBarSkin.scroller.x;
			_gapBgContentY = _chatBarSkin.bgContentText.y - _chatBarSkin.scroller.y;
			_gapBtnScaleX = _chatBarSkin.btnScale.x - _chatBarSkin.scroller.x;
			_gapBtnScaleY = _chatBarSkin.btnScale.y - _chatBarSkin.scroller.y;
			_gapBtnChannelX = _chatBarSkin.btnChannel.x - _chatBarSkin.scroller.x;
			_gapBtnChannelY = _chatBarSkin.btnChannel.y - _chatBarSkin.scroller.y;
			_gapBgInputX = _chatBarSkin.bgInput.x - _chatBarSkin.btnChannel.x;
			_gapBgInputY = _chatBarSkin.bgInput.y - _chatBarSkin.btnChannel.y;
			_gapInputTextX = _inputText.x - _chatBarSkin.bgInput.x;
			_gapInputTextY = _inputText.y - _chatBarSkin.bgInput.y;
			_gapBtnFaceX = _chatBarSkin.btnFace.x - _chatBarSkin.bgInput.x;
			_gapBtnFaceY = _chatBarSkin.btnFace.y - _chatBarSkin.bgInput.y;
			_gapBtnLocationX = _chatBarSkin.btnLocation.x - _chatBarSkin.btnFace.x;
			_gapBtnLocationY = _chatBarSkin.btnLocation.y - _chatBarSkin.btnFace.y;
			_gapBtnSendX = _chatBarSkin.btnSend.x - _chatBarSkin.btnLocation.x;
			_gapBtnSendY = _chatBarSkin.btnSend.y - _chatBarSkin.btnLocation.y;
		}
		
		private function tweenToClose():void
		{
			_status = STATUS_CLOSE;
			_chatBarSkin.btnClose.removeFromParent();
			this.addChild(_chatBarSkin.btnOpen);
			if(_tweenLiteToFold)
			{
				_tweenLiteToFold.kill();
			}
			var targetX:int = _normalScrollerX - _normalWidth;
//			var targetY:int = _normalScrollerY + _chatBarSkin.btnOpen.y - _chatBarSkin.scroller.y;
			_tweenLiteToFold = TweenLite.to(_chatBarSkin.scroller,FOLD_TIME,{x:targetX/*,y:targetY*/,onUpdate:updateDisplayObjectsPosition});
		}
		
		private function tweenToOpen():void
		{
			_status = STATUS_NORMAL;
			_chatBarSkin.btnOpen.removeFromParent();
			this.addChild(_chatBarSkin.btnClose);
			if(_tweenLiteToFold)
			{
				_tweenLiteToFold.kill();
			}
			_tweenLiteToFold = TweenLite.to(_chatBarSkin.scroller,FOLD_TIME,{x:_normalScrollerX,y:_normalScrollerY,onUpdate:updateDisplayObjectsPosition});
		}
		
		private function tweenToConciseMode():void
		{
			_status = STATUS_CONCISE;
			_tweenLiteToFold = TweenLite.to(_chatBarSkin.tabBar,CONCISE_TIME,{alpha:0,onUpdate:updateConciseAlpha,onComplete:tweenToConciseModePhaseTwo});
		}
		
		private function tweenToConciseModePhaseTwo():void
		{
			_chatBarSkin.btnSet.removeFromParent();
			_chatBarSkin.btnOpen.removeFromParent();
			_chatBarSkin.btnClose.removeFromParent();
			_chatBarSkin.btnChannel.removeFromParent();
			_chatBarSkin.btnScale.removeFromParent();
			_chatBarSkin.btnFace.removeFromParent();
			_chatBarSkin.btnLocation.removeFromParent();
			_chatBarSkin.btnSend.removeFromParent();
			_chatBarSkin.bgInput.removeFromParent();
			_inputText.removeFromParent();
			_inputText.alpha = 1;
//			var targetX:int = _normalScrollerX;
			var targetY:int = _normalScrollerY + 25;
			_tweenLiteToFold = TweenLite.to(_chatBarSkin.scroller,CONCISE_TIME,{/*x:targetX,*/y:targetY,onUpdate:updateDisplayObjectsPosition,onUpdateParams:[false]});
		}
		
		private function tweenToNormalMode():void
		{
			_status = STATUS_NORMAL;
			stopTimerToConciseMode();
			this.addChild(_chatBarSkin.btnClose);
			this.addChild(_chatBarSkin.btnChannel);
			this.addChild(_chatBarSkin.btnFace);
			this.addChild(_chatBarSkin.btnLocation);
			this.addChild(_chatBarSkin.btnSend);
			this.addChild(_chatBarSkin.bgInput);
			this.addChild(_inputText);
			_chatBarSkin.btnOpen.alpha = 1;
			_chatBarSkin.btnClose.alpha = 1;
			_chatBarSkin.btnChannel.alpha = 1;
			_chatBarSkin.btnFace.alpha = 1;
			_chatBarSkin.btnLocation.alpha = 1;
			_chatBarSkin.btnSend.alpha = 1;
			_chatBarSkin.bgInput.alpha = 1;
			_inputText.alpha = 1;
			_chatBarSkin.scroller.getVerticalScrollBar().alpha = 1;
			if(_tweenLiteToFold)
			{
				_tweenLiteToFold.kill();
			}
			_tweenLiteToFold = TweenLite.to(_chatBarSkin.scroller,CONCISE_TIME,{x:_normalScrollerX,y:_normalScrollerY,onUpdate:updateDisplayObjectsPosition,onUpdateParams:[false],onComplete:tweenToNormalModePhaseTwo});
		}
		
		private function tweenToNormalModePhaseTwo():void
		{
			this.addChild(_chatBarSkin.btnSet);
			this.addChild(_chatBarSkin.btnScale);
			_tweenLiteToFold = TweenLite.to(_chatBarSkin.tabBar,CONCISE_TIME,{alpha:1,onUpdate:updateConciseAlpha,onUpdateParams:[false]});
		}
		
		private function updateConciseAlpha(withInput:Boolean = true):void
		{
			_chatBarSkin.btnSet.alpha = _chatBarSkin.tabBar.alpha;
			_chatBarSkin.btnScale.alpha = _chatBarSkin.tabBar.alpha;
			if(withInput)
			{
				_chatBarSkin.btnOpen.alpha = _chatBarSkin.tabBar.alpha;
				_chatBarSkin.btnClose.alpha = _chatBarSkin.tabBar.alpha;
				_chatBarSkin.btnChannel.alpha = _chatBarSkin.tabBar.alpha;
				_chatBarSkin.btnFace.alpha = _chatBarSkin.tabBar.alpha;
				_chatBarSkin.btnLocation.alpha = _chatBarSkin.tabBar.alpha;
				_chatBarSkin.btnSend.alpha = _chatBarSkin.tabBar.alpha;
				_chatBarSkin.bgInput.alpha = _chatBarSkin.tabBar.alpha;
				_inputText.alpha = _chatBarSkin.tabBar.alpha;
				_chatBarSkin.scroller.getVerticalScrollBar().alpha = _chatBarSkin.tabBar.alpha;
			}
		}
		
		private function updateDisplayObjectsPosition(withIput:Boolean = true):void
		{
			_vipChatCanvas.y = _chatBarSkin.scroller.y + _gapVipCanvasY;
			_chatBarSkin.tabBar.x = _chatBarSkin.scroller.x + _gapTabBarX;
			_chatBarSkin.tabBar.y = _chatBarSkin.scroller.y + _gapTabBarY;
			updateBtnSetX();
			_chatBarSkin.btnSet.y = _chatBarSkin.tabBar.y + _gapBtnSetY;
			_chatBarSkin.bgContentText.x = _chatBarSkin.scroller.x + _gapBgContentX;
			_chatBarSkin.bgContentText.y = _chatBarSkin.scroller.y + _gapBgContentY;
			_chatBarSkin.btnScale.x = _chatBarSkin.bgContentText.x  + _gapBtnScaleX;
			_chatBarSkin.btnScale.y = _chatBarSkin.bgContentText.y + _gapBtnScaleY;
			if(withIput)
			{
				_chatBarSkin.btnChannel.x = _chatBarSkin.scroller.x + _gapBtnChannelX;
				_chatBarSkin.btnChannel.y = _chatBarSkin.scroller.y + _gapBtnChannelY;
				_chatBarSkin.bgInput.x = _chatBarSkin.btnChannel.x + _gapBgInputX;
				_chatBarSkin.bgInput.y = _chatBarSkin.btnChannel.y + _gapBgInputY;
				_inputText.x = _chatBarSkin.bgInput.x + _gapInputTextX;
				_inputText.y = _chatBarSkin.bgInput.y + _gapInputTextY;
				_chatBarSkin.btnFace.x = _chatBarSkin.bgInput.x + _gapBtnFaceX;
				_chatBarSkin.btnFace.y = _chatBarSkin.bgInput.y + _gapBtnFaceY;
				_chatBarSkin.btnLocation.x = _chatBarSkin.btnFace.x + _gapBtnLocationX;
				_chatBarSkin.btnLocation.y = _chatBarSkin.btnFace.y + _gapBtnLocationY;
				_chatBarSkin.btnSend.x = _chatBarSkin.btnLocation.x + _gapBtnSendX;
				_chatBarSkin.btnSend.y = _chatBarSkin.btnLocation.y + _gapBtnSendY;
			}
		}
		
		private function showInputText():void
		{
			if(_status == STATUS_CLOSE)
			{
				tweenToOpen();
			}
			else
			{
				if(_inputText.parent == null)
				{
					this.addChild(_inputText);
				}
				_inputText.setFocus();
//				var text:String = _inputText.text;
//				var index:int = text.length;
//				_inputText.selectRange(index,index);
			}
		}
		
		private function hideInputText():void
		{
			
		}
		
		/**
		 * 添加坐标到输入文本
		 * 
		 */
		private function onAddLocation():void
		{
			var countryName : String = "[" + CountryNameCfgData.getCountryNameById(MainRoleManager.actorInfo.countryId) + "]";
			var sceneID:String = MapDataManager.currentScene.sceneId.toString();
			var xy:String = int(MainRoleManager.actor.x) + "," + int(MainRoleManager.actor.z);
			var posName:String = countryName + MapDataManager.currentScene.name + "(" + xy + ")";
			var locationCode:String = RichTextCustomUtil.getTextLinkCode(posName,-1,RichTextCustomLinkType.POSITION_TYPE,sceneID + "," + xy);
			if(_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = "";
			}
			_inputText.appendRichText(locationCode);
			setTimeout(showInputText,10);
		}
		
		/**
		 * 显示输入频道列表
		 * 
		 */
		private function showOrHideInputChannelList():void
		{
			if(_chatChannelMenuView && _chatChannelMenuView.parent)
			{
				hideInputChannelList();
			}
			else
			{
				showInputChannelList();
			}
		}
		
		private function showInputChannelList():void
		{
			if(_chatChannelMenuView == null)
			{
				_chatChannelMenuView = new ChatChannelView();
			}
			if(_chatChannelMenuView.parent == null)
			{
				addChild(_chatChannelMenuView);
				Starling.current.stage.addEventListener( TouchEvent.TOUCH, stageClick );
				_chatChannelMenuView.y = _chatBarSkin.btnChannel.y-_chatChannelMenuView.height-10;
				_chatChannelMenuView.x = 27;
				_chatChannelMenuView.show();
			}
		}
		
		private function hideInputChannelList():void
		{
			if(_chatChannelMenuView && _chatChannelMenuView.parent)
			{
				_chatChannelMenuView.parent.removeChild(_chatChannelMenuView);
				_chatChannelMenuView.close();
			}
		}
		
		private function onInputChannelChange(channelType:int):void
		{
			setInputChannel(channelType);
			//通过菜单切换的频道需要输入框获得焦点
			setTimeout(showInputText,10);
		}
		private function stageClick(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch( Starling.current.stage, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			touch = event.getTouch( _chatBarSkin.btnChannel, TouchPhase.BEGAN ); 
			if( touch != null )
				return;
			hideInputChannelList();
			Starling.current.stage.removeEventListener( TouchEvent.TOUCH, stageClick );
		}
		
		/**
		 * 设置输入频道
		 * @param chatType
		 * 
		 */
		private function setInputChannel(chatType:int):void
		{
			_curSendChannel = chatType;
			var color:uint = ChatUtil.getChannelColor(chatType);
			_staticLabelRender.textFormat.color = color;
//			_chatBarSkin.btnChannel.color = color;
//			_chatBarSkin.btnChannel.invalidate();
			_chatBarSkin.btnChannel.label = ChatUtil.getChannelTitle(_curSendChannel);
			if(_currentPrivateTargetTag)
			{
				var text:String = _inputText.text;
				if(text.indexOf(_currentPrivateTargetTag) >= 0)
				{
					text = text.replace(_currentPrivateTargetTag,"");
					_inputText.text = text;
				}
			}
		}
		
		/**
		 * 选择了新的页签
		 * @param e
		 * 
		 */		
		private function onCurrentChatTabChanged( e:Event ):void
		{
			curShowTab = _chatBarSkin.tabBar.selectedIndex;
		}
		
		/**
		 * 显示表情列表
		 * 
		 */		
		private function onShowFaceListView():void
		{
			var point:Point = _chatBarSkin.btnFace.localToGlobal(new Point());
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
			setTimeout(showInputText,10);
		}
		
		/**
		 * 发送输入框内的内容
		 * 
		 */		
		private function sendChatMsg():void
		{
			switch(_curSendChannel)
			{
				case EnumChatChannelType.CHAT_CHANNEL_TEAM:
					if(!TeamManager.isHaveTeam())
					{
						NoticeManager.mouseFollowNotify("你尚未加入队伍，无法使用该频道");
						return;
					}
					break;
				case EnumChatChannelType.CHAT_CHANNEL_FAMILY:
					if(!SocietyManager.hasSociecy())
					{
						NoticeManager.mouseFollowNotify("你尚未加入家族，无法使用该频道");
						return;
					}
					break;
			}
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
	
		/**
		 * 自己的消息发送成功了
		 * @param info
		 * 
		 */		
		private function onSendSuccess( info:ChatInfo ):void 
		{
			if( info.channel != EnumChatChannelType.CHAT_CHANNEL_LABA )
			{
				ChatSpeakHistoryManager.add(info.realShowMsg);
			}
			showChatMsg( info );
			
			if(info.channel == EnumChatChannelType.CHAT_CHANNEL_SILIAO)
			{
				_inputText.text = _currentPrivateTargetTag;
			}
			else
			{
				_inputText.text = "";
			}
		}
		
		/**
		 * 显示一条消息
		 * @param info
		 * 
		 */		
		private function showChatMsg( info:ChatInfo ):void
		{
			if( info.channel == EnumChatChannelType.CHAT_CHANNEL_LABA )
			{
				_vipChatCanvas.addOneChuanYin( info );
			}
			if(ChatManager.checkChannelShowInTab(info.channel,_curShowTab))
			{
				var content:String = info.realShowName + info.realShowMsg;
				_chatText.appendRichText( ChatUtil.getChatMessageByChannel( info.channel, content ) );
				updateScrollBar();
			}
			//检测是否显示到角色头顶
			var showOnRole:Boolean = false;
			if(info.channel == EnumChatChannelType.CHAT_CHANNEL_NORMAL)
			{
				showOnRole = true;
			}
			else if(info.channel == EnumChatChannelType.CHAT_CHANNEL_TEAM)
			{
				if(info.id == MainRoleManager.actorID)
				{
					showOnRole = true;
				}
				else if(TeamManager.isMyTeamMember(info.id))
				{
					showOnRole = true;
				}
			}
			if(showOnRole)
			{
				var role:SceneRole = SceneManager.getSceneObjByID(info.id) as SceneRole;
				if(role)
				{
					var message:String = RichTextConfig.replaceUnitCodeToLabel(info.realShowMsg);
					if(role.headFace is HeadFace)	
						(role.headFace as HeadFace).addWordFrame(message);
				}
			}
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
			updateScrollBar();
		}
		
		private function updateScrollBar():void
		{
			_chatBarSkin.scroller.addChild(_chatText);//强制更新
			var scrollPos:int = Math.max(0,_chatText.y + _chatText.height - _chatBarSkin.scroller.height);
			_chatBarSkin.scroller.scrollToPosition( 0,scrollPos , 0.3 );
		}
		
		/** 当前聊天要发送的频道 **/
		private function get curSendChannel():int
		{
			return _curSendChannel;
		}

		/**
		 * @private
		 */
		private function set curSendChannel(value:int):void
		{
			_curSendChannel = value;
			
//			_chatBarSkin.btnChannel.label = ChatUtil.getChannelTitle( _curSendChannel );
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
		
	}
}