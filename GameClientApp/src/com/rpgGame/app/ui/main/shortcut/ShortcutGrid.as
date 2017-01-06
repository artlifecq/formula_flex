package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.view.icon.DragDropGrid;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;

	import feathers.controls.UIAsset;

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
		}


		public function showAutoImg(isShow : Boolean) : void
		{
			imgAutoUse.visible = isShow;
			if (isShow)
			{
				setChildIndex(imgAutoUse, parent.numChildren);
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
