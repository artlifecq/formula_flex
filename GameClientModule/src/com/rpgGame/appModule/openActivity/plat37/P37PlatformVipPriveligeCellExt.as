package com.rpgGame.appModule.openActivity.plat37
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.main.openActivity.BaseActivityListItemCell;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.coreData.info.openActivity.EnumCampsFlag;
	
	import feathers.themes.GuiTheme;
	
	import org.mokylin.skin.app.tequan.Item_Meirilibao;
	
	import starling.display.Image;
	
	public class P37PlatformVipPriveligeCellExt extends BaseActivityListItemCell
	{
		private var _skin:Item_Meirilibao;
		private var _gReward:RewardGroup;
		public function P37PlatformVipPriveligeCellExt()
		{
			_skin=new Item_Meirilibao();
			super(_skin,_skin.btnOk);
			_gReward=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1);
		}
		override public function setData(info:ActivityVo):void
		{
			super.setData(info);
			_skin.gLevel.visible=false;
			_skin.gTilte.visible=false;
			if (info.getFlagValue(EnumCampsFlag.F_37_TITLE)) 
			{
				_skin.gTilte.visible=true;
				MCUtil.removeAllChild(_skin.uiHead);
				_skin.uiHead.addChild(new Image(GuiTheme.ins.getTexture(info.getFlagValue(EnumCampsFlag.F_CELLNAME_STR))));
			
				_skin.uiHead0.styleName=info.getFlagValue(EnumCampsFlag.F_37_TITLE);
			}
			else
			{
				_skin.gLevel.visible=true;
				_skin.Icon.styleName=info.getFlagValue(EnumCampsFlag.F_CELLNAME_STR);
				_gReward.setRewardByJsonStr(info.activityReward);
				_skin.lbVip.text=info.info;
			}
		}
		override public function clearData():void
		{
			super.clearData();
			_gReward.clear();
		}
	}
}