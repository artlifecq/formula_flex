package com.rpgGame.app.ui.main.team
{
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.team.TeamUnit;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.teamlist.TeamHeadPortraitSkin;

	/**
	 * 队伍中队员列表（游戏界面左侧窗口）
	 * @author 陈鹉光
	 * 
	 */	
	public class TeamList extends SkinUI
	{
		private var _skin:TeamHeadPortraitSkin;
		/** 队伍itemVec **/
		private var _itemVect:Vector.<TeamListItem>;

		public function TeamList()
		{
			_skin = new TeamHeadPortraitSkin();
			super(_skin);
			init();
		}

		/**
		 * 初始化 
		 * 
		 */		
		private function init():void
		{
			_itemVect = new Vector.<TeamListItem>();
			updateTeamItem();
		}
		
		/**
		 *当面板显示时,给子类处理自身逻辑
		 */	
		override protected function onShow():void
		{
			EventManager.addEvent( TeamEvent.TEAM_MEMB_INFO_UPDATE, updateTeamItem );
			EventManager.addEvent( TeamEvent.TEAM_OTHER_JOIN_MY_TEAM,updateTeamItem );
			EventManager.addEvent( TeamEvent.TEAM_MEMB_LEAVE,updateTeamItem );
			EventManager.addEvent( TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE,updateTeamItem );
			EventManager.addEvent( TeamEvent.TEAM_CAPTION_CHANGE, updateTeamItem );
			EventManager.addEvent( TeamEvent.TEAM_EXP_MODE, updateTeamItem );
			EventManager.addEvent( TeamEvent.TEAM_PICK_UP_MODE, updateTeamItem );
			EventManager.addEvent( TeamEvent.TEAM_MEMB_MAP_UPDATE, updateTeamItem );
			EventManager.addEvent( TeamEvent.TEAM_MEMB_DEATH, updateTeamItem );
			EventManager.addEvent( MapEvent.MAP_SWITCH_COMPLETE, updateTeamItem );
		}
		
		/**
		 *当面板隐藏时,给子类处理自身逻辑
		 */
		override protected function onHide():void
		{
			EventManager.removeEvent( TeamEvent.TEAM_MEMB_INFO_UPDATE, updateTeamItem );
			EventManager.removeEvent( TeamEvent.TEAM_OTHER_JOIN_MY_TEAM,updateTeamItem );
			EventManager.removeEvent( TeamEvent.TEAM_MEMB_LEAVE,updateTeamItem );
			EventManager.removeEvent( TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE,updateTeamItem );
			EventManager.removeEvent( TeamEvent.TEAM_CAPTION_CHANGE, updateTeamItem );
			EventManager.removeEvent( TeamEvent.TEAM_EXP_MODE, updateTeamItem );
			EventManager.removeEvent( TeamEvent.TEAM_PICK_UP_MODE, updateTeamItem );
			EventManager.removeEvent( TeamEvent.TEAM_MEMB_MAP_UPDATE, updateTeamItem );
			EventManager.removeEvent( TeamEvent.TEAM_MEMB_DEATH, updateTeamItem );
			EventManager.removeEvent( MapEvent.MAP_SWITCH_COMPLETE, updateTeamItem );
		}
		
		/**
		 * 更新队伍数据 
		 * @param membInfo
		 * 
		 */		
		private function updateTeamItem( membInfo:TeamUnit=null ):void
		{
			if( membInfo == null )
				clearItem();
			
			var teamArr:Array = TeamManager.nearTeamsArr;
			var teamVec:Vector.<TeamUnit> = TeamManager.teamMemberInfolist;
			if( teamVec == null )
				return;
			
			//去掉自己，自己不显示在左侧窗口
			var newTeamVec:Vector.<TeamUnit> = new Vector.<TeamUnit>();
			for each (var unit:TeamUnit in teamVec)
			{
				if( unit.id ==  MainRoleManager.actorID )
					continue;
				newTeamVec.push( unit );
			}
			
			if( newTeamVec == null || newTeamVec.length <= 0 )
				return;
			
			var item:TeamListItem;
			var itemLen:int = _itemVect.length;
			for( var idx:int = 0; idx < newTeamVec.length; idx++ ) 
			{
				var teamPlayerInfo:TeamUnit = newTeamVec[ idx ];
				if( idx < itemLen )
				{
					item = _itemVect[idx];
				}
				else
				{
					item = new TeamListItem();
					_skin.group.addChild( item )
					item.y = idx * item.height + 25;
					_itemVect.push( item );
				}
				
				if( membInfo != null )
				{
					if( teamPlayerInfo.id != membInfo.id )
						continue;
					item.updateTeamPlayerData( membInfo );
				}
				else
				{
					item.updateTeamPlayerData( teamPlayerInfo );
				}
			}
		}
		
		/**
		 * 清空数据 
		 * 
		 */	
		private function clearItem():void
		{
			while ( _skin.group.numChildren > 0 )
				_skin.group.removeChildAt( 0 );
			
			if( _itemVect == null || _itemVect.length <= 0 )
				return;
			_itemVect.length = 0;
		}

		/**
		 * 界面布局 
		 * @param sWidth
		 * @param sHeight
		 * 
		 */		
		public function resize(sWidth:int, sHeight:int):void
		{
			x = 0;
			y = 170;
		}
	}
}
