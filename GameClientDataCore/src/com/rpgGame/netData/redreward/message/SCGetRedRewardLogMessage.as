package com.rpgGame.netData.redreward.message{
	import com.rpgGame.netData.redreward.bean.RedRewardLog;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 红包领取记录列表
	 */
	public class SCGetRedRewardLogMessage extends Message {
		
		//每月红包领取数量
		private var _monthCount: int;
		
		//红包领取记录
		private var _loglist: Vector.<RedRewardLog> = new Vector.<RedRewardLog>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//每月红包领取数量
			writeInt(_monthCount);
			//红包领取记录
			writeShort(_loglist.length);
			for (i = 0; i < _loglist.length; i++) {
				writeBean(_loglist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//每月红包领取数量
			_monthCount = readInt();
			//红包领取记录
			var loglist_length : int = readShort();
			for (i = 0; i < loglist_length; i++) {
				_loglist[i] = readBean(RedRewardLog) as RedRewardLog;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 254103;
		}
		
		/**
		 * get 每月红包领取数量
		 * @return 
		 */
		public function get monthCount(): int{
			return _monthCount;
		}
		
		/**
		 * set 每月红包领取数量
		 */
		public function set monthCount(value: int): void{
			this._monthCount = value;
		}
		
		/**
		 * get 红包领取记录
		 * @return 
		 */
		public function get loglist(): Vector.<RedRewardLog>{
			return _loglist;
		}
		
		/**
		 * set 红包领取记录
		 */
		public function set loglist(value: Vector.<RedRewardLog>): void{
			this._loglist = value;
		}
		
	}
}