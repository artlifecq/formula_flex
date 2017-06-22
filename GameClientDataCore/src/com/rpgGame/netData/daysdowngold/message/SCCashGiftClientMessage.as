package com.rpgGame.netData.daysdowngold.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 礼金抢夺消息
	 */
	public class SCCashGiftClientMessage extends Message {
	
		//剩余怪物数量
		private var _monsterNum: int;
		
		//刷新时间(秒)
		private var _refresh: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//剩余怪物数量
			writeInt(_monsterNum);
			//刷新时间(秒)
			writeInt(_refresh);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//剩余怪物数量
			_monsterNum = readInt();
			//刷新时间(秒)
			_refresh = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 130102;
		}
		
		/**
		 * get 剩余怪物数量
		 * @return 
		 */
		public function get monsterNum(): int{
			return _monsterNum;
		}
		
		/**
		 * set 剩余怪物数量
		 */
		public function set monsterNum(value: int): void{
			this._monsterNum = value;
		}
		
		/**
		 * get 刷新时间(秒)
		 * @return 
		 */
		public function get refresh(): int{
			return _refresh;
		}
		
		/**
		 * set 刷新时间(秒)
		 */
		public function set refresh(value: int): void{
			this._refresh = value;
		}
		
	}
}