package com.rpgGame.netData.marriage.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更新夫妻副本挑战剩余次数
	 */
	public class SCUpdateZoneSubNumMessage extends Message {
	
		//副本挑战剩余次数
		private var _zoneSubNum: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本挑战剩余次数
			writeInt(_zoneSubNum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本挑战剩余次数
			_zoneSubNum = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150119;
		}
		
		/**
		 * get 副本挑战剩余次数
		 * @return 
		 */
		public function get zoneSubNum(): int{
			return _zoneSubNum;
		}
		
		/**
		 * set 副本挑战剩余次数
		 */
		public function set zoneSubNum(value: int): void{
			this._zoneSubNum = value;
		}
		
	}
}