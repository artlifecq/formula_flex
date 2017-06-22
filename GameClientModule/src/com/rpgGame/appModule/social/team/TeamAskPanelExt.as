package  com.rpgGame.appModule.social.team
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.RoleModelShow;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import flash.utils.getTimer;
	
	import away3d.events.Event;
	
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.shejiao.zudui.Duiwu_TanKuang;
	
	import starling.display.DisplayObjectContainer;

	
	public class TeamAskPanelExt extends SkinUIPanel
	{
		private var type:int;
		private var _teamId:long;
		private var member:TeamMemberInfo;
		
		private var roleModel:RoleModelShow;
		private var _skin:Duiwu_TanKuang;
		private var timeLeft:int=0;
		private var timer:GameTimer;
		public function TeamAskPanelExt()
		{
			_skin=new Duiwu_TanKuang();
			super(_skin);
			
			registerListeners();
		}
		private function registerListeners():void
		{
			
			_skin.btn_Look.addEventListener(Event.TRIGGERED, OnViewPlayer);
			_skin.btn_ok.addEventListener(Event.TRIGGERED, OnAgree);
			_skin.btn_cancel.addEventListener(Event.TRIGGERED, OnDisagree);
			
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);	
			SetData(data);
		}
		private function SetData(data:*):void
		{
			clearModel();
			_teamId = data.teamId;
			member = data.mem;
			type = data.type;
			var tipsStr:String;
			_skin.lbName.text=member.memberName;
			_skin.lbLevel.text=member.memberLevel+"";
			
			if(type ==  TeamManager.TYPE_TEAM_INVITE)
			{
				tipsStr= NotifyCfgData.getNotifyTextByID(61015);
				
			}else if(type == TeamManager.TYPE_TEAM_JOIN)
			{
				tipsStr=NotifyCfgData.getNotifyTextByID(61016);
//				tipsStr.push( TextUtil.FormatStr( "请问您是否同意？" ) );
			}else if(type == TeamManager.TYPE_TEAM_APPOINT_CAPTAIN)
			{
				tipsStr=(  NotifyCfgData.getNotifyTextByID(61017));
			
			}
			_skin.lb_ask.text=tipsStr;
			
			if(roleModel == null)
			{
				roleModel = new RoleModelShow();
				roleModel.setData(member.appearanceInfo,1.7);
				_skin.dui1.addChild(roleModel);
			}
			timeLeft=getTimer()+10*1000;
			if (!timer) 
			{
				timer=new GameTimer("TeamAskPanelExt",1000);
				timer.onUpdate=onTimer;
			}
			onTimer();
			timer.start();
		}
		private function onTimer():void
		{
			var diff:int=(timeLeft-getTimer())/1000;
			if (diff>0) 
			{
				_skin.lbMsg.htmlText=NotifyCfgData.getNotifyTextByID(61018)+"("+diff+"s)";
			}
			else
			{
				timer.stop();
				hide();
			}
		}
		private function OnViewPlayer(event:Event):void
		{
			if(member != null)
			{
				Mgr.teamMgr.loopPlayer( member.memberId );			
			}
		}
		private function OnAgree(event:Event):void
		{
			if(type ==  TeamManager.TYPE_TEAM_JOIN)
			{
				TeamSender.ReqAcceptJionTeam(_teamId , member.memberId  , 1);
			}else if( type ==  TeamManager.TYPE_TEAM_INVITE)
			{
				TeamSender.ReqAcceptInviteJoin( _teamId , 1);
			}else if( type == TeamManager.TYPE_TEAM_APPOINT_CAPTAIN)
			{
				TeamSender.ReqAcceptAppointNewCaptain( _teamId , 1);
			}
			hide();
		}
		private function OnDisagree(event:Event):void
		{
			if(type ==  TeamManager.TYPE_TEAM_JOIN)
			{
				TeamSender.ReqAcceptJionTeam(_teamId , member.memberId  , 0);
			}else if( type ==  TeamManager.TYPE_TEAM_INVITE)
			{
				TeamSender.ReqAcceptInviteJoin( _teamId , 0);
			}else if( type == TeamManager.TYPE_TEAM_APPOINT_CAPTAIN)
			{
				TeamSender.ReqAcceptAppointNewCaptain( _teamId , 0);
			}
			hide();
		}
		
		public function Confirm():void
		{
			OnAgree( null );
		}
		
		override protected function onHide():void
		{
			super.onHide();
			clearModel();
		}
		private function clearModel():void
		{
			if(roleModel != null)
			{
				MCUtil.removeSelf( roleModel );
				roleModel.dispose();
				roleModel = null;
			}
			if (timer) 
			{
				timer.destroy();
				timer=null;
			}
		}
	}
}