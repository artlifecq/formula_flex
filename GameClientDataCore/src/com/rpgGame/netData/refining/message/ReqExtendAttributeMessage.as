package com.rpgGame.netData.refining.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求属性继承
	 */
	public class ReqExtendAttributeMessage extends Message {
	
		//(锻造属性继承)副装备唯一Id
		private var _dzFromItemId: long;
		
		//(极品属性继承)副装备唯一Id
		private var _jpFromItemId: long;
		
		//主装备唯一Id
		private var _toItemId: long;
		
		//预留类型
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//(锻造属性继承)副装备唯一Id
			writeLong(_dzFromItemId);
			//(极品属性继承)副装备唯一Id
			writeLong(_jpFromItemId);
			//主装备唯一Id
			writeLong(_toItemId);
			//预留类型
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//(锻造属性继承)副装备唯一Id
			_dzFromItemId = readLong();
			//(极品属性继承)副装备唯一Id
			_jpFromItemId = readLong();
			//主装备唯一Id
			_toItemId = readLong();
			//预留类型
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204204;
		}
		
		/**
		 * get (锻造属性继承)副装备唯一Id
		 * @return 
		 */
		public function get dzFromItemId(): long{
			return _dzFromItemId;
		}
		
		/**
		 * set (锻造属性继承)副装备唯一Id
		 */
		public function set dzFromItemId(value: long): void{
			this._dzFromItemId = value;
		}
		
		/**
		 * get (极品属性继承)副装备唯一Id
		 * @return 
		 */
		public function get jpFromItemId(): long{
			return _jpFromItemId;
		}
		
		/**
		 * set (极品属性继承)副装备唯一Id
		 */
		public function set jpFromItemId(value: long): void{
			this._jpFromItemId = value;
		}
		
		/**
		 * get 主装备唯一Id
		 * @return 
		 */
		public function get toItemId(): long{
			return _toItemId;
		}
		
		/**
		 * set 主装备唯一Id
		 */
		public function set toItemId(value: long): void{
			this._toItemId = value;
		}
		
		/**
		 * get 预留类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 预留类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}