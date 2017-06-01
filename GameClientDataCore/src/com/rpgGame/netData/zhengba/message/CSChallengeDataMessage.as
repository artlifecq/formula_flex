package com.rpgGame.netData.zhengba.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 获取挑战数据
	 */
	public class CSChallengeDataMessage extends Message {
	
		//1 正常数据     2 挑战 前三 名
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1 正常数据     2 挑战 前三 名
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1 正常数据     2 挑战 前三 名
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 127101;
		}
		
		/**
		 * get 1 正常数据     2 挑战 前三 名
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 正常数据     2 挑战 前三 名
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}