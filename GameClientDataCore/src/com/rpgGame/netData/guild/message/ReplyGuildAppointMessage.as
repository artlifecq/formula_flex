package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildMemberPostInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回复帮派任命
	 */
	public class ReplyGuildAppointMessage extends Message {
	
		//职位信息变更信息
		private var _changeMemberPostInfoList: Vector.<GuildMemberPostInfo> = new Vector.<GuildMemberPostInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//职位信息变更信息
			writeShort(_changeMemberPostInfoList.length);
			for (i = 0; i < _changeMemberPostInfoList.length; i++) {
				writeBean(_changeMemberPostInfoList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//职位信息变更信息
			var changeMemberPostInfoList_length : int = readShort();
			for (i = 0; i < changeMemberPostInfoList_length; i++) {
				_changeMemberPostInfoList[i] = readBean(GuildMemberPostInfo) as GuildMemberPostInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111110;
		}
		
		/**
		 * get 职位信息变更信息
		 * @return 
		 */
		public function get changeMemberPostInfoList(): Vector.<GuildMemberPostInfo>{
			return _changeMemberPostInfoList;
		}
		
		/**
		 * set 职位信息变更信息
		 */
		public function set changeMemberPostInfoList(value: Vector.<GuildMemberPostInfo>): void{
			this._changeMemberPostInfoList = value;
		}
		
	}
}