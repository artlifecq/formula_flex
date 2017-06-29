package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.Tips_JiXianTiaoZhan;
	
	public class JiXianBuffTip extends SkinUI implements ITip
	{
		private var _skin:Tips_JiXianTiaoZhan;
		private var _buffData:BuffData;
		
		private var _shopIco:BgIcon;
		public function JiXianBuffTip()
		{
			_skin=new Tips_JiXianTiaoZhan();
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
			_shopIco.x=24;
			_shopIco.y=25;
		}
		
		/**
		 * 设置物品数据tips
		 * @param data
		 *
		 */
		public function setTipData(data : *) : void
		{
			_buffData=data as BuffData;
			_shopIco.setIconResName(ClientConfig.getItemIcon(_buffData.buffData.q_icon,IcoSizeEnum.ICON_64));
			_skin.lbName.text= _buffData.buffData.q_buff_name;
			_skin.lbT1.text="效果增强:"+_buffData.buffData.q_description;
			_skin.lbT2.text="当前层数:"+_buffData.buffInfo.overlay+"层";
//			_skin.lbT2.color=StaticValue.UI_RED1;
		}
		
		public function hideTips() : void
		{
			
		}
		
		private static var _instance : JiXianBuffTip = null;
		public static function get instance() : JiXianBuffTip
		{
			if (null == _instance)
			{
				_instance = new JiXianBuffTip();
			}
			return _instance;
		}
	}
}