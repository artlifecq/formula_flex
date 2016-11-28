package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回通用副本结果消息
	 */
	public class ResZoneCommonResultInfoMessage extends Message {
	
		//副本模板ID
		private var _zoneModelId: int;
		
		//类型（0整个副本，1波次）
		private var _type: int;
		
		//结果（1成功，0失败）
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本模板ID
			writeInt(_zoneModelId);
			//类型（0整个副本，1波次）
			writeByte(_type);
			//结果（1成功，0失败）
			writeByte(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本模板ID
			_zoneModelId = readInt();
			//类型（0整个副本，1波次）
			_type = readByte();
			//结果（1成功，0失败）
			_result = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155108;
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
		 * get 类型（0整个副本，1波次）
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型（0整个副本，1波次）
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 结果（1成功，0失败）
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 结果（1成功，0失败）
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}