package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通用前端请求增加挑战次数
	 */
	public class ReqZoneCommonAddEnterNumMessage extends Message {
	
		//副本模型ID
		private var _zoneModelid: int;
		
		//类型
		private var _type: int;
		
		//增加次数
		private var _count: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本模型ID
			writeInt(_zoneModelid);
			//类型
			writeInt(_type);
			//增加次数
			writeByte(_count);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本模型ID
			_zoneModelid = readInt();
			//类型
			_type = readInt();
			//增加次数
			_count = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155210;
		}
		
		/**
		 * get 副本模型ID
		 * @return 
		 */
		public function get zoneModelid(): int{
			return _zoneModelid;
		}
		
		/**
		 * set 副本模型ID
		 */
		public function set zoneModelid(value: int): void{
			this._zoneModelid = value;
		}
		
		/**
		 * get 类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 增加次数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 增加次数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
	}
}