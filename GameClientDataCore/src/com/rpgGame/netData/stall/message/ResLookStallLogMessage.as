package com.rpgGame.netData.stall.message{
	import com.rpgGame.netData.stall.bean.StallLogInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 个人摊位交易日志
	 */
	public class ResLookStallLogMessage extends Message {
	
		//摊位获得元宝总数
		private var _getGold: long;
		
		//摊位获得银两总数
		private var _getMoney: long;
		
		//摊位交易日志列表
		private var _stallLogList: Vector.<StallLogInfo> = new Vector.<StallLogInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//摊位获得元宝总数
			writeLong(_getGold);
			//摊位获得银两总数
			writeLong(_getMoney);
			//摊位交易日志列表
			writeShort(_stallLogList.length);
			for (i = 0; i < _stallLogList.length; i++) {
				writeBean(_stallLogList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//摊位获得元宝总数
			_getGold = readLong();
			//摊位获得银两总数
			_getMoney = readLong();
			//摊位交易日志列表
			var stallLogList_length : int = readShort();
			for (i = 0; i < stallLogList_length; i++) {
				_stallLogList[i] = readBean(StallLogInfo) as StallLogInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142105;
		}
		
		/**
		 * get 摊位获得元宝总数
		 * @return 
		 */
		public function get getGold(): long{
			return _getGold;
		}
		
		/**
		 * set 摊位获得元宝总数
		 */
		public function set getGold(value: long): void{
			this._getGold = value;
		}
		
		/**
		 * get 摊位获得银两总数
		 * @return 
		 */
		public function get getMoney(): long{
			return _getMoney;
		}
		
		/**
		 * set 摊位获得银两总数
		 */
		public function set getMoney(value: long): void{
			this._getMoney = value;
		}
		
		/**
		 * get 摊位交易日志列表
		 * @return 
		 */
		public function get stallLogList(): Vector.<StallLogInfo>{
			return _stallLogList;
		}
		
		/**
		 * set 摊位交易日志列表
		 */
		public function set stallLogList(value: Vector.<StallLogInfo>): void{
			this._stallLogList = value;
		}
		
	}
}