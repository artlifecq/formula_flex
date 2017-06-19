package com.rpgGame.app.manager
{
	import com.game.engine3D.manager.SceneMapDataManager;
	import com.game.engine3D.utils.MathUtil;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.friend.FriendManager;
	import com.rpgGame.app.manager.map.MapUnitDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.LookSender;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.alert.GameAlertExt;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.SystemEvent;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.netData.team.bean.TeamInfo;
	import com.rpgGame.netData.team.bean.TeamMemberBriefInfo;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import flash.events.EventDispatcher;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;

	
	
	
	public class TeamManager extends EventDispatcher
	{
		public static const TYPE_TEAM_INVITE:int=0;
		public static const TYPE_TEAM_JOIN:int=1;
		public static const TYPE_TEAM_APPOINT_CAPTAIN:int=2;
		public  static var ins:TeamManager=new TeamManager();
		private var noticeArr:Array=[];
		public function TeamManager()
		{
			EventManager.addEvent(SystemEvent.SYS_SET,onSystemSetChange);
		}
		
		private function onSystemSetChange(type:int):void
		{
			// TODO Auto Generated method stub
			if (SystemSetManager.SYSTEMSET_REFUSING_TEAM==type) 
			{
				//同不同意和自动不自动没关系
				var isAutoAccept:Boolean=!SystemSetManager.getinstance().getBooleanByIndex(SystemSetManager.SYSTEMSET_REFUSING_TEAM);
				UpdateSystemSet();
			}
		}	
		
		public static const MAXMEMBER:int = 5; // 队伍最大人数
		
		private var _autoAcceptInvite:Boolean = true;
		private var _autoAllowApply:Boolean = true;
		
		private var _teamInfo:TeamInfo;
		private var _captain:TeamMemberInfo;
		private var _teamMemberMap:HashMap = new HashMap();
		
	
		
		
		/**
		 * 测试组队功能
		 */		
		public function TestTeam():void
		{
		}
		/** 当前队伍信息		 */
		public function get teamInfo():TeamInfo
		{
			return _teamInfo;
		}
		public function set teamInfo(value:TeamInfo):void
		{
			_teamInfo = value;
		}
		/**
		 * 队伍满员了
		 */		
		public function get isTeamFull():Boolean
		{
			return _teamInfo != null && _teamInfo.memberinfo.length >= MAXMEMBER;
		}
		public function get hasTeam():Boolean
		{
			return _teamInfo!=null&&!_teamInfo.teamId.IsZero();
		}
		public function getNearstHpTeammerber():SceneRole
		{
			if (!hasTeam) 
			{
				return null;
			}
			var ret:SceneRole;
			var minDis:Number=1;
			var tmp:SceneRole;
			var hpPer:Number=0;
			var data:HeroData;
			for each(var mem:TeamMemberInfo in teamInfo.memberinfo)
			{
				if (mem.isonline==0) 
				{
					continue;
				}
				tmp=SceneManager.getSceneObjByID(mem.memberId.ToGID()) as SceneRole;
				if (!tmp) 
				{
					continue;
				}
				if (!tmp.usable||tmp.stateMachine.isDeadState) 
				{
					continue;
				}
			
//				dis=MathUtil.getDistanceNoSqrt(tmp.pos.x,tmp.pos.y,MainRoleManager.actor.pos.x,MainRoleManager.actor.pos.y);
//				if (dis<minDis) 
//				{
//					minDis=dis;
//					ret=tmp;
//				}
				data=tmp.data as HeroData;
				hpPer=data.totalStat.hp/data.totalStat.getMaxValue(CharAttributeType.MAX_HP);
				if (hpPer<minDis) 
				{
					minDis=hpPer;
					ret=tmp;
				}
			}
			if (!ret) 
			{
				return MainRoleManager.actor;
			}
			return ret;
		}
		/**
		 * 是否队长
		 */		
		public function get isCaptain():Boolean
		{
			if(_captain == null)
				return false;
			return _captain.memberId.EqualTo(MainRoleManager.actorInfo.serverID)
		}
		public function getPlayerIsCaptain(playerId:long):Boolean
		{
			if(_captain == null)
				return false;
			return _captain.memberId.EqualTo(playerId);
		}
		public function isInMyTeam(playerId:long):Boolean
		{
			if (!hasTeam) 
			{
				return false;
			}
			return _teamMemberMap.containsKey(playerId.ToGID());
		}
		public function isMyCaptian(player:long):Boolean
		{
			if (!hasTeam) 
			{
				return false;
			}
			return getPlayerIsCaptain(player);
		}
		/**
		 * 
		 * @param type 2 组队 1好友
		 */		
		public function ShowSearchPanel(type:int = 2, isAutoShow:Boolean = true , show:Boolean = true ):void
		{
//			if(isAutoShow)
//			{
//				show = !Mgr.uiMgr.isPanelShowByType( SearchPlayerPanelExt );
//			}
//			if(show)
//			{
//				var panel:SearchPlayerPanelExt = Mgr.uiMgr.showPanelbyType( SearchPlayerPanelExt );
//				if(panel != null)
//					panel.SetType( type );
//			}else
//			{
//				Mgr.uiMgr.hidePanelByType( SearchPlayerPanelExt );
//			}
		}
		
		public function ShowTeamAskPanel(type:int, teamId:long , member:TeamMemberInfo):void
		{
			//AppManager.showApp(AppConstant.SOCIAL_TEAM_ALERT,{type:type,teamId:teamId,mem:member});
			noticeArr.push({type:type,teamId:teamId,mem:member});
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.TEAM_TYPE, noticeArr.length);
		}
		public function getWaitNoticeData():Object
		{
			var ret:Object=noticeArr.shift();
			if (noticeArr.length!=0) 
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.TEAM_TYPE, noticeArr.length);
			}
			else
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.TEAM_TYPE);
			}
			return ret;
		}
		public function FuncPrompRelationTimeOut(type:int , teamId:long, member:TeamMemberInfo):void
		{
//			if(Mgr.uiMgr.isPanelShowByType( TeamAskPanelExt))
//			{
//				var ask:TeamAskPanelExt = Mgr.uiMgr.getPanelShowByType( TeamAskPanelExt ) as TeamAskPanelExt;
//				ask.Confirm();
//			}
		}
		
		public function UpdateAutoOpration():void
		{
			TeamSender.ReqSetTeamOpation( autoAllowApply?1:0,autoAcceptInvite?1:0);
		}
		
		/**
		 * 邀请玩家组队
		 */		
		public function InvitePlayerJoinTeam(playerId:long):void
		{
			if(_teamInfo != null && !_teamInfo.teamId.IsZero())
			{
				if(isCaptain)
				{
					if(Mgr.teamMgr.isTeamFull)
					{
						//NoticeManager.mouseFollowNotify("很抱歉，您的队伍已经满员了") ;
						NoticeManager.showNotifyById(13013);
					}else
					{
						TeamSender.ReqInviteJoinTeam( playerId );
					}
				}else
				{
					//NoticeManager.mouseFollowNotify("很抱歉，只有队长才能发出组队邀请") ;
					NoticeManager.showNotifyById(13011);
				}
			}else
			{
				TeamSender.ReqInviteJoinTeam( playerId );
			}
		}
		/** 
		 * 申请入队通知 
		 */		
		public function AddApplyPrompt(teamId:long , player:TeamMemberInfo):void
		{
			ShowTeamAskPanel(TYPE_TEAM_JOIN,teamId,player);
			//Mgr.promptMgr.AddFuncPrompt(EnumFunctionPrompt.TYPE_TEAM_JOIN, [EnumFunctionPrompt.TYPE_TEAM_JOIN ,teamId, player]);
		}
		/**
		 * 邀请入队通知
		 */		
		public function AddInvitePrompt(teamId:long , member:TeamMemberInfo):void
		{
			ShowTeamAskPanel(TYPE_TEAM_INVITE,teamId,member);
			//Mgr.promptMgr.AddFuncPrompt( EnumFunctionPrompt.TYPE_TEAM_INVITE,[EnumFunctionPrompt.TYPE_TEAM_INVITE , teamId, member ]);
		}
		
		/**
		 * 任命队长
		 * @param teamId
		 * @param member
		 */		
		public function AppointCaptain(teamId:long , member:TeamMemberInfo):void
		{
			ShowTeamAskPanel(TYPE_TEAM_APPOINT_CAPTAIN,teamId,member);
//			Mgr.promptMgr.AddFuncPromptWithSameCheck( EnumFunctionPrompt.TYPE_TEAM_APPOINT_CAPTAIN,[EnumFunctionPrompt.TYPE_TEAM_APPOINT_CAPTAIN,teamId,member],
//				function(param:Array):Boolean
//				{
//					return true;
//				});
		}
		
		/**
		 * 更新玩家队伍信息
		 * @param teamId
		 * @param playerId
		 */		
		public function UpdatePlayerTeamInfo(teamId:long , playerId:long):void
		{
			trace("===========================================================");
			trace("UpdatePlayerTeamInfo");
		}
		
		/**
		 * 玩家离开队伍
		 * @param plyaerId
		 */		
		public function PlayerLeaveTeam(playreId:long):void
		{
			if(teamInfo != null)
			{
				if(MainRoleManager.actorInfo.id != playreId.ToGID())
				{
					var mem:TeamMemberInfo;
					for each(mem in teamInfo.memberinfo)
					{
						if(mem.memberId.EqualTo( playreId))
						{
							var idx:int = teamInfo.memberinfo.indexOf( mem );
							teamInfo.memberinfo.splice( idx , 1);
							break;
						}
					}
				}
				var isDismiss:Boolean = false;
				if(teamInfo.memberinfo.length <= 1 || MainRoleManager.actorInfo.id == playreId.ToGID())
				{
					teamInfo.memberinfo.length = 0;
					teamInfo.teamId.Clear();
					isDismiss = true;
					captain = null;
				}
				TeamInfoChange( teamInfo , false , isDismiss );
			}
		}
		public function SetTeamInfoMap( teamInfo:TeamInfo ):void
		{
			_teamMemberMap.clear();
			if(teamInfo!= null && teamInfo.teamId != null && !teamInfo.teamId.IsZero())
			{
				var gid:int;
				for each(var mem:TeamMemberInfo in teamInfo.memberinfo)
				{
					gid = mem.memberId.ToGID();
					_teamMemberMap.put( mem.memberId.ToGID() , mem);
				}
			}
		}
		public function TeamInfoChange( _teamInfo:TeamInfo , isCreated:Boolean = false , isDismiss:Boolean = false):void
		{
			
			var playerNumChange:Boolean = isCreated;
			if(teamInfo != null && teamInfo.memberinfo.length != _teamInfo.memberinfo.length)
				playerNumChange = true;
			
			teamInfo = _teamInfo;
			SetTeamInfoMap( _teamInfo );
			DispatchEvent( TeamEvent.GET_TEAM_INFO , _teamInfo , isCreated , isDismiss);
			MapUnitDataManager.updataTeammate(teamInfo);
			updateTeamFlag();
		}
		private function updateTeamFlag():void
		{
			var players:Vector.<SceneRole> = SceneManager.getScenePlayerList();
			for each (var tp:SceneRole in players) 
			{
				HeadFace(tp.headFace).updateTeamFlag(isMyCaptian((tp.data as HeroData).serverID));
			}
			
		}
		private var recommandTimeoutId:int;
		private function CheckRecommandAddFriend():void
		{
//			if(teamInfo != null && teamInfo.memberinfo.length > 1)
//			{
//				for each( var mem:TeamMemberInfo in teamInfo.memberinfo )
//				{
//					if( !mem.memberId.EqualTo( Mgr.mainPlayer.sid ) )
//					{
//						if( !Mgr.friendMgr.IsFriend( mem.memberId ) )
//						{
//							Mgr.promptMgr.AddFuncPrompt( EnumFunctionPrompt.TYPE_SYSTEM_ADDFRIEND , []);
//							break;
//						}
//					}
//				}
//			}
		}
		/**
		 * 是否是队友
		 * @param gid
		 */		
		public function isTeammate(gid:int):Boolean
		{
			return teamMemberMap.containsKey( gid );
		}
		
		/**
		 * 队友是否在同一张地图
		 * @param gid
		 */		
		public function teammateIsSameMap(gid:int):Boolean
		{
			if(teamMemberMap.containsKey( gid ))
			{
				var myMem:TeamMemberInfo = teamMemberMap.getValue( MainRoleManager.actorInfo.serverID );
				var mem:TeamMemberInfo = teamMemberMap.getValue( gid );
				if(mem != null && myMem !=null && mem.memberMapModelID == MapDataManager.currentScene.sceneId  && myMem.memberMapUniqueID.EqualTo( mem.memberMapUniqueID))
					return true;
				else
					return false;
			}else
			{
				return false;
			}
		
		}
		
		public function isTeamateById(teamId:long):Boolean
		{
			return _teamInfo != null && _teamInfo.teamId.EqualTo(teamId);
		}
		
		/**
		 * 同步玩家简要信息
		 * @param list
		 */		
		public function SynMemberInfo(list:Vector.<TeamMemberBriefInfo>):void
		{
			
			DispatchEvent(TeamEvent.TEAM_MEM_ATTR_CHANGE,list);
		}
		
		/**
		 * 同步玩家位置信息
		 * @param list
		 */		
		public function SynMemberPositionInfo(playerId:long , x:int , y:int):void
		{
			var gid:int = playerId.ToGID();
			var len:int = teamInfo.memberinfo.length
			for (var i:int = 0; i < teamInfo.memberinfo.length; i++ )
			{
				if ( teamInfo.memberinfo[i].memberId.ToGID() == gid)
				{
					teamInfo.memberinfo[i].x = x;
					teamInfo.memberinfo[i].y = y;
					MapUnitDataManager.updateTeammatePos(gid,x,y,teamInfo.memberinfo[i].memberName);
					break;
				}
			}
		}
		
		public function UpdateSystemSet():void
		{
			DispatchEvent( TeamEvent.SYSTEM_SET_CHANGE , null);
		}
		
		/**
		 * 队伍事件
		 * @param type
		 * @param data
		 */		
		public function DispatchEvent(type:String , data:*,isCreated:Boolean = false , isDismiss:Boolean = false):void
		{
			var event:TeamEvent = new TeamEvent(type);
			event.data = data;
			event.isCreateTeam = isCreated;
			event.isDismissTeam = isDismiss;
			dispatchEvent( event );
		}
		
		/** 自动接受邀请		 */
		public function get autoAcceptInvite():Boolean
		{
			return _autoAcceptInvite;
		}
		
		/**
		 * @private
		 */
		public function set autoAcceptInvite(value:Boolean):void
		{
			_autoAcceptInvite = value;
		}
		
		/** 自动允许申请		 */
		public function get autoAllowApply():Boolean
		{
			return _autoAllowApply;
		}
		
		/**
		 * @private
		 */
		public function set autoAllowApply(value:Boolean):void
		{
			_autoAllowApply = value;
		}
		
		public function get captain():TeamMemberInfo
		{
			return _captain;
		}
		
		public function set captain(value:TeamMemberInfo):void
		{
			_captain = value;
		}
		
		public function get teamMemberMap():HashMap
		{
			return _teamMemberMap;
		}
		public function loopPlayer(playerId:long):void
		{
			LookSender.lookOtherPlayer(playerId);
		}
		public function move2TeamMember(heroId:*):void
		{
			// TODO Auto Generated method stub
			var mem:TeamMemberInfo=getTeamMember(heroId);
			if (mem) 
			{
				var qMap:Q_map= MapDataManager.getMapInfo(mem.memberMapModelID).getData() as Q_map;
				if (qMap) 
				{
					//普通，中立，普通加中立
					if (qMap.q_map_public!=1&&qMap.q_map_public!=2&&qMap.q_map_public!=3) 
					{
						//NoticeManager.mouseFollowNotify(qMap.q_map_name+"无法寻路到达");
						NoticeManager.showNotifyById(13040,qMap.q_map_name);
					}
					if (qMap.q_map_min_level>MainRoleManager.actorInfo.totalStat.level) 
					{
						//NoticeManager.mouseFollowNotify("等级不足,无法进入地图{0}"+qMap.q_map_name);
						NoticeManager.showNotifyById(13041,qMap.q_map_name);
					}
					else if (qMap.q_map_max_level<MainRoleManager.actorInfo.totalStat.level) 
					{
						//NoticeManager.mouseFollowNotify("等级大于"+qMap.q_map_max_level+"级，无法进入地图"+qMap.q_map_name);
						NoticeManager.showNotifyById(13042,qMap.q_map_max_level,qMap.q_map_name);
					}
					else
					{
						MainRoleSearchPathManager.walkToScene(qMap.q_map_id, mem.x, -mem.y);
					}
				}
				else
				{
					//NoticeManager.mouseFollowNotify("找不到地图"+mem.memberMapModelID);
					NoticeManager.showNotifyById(13043,mem.memberMapModelID);
				}
			}
		}
		private function getTeamMember(playerId:long):TeamMemberInfo
		{
			if (teamInfo&&teamInfo.memberinfo.length>0) 
			{
				for each (var mem:TeamMemberInfo in teamInfo.memberinfo) 
				{
					if (mem.memberId.EqualTo(playerId)) 
					{
						return mem;
					}
				}
			}
			return null;
		}
		private var reqTeamId:long;
		public function reqJoinToTeam(teamId:long):void
		{
			reqTeamId=teamId;
			if (hasTeam) 
			{
				//这个接口太难用！！！！！！
				//GameAlert.showAlertUtil(LangAlertInfo.TeamJoinOtherTeam,checkAlert);
				GameAlertExt.show(NotifyCfgData.getNotifyByID(13045).q_content,TeamSender.ReqApplyJoinTeam,[reqTeamId]);
			}
			else
			{
				TeamSender.ReqApplyJoinTeam(teamId);
			}
		}
		private function checkAlert(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{	
				case AlertClickTypeEnum.TYPE_SURE:
					TeamSender.ReqApplyJoinTeam(reqTeamId);
					reqTeamId=null;
					break;
			}
		}
		/**
		 *获取队友相对于我的状态0同地图1远离2离线3未找到 
		 * @param playerId
		 * @return 
		 * 
		 */		
		public function getNearState(playerId:long):int
		{
			var mem:TeamMemberInfo = getTeamMember(playerId);
			if (playerId.EqualTo(MainRoleManager.actorInfo.serverID)) 
			{
				return 0;
			}
			if (!mem) 
			{
				return 3;
			}
			if (!mem.isonline) 
			{
				return 2;
			}
			if (mem.memberMapModelID!=MapDataManager.currentScene.sceneId) 
			{
				return 1;
			}
			return 0;
		}
		/***玩家头像下面组队***/
		public function reqCreateTeamWithPlayer(player:long):void
		{
			TeamSender.reqCreateTeamWithPlayer(player);
		}
		
		public function clearAllNotice():void
		{
			// TODO Auto Generated method stub
			noticeArr.length=0;
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.TEAM_TYPE);
		}
	}
}