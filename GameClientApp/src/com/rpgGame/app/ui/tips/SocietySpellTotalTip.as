package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.TextSizeUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.info.society.SocietySpellTotalData;

	import org.mokylin.skin.app.tips.SocietySpellTotalTipSkin;

	/**
	 *
	 * 帮派技能总tips
	 * @author L.L.M.Sunny
	 * 创建时间：2016-04-21 下午2:53:32
	 *
	 */
	public class SocietySpellTotalTip extends SkinUI implements ITip
	{
		private static var _instance : SocietySpellTotalTip = null;

		public static function get instance() : SocietySpellTotalTip
		{
			if (!_instance)
			{
				_instance = new SocietySpellTotalTip();
			}
			return _instance;
		}

		private var _tipSkin : SocietySpellTotalTipSkin;
		private var _posy : int = 0;

		public function SocietySpellTotalTip()
		{
			_tipSkin = new SocietySpellTotalTipSkin();
			super(_tipSkin);
			initTip();
		}

		private function initTip() : void
		{

		}

		public function setTipData(data : *) : void
		{
			var totalData : SocietySpellTotalData = data as SocietySpellTotalData;
			if (totalData)
			{
				var allSpellStateDesc : String = totalData.allSpellStateDesc;
				_tipSkin.labDesc.htmlText = allSpellStateDesc;

				_posy = 0;
				_posy = _tipSkin.labDesc.y + TextSizeUtil.getTextHeght(allSpellStateDesc, _tipSkin.labDesc.width, 14) + 20;

				_tipSkin.imgBG.height = _posy + 10;
			}
		}

		override public function get width() : Number
		{
			return _tipSkin.imgBG.width;
		}

		override public function get height() : Number
		{
			return _tipSkin.imgBG.height;
		}

		public function hideTips() : void
		{
			_tipSkin.labDesc.htmlText = "";
			_tipSkin.imgBG.height = 60;
		}
	}
}
