package com.rpgGame.netData.top.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回排行榜每日奖励数据
	 */
	public class ResRankRewardMessage extends Message {
	
		//昨日排名
		private var _rank: int;
		
		//是否已领取 0 否 1 是
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//昨日排名
			writeInt(_rank);
			//是否已领取 0 否 1 是
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//昨日排名
			_rank = readInt();
			//是否已领取 0 否 1 是
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141104;
		}
		
		/**
		 * get 昨日排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 昨日排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 是否已领取 0 否 1 是
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 是否已领取 0 否 1 是
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}