package com.rpgGame.app.cmdlistener
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.coreData.info.team.TeamUnit;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *	队伍成员位置变化侦听
	 * @author fly.liuyang
	 * 创建时间：2014-6-26 下午3:51:57
	 * 
	 */
	public class TeamMemberPosCmdListener extends BaseBean
	{
		private static const SMALL_MAP_TEAM_MEMBER_POS_TIMER:String = "small_map_team_member_pos_timer";
		
		private var _gameTimer:GameTimer;
		
		override public function start():void
		{
			EventManager.addEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE,onTeamStateChange);
			super.finish();
		}
		
		/**
		 * 我的队伍状态发生改变 入队或者离队发生 
		 * 
		 */		
		private function onTeamStateChange( membInfo:TeamUnit = null ):void
		{
			if(TeamManager.isHaveTeam() && TeamManager.memberCount > 1)
			{
				startTimer();	
			}
			else
			{
				stopTimer();	
			}
		}
		
		private function startTimer():void
		{
			if(_gameTimer == null)
			{
				_gameTimer = new GameTimer(SMALL_MAP_TEAM_MEMBER_POS_TIMER,1000,0,onTimer);
			}
			_gameTimer.start();
		}
		
		private function stopTimer():void
		{
			if(_gameTimer)
			{
				_gameTimer.stop();
			}
		}
		
		private function onTimer():void
		{
			TeamSender.requestSameSceneTeamMembPos();
		}
	}
}