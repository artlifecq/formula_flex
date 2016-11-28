package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.zone.bean.BattleZoneInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回前端战役副本信息
	 */
	public class ResBattleZoneObtainToClientMessage extends Message {
	
		//经典战役副本信息列表
		private var _battleZoneInfos: Vector.<BattleZoneInfo> = new Vector.<BattleZoneInfo>();
		//是否存在可领取的奖励，1是可领取，在可领取状态是不允许扫荡
		private var _cangetreward: int;
		
		//扫荡剩余时间
		private var _remaindSweepTime: int;
		
		//扫荡总时间
		private var _totalTime: int;
		
		//当前扫荡的副本id
		private var _sweepzoneids: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//经典战役副本信息列表
			writeShort(_battleZoneInfos.length);
			for (i = 0; i < _battleZoneInfos.length; i++) {
				writeBean(_battleZoneInfos[i]);
			}
			//是否存在可领取的奖励，1是可领取，在可领取状态是不允许扫荡
			writeInt(_cangetreward);
			//扫荡剩余时间
			writeInt(_remaindSweepTime);
			//扫荡总时间
			writeInt(_totalTime);
			//当前扫荡的副本id
			writeShort(_sweepzoneids.length);
			for (i = 0; i < _sweepzoneids.length; i++) {
				writeInt(_sweepzoneids[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//经典战役副本信息列表
			var battleZoneInfos_length : int = readShort();
			for (i = 0; i < battleZoneInfos_length; i++) {
				_battleZoneInfos[i] = readBean(BattleZoneInfo) as BattleZoneInfo;
			}
			//是否存在可领取的奖励，1是可领取，在可领取状态是不允许扫荡
			_cangetreward = readInt();
			//扫荡剩余时间
			_remaindSweepTime = readInt();
			//扫荡总时间
			_totalTime = readInt();
			//当前扫荡的副本id
			var sweepzoneids_length : int = readShort();
			for (i = 0; i < sweepzoneids_length; i++) {
				_sweepzoneids[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155101;
		}
		
		/**
		 * get 经典战役副本信息列表
		 * @return 
		 */
		public function get battleZoneInfos(): Vector.<BattleZoneInfo>{
			return _battleZoneInfos;
		}
		
		/**
		 * set 经典战役副本信息列表
		 */
		public function set battleZoneInfos(value: Vector.<BattleZoneInfo>): void{
			this._battleZoneInfos = value;
		}
		
		/**
		 * get 是否存在可领取的奖励，1是可领取，在可领取状态是不允许扫荡
		 * @return 
		 */
		public function get cangetreward(): int{
			return _cangetreward;
		}
		
		/**
		 * set 是否存在可领取的奖励，1是可领取，在可领取状态是不允许扫荡
		 */
		public function set cangetreward(value: int): void{
			this._cangetreward = value;
		}
		
		/**
		 * get 扫荡剩余时间
		 * @return 
		 */
		public function get remaindSweepTime(): int{
			return _remaindSweepTime;
		}
		
		/**
		 * set 扫荡剩余时间
		 */
		public function set remaindSweepTime(value: int): void{
			this._remaindSweepTime = value;
		}
		
		/**
		 * get 扫荡总时间
		 * @return 
		 */
		public function get totalTime(): int{
			return _totalTime;
		}
		
		/**
		 * set 扫荡总时间
		 */
		public function set totalTime(value: int): void{
			this._totalTime = value;
		}
		
		/**
		 * get 当前扫荡的副本id
		 * @return 
		 */
		public function get sweepzoneids(): Vector.<int>{
			return _sweepzoneids;
		}
		
		/**
		 * set 当前扫荡的副本id
		 */
		public function set sweepzoneids(value: Vector.<int>): void{
			this._sweepzoneids = value;
		}
		
	}
}