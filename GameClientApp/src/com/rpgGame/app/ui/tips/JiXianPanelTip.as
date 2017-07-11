package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.Tips_JiXianTiaoZhan2;
	
	public class JiXianPanelTip extends SkinUI implements ITip
	{
		private var _skin:Tips_JiXianTiaoZhan2;
		private var _shopVo:ShopItemVo;
		
		private var _shopIco:BgIcon;
		
		public function JiXianPanelTip()
		{
			_skin=new Tips_JiXianTiaoZhan2();
			super(_skin);
			initTip();
		}
		
		/**
		 * 初始化
		 *
		 */
		private function initTip() : void
		{
			_skin.icon.visible=false;
			_shopIco=new BgIcon(IcoSizeEnum.ICON_64);
			_shopIco.setBg(GridBGType.GRID_SIZE_64);
			_skin.container.addChild(_shopIco);
			_shopIco.x=9;
			_shopIco.y=9;
		}
		
		/**
		 * 设置物品数据tips
		 * @param data
		 *
		 */
		public function setTipData(data : *) : void
		{
			_shopVo=data as ShopItemVo;
			_shopIco.setIconResName(ClientConfig.getItemIcon(_shopVo.getItemConfig().q_icon.toString(),IcoSizeEnum.ICON_64));
			_skin.lbName.text=_shopVo.getItemConfig().q_name;
			_skin.lbT1.text="效果增强:"+_shopVo.getItemConfig().q_describe;
			_skin.lbT2.text="最大层数:5层";
			_skin.lbT2.color=StaticValue.UI_RED1;
			_skin.lbT4.text="消耗"+_shopVo.data.price+(_shopVo.data.priceType==CharAttributeType.RES_GOLD?"元宝,":"礼金,"+"激活")+_shopVo.getItemConfig().q_name;
		}
		
		public function hideTips() : void
		{
			
		}
		
		private static var _instance : JiXianPanelTip = null;
		public static function get instance() : JiXianPanelTip
		{
			if (null == _instance)
			{
				_instance = new JiXianPanelTip();
			}
			return _instance;
		}
	}
}