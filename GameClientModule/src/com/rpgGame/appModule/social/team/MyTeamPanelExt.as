package com.rpgGame.appModule.social.team
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.appModule.social.team.mediator.PlayerMediator;
	import com.rpgGame.core.events.SystemEvent;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.team.bean.TeamInfo;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import feathers.controls.Check;
	
	import gs.TweenMax;
	import gs.easing.Back;
	import gs.easing.Circ;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.shejiao.zudui.Duiwu_usSkin;
	
	import starling.events.Event;

	
	public class MyTeamPanelExt extends SkinUI
	{
		private var _skin:Duiwu_usSkin;
		private var playerList:Vector.<PlayerMediator> = new Vector.<PlayerMediator>();
		private var tInviteInitY:int;
		private var tApplyInitY:int;
		private var tWeijiaruInitY:int;
		public function MyTeamPanelExt()
		{
			_skin=new Duiwu_usSkin();
			super(_skin);
			tApplyInitY=_skin.chk_accept_apply.y;
			tInviteInitY=_skin.chk_accept_invite.y;
			tWeijiaruInitY=_skin.ui_weijiaru.y;
			playerList.push( new PlayerMediator( _skin.gPlayer1,_skin.dui1,_skin.head1,_skin.lab_map1 , this));
			playerList.push( new PlayerMediator( _skin.gPlayer2,_skin.dui2,_skin.head2,_skin.lab_map2 , this));
			playerList.push( new PlayerMediator( _skin.gPlayer3,_skin.dui3,_skin.head3,_skin.lab_map3 , this));
			playerList.push( new PlayerMediator( _skin.gPlayer4,_skin.dui4,_skin.head4,_skin.lab_map4 , this));
			playerList.push( new PlayerMediator( _skin.gPlayer5,_skin.dui5,_skin.head5,_skin.lab_map5 , this));
			
			_skin.imgCaptain.x=_skin.gPlayer1.x+_skin.gPlayer1.width-_skin.imgCaptain.width;
			registerListeners();
		}
		 private function registerListeners():void
		{
			
			
			_skin.btn_create.addEventListener(Event.TRIGGERED, OnCreateTeam);
			_skin.btn_add.addEventListener(Event.TRIGGERED , OnAddPlayer);
			_skin.btn_exit.addEventListener(Event.TRIGGERED , OnExitTeam);
			
			
			_skin.chk_accept_apply.addEventListener(Event.TRIGGERED,OnStateButton);
			_skin.chk_accept_invite.addEventListener(Event.TRIGGERED,OnStateButton);
			var str:String="组队经验加成:<br>";
			str+=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,"每多组一个队员，怪物经验总量将会上升5%<br>");
			str+=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_YELLOW,"当前上升$%/20%");
			
			TipTargetManager.show(_skin.grp_jingyan,TargetTipsMaker.makeSimplePropChangeTextTips(str,null,getTipValue));
		}
		private function OnStateButton(event:Event):void
		{
			var sbtn:Check = event.currentTarget as Check;
			if(_skin.chk_accept_apply == sbtn)
			{
				Mgr.teamMgr.autoAllowApply = !Mgr.teamMgr.autoAllowApply;
			}else if(_skin.chk_accept_invite == sbtn)
			{
				Mgr.teamMgr.autoAcceptInvite = !Mgr.teamMgr.autoAcceptInvite;
			}
			Mgr.teamMgr.UpdateAutoOpration();
		}
		private function OnCreateTeam(event:Event):void
		{
			TeamSender.ReqCreateTeam();
		}
		private function OnAddPlayer(event:Event):void
		{
			if(Mgr.teamMgr.isTeamFull)
			{
				NoticeManager.mouseFollowNotify("很抱歉，您的队伍已经满员了" );
			}else
			{
				Mgr.teamMgr.ShowSearchPanel();
			}
		}
		private function OnExitTeam(event:Event):void
		{
			TeamSender.ReqLeaveTeam( 1 );
		}
		private  function update():void
		{
			
			var p:PlayerMediator;
			var teamInfo:TeamInfo = Mgr.teamMgr.teamInfo;
			var nearNum:int = 0;
			_skin.imgCaptain.visible=false;
			_skin.btn_add.visible=false;
			_skin.btn_create.visible=false;
			_skin.btn_exit.visible=false;
			if(teamInfo != null && !teamInfo.teamId.IsZero())
			{
				var myMemberInfo:TeamMemberInfo = Mgr.teamMgr.teamMemberMap.getValue(MainRoleManager.actorInfo.id);
				var len:int = playerList.length;
				var tLen:int = teamInfo.memberinfo.length;
				_skin.imgCaptain.visible=true;
				for (var i:int = 0; i < len; i++) 
				{
					p = playerList[i];
					if(i < tLen)
					{
						p.SetData( teamInfo.memberinfo[i] );
					}else
					{
						p.SetData( null );
					}
				}
				_skin.ui_weijiaru.visible = false;
				
				_skin.btn_exit.visible=true;
				if(Mgr.teamMgr.isCaptain)
				{
					_skin.btn_add.visible = true;
				}else
				{
					_skin.btn_add.visible = false;
				}
			}else
			{
				for each(p in playerList) 
				{
					p.clearModel();
					p.visible = false;
				}
				_skin.ui_weijiaru.visible = true;
				_skin.btn_create.visible=true;
			}
			
			_skin.chk_accept_apply.isSelected=Mgr.teamMgr.autoAllowApply;
			
			_skin.chk_accept_invite.isSelected=Mgr.teamMgr.autoAcceptInvite;
			
			UpdateSetInfo();
			
			CalcAddTeamAttri();
		}

		private function CalcAddTeamAttri():void
		{
			var nearNum:int = 0;
			for each(var p:PlayerMediator in playerList)
			{
				if(p.member != null && !p.toFar)
				{
					nearNum ++;
				}
			}
			if(nearNum > 1)
			{
				_skin.jingyanbg2.filter = null;
				_skin.num_jingyan.label=(nearNum-1)*5+"x";
			}else
			{
				_skin.jingyanbg2.filter = FilterUtil.getGrayFilter();
				_skin.num_jingyan.label="0x";
			}
			
		}
		private function getTipValue():Array
		{
			var nearNum:int = 0;
			for each(var p:PlayerMediator in playerList)
			{
				if(p.member != null && !p.toFar)
				{
					nearNum ++;
				}
			}
			if (nearNum>1) 
			{
				return [(nearNum-1)*5];
			}
			return [0];
		}
		private function OnTeamInfoChange(event:TeamEvent):void
		{
			update();
			
			if(event.isCreateTeam || event.isDismissTeam)
			{
				if(_skin.ui_weijiaru.visible)
				{
					TweenNoTeam();
					
				}else
				{
					TweenTeamList();
				}
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			clearModel();
			Mgr.teamMgr.removeEventListener(TeamEvent.GET_TEAM_INFO , OnTeamInfoChange);
			Mgr.teamMgr.removeEventListener(TeamEvent.SYSTEM_SET_CHANGE , OnSystemSetChange);
		}
		private function clearModel():void
		{
			for each(var p:PlayerMediator in playerList)
			{
				p.clearModel();
			}
		}
		override protected function onShow():void
		{
			super.onShow();
			
			if(Mgr.teamMgr.isTeamInfoChange)
			{
				update();
				Mgr.teamMgr.isTeamInfoChange = false;
			}
			
			TweenPanel();
			
			Mgr.teamMgr.addEventListener(TeamEvent.GET_TEAM_INFO , OnTeamInfoChange);
			Mgr.teamMgr.addEventListener(TeamEvent.SYSTEM_SET_CHANGE , OnSystemSetChange);
			
		}
		
	
		
		private function OnSystemSetChange(evnet:TeamEvent):void
		{
			UpdateSetInfo();
		}
		
		private function UpdateSetInfo():void
		{
			var isAutoAccept:Boolean=!SystemSetManager.getinstance().getBooleanByIndex(SystemSetManager.SYSTEMSET_REFUSING_TEAM)
			if(_skin.chk_accept_invite.isEnabled ==isAutoAccept )
				return ;
			if(!isAutoAccept)
			{
				_skin.chk_accept_invite.isEnabled = false;
				TipTargetManager.show(_skin.chk_accept_invite,TargetTipsMaker.makeSimpleTextTips(HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,"您在设置面板中勾选了“拒绝组队邀请”")));
			}else
			{
				_skin.chk_accept_invite.isEnabled = true;
				TipTargetManager.remove(_skin.chk_accept_invite);
			}
			
		}
		
		public function TweenPanel():void
		{
			if(_skin.ui_weijiaru.visible)
			{
				TweenNoTeam();
			}else
			{
				TweenTeamList();
			}
			TweenMax.to(_skin.chk_accept_invite,0.3,{startAt:{y:tInviteInitY+34, autoAlpha:0}, y:tInviteInitY, autoAlpha:1, ease:Circ.easeInOut});
			TweenMax.to(_skin.chk_accept_apply,0.3,{startAt:{y:tApplyInitY+34, autoAlpha:0}, y:tApplyInitY, autoAlpha:1, ease:Circ.easeInOut});
		}
		
		public function TweenTeamList():void
		{
			for each(var p:PlayerMediator in playerList)
			{
				if(p.visible)
				{
					p.headTitle.visible = false;
					p.imgCon.visible = false;
					p.labMap.visible = false;
					
					TweenMax.to(p.labMap,0.6,{startAt:{autoAlpha:0},delay:0.2, autoAlpha:1, ease:Back.easeInOut})
					TweenMax.to(p.headTitle,0.6,{startAt:{y:p.labNameInitY-50, autoAlpha:0},delay:0.2, y:p.labNameInitY, autoAlpha:1, ease:Back.easeInOut})//玩家名字
					TweenMax.to(p.imgCon,0.6,{startAt:{y:p.conInitY-50, autoAlpha:0},delay:0.2, y:p.conInitY, autoAlpha:1, ease:Back.easeInOut})//玩家模型	
				}
			}
		}
		
		public function TweenNoTeam():void
		{
			var tween:TweenMax;
			TweenMax.to(_skin.ui_weijiaru,0.5,{startAt:{y:tWeijiaruInitY+40, autoAlpha:0},delay:0.5, y:tWeijiaruInitY, autoAlpha:1, ease:Back.easeOut});
			
		}
		
	}
}