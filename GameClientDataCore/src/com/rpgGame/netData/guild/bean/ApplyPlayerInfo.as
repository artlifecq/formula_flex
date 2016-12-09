package com.rpgGame.netData.guild.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 申请入会信息
	 */
	public class ApplyPlayerInfo extends Bean {
	
		//申请人Id
		private var _applyerId: long;
		
		//申请人名字
		private var _applyerName: String;
		
		//申请人等级
		private var _applyerLevel: int;
		
		//申请人性别
		private var _sex: int;
		
		//竞技场排名
		private var _arenaRank: int;
		
		//申请时间
		private var _applyTime: long;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//申请人Id
			writeLong(_applyerId);
			//申请人名字
			writeString(_applyerName);
			//申请人等级
			writeInt(_applyerLevel);
			//申请人性别
			writeByte(_sex);
			//竞技场排名
			writeInt(_arenaRank);
			//申请时间
			writeLong(_applyTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//申请人Id
			_applyerId = readLong();
			//申请人名字
			_applyerName = readString();
			//申请人等级
			_applyerLevel = readInt();
			//申请人性别
			_sex = readByte();
			//竞技场排名
			_arenaRank = readInt();
			//申请时间
			_applyTime = readLong();
			return true;
		}
		
		/**
		 * get 申请人Id
		 * @return 
		 */
		public function get applyerId(): long{
			return _applyerId;
		}
		
		/**
		 * set 申请人Id
		 */
		public function set applyerId(value: long): void{
			this._applyerId = value;
		}
		
		/**
		 * get 申请人名字
		 * @return 
		 */
		public function get applyerName(): String{
			return _applyerName;
		}
		
		/**
		 * set 申请人名字
		 */
		public function set applyerName(value: String): void{
			this._applyerName = value;
		}
		
		/**
		 * get 申请人等级
		 * @return 
		 */
		public function get applyerLevel(): int{
			return _applyerLevel;
		}
		
		/**
		 * set 申请人等级
		 */
		public function set applyerLevel(value: int): void{
			this._applyerLevel = value;
		}
		
		/**
		 * get 申请人性别
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set 申请人性别
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
		/**
		 * get 竞技场排名
		 * @return 
		 */
		public function get arenaRank(): int{
			return _arenaRank;
		}
		
		/**
		 * set 竞技场排名
		 */
		public function set arenaRank(value: int): void{
			this._arenaRank = value;
		}
		
		/**
		 * get 申请时间
		 * @return 
		 */
		public function get applyTime(): long{
			return _applyTime;
		}
		
		/**
		 * set 申请时间
		 */
		public function set applyTime(value: long): void{
			this._applyTime = value;
		}
		
	}
}