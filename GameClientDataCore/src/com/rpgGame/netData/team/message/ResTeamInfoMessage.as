package com.rpgGame.netData.team.message{
	import com.rpgGame.netData.team.bean.TeamInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更新队伍信息
	 */
	public class ResTeamInfoMessage extends Message {
	
		//队伍信息
		private var _teamInfo: TeamInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//队伍信息
			writeBean(_teamInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//队伍信息
			_teamInfo = readBean(TeamInfo) as TeamInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109101;
		}
		
		/**
		 * get 队伍信息
		 * @return 
		 */
		public function get teamInfo(): TeamInfo{
			return _teamInfo;
		}
		
		/**
		 * set 队伍信息
		 */
		public function set teamInfo(value: TeamInfo): void{
			this._teamInfo = value;
		}
		
	}
}