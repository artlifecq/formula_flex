package com.rpgGame.netData.marriage.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 挑战夫妻副本
	 */
	public class CSChallengeZoneMessage extends Message {
	
		//副本ID
		private var _zoneModelId: int;
		
		//挑战方式   1  夫妻挑战  2  个人挑战
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本ID
			writeInt(_zoneModelId);
			//挑战方式   1  夫妻挑战  2  个人挑战
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本ID
			_zoneModelId = readInt();
			//挑战方式   1  夫妻挑战  2  个人挑战
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150113;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneModelId(): int{
			return _zoneModelId;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneModelId(value: int): void{
			this._zoneModelId = value;
		}
		
		/**
		 * get 挑战方式   1  夫妻挑战  2  个人挑战
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 挑战方式   1  夫妻挑战  2  个人挑战
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}