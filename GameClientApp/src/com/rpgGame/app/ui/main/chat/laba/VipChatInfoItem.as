package com.rpgGame.app.ui.main.chat.laba
{
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.ui.main.chat.ChatUtil;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.utils.ColorUtils;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import feathers.controls.UIAsset;
	import feathers.controls.text.Fontter;
	
	import gs.TweenLite;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	
	/**
	 * 喇叭框
	 * @author fly.liuyang
	 * 创建时间：2014-5-14 上午12:11:34
	 * 
	 */
	public class VipChatInfoItem extends Sprite
	{
		private const TOTAL_SHOW_TIME:int = 10000;	//单条显示时间
		private const ALPHA_TIME:Number = 0.4;
		
		/**喇叭图标**/
		private var _ico:UIAsset;
		private var _deleteHandler:Function;
		private var _unitsMask:Quad;
		private var _richText:RichTextArea3D;
		private var _totalHeight:int;
		
		public function VipChatInfoItem(deleteOneChuanYin:Function)
		{
			name = "VipChatInfoItem"
			_deleteHandler = deleteOneChuanYin;
			//创建喇叭频道的聊天框
			var defaultFormat:TextFormat = new TextFormat(Fontter.FONT_Hei);
			defaultFormat.color = 0xded8c7;
			defaultFormat.size = 14;
			_richText = new RichTextArea3D( 365, 70,ColorUtils.getDefaultStrokeFilter() );
			_richText.setConfig(RichTextCustomUtil.getChatUnitConfigVec());
			_richText.x = 33;
			_richText.y = 0;
			_richText.wordWrap = false;
			_richText.multiline = false;
			_richText.defaultTextFormat = defaultFormat;
			addChild(_richText);
			_unitsMask=new Quad(4,4);
			_unitsMask.x=33;
			_unitsMask.width=_richText.width-33;
			_unitsMask.height=_richText.height;
			_richText.mask=_unitsMask;
			
			_ico = new UIAsset();
			_ico.styleName = AssetUrl.LA_BA_ICON;
			_ico.y = -7;
			addChild( _ico );
			addChild( _unitsMask );
		}
		
		override public function set width(value:Number):void
		{
			_unitsMask.width=value-33;
		}
		
		override public function get height():Number
		{
			return _totalHeight;
		}
		
		private var _timeOutId:uint;
		public function setData(info:ResChatMessage):void //info:ChatInfo
		{
			var userName:String = info.name;//info.realShowName;
			var showStr:String = ChatUtil.getHTMLChatMessage(info);//ChatUtil.getChatMessageByChannel(info.type,info.name,info.chatText);//ChatUtil.getChatMessageByChannel(info.channel, userName + message);
			updateShow(showStr);
			/*var rec:Rectangle = _richText.textfield.getCharBoundaries(0);
			var $_txtLineMetrics:TextLineMetrics = _richText.textfield.getLineMetrics(_richText.textfield.getLineIndexOfChar(0));
			_ico.y = $_txtLineMetrics.height - $_txtLineMetrics.descent - 12;*/
			_totalHeight = _richText.textHeight;
			_richText.setSize(_richText.textWidth+10,_richText.height);
		}
		
		private function updateShow(message:String):void
		{
			_richText.text = "";
			_richText.appendRichText(message);
		}
		
		/** 渐隐出现 */
		public function show():void
		{
			alpha = 0;
			_richText.x=33;
			TweenLite.to(this, ALPHA_TIME, { alpha:1,onComplete:onAlphaComplete} );
		}
		
		private function onAlphaComplete():void
		{
			var moveX:int=_richText.textWidth+10-_unitsMask.width;
			moveX=moveX<0?0:moveX;
			var time:int=moveX/10;
			addChild(_richText);
			if(time!=0){
				TweenLite.to(_richText,time,{x:-moveX,onComplete:moveXComplete});
			}else{
				moveXComplete();
			}
		}
		
		private function moveXComplete():void
		{
			_timeOutId = setTimeout(onShowComplete,TOTAL_SHOW_TIME);
		}
		
		private function onShowComplete():void
		{
			resetTimeOut();
			TweenLite.to(this, ALPHA_TIME, { alpha:0,x:-width,onComplete:onHideComplete});
		}
		
		private function resetTimeOut():void
		{
			if(_timeOutId > 0)
			{
				clearTimeout(_timeOutId);
				_timeOutId = 0;
			}
		}
		
		private function onHideComplete():void
		{
			deleteSelf();
		}
		
		public function toOffsetPos(offsetY:int):void
		{
			TweenLite.killTweensOf(this,true,{y:true});
//			var topPos:int = this.y - offsetY-2;
			this.y= this.y - offsetY-2;
		}
		
		private function deleteSelf():void
		{
			clear();
			_deleteHandler(this);
		}
		
		public function clear():void
		{
			TweenLite.killTweensOf(this);
			resetTimeOut();
			_richText.reset();
		}
	}
}