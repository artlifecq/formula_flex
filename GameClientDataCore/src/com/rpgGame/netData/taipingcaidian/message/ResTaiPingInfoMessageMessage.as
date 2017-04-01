package com.rpgGame.netData.taipingcaidian.message{
	import com.rpgGame.netData.taipingcaidian.bean.TaiPingInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回太平财典面板数据
	 */
	public class ResTaiPingInfoMessageMessage extends Message {
	
		//今日已领取钻石数量
		private var _bindGold: int;
		
		//太平财典数据
		private var _taiPingInfo: Vector.<TaiPingInfo> = new Vector.<TaiPingInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//今日已领取钻石数量
			writeInt(_bindGold);
			//太平财典数据
			writeShort(_taiPingInfo.length);
			for (i = 0; i < _taiPingInfo.length; i++) {
				writeBean(_taiPingInfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//今日已领取钻石数量
			_bindGold = readInt();
			//太平财典数据
			var taiPingInfo_length : int = readShort();
			for (i = 0; i < taiPingInfo_length; i++) {
				_taiPingInfo[i] = readBean(TaiPingInfo) as TaiPingInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 219101;
		}
		
		/**
		 * get 今日已领取钻石数量
		 * @return 
		 */
		public function get bindGold(): int{
			return _bindGold;
		}
		
		/**
		 * set 今日已领取钻石数量
		 */
		public function set bindGold(value: int): void{
			this._bindGold = value;
		}
		
		/**
		 * get 太平财典数据
		 * @return 
		 */
		public function get taiPingInfo(): Vector.<TaiPingInfo>{
			return _taiPingInfo;
		}
		
		/**
		 * set 太平财典数据
		 */
		public function set taiPingInfo(value: Vector.<TaiPingInfo>): void{
			this._taiPingInfo = value;
		}
		
	}
}