package com.rpgGame.netData.lostSkill.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 技能状态信息
	 */
	public class SkillStateInfo extends Bean {
	
		//技能ID
		private var _skillId: int;
		
		//技能等级
		private var _level: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能ID
			writeInt(_skillId);
			//技能等级
			writeShort(_level);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能ID
			_skillId = readInt();
			//技能等级
			_level = readShort();
			return true;
		}
		
		/**
		 * get 技能ID
		 * @return 
		 */
		public function get skillId(): int{
			return _skillId;
		}
		
		/**
		 * set 技能ID
		 */
		public function set skillId(value: int): void{
			this._skillId = value;
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