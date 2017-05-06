package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.netData.team.bean.TeamInfo;
	import com.rpgGame.netData.team.bean.TeamMemberBriefInfo;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	import org.game.netCore.data.long;

	
	
	
	public class TeamManager extends EventDispatcher
	{
		public  static var ins:TeamManager=new TeamManager();

		public function TeamManager()
		{
		}
		/** 推荐加好友		 */
		public var RECOMMAND_ADD_FRIEND:int = 9000;
		
		public static const MAXMEMBER:int = 5; // 队伍最大人数
		
		private var _autoAcceptInvite:Boolean = true;
		private var _autoAllowApply:Boolean = true;
		
		private var _teamInfo:TeamInfo;
		private var _captain:TeamMemberInfo;
		private var _teamMemberMap:HashMap = new HashMap();
		
		/** 面板关闭的时候 记录玩家信息是否改变 面板打开时更新面板信息		 */		
		public var isTeamInfoChange:Boolean = false;
		
		
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
			return _teamInfo != null && _teamInfo.memberinfo.length >= 4;
		}
		public function get hasTeam():Boolean
		{
			return _teamInfo!=null;
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
//			var ask:TeamAskPanelExt = Mgr.uiMgr.showPanelbyType( TeamAskPanelExt );
//			ask.SetData( type , teamId , member);
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
			//TeamMsgUtil.instance.ReqSetTeamOpation( autoAllowApply?1:0,autoAcceptInvite?1:0);
		}
		
		/**
		 * 邀请玩家组队
		 */		
		public function InvitePlayerJoinTeam(playerId:long):void
		{
//			if(_teamInfo != null && !_teamInfo.teamId.IsZero())
//			{
//				if(isCaptain)
//				{
//					if(Mgr.teamMgr.isTeamFull)
//					{
//						FloatingText.showUp( TextUtil.FormatStr("很抱歉，您的队伍已经满员了") );
//					}else
//					{
//						TeamMsgUtil.instance.ReqInviteJoinTeam( playerId );
//					}
//				}else
//				{
//					FloatingText.showUp(TextUtil.FormatStr("很抱歉，只有队长才能发出组队邀请") );
//				}
//			}else
//			{
//				TeamMsgUtil.instance.ReqInviteJoinTeam( playerId );
//			}
		}
		/** 
		 * 申请入队通知 
		 */		
		public function AddApplyPrompt(teamId:long , player:TeamMemberInfo):void
		{
			//Mgr.promptMgr.AddFuncPrompt(EnumFunctionPrompt.TYPE_TEAM_JOIN, [EnumFunctionPrompt.TYPE_TEAM_JOIN ,teamId, player]);
		}
		/**
		 * 邀请入队通知
		 */		
		public function AddInvitePrompt(teamId:long , member:TeamMemberInfo):void
		{
			//Mgr.promptMgr.AddFuncPrompt( EnumFunctionPrompt.TYPE_TEAM_INVITE,[EnumFunctionPrompt.TYPE_TEAM_INVITE , teamId, member ]);
		}
		
		/**
		 * 任命队长
		 * @param teamId
		 * @param member
		 */		
		public function AppointCaptain(teamId:long , member:TeamMemberInfo):void
		{
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
//			if(teamInfo != null)
//			{
//				if(Mgr.mainPlayer.gid != playreId.ToGID())
//				{
//					var mem:TeamMemberInfo;
//					for each(mem in teamInfo.memberinfo)
//					{
//						if(mem.memberId.EqualTo( playreId))
//						{
//							var idx:int = teamInfo.memberinfo.indexOf( mem );
//							teamInfo.memberinfo.splice( idx , 1);
//							break;
//						}
//					}
//				}
//				var isDismiss:Boolean = false;
//				if(teamInfo.memberinfo.length <= 1 || Mgr.mainPlayer.gid == playreId.ToGID())
//				{
//					teamInfo.memberinfo.length = 0;
//					teamInfo.teamId.Clear();
//					isDismiss = true;
//					captain = null;
//				}
//				TeamInfoChange( teamInfo , false , isDismiss );
//			}
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
//			isTeamInfoChange = true;
//			var playerNumChange:Boolean = isCreated;
//			if(teamInfo != null && teamInfo.memberinfo.length != _teamInfo.memberinfo.length)
//				playerNumChange = true;
//			
//			teamInfo = _teamInfo;
//			SetTeamInfoMap( _teamInfo );
//			DispatchEvent( TeamEvent.GET_TEAM_INFO , _teamInfo , isCreated , isDismiss);
//			
//			if(recommandTimeoutId != 0)
//				FrameMgr.ClearTimeout( recommandTimeoutId );
//			if(isDismiss)
//			{
//				recommandTimeoutId = 0;
//			}else
//			{
//				if(playerNumChange)
//					recommandTimeoutId = FrameMgr.SetTimeout( CheckRecommandAddFriend , RECOMMAND_ADD_FRIEND );
//			}
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
//			if(teamMemberMap.containsKey( gid ))
//			{
//				var myMem:TeamMemberInfo = teamMemberMap.getValue( MainRoleManager.actorInfo.serverID );
//				var mem:TeamMemberInfo = teamMemberMap.getValue( gid );
//				if(mem != null && myMem !=null && mem.memberMapModelID == Mgr.sceneMap.mapModelId && mem.memberMapLine == Mgr.sceneMap.mapLine && myMem.memberMapUniqueID.EqualTo( mem.memberMapUniqueID))
//					return true;
//				else
//					return false;
//			}else
//			{
//				return false;
//			}
			return false;
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
			trace("===========================================================");
			trace("SynMemberInfo");
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
					var pix:Point = new Point( x , y);
//					var basePlayerV:ScenePlayer = Mgr.sceneObj.FindObject( gid );
//					if ( basePlayerV == null )
//					{
//						Mgr.miniMapMgr.UpdatePosition( EnumMapPoint.TYPE_TEAM, gid , pix.x , pix.y );
//					}
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
	}
}