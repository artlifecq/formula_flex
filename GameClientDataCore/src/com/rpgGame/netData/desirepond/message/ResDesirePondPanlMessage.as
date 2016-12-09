package com.rpgGame.netData.desirepond.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回许愿池面板数据
	 */
	public class ResDesirePondPanlMessage extends Message {
	
		//经验
		private var _exp: int;
		
		//装备
		private var _equip: int;
		
		//金币
		private var _money: int;
		
		//真气
		private var _zhenQi: int;
		
		//最大次数
		private var _maxCount: int;
		
		//返回类型 -1 失败 1成功 0普通请求
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//经验
			writeByte(_exp);
			//装备
			writeByte(_equip);
			//金币
			writeByte(_money);
			//真气
			writeByte(_zhenQi);
			//最大次数
			writeByte(_maxCount);
			//返回类型 -1 失败 1成功 0普通请求
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//经验
			_exp = readByte();
			//装备
			_equip = readByte();
			//金币
			_money = readByte();
			//真气
			_zhenQi = readByte();
			//最大次数
			_maxCount = readByte();
			//返回类型 -1 失败 1成功 0普通请求
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 220101;
		}
		
		/**
		 * get 经验
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 经验
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
		/**
		 * get 装备
		 * @return 
		 */
		public function get equip(): int{
			return _equip;
		}
		
		/**
		 * set 装备
		 */
		public function set equip(value: int): void{
			this._equip = value;
		}
		
		/**
		 * get 金币
		 * @return 
		 */
		public function get money(): int{
			return _money;
		}
		
		/**
		 * set 金币
		 */
		public function set money(value: int): void{
			this._money = value;
		}
		
		/**
		 * get 真气
		 * @return 
		 */
		public function get zhenQi(): int{
			return _zhenQi;
		}
		
		/**
		 * set 真气
		 */
		public function set zhenQi(value: int): void{
			this._zhenQi = value;
		}
		
		/**
		 * get 最大次数
		 * @return 
		 */
		public function get maxCount(): int{
			return _maxCount;
		}
		
		/**
		 * set 最大次数
		 */
		public function set maxCount(value: int): void{
			this._maxCount = value;
		}
		
		/**
		 * get 返回类型 -1 失败 1成功 0普通请求
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 返回类型 -1 失败 1成功 0普通请求
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}