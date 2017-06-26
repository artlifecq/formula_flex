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
		
		//死亡的小怪列表
		private var _dieList: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//剩余怪物数量
			writeInt(_monsterNum);
			//刷新时间(秒)
			writeInt(_refresh);
			//死亡的小怪列表
			writeShort(_dieList.length);
			for (i = 0; i < _dieList.length; i++) {
				writeInt(_dieList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//剩余怪物数量
			_monsterNum = readInt();
			//刷新时间(秒)
			_refresh = readInt();
			//死亡的小怪列表
			var dieList_length : int = readShort();
			for (i = 0; i < dieList_length; i++) {
				_dieList[i] = readInt();
			}
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
		
		/**
		 * get 死亡的小怪列表
		 * @return 
		 */
		public function get dieList(): Vector.<int>{
			return _dieList;
		}
		
		/**
		 * set 死亡的小怪列表
		 */
		public function set dieList(value: Vector.<int>): void{
			this._dieList = value;
		}
		
	}
}