package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家修改名字
	 */
	public class ReqPlayerChangeNameMessage extends Message {
	
		//玩家名字
		private var _name: String;
		
		//玩家性别(0.女 1.男)
		private var _sex: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家名字
			writeString(_name);
			//玩家性别(0.女 1.男)
			writeByte(_sex);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家名字
			_name = readString();
			//玩家性别(0.女 1.男)
			_sex = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103206;
		}
		
		/**
		 * get 玩家名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 玩家名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 玩家性别(0.女 1.男)
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set 玩家性别(0.女 1.男)
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
	}
}