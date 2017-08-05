package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回复帮会技能升级
	 */
	public class ReplyGuildSkillLevelUpMessage extends Message {
	
		//帮会技能Id
		private var _skillId: int;
		
		//帮会技能等级
		private var _skillLevel: int;
		
		//帮会技能类型,1:个人技能,2:统帅技能
		private var _skillType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮会技能Id
			writeInt(_skillId);
			//帮会技能等级
			writeInt(_skillLevel);
			//帮会技能类型,1:个人技能,2:统帅技能
			writeByte(_skillType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮会技能Id
			_skillId = readInt();
			//帮会技能等级
			_skillLevel = readInt();
			//帮会技能类型,1:个人技能,2:统帅技能
			_skillType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111113;
		}
		
		/**
		 * get 帮会技能Id
		 * @return 
		 */
		public function get skillId(): int{
			return _skillId;
		}
		
		/**
		 * set 帮会技能Id
		 */
		public function set skillId(value: int): void{
			this._skillId = value;
		}
		
		/**
		 * get 帮会技能等级
		 * @return 
		 */
		public function get skillLevel(): int{
			return _skillLevel;
		}
		
		/**
		 * set 帮会技能等级
		 */
		public function set skillLevel(value: int): void{
			this._skillLevel = value;
		}
		
		/**
		 * get 帮会技能类型,1:个人技能,2:统帅技能
		 * @return 
		 */
		public function get skillType(): int{
			return _skillType;
		}
		
		/**
		 * set 帮会技能类型,1:个人技能,2:统帅技能
		 */
		public function set skillType(value: int): void{
			this._skillType = value;
		}
		
	}
}