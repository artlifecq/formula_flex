package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回通用副本追踪精简信息（周期性发送）
	 */
	public class ResZoneCommonTrackCompactInfoMessage extends Message {
	
		//副本模板ID
		private var _zoneModelId: int;
		
		//剩余时间（-1未开始 大于等于0已开始）
		private var _time: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本模板ID
			writeInt(_zoneModelId);
			//剩余时间（-1未开始 大于等于0已开始）
			writeInt(_time);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本模板ID
			_zoneModelId = readInt();
			//剩余时间（-1未开始 大于等于0已开始）
			_time = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155107;
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
		
	}
}