package com.rpgGame.appModule.vip
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.core.events.VipEvent;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.utils.TextUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_vip;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.vip.Vip_Skin;
	
	import starling.display.DisplayObject;
	
	public class VipMainPanelExt extends SkinUIPanel
	{
		private var _skin:Vip_Skin;
		private var _rewarG:RewardGroup;
		private var _vip1:VipItem;
		private var _vip2:VipItem;
		private var _vip3:VipItem;
		private var _labs:Array=[];
		private var _rewardVip1Ctrl:RewardMarkCtrl;
		private var _rewardVip2Ctrl:RewardMarkCtrl;
		private var _rewardVip3Ctrl:RewardMarkCtrl;
		private var _rewardBtnCtrl:RewardMarkCtrl;
		private var _endTime:int;
		private var _timer:GameTimer;
		public function VipMainPanelExt()
		{
			_skin=new Vip_Skin();
			super(_skin);
			_rewarG=new RewardGroup(IcoSizeEnum.ICON_36,_skin.icon1);
			setConfig();
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnChongzhi:
				{
					GlobalFunction.iWantRecharge();
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		private function setConfig():void
		{
			_vip1=new VipItem(_skin.skinVip1.skin,1,showVipItem);
			_vip2=new VipItem(_skin.skinVip2.skin,2,showVipItem);
			_vip3=new VipItem(_skin.skinVip3.skin,3,showVipItem);
			
			_rewardVip1Ctrl=new RewardMarkCtrl(_skin.skinVip1);
			_rewardVip2Ctrl=new RewardMarkCtrl(_skin.skinVip2);
			_rewardVip3Ctrl=new RewardMarkCtrl(_skin.skinVip3);
			_rewardBtnCtrl=new RewardMarkCtrl(_skin.btnLIngQu);
			
			var list:List=_skin.listVip;
			list.itemRendererFactory = createCell;
			//list.touchAcross=true;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			
			_timer=new GameTimer("VipMainPanelExt",1000);
			_timer.onUpdate=onTimer;
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(_endTime-getTimer())/1000;
			if (left>0) 
			{
				_skin.lbTime.text=TextUtil.SecondToDHMS(left);
			}
			else 
			{
				_timer.stop();
			}
		}
		private function createCell():VipTQCellRender
		{
			return new VipTQCellRender();
		}
		private function showVipItem(vipLv:int):void
		{
			for each (var lab:Label in _labs) 
			{
				MCUtil.removeSelf(lab);
			}
			
			_vip1.setSelectState(vipLv==1);
			_vip2.setSelectState(vipLv==2);
			_vip3.setSelectState(vipLv==3);
			var vip:Q_vip=VipCfg.getVip(vipLv);
			if (vip) 
			{
				_rewarG.setRewardByJsonStr(vip.q_first_gift);
				var attr:HashMap = AttValueConfig.getTypeValueMap(AttValueConfig.getAttInfoById(vip.q_attr_id));
				var ret:Array=AttrUtil.showAttr(attr,this,_skin.lb1,10,new Point(_skin.lb1.x,_skin.lb1.y),0,0,":",_labs);
				_labs=_labs.concat(ret);
				_skin.listVip.dataProvider=new ListCollection(vip.q_vip_privileges.split("|"));
				
				var item:Q_item=ItemConfig.getQItemByID(vip.q_mo_tokenID);
				if (item) 
				{
					var retH:HashMap;
					AttValueConfig.getTypeValue(item.q_att_type,retH);
					_skin.NumZhanli.label=FightValueUtil.calFightPowerByHash(retH,MainRoleManager.actorInfo.job)+"";
				}
			}
			_rewardBtnCtrl.hasReward=true;
			_skin.imgBuy.styleName=Mgr.vipMgr.vipLv==vipLv?"ui/app/vip/xufei.png":"ui/app/vip/jihuo.png";
			_skin.imgAttr.styleName="ui/app/vip/tq"+vipLv+".png";
			_skin.imgVipPrivilegs.styleName="ui/app/vip/vip_name"+vipLv+".png";
			_skin.imgAcitve.styleName="ui/app/vip/act"+vipLv+".png";
			_skin.imgMo.styleName="ui/app/vip/mo"+vipLv+".png";
		
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(VipEvent.GET_VIP_DATA,onGetVipData);
		}
		
		private function onGetVipData():void
		{
			// TODO Auto Generated method stub
			var nowVip:int=Mgr.vipMgr.vipLv;
			//显示至尊
			if (nowVip==0) 
			{
				showVipItem(3);
			}
			else
			{
				showVipItem(nowVip);
			}
			switch(nowVip)
			{
				case 1:
				{
					_skin.uiVipLevel.styleName="ui/app/vip/vip/baijinjika.png";
					_skin.uiVipLevel.width=181;
					break;
				}
				case 2:
				{
					_skin.uiVipLevel.styleName="ui/app/vip/vip/zuanshijika.png";
					_skin.uiVipLevel.width=179;
					break;
				}
				case 3:
				{
					_skin.uiVipLevel.styleName="ui/app/vip/vip/zhizunbannianka.png";
					_skin.uiVipLevel.width=209;
					break;
				}
				default:
				{
					_skin.uiVipLevel.styleName="ui/app/vip/nizanweikaitong.png";
					_skin.uiVipLevel.width=208;
					break;
				}
			}
			this._skin.imgTQ.visible==nowVip==0;
			this._skin.lbTime.visible=nowVip!=0;
			if (Mgr.vipMgr.endTime>0) 
			{
				_endTime=getTimer()+Mgr.vipMgr.endTime*1000;
				_timer.start();
				onTimer();
			}
		
		}
		override protected function onHide():void
		{
			super.onHide();
			_rewarG.clear();
			EventManager.removeEvent(VipEvent.GET_VIP_DATA,onGetVipData);
			_timer.stop();
		}
	}
}