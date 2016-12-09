package com.rpgGame.netData.skill.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 升级技能
	 */
	public class ReqLevelUpSkillMessage extends Message {
	
		//技能模板Id
		private var _skillModelId: int;
		
		//升级类型 0-等级 1-阶数
		private var _skilltype: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能模板Id
			writeInt(_skillModelId);
			//升级类型 0-等级 1-阶数
			writeByte(_skilltype);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能模板Id
			_skillModelId = readInt();
			//升级类型 0-等级 1-阶数
			_skilltype = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 123201;
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
		 * get 升级类型 0-等级 1-阶数
		 * @return 
		 */
		public function get skilltype(): int{
			return _skilltype;
		}
		
		/**
		 * set 升级类型 0-等级 1-阶数
		 */
		public function set skilltype(value: int): void{
			this._skilltype = value;
		}
		
	}
}