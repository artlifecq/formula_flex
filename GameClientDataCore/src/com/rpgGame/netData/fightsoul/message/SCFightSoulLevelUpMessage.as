package com.rpgGame.netData.fightsoul.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战魂升级结果
	 */
	public class SCFightSoulLevelUpMessage extends Message {
	
		//当前等级
		private var _level: int;
		
		//当前经验值
		private var _curExp: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前等级
			writeShort(_level);
			//当前经验值
			writeInt(_curExp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前等级
			_level = readShort();
			//当前经验值
			_curExp = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 223002;
		}
		
		/**
		 * get 当前等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 当前等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 当前经验值
		 * @return 
		 */
		public function get curExp(): int{
			return _curExp;
		}
		
		/**
		 * set 当前经验值
		 */
		public function set curExp(value: int): void{
			this._curExp = value;
		}
		
	}
}