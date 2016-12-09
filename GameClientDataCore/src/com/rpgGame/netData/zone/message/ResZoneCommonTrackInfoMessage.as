package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回通用副本追踪信息（需要改变时发送）
	 */
	public class ResZoneCommonTrackInfoMessage extends Message {
	
		//当前波数
		private var _waveNum: int;
		
		//剩余时间（-1未开始 大于等于0已开始）
		private var _time: int;
		
		//副本模板ID
		private var _zoneModelId: int;
		
		//怪物血量信息
		private var _hpValue: int;
		
		//怪物最大血量信息
		private var _hpMaxValue: int;
		
		//怪物模型ID
		private var _monsterModelId: int;
		
		//0不是 1是
		private var _isTomorrow: int;
		
		//挑战状态（ 0 未开始 1正在挑战 2挑战成功 3挑战失败）
		private var _challengeState: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前波数
			writeInt(_waveNum);
			//剩余时间（-1未开始 大于等于0已开始）
			writeInt(_time);
			//副本模板ID
			writeInt(_zoneModelId);
			//怪物血量信息
			writeInt(_hpValue);
			//怪物最大血量信息
			writeInt(_hpMaxValue);
			//怪物模型ID
			writeInt(_monsterModelId);
			//0不是 1是
			writeByte(_isTomorrow);
			//挑战状态（ 0 未开始 1正在挑战 2挑战成功 3挑战失败）
			writeByte(_challengeState);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前波数
			_waveNum = readInt();
			//剩余时间（-1未开始 大于等于0已开始）
			_time = readInt();
			//副本模板ID
			_zoneModelId = readInt();
			//怪物血量信息
			_hpValue = readInt();
			//怪物最大血量信息
			_hpMaxValue = readInt();
			//怪物模型ID
			_monsterModelId = readInt();
			//0不是 1是
			_isTomorrow = readByte();
			//挑战状态（ 0 未开始 1正在挑战 2挑战成功 3挑战失败）
			_challengeState = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155106;
		}
		
		/**
		 * get 当前波数
		 * @return 
		 */
		public function get waveNum(): int{
			return _waveNum;
		}
		
		/**
		 * set 当前波数
		 */
		public function set waveNum(value: int): void{
			this._waveNum = value;
		}
		
		/**
		 * get 剩余时间（-1未开始 大于等于0已开始）
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 剩余时间（-1未开始 大于等于0已开始）
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 副本模板ID
		 * @return 
		 */
		public function get zoneModelId(): int{
			return _zoneModelId;
		}
		
		/**
		 * set 副本模板ID
		 */
		public function set zoneModelId(value: int): void{
			this._zoneModelId = value;
		}
		
		/**
		 * get 怪物血量信息
		 * @return 
		 */
		public function get hpValue(): int{
			return _hpValue;
		}
		
		/**
		 * set 怪物血量信息
		 */
		public function set hpValue(value: int): void{
			this._hpValue = value;
		}
		
		/**
		 * get 怪物最大血量信息
		 * @return 
		 */
		public function get hpMaxValue(): int{
			return _hpMaxValue;
		}
		
		/**
		 * set 怪物最大血量信息
		 */
		public function set hpMaxValue(value: int): void{
			this._hpMaxValue = value;
		}
		
		/**
		 * get 怪物模型ID
		 * @return 
		 */
		public function get monsterModelId(): int{
			return _monsterModelId;
		}
		
		/**
		 * set 怪物模型ID
		 */
		public function set monsterModelId(value: int): void{
			this._monsterModelId = value;
		}
		
		/**
		 * get 0不是 1是
		 * @return 
		 */
		public function get isTomorrow(): int{
			return _isTomorrow;
		}
		
		/**
		 * set 0不是 1是
		 */
		public function set isTomorrow(value: int): void{
			this._isTomorrow = value;
		}
		
		/**
		 * get 挑战状态（ 0 未开始 1正在挑战 2挑战成功 3挑战失败）
		 * @return 
		 */
		public function get challengeState(): int{
			return _challengeState;
		}
		
		/**
		 * set 挑战状态（ 0 未开始 1正在挑战 2挑战成功 3挑战失败）
		 */
		public function set challengeState(value: int): void{
			this._challengeState = value;
		}
		
	}
}