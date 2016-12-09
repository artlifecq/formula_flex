package com.rpgGame.netData.fight.bean{
	
	import org.game.netCore.data.long;
	
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
	
		//实体Id
		private var _entityId: long;
		
		//攻击来源Id
		private var _sourceId: long;
		
		//连击伤害
		private var _hit: int;
		
		//攻击技能等级
		private var _skillLevel: int;
		
		//攻击结果0-成功 1-MISS 2-跳闪 4-暴击 8-格挡6-跳闪+暴击 12-格挡+暴击
		private var _fightResult: int;
		
		//伤害
		private var _damage: int;
		
		//反伤
		private var _back: int;
		
		//攻击技能模板Id
		private var _skillId: int;
		
		//攻击技能特效ID
		private var _effectsid: int;
		
		//扩展参数 1-攻击ID是否是虚拟侍宠
		private var _parameter: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//实体Id
			writeLong(_entityId);
			//攻击来源Id
			writeLong(_sourceId);
			//连击伤害
			writeInt(_hit);
			//攻击技能等级
			writeShort(_skillLevel);
			//攻击结果0-成功 1-MISS 2-跳闪 4-暴击 8-格挡6-跳闪+暴击 12-格挡+暴击
			writeInt(_fightResult);
			//伤害
			writeInt(_damage);
			//反伤
			writeInt(_back);
			//攻击技能模板Id
			writeInt(_skillId);
			//攻击技能特效ID
			writeByte(_effectsid);
			//扩展参数 1-攻击ID是否是虚拟侍宠
			writeByte(_parameter);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//实体Id
			_entityId = readLong();
			//攻击来源Id
			_sourceId = readLong();
			//连击伤害
			_hit = readInt();
			//攻击技能等级
			_skillLevel = readShort();
			//攻击结果0-成功 1-MISS 2-跳闪 4-暴击 8-格挡6-跳闪+暴击 12-格挡+暴击
			_fightResult = readInt();
			//伤害
			_damage = readInt();
			//反伤
			_back = readInt();
			//攻击技能模板Id
			_skillId = readInt();
			//攻击技能特效ID
			_effectsid = readByte();
			//扩展参数 1-攻击ID是否是虚拟侍宠
			_parameter = readByte();
			return true;
		}
		
		/**
		 * get 实体Id
		 * @return 
		 */
		public function get entityId(): long{
			return _entityId;
		}
		
		/**
		 * set 实体Id
		 */
		public function set entityId(value: long): void{
			this._entityId = value;
		}
		
		/**
		 * get 攻击来源Id
		 * @return 
		 */
		public function get sourceId(): long{
			return _sourceId;
		}
		
		/**
		 * set 攻击来源Id
		 */
		public function set sourceId(value: long): void{
			this._sourceId = value;
		}
		
		/**
		 * get 连击伤害
		 * @return 
		 */
		public function get hit(): int{
			return _hit;
		}
		
		/**
		 * set 连击伤害
		 */
		public function set hit(value: int): void{
			this._hit = value;
		}
		
		/**
		 * get 攻击技能等级
		 * @return 
		 */
		public function get skillLevel(): int{
			return _skillLevel;
		}
		
		/**
		 * set 攻击技能等级
		 */
		public function set skillLevel(value: int): void{
			this._skillLevel = value;
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
		 * get 反伤
		 * @return 
		 */
		public function get back(): int{
			return _back;
		}
		
		/**
		 * set 反伤
		 */
		public function set back(value: int): void{
			this._back = value;
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
		 * get 攻击技能特效ID
		 * @return 
		 */
		public function get effectsid(): int{
			return _effectsid;
		}
		
		/**
		 * set 攻击技能特效ID
		 */
		public function set effectsid(value: int): void{
			this._effectsid = value;
		}
		
		/**
		 * get 扩展参数 1-攻击ID是否是虚拟侍宠
		 * @return 
		 */
		public function get parameter(): int{
			return _parameter;
		}
		
		/**
		 * set 扩展参数 1-攻击ID是否是虚拟侍宠
		 */
		public function set parameter(value: int): void{
			this._parameter = value;
		}
		
	}
}