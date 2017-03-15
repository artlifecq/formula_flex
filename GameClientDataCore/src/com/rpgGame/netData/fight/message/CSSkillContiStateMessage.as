package com.rpgGame.netData.fight.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 技能持续状态
	 */
	public class CSSkillContiStateMessage extends Message {
	
		//技能ID
		private var _skillId: int;
		
		//技能持续状态（0不持续，1持续）
		private var _skillState: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能ID
			writeInt(_skillId);
			//技能持续状态（0不持续，1持续）
			writeByte(_skillState);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能ID
			_skillId = readInt();
			//技能持续状态（0不持续，1持续）
			_skillState = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102211;
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
		 * get 技能持续状态（0不持续，1持续）
		 * @return 
		 */
		public function get skillState(): int{
			return _skillState;
		}
		
		/**
		 * set 技能持续状态（0不持续，1持续）
		 */
		public function set skillState(value: int): void{
			this._skillState = value;
		}
		
	}
}