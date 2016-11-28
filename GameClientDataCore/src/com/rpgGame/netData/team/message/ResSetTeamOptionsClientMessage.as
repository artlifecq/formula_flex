package com.rpgGame.netData.team.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 组队选项
	 */
	public class ResSetTeamOptionsClientMessage extends Message {
	
		//队员选择 是否自动接受邀请,1同意，0拒绝
		private var _autoJoinTeam: int;
		
		//当你是队长时,自动接受他人入队申请 ,1同意，0拒绝
		private var _autoIntoTeamApply: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//队员选择 是否自动接受邀请,1同意，0拒绝
			writeByte(_autoJoinTeam);
			//当你是队长时,自动接受他人入队申请 ,1同意，0拒绝
			writeByte(_autoIntoTeamApply);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//队员选择 是否自动接受邀请,1同意，0拒绝
			_autoJoinTeam = readByte();
			//当你是队长时,自动接受他人入队申请 ,1同意，0拒绝
			_autoIntoTeamApply = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109115;
		}
		
		/**
		 * get 队员选择 是否自动接受邀请,1同意，0拒绝
		 * @return 
		 */
		public function get autoJoinTeam(): int{
			return _autoJoinTeam;
		}
		
		/**
		 * set 队员选择 是否自动接受邀请,1同意，0拒绝
		 */
		public function set autoJoinTeam(value: int): void{
			this._autoJoinTeam = value;
		}
		
		/**
		 * get 当你是队长时,自动接受他人入队申请 ,1同意，0拒绝
		 * @return 
		 */
		public function get autoIntoTeamApply(): int{
			return _autoIntoTeamApply;
		}
		
		/**
		 * set 当你是队长时,自动接受他人入队申请 ,1同意，0拒绝
		 */
		public function set autoIntoTeamApply(value: int): void{
			this._autoIntoTeamApply = value;
		}
		
	}
}