package com.rpgGame.netData.zhangong.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战功对象数据
	 */
	public class MeritoriousInfo extends Bean {
	
		//战功类型
		private var _type: int;
		
		//战功等级
		private var _level: int;
		
		//战功所属的等级类型
		private var _LevelType: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战功类型
			writeInt(_type);
			//战功等级
			writeInt(_level);
			//战功所属的等级类型
			writeInt(_LevelType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战功类型
			_type = readInt();
			//战功等级
			_level = readInt();
			//战功所属的等级类型
			_LevelType = readInt();
			return true;
		}
		
		/**
		 * get 战功类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 战功类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 战功等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 战功等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 战功所属的等级类型
		 * @return 
		 */
		public function get LevelType(): int{
			return _LevelType;
		}
		
		/**
		 * set 战功所属的等级类型
		 */
		public function set LevelType(value: int): void{
			this._LevelType = value;
		}
		
	}
}