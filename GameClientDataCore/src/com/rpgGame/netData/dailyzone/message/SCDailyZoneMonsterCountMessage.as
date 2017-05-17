package com.rpgGame.netData.dailyzone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回日常副本怪物计数
	 */
	public class SCDailyZoneMonsterCountMessage extends Message {
	
		//当前波数
		private var _currentWave: int;
		
		//当前波数击杀数
		private var _currentWaveKill: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前波数
			writeInt(_currentWave);
			//当前波数击杀数
			writeInt(_currentWaveKill);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前波数
			_currentWave = readInt();
			//当前波数击杀数
			_currentWaveKill = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 400102;
		}
		
		/**
		 * get 当前波数
		 * @return 
		 */
		public function get currentWave(): int{
			return _currentWave;
		}
		
		/**
		 * set 当前波数
		 */
		public function set currentWave(value: int): void{
			this._currentWave = value;
		}
		
		/**
		 * get 当前波数击杀数
		 * @return 
		 */
		public function get currentWaveKill(): int{
			return _currentWaveKill;
		}
		
		/**
		 * set 当前波数击杀数
		 */
		public function set currentWaveKill(value: int): void{
			this._currentWaveKill = value;
		}
		
	}
}