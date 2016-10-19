package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.TextSizeUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.info.buff.BuffInfo;

	import org.mokylin.skin.app.tips.BuffTipsSkin;

	/**
	 *
	 * Buff tips
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-06 下午2:53:32
	 *
	 */
	public class BuffTip extends SkinUI implements ITip
	{
		private static var _instance : BuffTip = null;

		public static function get instance() : BuffTip
		{
			if (!_instance)
			{
				_instance = new BuffTip();
			}
			return _instance;
		}

		private var _tipSkin : BuffTipsSkin;
		private var _posy : int = 0;

		public function BuffTip()
		{
			_tipSkin = new BuffTipsSkin();
			super(_tipSkin);
			initTip();
		}

		private function initTip() : void
		{

		}

		public function setTipData(data : *) : void
		{
			var buffInfo : BuffInfo = data as BuffInfo;
			var description : String = buffInfo.description;
			var isBuff : Boolean = buffInfo.isBuff;
			var timeStr : String = buffInfo.disappearTime > 0 ? TimeUtil.timeFormatCH((buffInfo.disappearTime - SystemTimeManager.curtTm) * 0.001) : "永久";
			var tipsStr : String = "<font color='#ffe258'>" + buffInfo.name + "</font><br><font color='#f9f0cc'>" + description + "</font><br>" + //
				"<font color='#f9f0cc'>剩余时间：</font>" + //
				(isBuff ? ("<font color='#4efd6f'>" + timeStr + "</font>") : ("<font color='#ff0000'>" + timeStr + "</font>"));
			_tipSkin.labDesc.htmlText = tipsStr;

			_posy = 0;
			_posy = _tipSkin.labDesc.y + TextSizeUtil.getTextHeght(tipsStr, _tipSkin.labDesc.width, 14) + 20;

			_tipSkin.imgBG.height = _posy + 10;
		}

		public function hideTips() : void
		{
			_tipSkin.labDesc.htmlText = "";
			_tipSkin.imgBG.height = 60;
		}
	}
}
