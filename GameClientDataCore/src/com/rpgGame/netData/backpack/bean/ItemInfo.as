package com.rpgGame.netData.backpack.bean{
	import com.rpgGame.netData.backpack.bean.AttributeInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 物品信息类
	 */
	public class ItemInfo extends Bean {
	
		//物品唯一Id
		private var _itemId: long;
		
		//物品模板Id
		private var _itemModelId: int;
		
		//物品数量
		private var _num: int;
		
		//是否绑定 1是 0否
		private var _isbind: int;
		
		//道具所在格子Id
		private var _gridId: int;
		
		//过期时间
		private var _lostTime: int;
		
		//限制类型1:天,2:周,3:月,4:年
		private var _limitType: int;
		
		//限制数量
		private var _limitNum: int;
		
		//限制剩余数量
		private var _limitValue: int;
		
		//参数，额外信息
		private var _parameters: String;
		
		//附加属性表
		private var _attributeInfos: Vector.<AttributeInfo> = new Vector.<AttributeInfo>();
		//战斗力
		private var _fightPower: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品唯一Id
			writeLong(_itemId);
			//物品模板Id
			writeInt(_itemModelId);
			//物品数量
			writeInt(_num);
			//是否绑定 1是 0否
			writeByte(_isbind);
			//道具所在格子Id
			writeInt(_gridId);
			//过期时间
			writeInt(_lostTime);
			//限制类型1:天,2:周,3:月,4:年
			writeInt(_limitType);
			//限制数量
			writeInt(_limitNum);
			//限制剩余数量
			writeInt(_limitValue);
			//参数，额外信息
			writeString(_parameters);
			//附加属性表
			writeShort(_attributeInfos.length);
			for (var i: int = 0; i < _attributeInfos.length; i++) {
				writeBean(_attributeInfos[i]);
			}
			//战斗力
			writeInt(_fightPower);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品唯一Id
			_itemId = readLong();
			//物品模板Id
			_itemModelId = readInt();
			//物品数量
			_num = readInt();
			//是否绑定 1是 0否
			_isbind = readByte();
			//道具所在格子Id
			_gridId = readInt();
			//过期时间
			_lostTime = readInt();
			//限制类型1:天,2:周,3:月,4:年
			_limitType = readInt();
			//限制数量
			_limitNum = readInt();
			//限制剩余数量
			_limitValue = readInt();
			//参数，额外信息
			_parameters = readString();
			//附加属性表
			var attributeInfos_length : int = readShort();
			for (var i: int = 0; i < attributeInfos_length; i++) {
				_attributeInfos[i] = readBean(AttributeInfo) as AttributeInfo;
			}
			//战斗力
//			_fightPower = readInt();
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
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 物品模板Id
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
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
		 * get 道具所在格子Id
		 * @return 
		 */
		public function get gridId(): int{
			return _gridId;
		}
		
		/**
		 * set 道具所在格子Id
		 */
		public function set gridId(value: int): void{
			this._gridId = value;
		}
		
		/**
		 * get 过期时间
		 * @return 
		 */
		public function get lostTime(): int{
			return _lostTime;
		}
		
		/**
		 * set 过期时间
		 */
		public function set lostTime(value: int): void{
			this._lostTime = value;
		}
		
		/**
		 * get 限制类型1:天,2:周,3:月,4:年
		 * @return 
		 */
		public function get limitType(): int{
			return _limitType;
		}
		
		/**
		 * set 限制类型1:天,2:周,3:月,4:年
		 */
		public function set limitType(value: int): void{
			this._limitType = value;
		}
		
		/**
		 * get 限制数量
		 * @return 
		 */
		public function get limitNum(): int{
			return _limitNum;
		}
		
		/**
		 * set 限制数量
		 */
		public function set limitNum(value: int): void{
			this._limitNum = value;
		}
		
		/**
		 * get 限制剩余数量
		 * @return 
		 */
		public function get limitValue(): int{
			return _limitValue;
		}
		
		/**
		 * set 限制剩余数量
		 */
		public function set limitValue(value: int): void{
			this._limitValue = value;
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
		
		/**
		 * get 附加属性表
		 * @return 
		 */
		public function get attributeInfos(): Vector.<AttributeInfo>{
			return _attributeInfos;
		}
		
		/**
		 * set 附加属性表
		 */
		public function set attributeInfos(value: Vector.<AttributeInfo>): void{
			this._attributeInfos = value;
		}
		
		/**
		 * get 战斗力
		 * @return 
		 */
		public function get fightPower(): int{
			return _fightPower;
		}
		
		/**
		 * set 战斗力
		 */
		public function set fightPower(value: int): void{
			this._fightPower = value;
		}
		
	}
}