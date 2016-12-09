package com.rpgGame.netData.horse.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 单个坐骑信息
	 */
	public class HorseInfo extends Bean {
	
		//坐骑阶数
		private var _horseModelId: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//坐骑阶数
			writeByte(_horseModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//坐骑阶数
			_horseModelId = readByte();
			return true;
		}
		
		/**
		 * get 坐骑阶数
		 * @return 
		 */
		public function get horseModelId(): int{
			return _horseModelId;
		}
		
		/**
		 * set 坐骑阶数
		 */
		public function set horseModelId(value: int): void{
			this._horseModelId = value;
		}
		
	}
}