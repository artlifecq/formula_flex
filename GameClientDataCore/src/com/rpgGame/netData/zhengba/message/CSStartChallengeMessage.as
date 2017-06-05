package com.rpgGame.netData.zhengba.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 开始争霸
	 */
	public class CSStartChallengeMessage extends Message {
	
		//挑战目标id
		private var _targetId: long;
		
		//1 正常数据     2 挑战 前三 名
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//挑战目标id
			writeLong(_targetId);
			//1 正常数据     2 挑战 前三 名
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//挑战目标id
			_targetId = readLong();
			//1 正常数据     2 挑战 前三 名
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 127103;
		}
		
		/**
		 * get 挑战目标id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 挑战目标id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
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