package com.rpgGame.netData.monster.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 血条倍率变化
	 */
	public class ResMonsterHpRateChangeMessage extends Message {
	
		//怪物唯一Id
		private var _monsterId: long;
		
		//当前血条倍率
		private var _currentHpRate: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物唯一Id
			writeLong(_monsterId);
			//当前血条倍率
			writeInt(_currentHpRate);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物唯一Id
			_monsterId = readLong();
			//当前血条倍率
			_currentHpRate = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114112;
		}
		
		/**
		 * get 怪物唯一Id
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set 怪物唯一Id
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
		}
		
		/**
		 * get 当前血条倍率
		 * @return 
		 */
		public function get currentHpRate(): int{
			return _currentHpRate;
		}
		
		/**
		 * set 当前血条倍率
		 */
		public function set currentHpRate(value: int): void{
			this._currentHpRate = value;
		}
		
	}
}