package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.TaxManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.lang.LangTips;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import org.mokylin.skin.common.tips.wupin_Skin;

	/**
	 * 物品TIPS
	 * @author luguozheng
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-09-06 下午3:05:12
	 *
	 */
	public class ItemTip extends SkinUI implements ITip
	{
		private var _itemTip : Object;//ItemTipsSkin;
		/** 物品信息类 **/
		private var _itemInfo : ItemInfo;

		public function ItemTip()
		{
			_itemTip = new wupin_Skin();
			super(_itemTip);
			initTip();
		}

		/**
		 * 初始化
		 *
		 */
		private function initTip() : void
		{
//			_itemTip.labDecTxt.leading = 5;
//			_itemTip.labDecTxt.color = StaticValue.COLOR_CODE_1;
//			_itemTip.labDecTxt.maxWidth = _itemTip.labDecTxt.width = 240;
		}

		/**
		 * 设置物品数据tips
		 * @param data
		 *
		 */
		public function setTipData(data : *) : void
		{
			_itemInfo = data as ItemInfo;

			if (_itemInfo == null)
				return;

			if (_itemInfo.price > 0)
			{
				_itemTip.lbl_name.htmlText = HtmlTextUtil.getTextColor(ItemCfgData.getItemQualityColor(_itemInfo.cfgId), ItemCfgData.getItemName(_itemInfo.cfgId));
			}
			else
			{
				_itemTip.lbl_name.htmlText = HtmlTextUtil.getTextColor(ItemCfgData.getItemQualityColor(_itemInfo.cfgId), ItemCfgData.getItemName(_itemInfo.cfgId)) + //
					(_itemInfo.count > 0 ? (" " + "<font size='12'>X</font>" + _itemInfo.count) : "");
			}

		/*	var decTxts : Array = [];

			if (_itemInfo.price > 0)
			{
				var tax : int = TaxManager.getTaxByType(_itemInfo.taxType);
				decTxts.push(LanguageConfig.getText(LangTips.ITEM_TIPS_BUY_PRIZE_TXT, MoneyUtil.getHtmlMoneyString(_itemInfo.price, //
					true, StaticValue.COLOR_CODE_25, StaticValue.COLOR_CODE_15, StaticValue.COLOR_CODE_14, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_25), //
					MoneyUtil.getHtmlMoneyString(tax, //
					true, StaticValue.COLOR_CODE_25, StaticValue.COLOR_CODE_15, StaticValue.COLOR_CODE_14, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_25)));
			}

			decTxts.push(LanguageConfig.getText(LangTips.ITEM_TIPS_NEED_LEVEL_TXT, ItemCfgData.getItemRequireLevel(_itemInfo.cfgId)));
			decTxts.push(LanguageConfig.getText(LangTips.ITEM_TIPS_DESC_TXT, ItemCfgData.getItemDesc(_itemInfo.cfgId)));

			if (_itemInfo.price <= 0)
			{
				decTxts.push(LanguageConfig.getText(LangTips.ITEM_TIPS_SELL_PRIZE_TXT, MoneyUtil.getHtmlMoneyString(_itemInfo.sellPrize, //
					true, StaticValue.COLOR_CODE_25, StaticValue.COLOR_CODE_15, StaticValue.COLOR_CODE_14, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_25)));
				decTxts.push(LanguageConfig.getText(LangTips.ITEM_TIPS_TOTAL_SELL_PRIZE_TXT, MoneyUtil.getHtmlMoneyString(_itemInfo.sellPrize * (_itemInfo.count > 0 ? _itemInfo.count : 1), //
					true, StaticValue.COLOR_CODE_25, StaticValue.COLOR_CODE_15, StaticValue.COLOR_CODE_14, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_25)));
			}

			decTxts.push(LanguageConfig.getText(LangTips.ITEM_TIPS_CLICK_GOODS_TXT));

			_itemTip.labDecTxt.htmlText = decTxts.join("<br>");

			if (_itemInfo.binded)
			{
				_itemTip.bindImage.visible = true;
				_itemTip.unbindImage.visible = false;
			}
			else
			{
				_itemTip.bindImage.visible = false;
				_itemTip.unbindImage.visible = true;
			}

			_itemTip.imgBG.height = _itemTip.labDecTxt.y + _itemTip.labDecTxt.textHeight + 20;*/
		}

		public function hideTips() : void
		{

		}

		/**
		 * 获取物品tips背景高度
		 * @return
		 *
		 */
		public override function get height() : Number
		{

			return _itemTip.height;
		}

		private static var _instance : ItemTip = null;

		public static function get instance() : ItemTip
		{
			if (null == _instance)
			{
				_instance = new ItemTip();
			}
			return _instance;
		}
	}
}
