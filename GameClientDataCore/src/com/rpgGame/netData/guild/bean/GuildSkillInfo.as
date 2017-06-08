package com.rpgGame.netData.guild.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮派技能信息
	 */
	public class GuildSkillInfo extends Bean {
	
		//技能Id
		private var _id: int;
		
		//技能等级
		private var _level: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能Id
			writeInt(_id);
			//技能等级
			writeInt(_level);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能Id
			_id = readInt();
			//技能等级
			_level = readInt();
			return true;
		}
		
		/**
		 * get 技能Id
		 * @return 
		 */
		public function get id(): int{
			return _id;
		}
		
		/**
		 * set 技能Id
		 */
		public function set id(value: int): void{
			this._id = value;
		}
		
		/**
		 * get 技能等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 技能等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
	}
}