package com.rpgGame.app.ui.main.head
{
	import gs.TweenLite;
	
	import org.mokylin.skin.app.npc.npcTips2_Skin;
	
	import starling.display.Sprite;

	/**
	 * npc闲话气泡
	 * @author YT
	 * 
	 */	
	public class NpcSpeakBubble extends Sprite
	{
		private static var _speakBubble:NpcSpeakBubble
		public static function speakBubble(text:String):NpcSpeakBubble
		{
			if(_speakBubble==null)
			{
				_speakBubble=new NpcSpeakBubble();
			}
			_speakBubble.visible=false;
			TweenLite.killDelayedCallsTo(_speakBubble.setLable2);
			TweenLite.delayedCall(0.05, _speakBubble.setLable2,[text]);//没有new的时候改变不了width
			return _speakBubble;
		}
		
		private var _skin:npcTips2_Skin;
		private var skp:Sprite;
		public function NpcSpeakBubble()
		{
			_skin = new npcTips2_Skin();
			this.x=-56;
			this.y=-80;
			skp=_skin.toSprite();
			addChild(skp);
			_skin.lable.htmlText="";
			this.visible=false;
		}
		/**高度不变宽拉长*/
		public function setLable(text:String):void
		{
			var wid:int=text.length*14+14;
			wid=wid*0.5;
			if(wid>186)
			{
				_skin.lable.width=wid;
				_skin.bg.width=wid+14;
			}
			else
			{
				_skin.lable.width=186;
				_skin.bg.width=200;
			}
			_skin.lable.htmlText=text;
			this.visible=true;
			TweenLite.killDelayedCallsTo(hide);
			TweenLite.delayedCall(4.5, hide);
		}
		/**宽度不变高拉长*/
		public function setLable2(text:String):void
		{
			_skin.lable.height=0;
			_skin.lable.htmlText=text;
			if(_skin.lable.textHeight>32)
			{
				_skin.bg.height=_skin.lable.textHeight+27;
				this.y=-_skin.bg.height-22;
			}
			else
			{
				_skin.bg.height=58;
				this.y=-_skin.bg.height-22;
			}
			this.visible=true;
			TweenLite.killDelayedCallsTo(hide);
			TweenLite.delayedCall(4.5, hide);
		}
		private function hide():void
		{
			if(this.parent)
			{
				this.parent.removeChild(this);
			}
			this.visible=false;
		}
		
		
		
	}
}