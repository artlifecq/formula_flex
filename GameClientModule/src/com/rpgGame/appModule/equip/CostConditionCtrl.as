package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_equip_inherit_cost;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import app.message.EnumItemId;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;

	public class CostConditionCtrl
	{
		private static const USE_ITEM:String="消耗{0}：{1}";
		private static const DESC:String="{0}不足将消耗{1}";
		
		private var labUse:Label;
		private var uiIcon:UIAsset;
		private var labDesc:Label
		public function CostConditionCtrl(skin:Zhuangbei_left)
		{
			this.labUse=skin.lb_yinzi;
			this.uiIcon=skin.monyIcon;
			this.labDesc=skin.monyTips;
		}
		public function setData(type:int,num:int,type2:int):void
		{
			var color:int=GameColorUtil.COLOR_NORMAL;
			if (num>0) 
			{
				color=num<=(Mgr.shopMgr.getCurrency(type)+Mgr.shopMgr.getCurrency(type2))?GameColorUtil.COLOR_GREEN:GameColorUtil.COLOR_RED;
			}
			
			labUse.htmlText=LanguageConfig.replaceStr(USE_ITEM,[ItemConfig.getItemName(type),HtmlTextUtil.getTextColor(color,num+"")]);
			labDesc.text=LanguageConfig.replaceStr(DESC,[ItemConfig.getItemName(type),ItemConfig.getItemName(type2)]);
			uiIcon.styleName=ItemUtil.getResURL(type);
		}
		public function reset():void
		{
			setData(EnumItemId.MONEY,0,EnumItemId.BIND_MONEY);
		}
	}
}