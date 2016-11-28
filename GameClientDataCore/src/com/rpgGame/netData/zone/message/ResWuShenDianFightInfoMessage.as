package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.monster.bean.BossDamageInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 武神殿战斗面板信息
	 */
	public class ResWuShenDianFightInfoMessage extends Message {
	
		//当前BOSS名字
		private var _bossName: String;
		
		//当前BOSS数
		private var _currentBoss: int;
		
		//BOSS总数
		private var _total: int;
		
		//我的伤害
		private var _damage: int;
		
		//玩家对BOSS伤害列表
		private var _BossDamageInfos: Vector.<com.rpgGame.netData.monster.bean.BossDamageInfo> = new Vector.<com.rpgGame.netData.monster.bean.BossDamageInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//当前BOSS名字
			writeString(_bossName);
			//当前BOSS数
			writeByte(_currentBoss);
			//BOSS总数
			writeByte(_total);
			//我的伤害
			writeInt(_damage);
			//玩家对BOSS伤害列表
			writeShort(_BossDamageInfos.length);
			for (i = 0; i < _BossDamageInfos.length; i++) {
				writeBean(_BossDamageInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//当前BOSS名字
			_bossName = readString();
			//当前BOSS数
			_currentBoss = readByte();
			//BOSS总数
			_total = readByte();
			//我的伤害
			_damage = readInt();
			//玩家对BOSS伤害列表
			var BossDamageInfos_length : int = readShort();
			for (i = 0; i < BossDamageInfos_length; i++) {
				_BossDamageInfos[i] = readBean(com.rpgGame.netData.monster.bean.BossDamageInfo) as com.rpgGame.netData.monster.bean.BossDamageInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155132;
		}
		
		/**
		 * get 当前BOSS名字
		 * @return 
		 */
		public function get bossName(): String{
			return _bossName;
		}
		
		/**
		 * set 当前BOSS名字
		 */
		public function set bossName(value: String): void{
			this._bossName = value;
		}
		
		/**
		 * get 当前BOSS数
		 * @return 
		 */
		public function get currentBoss(): int{
			return _currentBoss;
		}
		
		/**
		 * set 当前BOSS数
		 */
		public function set currentBoss(value: int): void{
			this._currentBoss = value;
		}
		
		/**
		 * get BOSS总数
		 * @return 
		 */
		public function get total(): int{
			return _total;
		}
		
		/**
		 * set BOSS总数
		 */
		public function set total(value: int): void{
			this._total = value;
		}
		
		/**
		 * get 我的伤害
		 * @return 
		 */
		public function get damage(): int{
			return _damage;
		}
		
		/**
		 * set 我的伤害
		 */
		public function set damage(value: int): void{
			this._damage = value;
		}
		
		/**
		 * get 玩家对BOSS伤害列表
		 * @return 
		 */
		public function get BossDamageInfos(): Vector.<com.rpgGame.netData.monster.bean.BossDamageInfo>{
			return _BossDamageInfos;
		}
		
		/**
		 * set 玩家对BOSS伤害列表
		 */
		public function set BossDamageInfos(value: Vector.<com.rpgGame.netData.monster.bean.BossDamageInfo>): void{
			this._BossDamageInfos = value;
		}
		
	}
}