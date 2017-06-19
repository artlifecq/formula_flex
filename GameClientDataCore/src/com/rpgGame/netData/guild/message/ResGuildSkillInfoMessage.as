package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildSkillInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮派技能信息
	 */
	public class ResGuildSkillInfoMessage extends Message {
	
		//个人帮派技能Id
		private var _personSkillList: Vector.<GuildSkillInfo> = new Vector.<GuildSkillInfo>();
		//统帅帮派技能Id
		private var _leaderSkillList: Vector.<GuildSkillInfo> = new Vector.<GuildSkillInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//个人帮派技能Id
			writeShort(_personSkillList.length);
			for (i = 0; i < _personSkillList.length; i++) {
				writeBean(_personSkillList[i]);
			}
			//统帅帮派技能Id
			writeShort(_leaderSkillList.length);
			for (i = 0; i < _leaderSkillList.length; i++) {
				writeBean(_leaderSkillList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//个人帮派技能Id
			var personSkillList_length : int = readShort();
			for (i = 0; i < personSkillList_length; i++) {
				_personSkillList[i] = readBean(GuildSkillInfo) as GuildSkillInfo;
			}
			//统帅帮派技能Id
			var leaderSkillList_length : int = readShort();
			for (i = 0; i < leaderSkillList_length; i++) {
				_leaderSkillList[i] = readBean(GuildSkillInfo) as GuildSkillInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111108;
		}
		
		/**
		 * get 个人帮派技能Id
		 * @return 
		 */
		public function get personSkillList(): Vector.<GuildSkillInfo>{
			return _personSkillList;
		}
		
		/**
		 * set 个人帮派技能Id
		 */
		public function set personSkillList(value: Vector.<GuildSkillInfo>): void{
			this._personSkillList = value;
		}
		
		/**
		 * get 统帅帮派技能Id
		 * @return 
		 */
		public function get leaderSkillList(): Vector.<GuildSkillInfo>{
			return _leaderSkillList;
		}
		
		/**
		 * set 统帅帮派技能Id
		 */
		public function set leaderSkillList(value: Vector.<GuildSkillInfo>): void{
			this._leaderSkillList = value;
		}
		
	}
}