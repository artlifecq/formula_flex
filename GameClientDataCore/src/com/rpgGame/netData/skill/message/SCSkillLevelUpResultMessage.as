package com.rpgGame.netData.skill.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 技能升结果
	 */
	public class SCSkillLevelUpResultMessage extends Message {
	
		//升级类型 0-等级 1-阶数
		private var _skilltype: int;
		
		//结果 0 失败   1 成功
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//升级类型 0-等级 1-阶数
			writeByte(_skilltype);
			//结果 0 失败   1 成功
			writeByte(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//升级类型 0-等级 1-阶数
			_skilltype = readByte();
			//结果 0 失败   1 成功
			_result = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 123108;
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
		
		/**
		 * get 结果 0 失败   1 成功
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 结果 0 失败   1 成功
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}