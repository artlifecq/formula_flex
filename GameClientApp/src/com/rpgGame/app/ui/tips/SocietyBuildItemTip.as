package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;

	import org.mokylin.skin.app.tips.SocietyBuildItemTipSkin;

	/**
	 *
	 * 帮派建设项tips
	 * @author L.L.M.Sunny
	 * 创建时间：2016-04-21 下午2:53:32
	 *
	 */
	public class SocietyBuildItemTip extends SkinUI implements ITip
	{
		private static var _instance : SocietyBuildItemTip = null;

		public static function get instance() : SocietyBuildItemTip
		{
			if (!_instance)
			{
				_instance = new SocietyBuildItemTip();
			}
			return _instance;
		}

		private var _tipSkin : Object;//SocietyBuildItemTipSkin;
		private var _iconFace : IconCDFace;

		public function SocietyBuildItemTip()
		{
//			_tipSkin = new SocietyBuildItemTipSkin();
			super(_tipSkin);
			initTip();
		}

		private function initTip() : void
		{
			_iconFace = FaceUtil.creatIconCDFaceByUIAsset(_tipSkin.icon, IcoSizeEnum.SIZE_60, 1);
		}

		public function setTipData(data : *) : void
		{
			var itemInfo : ItemInfo = data as ItemInfo;
			FaceUtil.SetItemGrid(_iconFace, itemInfo, false);
			var nameStr : String = HtmlTextUtil.getTextColor(ItemQualityType.getColorValue(itemInfo.quality), itemInfo.name);
			_tipSkin.labDesc.htmlText = nameStr + "<br>" + itemInfo.desc;
		}

		public function hideTips() : void
		{
			_tipSkin.labDesc.htmlText = "";
		}
	}
}
