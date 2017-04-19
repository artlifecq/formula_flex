package com.rpgGame.netData.lostSkill.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 激活绝学技能
	 */
	public class CSActivitSkillMessage extends Message {
	
		//激活技能ID
		private var _skillId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//激活技能ID
			writeInt(_skillId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//激活技能ID
			_skillId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 224001;
		}
		
		/**
		 * get 激活技能ID
		 * @return 
		 */
		public function get skillId(): int{
			return _skillId;
		}
		
		/**
		 * set 激活技能ID
		 */
		public function set skillId(value: int): void{
			this._skillId = value;
		}
		
	}
}