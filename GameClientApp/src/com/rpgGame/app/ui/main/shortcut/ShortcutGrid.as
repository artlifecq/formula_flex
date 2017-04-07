package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.mainCore.libCore._special.cd.CDFace;
	import com.rpgGame.app.view.icon.DragDropGrid;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.uiComponent.face.cd.MaskCDUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import feathers.controls.UIAsset;
	
	import gs.TimelineLite;
	import gs.TweenMax;
	import gs.easing.Bounce;

	/**
	 * 快捷栏数据
	 * @author luguozheng
	 *
	 */
	public class ShortcutGrid extends DragDropGrid
	{
		private var _shortcutBar : ShortcutBar;
		private var imgAutoUse : UIAsset;
		private var effAutoUse : InterObject3D;
		private var offsetX : int = 315;
		private var offsetY : int = 27;

		private var timeLine:TimelineLite;
		
		private var effectSk:Inter3DContainer;
		private var effect3D:InterObject3D;
		public function ShortcutGrid(shortcutBar : ShortcutBar, size : int)
		{
			_shortcutBar = shortcutBar;
			super(size);
			init();
		}

		private function init() : void
		{
			imgAutoUse = new UIAsset();
			addChild(imgAutoUse);
			imgAutoUse.x = 4;
			imgAutoUse.y = 4;
			imgAutoUse.styleName = ClientConfig.getSpellAutoIco();
			setIsShowCdTm(true);
			
			effectSk=new Inter3DContainer();
			effectSk.x = _iconSize/2+6;
			effectSk.y = _iconSize/2+6;
			effect3D=effectSk.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_MJ),0,0,0);
			effect3D.stop();
			
		}
		
		override  public function cdUpdate($now : Number, $cdTotal : Number) :void
		{
		
			if (!_cdFace || !_cdFace.parent)
			{
				addCdFace();
			}
			if(_cdFace)
			{
				_cdFace.updateTimeTxt($now,$cdTotal);
			}
			//effect3D.stop();
			//effect3D.start();
			//1000-int(1000/$cdTotal*$now)
			effect3D.gotoAndStop(int(1000/$cdTotal*$now));
		}
		override  protected function updateIconImagePosition( posx:Number=0, posy:Number=0 ):void
		{
			if(!_iconImage)
				return;
			_iconImage.x = 6;
			_iconImage.y = 6;
		}
		
		public function tweenGrid():void
		{
			if(timeLine){
				timeLine.complete();
			}
			timeLine = new TimelineLite();
			timeLine.append(TweenMax.to(this,0.1,{y:this.y+2,ease:Bounce.easeOut}));
			timeLine.append(TweenMax.to(this,0.1,{y:this.y,ease:Bounce.easeOut,onComplete:onComplete}));	
			
			
			//effect3D.stop();
			//effect3D.start();
			
		}
		
		private function onComplete():void
		{
			timeLine=null;
		}

		public function showAutoImg(isShow : Boolean) : void
		{
			imgAutoUse.visible = isShow;
			if (isShow)
			{
				setChildIndex(imgAutoUse, parent.numChildren);
				addChild(effectSk);
			}
			
		}

		public function showAutoEff(isShow : Boolean) : void
		{
			if (isShow)
			{
				if (!effAutoUse)
				{
					effAutoUse = _shortcutBar.playInter3DAt(ClientConfig.getEffect(EffectUrl.USE_AUTO_SPELL_EFFECT), this.x + offsetX, this.y + offsetY, 0);
				}
			}
			else
			{
				if (effAutoUse)
				{
					_shortcutBar.removeChild3D(effAutoUse);
					effAutoUse = null;
				}
			}
		}

		/** 清空 只是把显示数据清除 并不全部销毁 * */
		override public function clear() : void
		{
			showAutoImg(false);
			showAutoEff(false);
			super.clear();
		}
	}
}
