package com.rpgGame.netData.shiji.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 史记数据
	 */
	public class ShiJiInfo extends Bean {
	
		//史记等级
		private var _level: int;
		
		//勋章收集进度
		private var _progress: long;
		
		//勋章类型(1勇士勋章，2战神勋章，3王者勋章，4帝王勋章)
		private var _xunZhangType: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//史记等级
			writeByte(_level);
			//勋章收集进度
			writeLong(_progress);
			//勋章类型(1勇士勋章，2战神勋章，3王者勋章，4帝王勋章)
			writeByte(_xunZhangType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//史记等级
			_level = readByte();
			//勋章收集进度
			_progress = readLong();
			//勋章类型(1勇士勋章，2战神勋章，3王者勋章，4帝王勋章)
			_xunZhangType = readByte();
			return true;
		}
		
		/**
		 * get 史记等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 史记等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 勋章收集进度
		 * @return 
		 */
		public function get progress(): long{
			return _progress;
		}
		
		/**
		 * set 勋章收集进度
		 */
		public function set progress(value: long): void{
			this._progress = value;
		}
		
		/**
		 * get 勋章类型(1勇士勋章，2战神勋章，3王者勋章，4帝王勋章)
		 * @return 
		 */
		public function get xunZhangType(): int{
			return _xunZhangType;
		}
		
		/**
		 * set 勋章类型(1勇士勋章，2战神勋章，3王者勋章，4帝王勋章)
		 */
		public function set xunZhangType(value: int): void{
			this._xunZhangType = value;
		}
		
	}
}