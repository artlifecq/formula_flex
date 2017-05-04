package com.rpgGame.netData.horse.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 坐骑基本数据信息
	 */
	public class HorseDataInfo extends Bean {
	
		//坐骑当前祝福值
		private var _exp: int;
		
		//当前乘骑坐骑ID
		private var _rideHorseModelId: int;
		
		//坐骑当前阶数
		private var _horseModelId: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//坐骑当前祝福值
			writeInt(_exp);
			//当前乘骑坐骑ID
			writeInt(_rideHorseModelId);
			//坐骑当前阶数
			writeInt(_horseModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//坐骑当前祝福值
			_exp = readInt();
			//当前乘骑坐骑ID
			_rideHorseModelId = readInt();
			//坐骑当前阶数
			_horseModelId = readInt();
			return true;
		}
		
		/**
		 * get 坐骑当前祝福值
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 坐骑当前祝福值
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
		/**
		 * get 当前乘骑坐骑ID
		 * @return 
		 */
		public function get rideHorseModelId(): int{
			return _rideHorseModelId;
		}
		
		/**
		 * set 当前乘骑坐骑ID
		 */
		public function set rideHorseModelId(value: int): void{
			this._rideHorseModelId = value;
		}
		
		/**
		 * get 坐骑当前阶数
		 * @return 
		 */
		public function get horseModelId(): int{
			return _horseModelId;
		}
		
		/**
		 * set 坐骑当前阶数
		 */
		public function set horseModelId(value: int): void{
			this._horseModelId = value;
		}
		
	}
}