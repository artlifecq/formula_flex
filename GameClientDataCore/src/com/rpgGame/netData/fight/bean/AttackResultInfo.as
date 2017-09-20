package com.rpgGame.netData.fight.bean{
	import com.rpgGame.netData.structs.Position;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 游戏实体战斗结果
	 */
	public class AttackResultInfo extends Bean {
	
		//攻击者Id
		private var _attackerId: int;
		
		//目标Id
		private var _targetId: int;
		
		//攻击结果0-成功 1-MISS 2-跳闪 4-暴击 8-格挡6-跳闪+暴击 12-格挡+暴击
		private var _fightResult: int;
		
		//伤害
		private var _damage: int;
		
		//攻击技能模板Id
		private var _skillId: int;
		
		//击退点
		private var _newPos: com.rpgGame.netData.structs.Position;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//攻击者Id
			writeShort(_attackerId);
			//目标Id
			writeShort(_targetId);
			//攻击结果0-成功 1-MISS 2-跳闪 4-暴击 8-格挡6-跳闪+暴击 12-格挡+暴击
			writeInt(_fightResult);
			//伤害
			writeInt(_damage);
			//攻击技能模板Id
			writeInt(_skillId);
			//击退点
			writeBean(_newPos);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//攻击者Id
			_attackerId = readShort();
			//目标Id
			_targetId = readShort();
			//攻击结果0-成功 1-MISS 2-跳闪 4-暴击 8-格挡6-跳闪+暴击 12-格挡+暴击
			_fightResult = readInt();
			//伤害
			_damage = readInt();
			//攻击技能模板Id
			_skillId = readInt();
			//击退点
			_newPos = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get 攻击者Id
		 * @return 
		 */
		public function get attackerId(): int{
			return _attackerId;
		}
		
		/**
		 * set 攻击者Id
		 */
		public function set attackerId(value: int): void{
			this._attackerId = value;
		}
		
		/**
		 * get 目标Id
		 * @return 
		 */
		public function get targetId(): int{
			return _targetId;
		}
		
		/**
		 * set 目标Id
		 */
		public function set targetId(value: int): void{
			this._targetId = value;
		}
		
		/**
		 * get 攻击结果0-成功 1-MISS 2-跳闪 4-暴击 8-格挡6-跳闪+暴击 12-格挡+暴击
		 * @return 
		 */
		public function get fightResult(): int{
			return _fightResult;
		}
		
		/**
		 * set 攻击结果0-成功 1-MISS 2-跳闪 4-暴击 8-格挡6-跳闪+暴击 12-格挡+暴击
		 */
		public function set fightResult(value: int): void{
			this._fightResult = value;
		}
		
		/**
		 * get 伤害
		 * @return 
		 */
		public function get damage(): int{
			return _damage;
		}
		
		/**
		 * set 伤害
		 */
		public function set damage(value: int): void{
			this._damage = value;
		}
		
		/**
		 * get 攻击技能模板Id
		 * @return 
		 */
		public function get skillId(): int{
			return _skillId;
		}
		
		/**
		 * set 攻击技能模板Id
		 */
		public function set skillId(value: int): void{
			this._skillId = value;
		}
		
		/**
		 * get 击退点
		 * @return 
		 */
		public function get newPos(): com.rpgGame.netData.structs.Position{
			return _newPos;
		}
		
		/**
		 * set 击退点
		 */
		public function set newPos(value: com.rpgGame.netData.structs.Position): void{
			this._newPos = value;
		}
		
	}
}