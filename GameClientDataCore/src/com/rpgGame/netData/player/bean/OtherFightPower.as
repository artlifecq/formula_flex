package com.rpgGame.netData.player.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 相关战斗力
	 */
	public class OtherFightPower extends Bean {
	
		//类型(1坐骑2装备3心法 4技能 5筋脉心法6战旗7美人)
		private var _type: int;
		
		//战斗力
		private var _fightPower: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型(1坐骑2装备3心法 4技能 5筋脉心法6战旗7美人)
			writeByte(_type);
			//战斗力
			writeInt(_fightPower);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型(1坐骑2装备3心法 4技能 5筋脉心法6战旗7美人)
			_type = readByte();
			//战斗力
			_fightPower = readInt();
			return true;
		}
		
		/**
		 * get 类型(1坐骑2装备3心法 4技能 5筋脉心法6战旗7美人)
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型(1坐骑2装备3心法 4技能 5筋脉心法6战旗7美人)
		 */
		public function set type(value: int): void{
			this._type = value;
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