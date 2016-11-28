package com.rpgGame.netData.team.message{
	import com.rpgGame.netData.team.bean.TeamMemberBriefInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 同步队员简要信息
	 */
	public class ResTeamSynMemberinfoClientMessage extends Message {
	
		//队员简要信息列表
		private var _teamMemberBriefInfolist: Vector.<TeamMemberBriefInfo> = new Vector.<TeamMemberBriefInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//队员简要信息列表
			writeShort(_teamMemberBriefInfolist.length);
			for (i = 0; i < _teamMemberBriefInfolist.length; i++) {
				writeBean(_teamMemberBriefInfolist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//队员简要信息列表
			var teamMemberBriefInfolist_length : int = readShort();
			for (i = 0; i < teamMemberBriefInfolist_length; i++) {
				_teamMemberBriefInfolist[i] = readBean(TeamMemberBriefInfo) as TeamMemberBriefInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109114;
		}
		
		/**
		 * get 队员简要信息列表
		 * @return 
		 */
		public function get teamMemberBriefInfolist(): Vector.<TeamMemberBriefInfo>{
			return _teamMemberBriefInfolist;
		}
		
		/**
		 * set 队员简要信息列表
		 */
		public function set teamMemberBriefInfolist(value: Vector.<TeamMemberBriefInfo>): void{
			this._teamMemberBriefInfolist = value;
		}
		
	}
}