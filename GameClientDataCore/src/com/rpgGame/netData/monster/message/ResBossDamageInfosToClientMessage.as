package com.rpgGame.netData.monster.message{
	import com.rpgGame.netData.monster.bean.BossDamageInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送玩家对BOSS伤害排行列表
	 */
	public class ResBossDamageInfosToClientMessage extends Message {
	
		//玩家对BOSS伤害列表
		private var _BossDamageInfos: Vector.<BossDamageInfo> = new Vector.<BossDamageInfo>();
		//排名类型(1世界BOSS，4极限挑战上次排名，5极限挑战当前排名)
		private var _rankType: int;
		
		//总血量
		private var _totalHp: int;
		
		//玩家自身排名
		private var _rank: int;
		
		//玩家自身造成伤害
		private var _damage: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家对BOSS伤害列表
			writeShort(_BossDamageInfos.length);
			for (i = 0; i < _BossDamageInfos.length; i++) {
				writeBean(_BossDamageInfos[i]);
			}
			//排名类型(1世界BOSS，4极限挑战上次排名，5极限挑战当前排名)
			writeByte(_rankType);
			//总血量
			writeInt(_totalHp);
			//玩家自身排名
			writeInt(_rank);
			//玩家自身造成伤害
			writeInt(_damage);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家对BOSS伤害列表
			var BossDamageInfos_length : int = readShort();
			for (i = 0; i < BossDamageInfos_length; i++) {
				_BossDamageInfos[i] = readBean(BossDamageInfo) as BossDamageInfo;
			}
			//排名类型(1世界BOSS，4极限挑战上次排名，5极限挑战当前排名)
			_rankType = readByte();
			//总血量
			_totalHp = readInt();
			//玩家自身排名
			_rank = readInt();
			//玩家自身造成伤害
			_damage = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114115;
		}
		
		/**
		 * get 玩家对BOSS伤害列表
		 * @return 
		 */
		public function get BossDamageInfos(): Vector.<BossDamageInfo>{
			return _BossDamageInfos;
		}
		
		/**
		 * set 玩家对BOSS伤害列表
		 */
		public function set BossDamageInfos(value: Vector.<BossDamageInfo>): void{
			this._BossDamageInfos = value;
		}
		
		/**
		 * get 排名类型(1世界BOSS，4极限挑战上次排名，5极限挑战当前排名)
		 * @return 
		 */
		public function get rankType(): int{
			return _rankType;
		}
		
		/**
		 * set 排名类型(1世界BOSS，4极限挑战上次排名，5极限挑战当前排名)
		 */
		public function set rankType(value: int): void{
			this._rankType = value;
		}
		
		/**
		 * get 总血量
		 * @return 
		 */
		public function get totalHp(): int{
			return _totalHp;
		}
		
		/**
		 * set 总血量
		 */
		public function set totalHp(value: int): void{
			this._totalHp = value;
		}
		
		/**
		 * get 玩家自身排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 玩家自身排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 玩家自身造成伤害
		 * @return 
		 */
		public function get damage(): int{
			return _damage;
		}
		
		/**
		 * set 玩家自身造成伤害
		 */
		public function set damage(value: int): void{
			this._damage = value;
		}
		
	}
}