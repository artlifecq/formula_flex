package com.rpgGame.appModule.vip
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
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
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_vip;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.vip.bean.VipCardInfo;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import app.message.EnumVip;
	
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.vip.VipLevel1;
	import org.mokylin.skin.app.vip.VipLevel2;
	import org.mokylin.skin.app.vip.VipLevel3;
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
		private var _endTime:Number;
		private var _timer:GameTimer;
		private var _rewardStr:String;
		private var _curVip:int;
		private var _effectCon:Inter3DContainer;
		private var _effect3d:InterObject3D;
		private static const VIPMODELS:String="tx_ui_vip_mozheling0";
		public function VipMainPanelExt()
		{
			_skin=new Vip_Skin();
			super(_skin);
			//MCUtil.removeSelf(_skin.lb1);
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
				case _skin.btnLIngQu:
				{
					if (_rewardBtnCtrl.hasReward) 
					{
						Mgr.vipMgr.reqGetVipReward(_curVip);
					}
					break;
				}
				case (_skin.skinVip1.skin as VipLevel1).uiVip:
				{
					showVipItem(EnumVip.VIP1);
					break;
				}
				case (_skin.skinVip2.skin as VipLevel2).uiVip:
				{
					showVipItem(EnumVip.VIP2);
					break;
				}
				case (_skin.skinVip3.skin as VipLevel3).uiVip:
				{
					showVipItem(EnumVip.VIP3);
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
			_rewarG=new RewardGroup(IcoSizeEnum.ICON_36,_skin.icon1);
			_rewardStr=_skin.lbTime0.text;
			_vip1=new VipItem(_skin.skinVip1.skin,EnumVip.VIP1,showVipItem);
			_vip2=new VipItem(_skin.skinVip2.skin,EnumVip.VIP2,showVipItem);
			_vip3=new VipItem(_skin.skinVip3.skin,EnumVip.VIP3,showVipItem);
			
			_rewardVip1Ctrl=new RewardMarkCtrl(_skin.skinVip1,false);
			_rewardVip2Ctrl=new RewardMarkCtrl(_skin.skinVip2,false);
			_rewardVip3Ctrl=new RewardMarkCtrl(_skin.skinVip3,false);
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
			
			_effectCon=new Inter3DContainer();
			_effectCon.y=280+20;
			_effectCon.x=_skin.uiModel.width/2;
			_skin.uiModel.addChild(_effectCon);
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
		private function showVipItem(vipLv:int,bForce:Boolean=false):void
		{
			if (_curVip==vipLv&&!bForce) 
			{
				return;
			}
			for each (var lab:Label in _labs) 
			{
				MCUtil.removeSelf(lab);
			}
			_curVip=vipLv;
			_vip1.setSelectState(vipLv==EnumVip.VIP1);
			_vip2.setSelectState(vipLv==EnumVip.VIP2);
			_vip3.setSelectState(vipLv==EnumVip.VIP3);
			var vip:Q_vip=VipCfg.getVip(vipLv);
			if (vip) 
			{
				_rewarG.setRewardByJsonStr(vip.q_first_gift);
				if (vip.q_attr_id!=0) 
				{
					var attr:HashMap = AttValueConfig.getTypeValueMap(AttValueConfig.getAttInfoById(vip.q_attr_id));
//					var ret:Array=AttrUtil.showAttr(attr,this,_skin.lb1,10,new Point(_skin.lb1.x,_skin.lb1.y),_skin.lb1.width,_skin.lb1.height,":",_labs);
					AttrUtil.showAttrInSingleLab(attr,_skin.lb1,"  ",":");
					//_labs=_labs.concat(ret);
				}
			
				_skin.listVip.dataProvider=new ListCollection(vip.q_vip_privileges.split("|"));
				
				var item:Q_item=ItemConfig.getQItemByID(vip.q_mo_tokenID);
				if (item) 
				{
					var retH:HashMap;
					retH=AttValueConfig.getAttrHash(item.q_att_type);
					_skin.NumZhanli0.label="x"+FightValueUtil.calFightPowerByHash(retH,MainRoleManager.actorInfo.job)+"";
				}
			}
			_rewardBtnCtrl.hasReward=true;
			_skin.imgBuy.styleName=Mgr.vipMgr.vipLv>0?"ui/app/vip/xufei.png":"ui/app/vip/jihuo.png";
			_skin.imgAttr.styleName="ui/app/vip/tq"+vipLv+".png";
			_skin.imgVipPrivilegs.styleName="ui/app/vip/vip_name"+vipLv+".png";
			_skin.imgAcitve.styleName="ui/app/vip/act"+vipLv+".png";
			_skin.imgMo.styleName="ui/app/vip/mo"+vipLv+".png";
			_skin.imgRewardType.styleName="ui/app/vip/vip_name"+vipLv+".png";
			_skin.lbTime0.text=LanguageConfig.replaceStr(_rewardStr,[Mgr.vipMgr.getCardRewardCount(vipLv)]);
			_rewardBtnCtrl.hasReward=Mgr.vipMgr.getCardRewardCount(vipLv);
			if (_effect3d) 
			{
				_effect3d.dispose();
			}
			_effect3d=_effectCon.playInter3DAt(ClientConfig.getEffect(VIPMODELS+vipLv),0,0,0,null,addEft)
		}
		private  function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(VipEvent.GET_VIP_DATA,onGetVipData);
			onGetVipData();
		}
		
		private function onGetVipData():void
		{
			// TODO Auto Generated method stub
			var nowVip:int=Mgr.vipMgr.vipLv;
			//显示至尊
		
			switch(nowVip)
			{
				case EnumVip.VIP1:
				{
					_skin.uiVipLevel.styleName="ui/app/vip/vip/baijinjika.png";
					_skin.uiVipLevel.width=181;
					break;
				}
				case EnumVip.VIP2:
				{
					_skin.uiVipLevel.styleName="ui/app/vip/vip/zuanshijika.png";
					_skin.uiVipLevel.width=179;
					break;
				}
				case EnumVip.VIP3:
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
			this._skin.imgTQ.visible=nowVip==0;
			this._skin.lbTime.visible=nowVip!=0;
			if (Mgr.vipMgr.endTime>getTimer()) 
			{
				_endTime=Mgr.vipMgr.endTime;
				_timer.start();
				onTimer();
			}
			
			_rewardVip1Ctrl.hasReward=Mgr.vipMgr.getCardRewardCount(EnumVip.VIP1);
			_rewardVip2Ctrl.hasReward=Mgr.vipMgr.getCardRewardCount(EnumVip.VIP2);
			_rewardVip3Ctrl.hasReward=Mgr.vipMgr.getCardRewardCount(EnumVip.VIP3);
			
			_vip1.resetData();
			_vip2.resetData();
			_vip3.resetData();
			
			_vip1.setState(nowVip);
			_vip2.setState(nowVip);
			_vip3.setState(nowVip);
			
			if (_curVip==0&&nowVip==0) 
			{
				showVipItem(EnumVip.VIP3,true);
			}
			else
			{
				showVipItem(_curVip!=0?_curVip:nowVip,true);
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			_rewarG.clear();
			EventManager.removeEvent(VipEvent.GET_VIP_DATA,onGetVipData);
			_timer.stop();
			_curVip=0;
			if (_effect3d) 
			{
				_effect3d.dispose();
				_effect3d=null;
			}
		}
	}
}