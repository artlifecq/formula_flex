package com.rpgGame.netData.backpack.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 临时物品信息类
	 */
	public class TempItemInfo extends Bean {
	
		//物品唯一Id
		private var _itemId: long;
		
		//物品模板Id
		private var _mod: int;
		
		//物品数量
		private var _num: int;
		
		//是否绑定 1是 0否
		private var _isbind: int;
		
		//过期时间（获得道具XX秒后过期）
		private var _ltime: int;
		
		//到期时间(到达指定时间过期)
		private var _ldate: String;
		
		//强化等级
		private var _job: int;
		
		//参数，额外信息
		private var _parameters: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品唯一Id
			writeLong(_itemId);
			//物品模板Id
			writeInt(_mod);
			//物品数量
			writeInt(_num);
			//是否绑定 1是 0否
			writeByte(_isbind);
			//过期时间（获得道具XX秒后过期）
			writeInt(_ltime);
			//到期时间(到达指定时间过期)
			writeString(_ldate);
			//强化等级
			writeByte(_job);
			//参数，额外信息
			writeString(_parameters);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品唯一Id
			_itemId = readLong();
			//物品模板Id
			_mod = readInt();
			//物品数量
			_num = readInt();
			//是否绑定 1是 0否
			_isbind = readByte();
			//过期时间（获得道具XX秒后过期）
			_ltime = readInt();
			//到期时间(到达指定时间过期)
			_ldate = readString();
			//强化等级
			_job = readByte();
			//参数，额外信息
			_parameters = readString();
			return true;
		}
		
		/**
		 * get 物品唯一Id
		 * @return 
		 */
		public function get itemId(): long{
			return _itemId;
		}
		
		/**
		 * set 物品唯一Id
		 */
		public function set itemId(value: long): void{
			this._itemId = value;
		}
		
		/**
		 * get 物品模板Id
		 * @return 
		 */
		public function get mod(): int{
			return _mod;
		}
		
		/**
		 * set 物品模板Id
		 */
		public function set mod(value: int): void{
			this._mod = value;
		}
		
		/**
		 * get 物品数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 物品数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
		/**
		 * get 是否绑定 1是 0否
		 * @return 
		 */
		public function get isbind(): int{
			return _isbind;
		}
		
		/**
		 * set 是否绑定 1是 0否
		 */
		public function set isbind(value: int): void{
			this._isbind = value;
		}
		
		/**
		 * get 过期时间（获得道具XX秒后过期）
		 * @return 
		 */
		public function get ltime(): int{
			return _ltime;
		}
		
		/**
		 * set 过期时间（获得道具XX秒后过期）
		 */
		public function set ltime(value: int): void{
			this._ltime = value;
		}
		
		/**
		 * get 到期时间(到达指定时间过期)
		 * @return 
		 */
		public function get ldate(): String{
			return _ldate;
		}
		
		/**
		 * set 到期时间(到达指定时间过期)
		 */
		public function set ldate(value: String): void{
			this._ldate = value;
		}
		
		/**
		 * get 强化等级
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set 强化等级
		 */
		public function set job(value: int): void{
			this._job = value;
		}
		
		/**
		 * get 参数，额外信息
		 * @return 
		 */
		public function get parameters(): String{
			return _parameters;
		}
		
		/**
		 * set 参数，额外信息
		 */
		public function set parameters(value: String): void{
			this._parameters = value;
		}
		
	}
}