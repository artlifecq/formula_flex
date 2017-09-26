package com.rpgGame.appModule.openActivity.plat37
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.platform.PlatformUtil;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.main.openActivity.BaseActivityMainPanel;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
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
		
		private var _shoujiEftContaner1:Inter3DContainer;
		private var _shoujiEff:InterObject3D;
		public function P37PhonePanelExt()
		{
			_skin=new Shoujilibao_Skin();
			super(EnumCampPanelType.M_PHONE_37,_skin);
			_gReward=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon2,1,9,4);
			initView();
		}
		
		private function initView():void
		{
			_shoujiEftContaner1=new Inter3DContainer();
			_skin.container.addChildAt(_shoujiEftContaner1,2);
			_shoujiEff=_shoujiEftContaner1.playInter3DAt(ClientConfig.getEffect("ui_shoujilibao_mianban"),479,253,0);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			if(_shoujiEff) _shoujiEff.start();
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
			if(_shoujiEff) _shoujiEff.stop();
			_vo=null;
		}
	}
}