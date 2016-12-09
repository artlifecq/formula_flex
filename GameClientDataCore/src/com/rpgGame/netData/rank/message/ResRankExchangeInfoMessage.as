package com.rpgGame.netData.rank.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回军功值兑换消息
	 */
	public class ResRankExchangeInfoMessage extends Message {
	
		//需求经验
		private var _needExp: long;
		
		//已兑换次数
		private var _count: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//需求经验
			writeLong(_needExp);
			//已兑换次数
			writeInt(_count);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//需求经验
			_needExp = readLong();
			//已兑换次数
			_count = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 214101;
		}
		
		/**
		 * get 需求经验
		 * @return 
		 */
		public function get needExp(): long{
			return _needExp;
		}
		
		/**
		 * set 需求经验
		 */
		public function set needExp(value: long): void{
			this._needExp = value;
		}
		
		/**
		 * get 已兑换次数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 已兑换次数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
	}
}