package com.rpgGame.app.ui.tips
{
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.engine3D.vo.map.MapAreaTypeEnum;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.TextSizeUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangTips;

	import org.mokylin.skin.app.tips.MapAreaTipSkin;

	/**
	 *
	 * 地图区域tips
	 * @author L.L.M.Sunny
	 * 创建时间：2016-07-26 下午2:53:32
	 *
	 */
	public class MapAreaTip extends SkinUI implements ITip
	{
		private static var _instance : MapAreaTip = null;

		public static function get instance() : MapAreaTip
		{
			if (!_instance)
			{
				_instance = new MapAreaTip();
			}
			return _instance;
		}

		private var _tipSkin : MapAreaTipSkin;
		private var _posy : int = 0;

		public function MapAreaTip()
		{
			_tipSkin = new MapAreaTipSkin();
			super(_tipSkin);
			initTip();
		}

		private function initTip() : void
		{

		}

		public function setTipData(data : *) : void
		{
			var areaData : ClientMapAreaData = data as ClientMapAreaData;
			if (areaData)
			{
				var title : String = "";
				var desc : String = "";
				switch (areaData.type)
				{
					case MapAreaTypeEnum.SAFE:
						title = LanguageConfig.getText(LangTips.MAP_AREA_SAFE_TIPS_TITLE);
						desc = LanguageConfig.getText(LangTips.MAP_AREA_SAFE_TIPS_DESC);
						break;
					case MapAreaTypeEnum.STALL:
						title = LanguageConfig.getText(LangTips.MAP_AREA_STALL_TIPS_TITLE);
						desc = LanguageConfig.getText(LangTips.MAP_AREA_STALL_TIPS_DESC);
						break;
					case MapAreaTypeEnum.SPELL_FORBID:
						title = LanguageConfig.getText(LangTips.MAP_AREA_SPELL_FORBID_TIPS_TITLE);
						desc = LanguageConfig.getText(LangTips.MAP_AREA_SPELL_FORBID_TIPS_DESC);
						break;
					case MapAreaTypeEnum.ATHLETICS:
						title = LanguageConfig.getText(LangTips.MAP_AREA_ATHLETICS_TIPS_TITLE);
						desc = LanguageConfig.getText(LangTips.MAP_AREA_ATHLETICS_TIPS_DESC);
						break;
				}

				_tipSkin.labTitle.htmlText = title;
				_tipSkin.labDesc.htmlText = desc;

				_posy = 0;
				_posy = _tipSkin.labDesc.y + TextSizeUtil.getTextHeght(desc, _tipSkin.labDesc.width, 14) + 20;

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
			_tipSkin.labTitle.htmlText = "";
			_tipSkin.labDesc.htmlText = "";
			_tipSkin.imgBG.height = 60;
		}
	}
}
