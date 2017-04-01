package com.rpgGame.netData.fate.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 绝命已兑换列表数据
	 */
	public class ResFateYiDuiHuanMessage extends Message {
	
		//已兑换的ID
		private var _fateId: Vector.<int> = new Vector.<int>();
		//当前轮
		private var _round: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//已兑换的ID
			writeShort(_fateId.length);
			for (i = 0; i < _fateId.length; i++) {
				writeInt(_fateId[i]);
			}
			//当前轮
			writeInt(_round);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//已兑换的ID
			var fateId_length : int = readShort();
			for (i = 0; i < fateId_length; i++) {
				_fateId[i] = readInt();
			}
			//当前轮
			_round = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 213104;
		}
		
		/**
		 * get 已兑换的ID
		 * @return 
		 */
		public function get fateId(): Vector.<int>{
			return _fateId;
		}
		
		/**
		 * set 已兑换的ID
		 */
		public function set fateId(value: Vector.<int>): void{
			this._fateId = value;
		}
		
		/**
		 * get 当前轮
		 * @return 
		 */
		public function get round(): int{
			return _round;
		}
		
		/**
		 * set 当前轮
		 */
		public function set round(value: int): void{
			this._round = value;
		}
		
	}
}