package com.rpgGame.appModule.openActivity.plat37
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.platform.PlatformUtil;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.main.openActivity.BaseActivityMainPanel;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.coreData.info.openActivity.EnumCampPanelType;
	
	import org.mokylin.skin.app.shoujilibao.Shoujilibao_Skin;
	
	import starling.display.DisplayObject;
	
	public class P37PhonePanelExt extends BaseActivityMainPanel
	{
		private var _skin:Shoujilibao_Skin;
		private var _gReward:RewardGroup;
		private var _vo:ActivityVo;
		public function P37PhonePanelExt()
		{
			super(EnumCampPanelType.M_PHONE_37,_skin);
			_gReward=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon2,1,9,4);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnBangding:
				{
					PlatformUtil.platform.phoneVerify();
					break;
				}
				case _skin.btnLingqu:
				{
					if (_vo.status==1) 
					{
						Mgr.activityPanelMgr.reqActivitiesGetRewardMsg(_vo.activityId);
					}
					
					break;
				}
				default:
				{
					break;
				}
			}
		}
		override protected function setData(hash:HashMap):void
		{
			super.setData(hash);
			_vo=getSingleVo(hash);
			if (_vo) 
			{
				_gReward.setRewardByJsonStr(_vo.activityReward);
				_skin.btnBangding.visible=false;
				_skin.btnLingqu.visible=false;
				if (_vo.status==0) 
				{
					_skin.btnLingqu.visible=true;
					TouchableUtil.gray(_skin.btnLingqu);
					
				}
				else if (_vo.status==1) 
				{
					_skin.btnLingqu.visible=true;
					TouchableUtil.ungray(_skin.btnLingqu);
				}
				else 
				{
					_skin.btnBangding.visible=true;
				}
				
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			_gReward.clear();
			_vo=null;
		}
	}
}