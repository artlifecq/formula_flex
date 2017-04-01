package com.rpgGame.netData.team.message{
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 邀请加入队伍
	 */
	public class ResInviteTeamMessage extends Message {
	
		//邀请者信息
		private var _invitePlayerInfo: TeamMemberInfo;
		
		//队伍Id
		private var _teamId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邀请者信息
			writeBean(_invitePlayerInfo);
			//队伍Id
			writeLong(_teamId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//邀请者信息
			_invitePlayerInfo = readBean(TeamMemberInfo) as TeamMemberInfo;
			//队伍Id
			_teamId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109104;
		}
		
		/**
		 * get 邀请者信息
		 * @return 
		 */
		public function get invitePlayerInfo(): TeamMemberInfo{
			return _invitePlayerInfo;
		}
		
		/**
		 * set 邀请者信息
		 */
		public function set invitePlayerInfo(value: TeamMemberInfo): void{
			this._invitePlayerInfo = value;
		}
		
		/**
		 * get 队伍Id
		 * @return 
		 */
		public function get teamId(): long{
			return _teamId;
		}
		
		/**
		 * set 队伍Id
		 */
		public function set teamId(value: long): void{
			this._teamId = value;
		}
		
	}
}