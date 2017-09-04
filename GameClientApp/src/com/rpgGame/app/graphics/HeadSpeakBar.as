package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.npc.npcTips2_Skin;
	
	import starling.display.Sprite;

	/**
	 * 闲话对话框
	 * @author YT
	 * 创建时间：2017-8-30 下午3:28:18
	 */
	public class HeadSpeakBar extends Sprite  implements IInstancePoolClass
	{
		private static var headSpeakBarPool : InstancePool = new InstancePool("HeadSpeakBar", 300);
		/**创建*/
		public static function create() : HeadSpeakBar
		{
			return headSpeakBarPool.createObj(HeadSpeakBar) as HeadSpeakBar;
		}
		/**回收*/
		public static function recycle(bar : HeadSpeakBar) : void
		{
			headSpeakBarPool.recycleObj(bar);
		}
		
		/*-------------------接口实现----------------------------------*/
		
		private var _isDestroyed : Boolean=false; 
		private var _isDisposed : Boolean;
		public function instanceDestroy() : void
		{
			putInPool();
			dispose();
			_isDestroyed = true;
		}
		public function reSet(parameters:Array):void
		{
			_isDisposed = false;
		}
		public function putInPool() : void
		{
			TweenLite.killDelayedCallsTo(hide);
			if (parent != null)
				parent.removeChild(this);
			this.visible=false;
			_isDisposed = true;
		}
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isInPool():Boolean
		{
			return _isDisposed;
		}
		/*-----------------------------------------------------*/
		
		private var _skin:npcTips2_Skin;
		private var skp:Sprite;
		public function HeadSpeakBar()
		{
			_skin = new npcTips2_Skin();
			skp=_skin.toSprite();
			addChild(skp);
			_skin.lable.htmlText="";
			this.visible=false;
		}
		/**高度不变宽拉长*/
		public function setLable2(text:String):void
		{
			var wid:int=text.length*14+14;
			wid=wid*0.5;
			if(wid>186)
			{
				_skin.lable.width=wid;
				_skin.bg1.width=wid+14;
			}
			else
			{
				_skin.lable.width=186;
				_skin.bg1.width=200;
			}
			_skin.lable.htmlText=text;
			this.visible=true;
			TweenLite.killDelayedCallsTo(hide);
			TweenLite.delayedCall(4.5, hide);
		}
		
		/**宽度不变高拉长*/
		public function setHeroLable(text:String):void
		{
			skp.x=-173;
			_skin.bg2.visible=true;
			_skin.bg1.visible=false;
			setLable(text);
		}
		/**宽度不变高拉长*/
		public function setMonsterLable(text:String):void
		{
			skp.x=-25;
			_skin.bg1.visible=true;
			_skin.bg2.visible=false;
			setLable(text);
		}
		private function setLable(text:String):void
		{
			_skin.lable.height=0;
			_skin.lable.htmlText=text;
			if(_skin.lable.textHeight<20)
			{
				_skin.lable.y=28;
				_skin.bg1.height=103;
				_skin.bg2.height=103;
				skp.y=-160;
				//_skin.bg1.height=_skin.lable.textHeight+27;
				//skp.y=-_skin.bg1.height-22;
			}
			else if(_skin.lable.textHeight<34)
			{
				_skin.lable.y=20;
				_skin.bg1.height=103;
				_skin.bg2.height=103;
				skp.y=-160;
			}
			else
			{
				_skin.lable.y=20;
				_skin.bg1.height=70+_skin.lable.textHeight;
				_skin.bg2.height=70+_skin.lable.textHeight;
				skp.y=-127-_skin.lable.textHeight;
				//_skin.bg1.height=58;
				//skp.y=-_skin.bg1.height-22;
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