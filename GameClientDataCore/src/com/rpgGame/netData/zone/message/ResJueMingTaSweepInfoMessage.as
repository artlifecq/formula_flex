package com.rpgGame.netData.zone.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回绝命塔扫荡信息
	 */
	public class ResJueMingTaSweepInfoMessage extends Message {
	
		//扫荡状态 0-未开始扫荡 1-正在扫荡 2-全部扫荡结束
		private var _sweepState: int;
		
		//当前扫荡开始层 从0计
		private var _startLayer: int;
		
		//当前扫荡结束层 从0计
		private var _endLayer: int;
		
		//当前正在扫荡的层 从0计
		private var _curLayer: int;
		
		//当前已领奖的层数 从1计
		private var _rewardLayer: int;
		
		//当前扫荡开始时间
		private var _sweepStartTm: long;
		
		//扫荡开始时的玩家战斗力
		private var _fightPower: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//扫荡状态 0-未开始扫荡 1-正在扫荡 2-全部扫荡结束
			writeByte(_sweepState);
			//当前扫荡开始层 从0计
			writeShort(_startLayer);
			//当前扫荡结束层 从0计
			writeShort(_endLayer);
			//当前正在扫荡的层 从0计
			writeShort(_curLayer);
			//当前已领奖的层数 从1计
			writeShort(_rewardLayer);
			//当前扫荡开始时间
			writeLong(_sweepStartTm);
			//扫荡开始时的玩家战斗力
			writeInt(_fightPower);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//扫荡状态 0-未开始扫荡 1-正在扫荡 2-全部扫荡结束
			_sweepState = readByte();
			//当前扫荡开始层 从0计
			_startLayer = readShort();
			//当前扫荡结束层 从0计
			_endLayer = readShort();
			//当前正在扫荡的层 从0计
			_curLayer = readShort();
			//当前已领奖的层数 从1计
			_rewardLayer = readShort();
			//当前扫荡开始时间
			_sweepStartTm = readLong();
			//扫荡开始时的玩家战斗力
			_fightPower = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155110;
		}
		
		/**
		 * get 扫荡状态 0-未开始扫荡 1-正在扫荡 2-全部扫荡结束
		 * @return 
		 */
		public function get sweepState(): int{
			return _sweepState;
		}
		
		/**
		 * set 扫荡状态 0-未开始扫荡 1-正在扫荡 2-全部扫荡结束
		 */
		public function set sweepState(value: int): void{
			this._sweepState = value;
		}
		
		/**
		 * get 当前扫荡开始层 从0计
		 * @return 
		 */
		public function get startLayer(): int{
			return _startLayer;
		}
		
		/**
		 * set 当前扫荡开始层 从0计
		 */
		public function set startLayer(value: int): void{
			this._startLayer = value;
		}
		
		/**
		 * get 当前扫荡结束层 从0计
		 * @return 
		 */
		public function get endLayer(): int{
			return _endLayer;
		}
		
		/**
		 * set 当前扫荡结束层 从0计
		 */
		public function set endLayer(value: int): void{
			this._endLayer = value;
		}
		
		/**
		 * get 当前正在扫荡的层 从0计
		 * @return 
		 */
		public function get curLayer(): int{
			return _curLayer;
		}
		
		/**
		 * set 当前正在扫荡的层 从0计
		 */
		public function set curLayer(value: int): void{
			this._curLayer = value;
		}
		
		/**
		 * get 当前已领奖的层数 从1计
		 * @return 
		 */
		public function get rewardLayer(): int{
			return _rewardLayer;
		}
		
		/**
		 * set 当前已领奖的层数 从1计
		 */
		public function set rewardLayer(value: int): void{
			this._rewardLayer = value;
		}
		
		/**
		 * get 当前扫荡开始时间
		 * @return 
		 */
		public function get sweepStartTm(): long{
			return _sweepStartTm;
		}
		
		/**
		 * set 当前扫荡开始时间
		 */
		public function set sweepStartTm(value: long): void{
			this._sweepStartTm = value;
		}
		
		/**
		 * get 扫荡开始时的玩家战斗力
		 * @return 
		 */
		public function get fightPower(): int{
			return _fightPower;
		}
		
		/**
		 * set 扫荡开始时的玩家战斗力
		 */
		public function set fightPower(value: int): void{
			this._fightPower = value;
		}
		
	}
}