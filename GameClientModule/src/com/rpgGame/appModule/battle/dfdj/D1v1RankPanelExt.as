package com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.common.NumSelectUICtrl;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.appModule.common.RoleModelShow;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.D1v1Event;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	import com.rpgGame.coreData.clientConfig.Q_battle_rank;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.dianfeng.bean.DianFengDataInfo;
	import com.rpgGame.netData.dianfeng.bean.DianFengRankInfo;
	import com.rpgGame.netData.dianfeng.message.SCOpenDianFengRankMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.paihangbang.KuaFuPaiHang_Skin;
	import org.mokylin.skin.app.zhanchang.paihangbang.PaiHangAlll_Skin;
	import org.mokylin.skin.common.Flip3_Skin;
	
	import starling.display.DisplayObject;
	
	public class D1v1RankPanelExt extends SkinUIPanel
	{
		private var _skin:KuaFuPaiHang_Skin;
		private var _numCtrl:D1v1RankPageSelectCtrl;
		private var _gReward:RewardGroup;
		private var _myCell:D1v1RankCellExt;
		private var _rankList:Vector.<D1v1RankCellExt>;
		private const MAX_COUNT:int=9;
		private var _roleShow:RoleModelShow;
		private var _rightData:DianFengRankInfo;
		private var _weekRank:D1v1WeekRewardPanelExt;
		public function D1v1RankPanelExt()
		{
			_skin=new KuaFuPaiHang_Skin();
			super(_skin);
			
			var skinF:Flip3_Skin=_skin.skinFlip.skin as Flip3_Skin;
			_numCtrl=new D1v1RankPageSelectCtrl(skinF.btnAdd,skinF.btnDec,skinF.btnMax,skinF.btnMin,skinF.textDisplay,1,1,onPageChange);
			_numCtrl.needSpeed=false;
			_gReward=new RewardGroup(IcoSizeEnum.ICON_36,_skin.icon2);
			initList();
		}
		private function initList():void
		{
			D1v1RankCellExt.clickCall=cellCkick;
			_myCell=new D1v1RankCellExt(0);
			_myCell.isMy(true);
			
			_myCell.x=21;
			_myCell.y=415;
			_myCell.visible=false;
			_skin.container.addChild(_myCell);
			var tmp:D1v1RankCellExt;
			var startX:int=26;
			var startY:int=115;
			_rankList=new Vector.<D1v1RankCellExt>();
			for (var i:int = 0; i < MAX_COUNT; i++) 
			{
				tmp=new D1v1RankCellExt(i);
				tmp.x=startX;
				tmp.y=startY+i*tmp.height;
				_skin.container.addChild(tmp);
				_rankList.push(tmp);
				tmp.visible=false;
			}
			TipTargetManager.show(_skin.btnMsg,TargetTipsMaker.makeTips(TipType.D1V1_RANK_REWARD_TIP,null));
			_weekRank=new D1v1WeekRewardPanelExt(_skin.skinRank.skin as PaiHangAlll_Skin);
			TipTargetManager.show(_skin.uiLevel,TargetTipsMaker.makeTips(TipType.D1V1_RANK_TIP,new DynamicTipData()));
		}
		private var _curCell:D1v1RankCellExt;
		private function cellCkick(cell:D1v1RankCellExt):void
		{
			if (_curCell) 
			{
				_curCell.setSelect(false);
			}
			if (cell) 
			{
				_curCell=cell;
				_curCell.setSelect(true);
				setRightData(cell.data);
			}
		}
		public function setRightData(data:DianFengRankInfo):void
		{
			_rightData=data;
			if (!_roleShow) 
			{
				_roleShow=new RoleModelShow();
				
				_roleShow.x=_skin.uiRight.x+_skin.uiRight.width/2;
				_roleShow.y=_skin.uiRight.y+_skin.uiRight.height/2+160;
				_skin.container.addChild(_roleShow);
			}
			_roleShow.setData(data.playerAppearanceInfo,1.6);
			_skin.NumZhanli.label=data.fightPower+"";
			_skin.lbRoleName.text=data.playerName;
		}
		private function onPageChange(val:int):void
		{
//			var skinF:Flip3_Skin=_skin.skinFlip.skin as Flip3_Skin;
//			skinF.textDisplay.text=_numCtrl.getValue()+"/"+_numCtrl.maxCount;
			Mgr.d1v1Mgr.reqDFRankData(val);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnJiangli:
				{
					Mgr.d1v1Mgr.reqGetReward();
					break;
				}
				case _skin.btnGlass:
				{
					if (_rightData) 
					{
						Mgr.teamMgr.loopPlayer(_rightData.playerId);
					}
					break;
				}
				case _skin.lbMsg:
				{
					AppManager.showApp(AppConstant.BATTLE_D1V1_LEVEL_UP_PANEL);
				}
			}
		}
		override protected function onShow():void
		{
			super.onShow();
			_weekRank.setData();
			ongetPanelData();
			EventManager.addEvent(D1v1Event.GET_RANK_DATA,onGetRankData);
			EventManager.addEvent(D1v1Event.GET_PANEL_DATA,ongetPanelData);
			//Mgr.d1v1Mgr.reqDFRankData(1);
			_numCtrl.setDefault();
		}
		
		private function ongetPanelData():void
		{
			// TODO Auto Generated method stub
			var data:DianFengDataInfo=Mgr.d1v1Mgr.data;
			if (data) 
			{
				var qRank:Q_battle_rank=BattleRankCfg.getRank(data.level);
				if (qRank) 
				{
					_gReward.setRewardByJsonStr(qRank.q_reward);
				}
				if (data.drawAward==1) 
				{
					TouchableUtil.gray(_skin.btnJiangli);
					_skin.btnJiangli.label="已领取";
				}
				else 
				{
					TouchableUtil.ungray(_skin.btnJiangli);
					_skin.btnJiangli.label="领取奖励";
				}
			}
			
		}
		
		private function onGetRankData(...arg):void
		{
			// TODO Auto Generated method stub
			clearModel();
			var msg:SCOpenDianFengRankMessage=arg[0];
			if (msg) 
			{
				_myCell.visible=true;
				_myCell.setData(msg.dianFengRankInfo);
				for each (var cell:D1v1RankCellExt in _rankList) 
				{
					cell.clearData();
				}
				var len:int=msg.dianFengRankInfos.length;
				for (var i:int = 0; i <len; i++) 
				{
					_rankList[i].setData(msg.dianFengRankInfos[i]);
				}
				if (len>0) 
				{
					//setRightData(msg.dianFengRankInfos[0]);
					cellCkick(_rankList[0]);
				}
				_numCtrl.updateMax(msg.maxPage,msg.maxPage,false);
//				var skinF:Flip3_Skin=_skin.skinFlip.skin as Flip3_Skin;
//				skinF.textDisplay.text=_numCtrl.getValue()+"/"+_numCtrl.maxCount;
				_weekRank.setMyRank(msg.dianFengRankInfo.rank);
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(D1v1Event.GET_RANK_DATA,onGetRankData);
			EventManager.removeEvent(D1v1Event.GET_PANEL_DATA,ongetPanelData);
			_gReward.clear();
			clearModel();
		}
		private function clearModel():void
		{
			if (_roleShow) 
			{
				_roleShow.dispose();
				_roleShow=null;
			}
			_rightData=null;
		}
	}
}