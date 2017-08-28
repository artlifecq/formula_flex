package com.rpgGame.app.ui.main.fight
{
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.MCUtil;
	
	import flash.events.Event;
	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Sprite;
	
	public class FightStateView extends Sprite
	{
		private static var _ins:FightStateView=new FightStateView();
		public static const W:int=220;
		public static const H:int=45;
		private var _enterImg:UIAsset;
		private var _leaveImg:UIAsset;
		private var _enterState:Boolean;
		public function FightStateView()
		{
			super();
		}
		public static function show(state:Boolean):void
		{
			_ins.showState(state);
			StarlingLayerManager.topUILayer.addChild(_ins);
			Starling.current.nativeStage.addEventListener(Event.RESIZE,_ins.onResize);
			_ins.onResize(null);
		}
		private function onResize(eve:Event):void
		{
			var stageWidth:int = Starling.current.nativeStage.stageWidth;
			var stageHeight:int = Starling.current.nativeStage.stageHeight;
			this.y=stageHeight-220;
			this.x=(stageWidth-W)/2;
		}
		public function showState(state:Boolean):void
		{
			MCUtil.removeAllChild(this);
			_enterState=state;
			var tmp:UIAsset;
			if (_enterState) 
			{
				if (!_enterImg) 
				{
					_enterImg=new UIAsset();
					_enterImg.styleName="ui/art_txt/mainui/guaji/jinruzhandou.png";
				}
				this.addChild(_enterImg);
				tmp=_enterImg;
			}
			else
			{
				if (!_leaveImg) 
				{
					_leaveImg=new UIAsset();
					_leaveImg.styleName="ui/art_txt/mainui/guaji/tuolizhandou.png";
				}
				this.addChild(_leaveImg);
				tmp=_leaveImg;
			}
			TweenLite.killTweensOf(tmp);
			tmp.y=0;
			tmp.alpha=0.5;
			TweenLite.to(tmp,0.5,{y:-150,alpha:1});
			TweenLite.delayedCall(1.5,removeSelf);
		}
		private function removeSelf():void
		{
			MCUtil.removeSelf(this);
			Starling.current.nativeStage.removeEventListener(Event.RESIZE,onResize);
		}
	}
}