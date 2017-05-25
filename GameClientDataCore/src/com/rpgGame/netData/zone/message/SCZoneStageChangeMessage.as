package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 副本状态信息
	 */
	public class SCZoneStageChangeMessage extends Message {
	
		//副本ID
		private var _zoneModelId: int;
		
		//当前阶段
		private var _stage: int;
		
		//当前波数
		private var _wave: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本ID
			writeInt(_zoneModelId);
			//当前阶段
			writeByte(_stage);
			//当前波数
			writeByte(_wave);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本ID
			_zoneModelId = readInt();
			//当前阶段
			_stage = readByte();
			//当前波数
			_wave = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155139;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneModelId(): int{
			return _zoneModelId;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneModelId(value: int): void{
			this._zoneModelId = value;
		}
		
		/**
		 * get 当前阶段
		 * @return 
		 */
		public function get stage(): int{
			return _stage;
		}
		
		/**
		 * set 当前阶段
		 */
		public function set stage(value: int): void{
			this._stage = value;
		}
		
		/**
		 * get 当前波数
		 * @return 
		 */
		public function get wave(): int{
			return _wave;
		}
		
		/**
		 * set 当前波数
		 */
		public function set wave(value: int): void{
			this._wave = value;
		}
		
	}
}