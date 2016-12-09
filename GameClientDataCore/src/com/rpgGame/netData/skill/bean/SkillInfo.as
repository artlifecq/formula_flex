package com.rpgGame.netData.skill.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 技能信息类
	 */
	public class SkillInfo extends Bean {
	
		//技能唯一Id
		private var _skillId: long;
		
		//技能模板Id
		private var _skillModelId: int;
		
		//技能等级
		private var _skillLevel: int;
		
		//技能子等级
		private var _skillChildLv: int;
		
		//技能经验
		private var _skillExp: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能唯一Id
			writeLong(_skillId);
			//技能模板Id
			writeInt(_skillModelId);
			//技能等级
			writeInt(_skillLevel);
			//技能子等级
			writeInt(_skillChildLv);
			//技能经验
			writeInt(_skillExp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能唯一Id
			_skillId = readLong();
			//技能模板Id
			_skillModelId = readInt();
			//技能等级
			_skillLevel = readInt();
			//技能子等级
			_skillChildLv = readInt();
			//技能经验
			_skillExp = readInt();
			return true;
		}
		
		/**
		 * get 技能唯一Id
		 * @return 
		 */
		public function get skillId(): long{
			return _skillId;
		}
		
		/**
		 * set 技能唯一Id
		 */
		public function set skillId(value: long): void{
			this._skillId = value;
		}
		
		/**
		 * get 技能模板Id
		 * @return 
		 */
		public function get skillModelId(): int{
			return _skillModelId;
		}
		
		/**
		 * set 技能模板Id
		 */
		public function set skillModelId(value: int): void{
			this._skillModelId = value;
		}
		
		/**
		 * get 技能等级
		 * @return 
		 */
		public function get skillLevel(): int{
			return _skillLevel;
		}
		
		/**
		 * set 技能等级
		 */
		public function set skillLevel(value: int): void{
			this._skillLevel = value;
		}
		
		/**
		 * get 技能子等级
		 * @return 
		 */
		public function get skillChildLv(): int{
			return _skillChildLv;
		}
		
		/**
		 * set 技能子等级
		 */
		public function set skillChildLv(value: int): void{
			this._skillChildLv = value;
		}
		
		/**
		 * get 技能经验
		 * @return 
		 */
		public function get skillExp(): int{
			return _skillExp;
		}
		
		/**
		 * set 技能经验
		 */
		public function set skillExp(value: int): void{
			this._skillExp = value;
		}
		
	}
}