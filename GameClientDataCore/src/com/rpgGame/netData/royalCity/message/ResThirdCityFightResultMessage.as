package com.rpgGame.netData.royalCity.message{
	import com.rpgGame.netData.royalCity.bean.CityFightInfo3;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 三级城市战斗结果数据
	 */
	public class ResThirdCityFightResultMessage extends Message {
	
		//胜利帮会ID
		private var _sucGuildId: long;
		
		//胜利帮会名称
		private var _sucGuildName: String;
		
		//胜利帮会成员数量
		private var _sucGuildMenbers: int;
		
		//失败帮会名称
		private var _failGuildName: String;
		
		//失败帮会成员数量
		private var _failGuildMenbers: int;
		
		//战斗时间（秒）
		private var _fightTime: int;
		
		//士气值
		private var _shiQi: int;
		
		//经验值
		private var _exp: int;
		
		//真气值
		private var _zhenQi: int;
		
		//物品奖励
		private var _itemInfos: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//玩家战斗数据
		private var _fightInfos: Vector.<CityFightInfo3> = new Vector.<CityFightInfo3>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//胜利帮会ID
			writeLong(_sucGuildId);
			//胜利帮会名称
			writeString(_sucGuildName);
			//胜利帮会成员数量
			writeInt(_sucGuildMenbers);
			//失败帮会名称
			writeString(_failGuildName);
			//失败帮会成员数量
			writeInt(_failGuildMenbers);
			//战斗时间（秒）
			writeInt(_fightTime);
			//士气值
			writeInt(_shiQi);
			//经验值
			writeInt(_exp);
			//真气值
			writeInt(_zhenQi);
			//物品奖励
			writeShort(_itemInfos.length);
			for (i = 0; i < _itemInfos.length; i++) {
				writeBean(_itemInfos[i]);
			}
			//玩家战斗数据
			writeShort(_fightInfos.length);
			for (i = 0; i < _fightInfos.length; i++) {
				writeBean(_fightInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//胜利帮会ID
			_sucGuildId = readLong();
			//胜利帮会名称
			_sucGuildName = readString();
			//胜利帮会成员数量
			_sucGuildMenbers = readInt();
			//失败帮会名称
			_failGuildName = readString();
			//失败帮会成员数量
			_failGuildMenbers = readInt();
			//战斗时间（秒）
			_fightTime = readInt();
			//士气值
			_shiQi = readInt();
			//经验值
			_exp = readInt();
			//真气值
			_zhenQi = readInt();
			//物品奖励
			var itemInfos_length : int = readShort();
			for (i = 0; i < itemInfos_length; i++) {
				_itemInfos[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//玩家战斗数据
			var fightInfos_length : int = readShort();
			for (i = 0; i < fightInfos_length; i++) {
				_fightInfos[i] = readBean(CityFightInfo3) as CityFightInfo3;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 222504;
		}
		
		/**
		 * get 胜利帮会ID
		 * @return 
		 */
		public function get sucGuildId(): long{
			return _sucGuildId;
		}
		
		/**
		 * set 胜利帮会ID
		 */
		public function set sucGuildId(value: long): void{
			this._sucGuildId = value;
		}
		
		/**
		 * get 胜利帮会名称
		 * @return 
		 */
		public function get sucGuildName(): String{
			return _sucGuildName;
		}
		
		/**
		 * set 胜利帮会名称
		 */
		public function set sucGuildName(value: String): void{
			this._sucGuildName = value;
		}
		
		/**
		 * get 胜利帮会成员数量
		 * @return 
		 */
		public function get sucGuildMenbers(): int{
			return _sucGuildMenbers;
		}
		
		/**
		 * set 胜利帮会成员数量
		 */
		public function set sucGuildMenbers(value: int): void{
			this._sucGuildMenbers = value;
		}
		
		/**
		 * get 失败帮会名称
		 * @return 
		 */
		public function get failGuildName(): String{
			return _failGuildName;
		}
		
		/**
		 * set 失败帮会名称
		 */
		public function set failGuildName(value: String): void{
			this._failGuildName = value;
		}
		
		/**
		 * get 失败帮会成员数量
		 * @return 
		 */
		public function get failGuildMenbers(): int{
			return _failGuildMenbers;
		}
		
		/**
		 * set 失败帮会成员数量
		 */
		public function set failGuildMenbers(value: int): void{
			this._failGuildMenbers = value;
		}
		
		/**
		 * get 战斗时间（秒）
		 * @return 
		 */
		public function get fightTime(): int{
			return _fightTime;
		}
		
		/**
		 * set 战斗时间（秒）
		 */
		public function set fightTime(value: int): void{
			this._fightTime = value;
		}
		
		/**
		 * get 士气值
		 * @return 
		 */
		public function get shiQi(): int{
			return _shiQi;
		}
		
		/**
		 * set 士气值
		 */
		public function set shiQi(value: int): void{
			this._shiQi = value;
		}
		
		/**
		 * get 经验值
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 经验值
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
		/**
		 * get 真气值
		 * @return 
		 */
		public function get zhenQi(): int{
			return _zhenQi;
		}
		
		/**
		 * set 真气值
		 */
		public function set zhenQi(value: int): void{
			this._zhenQi = value;
		}
		
		/**
		 * get 物品奖励
		 * @return 
		 */
		public function get itemInfos(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _itemInfos;
		}
		
		/**
		 * set 物品奖励
		 */
		public function set itemInfos(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._itemInfos = value;
		}
		
		/**
		 * get 玩家战斗数据
		 * @return 
		 */
		public function get fightInfos(): Vector.<CityFightInfo3>{
			return _fightInfos;
		}
		
		/**
		 * set 玩家战斗数据
		 */
		public function set fightInfos(value: Vector.<CityFightInfo3>): void{
			this._fightInfos = value;
		}
		
	}
}