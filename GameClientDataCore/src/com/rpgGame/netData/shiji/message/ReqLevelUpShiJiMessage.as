package com.rpgGame.netData.shiji.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求升级史记等级
	 */
	public class ReqLevelUpShiJiMessage extends Message {
	
		//荣耀类型(1勇士荣耀，2战神荣耀，3王者荣耀，4帝王荣耀)
		private var _monsterType: int;
		
		//是否自动购买材料(1是，0否)
		private var _useGold: int;
		
		//是否是VIP(0不是，1是)
		private var _isVip: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//荣耀类型(1勇士荣耀，2战神荣耀，3王者荣耀，4帝王荣耀)
			writeByte(_monsterType);
			//是否自动购买材料(1是，0否)
			writeByte(_useGold);
			//是否是VIP(0不是，1是)
			writeByte(_isVip);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//荣耀类型(1勇士荣耀，2战神荣耀，3王者荣耀，4帝王荣耀)
			_monsterType = readByte();
			//是否自动购买材料(1是，0否)
			_useGold = readByte();
			//是否是VIP(0不是，1是)
			_isVip = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 218201;
		}
		
		/**
		 * get 荣耀类型(1勇士荣耀，2战神荣耀，3王者荣耀，4帝王荣耀)
		 * @return 
		 */
		public function get monsterType(): int{
			return _monsterType;
		}
		
		/**
		 * set 荣耀类型(1勇士荣耀，2战神荣耀，3王者荣耀，4帝王荣耀)
		 */
		public function set monsterType(value: int): void{
			this._monsterType = value;
		}
		
		/**
		 * get 是否自动购买材料(1是，0否)
		 * @return 
		 */
		public function get useGold(): int{
			return _useGold;
		}
		
		/**
		 * set 是否自动购买材料(1是，0否)
		 */
		public function set useGold(value: int): void{
			this._useGold = value;
		}
		
		/**
		 * get 是否是VIP(0不是，1是)
		 * @return 
		 */
		public function get isVip(): int{
			return _isVip;
		}
		
		/**
		 * set 是否是VIP(0不是，1是)
		 */
		public function set isVip(value: int): void{
			this._isVip = value;
		}
		
	}
}