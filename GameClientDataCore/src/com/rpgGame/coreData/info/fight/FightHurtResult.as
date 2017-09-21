package com.rpgGame.coreData.info.fight
{
	import com.game.engine3D.vo.BaseRole;
	import com.gameClient.alert.AlertPanel;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.SpellEffectDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.type.EnumHurtType;
	
	import flash.geom.Point;
	
	import away3d.log.Log;
	
	/**
	 * 对某个单位的一个技能伤害结果 ，可能包含多次伤害 
	 * @author NEIL
	 * 
	 */	
	public class FightHurtResult
	{
		/**
		 * 是否击飞位移 
		 */		
		public var hasPositionFly:Boolean = false;
		/** 否造成位移。 **/
		public var hasPositionChange : Boolean = false;
		/** 输出结果正数为伤害，负数为加血... **/
		public var curLife : Number = 0;
		/** 本次技能之后, 还剩多少法术。。 **/
		public var curMana : Number = 0;
		/** 如果有造成位移，对象新的坐标。hasPositionChange为 true 时有效。 **/
		public var newPosition : Point = new Point();
		
		private var _hurts : Vector.<FightSingleHurt> = new Vector.<FightSingleHurt>();
		private var _hurtCounts : int = 0;
		/** 本次技能对此目标单位共造成伤害 **/
		private var _hurtAmount : int;
		/**
		 *跟击飞有关系 (腾空时间)
		*/
		public var stiffTime : Number = 0;
		
		private var _spellData:Q_skill_model;
		private var _spellEffectID : int = 0; //技能表现形式ID
		private var _spellEffectData : Q_SpellEffect;
		
		private var _atkorID : Number = 0;
		private var _atkor : BaseRole = null;
		private var _atkorPos : Point;
		private var _targetID : Number = 0;
		private var _targetRole : BaseRole;
		private var _targetPos : Point;
		
		//-----------------击退，击飞相关表信息
		private var _deadLaunchHeight : int;
		private var _deadLaunchDistance : int;
		private var _deadLaunchSpeed : int;
		private var _deadBeatDistance : int;
		private var _deadBeatSpeed : int;
		private var _deadBeatProbability : int;
		private var _deadLaunchProbability : int;
		
		private var _beatBackSpeed : int = 0;
		
		private var _hurtTimes : int = 1;
		private var _hurtSpacing : Number = 0;
		
		private var _hurtAnimation : Q_SpellAnimation; //被击动画
		private var _sputteringHurtAnimation : Q_SpellAnimation; //溅射被击动画
		
		/**
		 * 伤害延迟
		 */
		private var _hurtDelay : int = 0;
		
		public function FightHurtResult()
		{
		}
		
		/**
		 * 本次技能对此目标单位共造成伤害 Vector
		 * @return
		 *
		 */
		public function get hurtList() : Vector.<FightSingleHurt>
		{
			return _hurts;
		}
		
		public function clearHurtList() : void
		{
			_hurts.length = 0;
		}
		
		public function get remainHurtAmount() : int
		{
			var cnt : int = 0;
			for each (var sVo : FightSingleHurt in _hurts)
			{
				if (sVo.hurtType != EnumHurtType.SPELL_HURT_TYPE_ABSORB)
				{
					cnt += sVo.hurtAmount;
				}
			}
			return cnt;
		}
		
		public function getHurtCounts() : int
		{
			return this._hurtCounts;
		}
		
		public function getHurt(i : int) : FightSingleHurt
		{
			if (i > this._hurtCounts - 1)
			{
				return null;
			}
			return this._hurts[i];
		}
		
		public function addHurt(hurt : FightSingleHurt) : void
		{
			this._hurts.push(hurt);
			this._hurtAmount += hurt.hurtAmount;
			this._hurtCounts++;
		}
		
		/**
		 * 本次技能对此目标单位共造成伤害
		 * @return
		 *
		 */
		public function get hurtAmount() : int
		{
			return _hurtAmount;
		}
		
		public function readSpellEffectData(spellID:int):void
		{
			_spellData = SpellDataManager.getSpellDataWithID(spellID);
			if (!_spellData) 
			{
				return;
				GameLog.addError("客户端战斗结果技能为空,服务器发送id:"+spellID);
				AlertPanel.showMsg( "客户端战斗结果技能为空,服务器发送id:"+spellID, null );
			}
			_spellEffectID = _spellData.q_spell_effect;
			_spellEffectData = SpellEffectDataManager.getData(_spellEffectID);
			if (_spellEffectData)
			{
				_hurtAnimation = AnimationDataManager.getData(_spellEffectData.hurt_animation);
				_sputteringHurtAnimation = AnimationDataManager.getData(_spellEffectData.sputtering_hurt_animation);
				
				_hurtDelay = _spellEffectData.hurt_delay;//伤害飘字的时间
				
				_beatBackSpeed = _spellData.q_beat_back_speed;
				
				//击退，击飞相关表字段信息
				_deadLaunchHeight = _spellData.q_dead_launch_height;
				_deadLaunchDistance = _spellData.q_dead_launch_distance;
				_deadLaunchSpeed = _spellData.q_dead_launch_speed;
				_deadBeatDistance = _spellData.q_dead_beat_distance;
				_deadBeatSpeed = _spellData.q_dead_beat_speed;
				_deadBeatProbability = _spellData.q_dead_beat_probability;
				_deadLaunchProbability = _spellData.q_dead_launch_probability;
				
				_hurtTimes = _spellData.q_split_count > 0 ? _spellData.q_split_count : 1;
				_hurtSpacing = _spellData.q_split_spacing;
			}
		}
		
		public function get targetIsSelf() : Boolean
		{
			return _targetID == _atkorID;
		}
		
		public function get deadLaunchProbability() : int
		{
			//return _deadLaunchProbability > 0 ? _deadLaunchProbability : 100;
			return _deadLaunchProbability;
		}
		
		public function get deadBeatProbability() : int
		{
			//return _deadBeatProbability > 0 ? _deadBeatProbability : 100;
			return _deadBeatProbability;
		}
		
		public function get deadBeatSpeed() : int
		{
			return _deadBeatSpeed;
		}
		
		public function get deadBeatDistance() : int
		{
			return _deadBeatDistance;
		}
		
		public function get deadLaunchHeight() : int
		{
			return _deadLaunchHeight;
		}
		
		public function get deadLaunchSpeed() : int
		{
			return _deadLaunchSpeed;
		}
		
		public function get deadLaunchDistance() : int
		{
			return _deadLaunchDistance;
		}
		
		/**
		 * 被击动画 
		 * @return 
		 * 
		 */		
		public function get hurtAnimation() : Q_SpellAnimation
		{
			return _hurtAnimation;
		}
		
		/**
		 * 溅射被击动画 
		 * @return 
		 * 
		 */		
		public function get sputteringHurtAnimation() : Q_SpellAnimation
		{
			return _sputteringHurtAnimation;
		}
		
		public function get beatBackSpeed() : int
		{
			return _beatBackSpeed;
		}
		public function get spellData():Q_skill_model
		{
			return _spellData;
		}
		
		public function set spellData(value:Q_skill_model):void
		{
			_spellData = value;
		}
		
		public function get hurtDelay() : int
		{
			return _hurtDelay;
		}

		public function get spellEffectID():int
		{
			return _spellEffectID;
		}

		public function set targetPos(value:Point):void
		{
			_targetPos = value;
		}

		public function get targetPos() : Point
		{
			return _targetPos;
		}
		
		public function set atkorPos(value:Point):void
		{
			_atkorPos = value;
		}
		public function get atkorPos() : Point
		{
			return _atkorPos;
		}
		
		public function set atkor(value:BaseRole):void
		{
			_atkor = value;
		}
		
		public function get atkor() : BaseRole
		{
			return _atkor;
		}
		
		public function set targetRole(value:BaseRole):void
		{
			_targetRole = value;
		}
		
		public function get targetRole() : BaseRole
		{
			return _targetRole;
		}
		public function set atkorID(value:Number):void
		{
			_atkorID = value;
		}
		
		public function get atkorID() : Number
		{
			return _atkorID;
		}
		
		public function get targetID() : Number
		{
			return _targetID;
		}
		
		public function set targetID(value:Number):void
		{
			_targetID = value;
		}

		public function get hurtTimes():int
		{
			return _hurtTimes;
		}

		public function set hurtTimes(value:int):void
		{
			_hurtTimes = value;
		}

		public function get hurtSpacing():Number
		{
			return _hurtSpacing;
		}

		public function set hurtSpacing(value:Number):void
		{
			_hurtSpacing = value;
		}


	}
}
