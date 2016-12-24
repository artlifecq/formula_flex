package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.SpellEffectDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.info.buff.BuffInfo;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.info.fight.FightSingleHurt;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.fight.bean.AttackResultInfo;
	import com.rpgGame.netData.fight.message.ResAttackResultMessage;
	import com.rpgGame.netData.fight.message.ResFightBroadcastMessage;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import org.game.netCore.net.Message;

	/**
	 *
	 * 释放技能信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *
	 */
	public class ReleaseSpellInfo
	{
		private static var _releaseInfoById : Dictionary = new Dictionary();

		/**
		 *  
		 * @param flySceneObjID 暂时把这个id，以技能的id来处理，后面看后端要不要有其他处理
		 * @param msg
		 * @param waitCache
		 * @return 
		 * 
		 */		
		public static function setReleaseInfo(flySceneObjID : int, msg : Message, waitCache : Boolean = false) : ReleaseSpellInfo
		{
			var info : ReleaseSpellInfo = _releaseInfoById[flySceneObjID];
			if (!info)
			{
				info = new ReleaseSpellInfo();
			}
			if(msg is ResFightBroadcastMessage)
			{
				info.readFrom(flySceneObjID, msg as ResFightBroadcastMessage);
			}
			else if(msg is ResAttackResultMessage)
			{
				createResults(info, msg as ResAttackResultMessage);
			}
			
			if (waitCache)
			{
				_releaseInfoById[flySceneObjID] = info;
			}
			return info;
		}

		public static function expendReleaseInfo(flySceneObjID : int) : Boolean
		{
			var info : ReleaseSpellInfo = _releaseInfoById[flySceneObjID];
			if (info)
			{
				var expended : Boolean = info.expendHurtTimes();
				if (expended)
				{
					_releaseInfoById[flySceneObjID] = null;
					delete _releaseInfoById[flySceneObjID];
					return true;
				}
			}
			return false;
		}

		public static function removeReleaseInfo(flySceneObjID : int) : void
		{
			var info : ReleaseSpellInfo = _releaseInfoById[flySceneObjID];
			if (info)
			{
				_releaseInfoById[flySceneObjID] = null;
				delete _releaseInfoById[flySceneObjID];
			}
		}

		public static function isCurrReleaseInfo(flySceneObjID : int) : Boolean
		{
			var info : ReleaseSpellInfo = _releaseInfoById[flySceneObjID];
			return info && !info.motionFinish;
		}

		private var _spellEffectID : int = 0; //技能表现形式ID
		private var _releaseAngle : int = 0;
		private var _attackSpeed : int = 0;
		private var _spellEffectData : Q_SpellEffect;
		private var _atkMotion : String; //对动作
		private var _fromSingleAni : Q_SpellAnimation; //施法动画
		private var _selfAni : Q_SpellAnimation; //自身动画
		private var _hurtAnimation : Q_SpellAnimation; //被击动画
		private var _sputteringHurtAnimation : Q_SpellAnimation; //溅射被击动画
		private var _posSingleAni : Q_SpellAnimation; //对地动画
		private var _passSingleAni : Q_SpellAnimation; //弹道动画

		/**
		 * 动作完成
		 */
		public var motionFinish : Boolean = false;
		private var _atkorID : Number = 0;
		private var _atkor : SceneRole = null;
		/**
		 * 连招起手帧时间
		 */
		private var _caromStartFrameTime : int = 0;
		/**
		 * 打断帧时间
		 */
		private var _breakFrameTime : int = 0;
		/**
		 * 判定帧时间
		 */
		private var _hitFrameTime : int = 0;
		/**
		 * 释放延迟
		 */
		private var _delayTime : int = 0;
		/**
		 * 伤害延迟
		 */
		private var _hurtDelay : int = 0;
		/**
		 * 投掷延迟时间
		 */
		private var _throwDelayTime : int = 0;
		/**
		 * 腾飞帧时间
		 */
		private var _soarFrameTime : int = 0;

		private var _castTime : int = 0;
		private var _blinkType : int = 0;
		private var _blinkSpeed : int = 0;
		private var _blinkHeight : int = 0;
		private var _beatBackSpeed : int = 0;

		private var _atkorPos : Point;
		private var _targetID : Number = 0; //施法目标对象id,客户端可能找不到目标对象
		private var _targetRole : SceneRole;
		private var _targetPos : Point;
		private var _flySceneObjID : Number = 0; //场景飞行特效唯一标识
//		//施法结果列表，结果的类型分两种：1、状态改变效果，2、伤害效果
		public var stateList : Vector.<BuffInfo>;
		public var hurtList : Vector.<FightHurtResult>;
		public var isMainCharHited : Boolean = false; //主角是否被打了
		private var _ghostEffect : Boolean;
		private var _matchTerrain : Boolean;
		private var _canWalkRelease : Boolean; //能够边走边放
		private var _deadLaunchHeight : int;
		private var _deadLaunchDistance : int;
		private var _deadLaunchSpeed : int;
		private var _deadBeatDistance : int;
		private var _deadBeatSpeed : int;
		private var _deadBeatProbability : int;
		private var _deadLaunchProbability : int;
		private var _isTrackTarget : Boolean;
		private var _isTrapSpell : Boolean;
		private var _repeatTimes : int = 0;
		private var _repeatInterval : int = 0;
		/**
		 * 陷阱技能最大伤害波数
		 */
		private var _maxHurtTimes : int = 0;
		/**
		 * 投掷高度
		 */
		private var _throwHeight : int = 0;
		/**
		 * 投掷分量比
		 */
		private var _throwWeightRatio : int = 0;

		public function ReleaseSpellInfo() : void
		{
		}

		/**
		 * 初始化一些技能特效的信息 
		 * @param flySceneObjID
		 * @param msg
		 * 
		 */		
		public function readFrom(flySceneObjID : int, msg : ResFightBroadcastMessage) : void
		{
			_flySceneObjID = flySceneObjID;//
			
			_spellEffectID = SpellDataManager.getSpellEffectID(msg.skillModelId);
			_releaseAngle = msg.fightDirection;
			_releaseAngle = (_releaseAngle + 270) % 360;
			
			_atkorID = msg.personId.ToGID();
			if (_atkorID > 0)
			{
				_atkor = SceneManager.getSceneObjByID(_atkorID) as SceneRole;
				if (_atkor && !_atkor.usable)
					_atkor = null;
			}
			
			_targetID = msg.fightTarget.ToGID();
			if (_targetID > 0)
			{
				_targetRole = SceneManager.getSceneObjByID(_targetID) as SceneRole;
				if (_targetRole && !_targetRole.usable)
					_targetRole = null;
			}
			
			_atkorPos = new Point(_atkor.x, _atkor.y);
//			_targetPos = new Point(targetX, targetY); 不知道怎么定
			
//			_spellEffectID = buffer.readVarint32();
//			_releaseAngle = buffer.readVarint32();
//			_releaseAngle = (_releaseAngle + 270) % 360;
			//_attackSpeed = buffer.readVarint64();
//			_atkorID = buffer.readVarint64();
//			var atkorX : int = buffer.readVarint32();
//			var atkorY : int = buffer.readVarint32();
//			_targetID = buffer.readVarint64();
//			var targetX : int = buffer.readVarint32();
//			var targetY : int = buffer.readVarint32();
//			_atkorPos = new Point(atkorX, atkorY);
//			_targetPos = new Point(targetX, targetY);
			
//			if (_atkorID > 0)
//			{
//				_atkor = SceneManager.getSceneObjByID(_atkorID) as SceneRole;
//				if (_atkor && !_atkor.usable)
//					_atkor = null;
//			}
//			if (_targetID > 0)
//			{
//				_targetRole = SceneManager.getSceneObjByID(_targetID) as SceneRole;
//				if (_targetRole && !_targetRole.usable)
//					_targetRole = null;
//			}

			_spellEffectData = SpellEffectDataManager.getData(_spellEffectID);
			if (_spellEffectData)
			{
				//动作.
				_atkMotion = _spellEffectData.attack_motion;
				_fromSingleAni = AnimationDataManager.getData(_spellEffectData.cast_animation);
				_selfAni = AnimationDataManager.getData(_spellEffectData.self_dest_animation);
				_hurtAnimation = AnimationDataManager.getData(_spellEffectData.hurt_animation);
				_sputteringHurtAnimation = AnimationDataManager.getData(_spellEffectData.sputtering_hurt_animation);
				_posSingleAni = AnimationDataManager.getData(_spellEffectData.dest_animation);
				_passSingleAni = AnimationDataManager.getData(_spellEffectData.fly_animation);

				_caromStartFrameTime = _spellEffectData.carom_start_frame_time;
				_breakFrameTime = _spellEffectData.break_frame_time;
				_hitFrameTime = _spellEffectData.hit_frame_time;
				_delayTime = _spellEffectData.delay_time;
				_hurtDelay = _spellEffectData.hurt_delay;
				_soarFrameTime = _spellEffectData.soar_frame_time;
				_throwDelayTime = _spellEffectData.throw_delay_time;

				_castTime = _spellEffectData.cast_time;
				_blinkType = _spellEffectData.blink_type;
				_blinkSpeed = _spellEffectData.blink_speed;
				_blinkHeight = _spellEffectData.blink_height;
				_beatBackSpeed = _spellEffectData.beat_back_speed;
				_ghostEffect = _spellEffectData.ghost_effect;
				_matchTerrain = false;
				_canWalkRelease = _spellEffectData.can_walk_release;
				_deadLaunchHeight = _spellEffectData.dead_launch_height;
				_deadLaunchDistance = _spellEffectData.dead_launch_distance;
				_deadLaunchSpeed = _spellEffectData.dead_launch_speed;
				_deadBeatDistance = _spellEffectData.dead_beat_distance;
				_deadBeatSpeed = _spellEffectData.dead_beat_speed;
				_deadBeatProbability = _spellEffectData.dead_beat_probability;
				_deadLaunchProbability = _spellEffectData.dead_launch_probability;
				_isTrackTarget = _spellEffectData.is_track_target;
				_isTrapSpell = _spellEffectData.is_trap_spell;
				_repeatTimes = _spellEffectData.repeat_times;
				_repeatInterval = _spellEffectData.repeat_interval;
				_maxHurtTimes = _spellEffectData.max_hurt_times;
				_throwHeight = _spellEffectData.throw_height;
				_throwWeightRatio = _spellEffectData.throw_weight_ratio;
			}
		}

		private static const IS_STATE : int = 1 << 0;
		private static const HAS_POSITION_CHANGE : int = 1 << 1;
		private static const HAS_ATTACKER_ID : int = 1 << 2;
		private static const HAS_STIFFTIME : int = 1 << 3;

		/**
		 * 技能造成的伤害和buff列表处理（通用）
		 * @param info
		 * @param buffer
		 *
		 */
		private static function createResults(info : ReleaseSpellInfo, msg : ResAttackResultMessage) : void
		{
			//类型和血量
			var stateList : Vector.<BuffInfo> = new Vector.<BuffInfo>;
			var hurtList : Vector.<FightHurtResult> = new Vector.<FightHurtResult>;
			var hurtCharList : Vector.<SceneRole> = new Vector.<SceneRole>;
			var isHited : Boolean = false;
			var roleID : Number = 0;
			
			var state:AttackResultInfo = msg.state;
			
//			var type : int = buffer.readVarint32();
//			var isState : Boolean = Boolean(type & IS_STATE);
			var isState : Boolean = false;//现在还没有技能触发buff的功能，暂时不走这里面的逻辑
			if (isState) //是否状态效果（buff/debuff）
			{
//				roleID = buffer.readVarint64();
//				var buffInfo : BuffInfo = new BuffInfo(roleID);
//				buffInfo.cfgId = buffer.readVarint32();
//				buffInfo.curtStackCount = buffer.readVarint32();
//				buffInfo.disappearTime = buffer.readVarint64();
//				stateList.push(buffInfo);
			}
			else
			{
				roleID = state.targetId.ToGID();
				var hurtResultVO : FightHurtResult = new FightHurtResult(roleID);
				hurtResultVO.curLife = state.damage;
				
//				hurtResultVO.hasPositionChange = Boolean(type & HAS_POSITION_CHANGE);
//				if (hurtResultVO.hasPositionChange)
//				{
//					hurtResultVO.newPosition = new Point(buffer.readVarint32(), buffer.readVarint32());
//				}
				
//				var hasAttckerId : Boolean = Boolean(type & HAS_ATTACKER_ID);
//				if (hasAttckerId)
//				{
					hurtResultVO.attackerId = state.attackerId.ToGID();
//				}
//				var hasStiffTime : Boolean = Boolean(type & HAS_STIFFTIME);
//				if (hasStiffTime)
//				{
//					hurtResultVO.stiffTime = buffer.readVarint64();
//				}
				
//				var hurtTimes : int = type >>> 4; //伤害次数
//				for (var hurtTimeI : int = 0; hurtTimeI < hurtTimes; hurtTimeI++) //hp - 3*50 = curLife
//				{
//					var hurtTypeAmount : int = state.damage;
					var hurtType : int = state.fightResult
					var hurtAmount : int = state.damage; //本次
					var sVo : FightSingleHurt = new FightSingleHurt(hurtType, hurtAmount, roleID);
					hurtResultVO.addHurt(sVo);
//				}
				hurtList.push(hurtResultVO);
				//
				var role : SceneRole = SceneManager.getSceneObjByID(roleID) as SceneRole;
				if (role)
				{
					//role.isServerLiving = hurtResultVO.curLife > 0;
					hurtCharList.push(role);
				}
				//
				if (roleID == MainRoleManager.actorID) //判定主角是否被攻击
				{
					if (info.atkor && info.atkor.data is HeroData) //是玩家才自动反击
					{
						isHited = true;
					}
				}
			}
			
			info.hurtList = hurtList;
			info.stateList = stateList;
			info.isMainCharHited = isHited;
		}

		public function get flySceneObjID() : Number
		{
			return _flySceneObjID;
		}

		public function get isFlyCross() : Boolean
		{
			if (_spellEffectData)
				return _spellEffectData.is_fly_cross;
			return false;
		}

		public function get isAdaptiveTargetHeight() : Boolean
		{
			if (_spellEffectData)
				return _spellEffectData.is_adaptive_target_height;
			return false;
		}

		/**
		 * 沿直线飞行的时间
		 * @return
		 *
		 */
		public function get flyTm() : int
		{
			if (_spellEffectData)
				return _spellEffectData.fly_time;
			return 0;
		}

		/**
		 * 沿直线飞行的技能速度
		 * @return
		 *
		 */
		public function get flySpeed() : int
		{
			if (_spellEffectData)
				return _spellEffectData.fly_speed;
			return 0;
		}

//		
//		public function get showHurtCnt():uint
//		{
//			return _skillEffectData.specialHurtTimes || 1;
//		}
//
//		public function get durationTm():Number
//		{
//			return _specialEffectTime || 1000;
//		}
//
//		public function get specialSkillKey():uint
//		{
//			return _skillEffectData.specialType;
//		}
//		
//		/**
//		 * 是否可以移动施放
//		 * @return 
//		 * 
//		 */
//		public function get isReleaseMovable():Boolean
//		{
//			return _skillEffectData.isReleaseMovable;
//		}
//		

		public function get deadLaunchProbability() : int
		{
			return _deadLaunchProbability > 0 ? _deadLaunchProbability : 100;
		}

		public function get deadBeatProbability() : int
		{
			return _deadBeatProbability > 0 ? _deadBeatProbability : 100;
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

		public function get releaseAngle() : int
		{
			return _releaseAngle;
		}

		public function get castTime() : int
		{
			return _castTime;
		}

		public function get blinkHeight() : int
		{
			return _blinkHeight;
		}

		public function get blinkType() : int
		{
			return 2;//_blinkType;
		}

		public function get blinkSpeed() : int
		{
			return _blinkSpeed;
		}

		public function get hitFrameTime() : int
		{
			return _hitFrameTime;
		}

		public function get delayTime() : int
		{
			return _delayTime;
		}

		public function get hurtDelay() : int
		{
			return _hurtDelay;
		}

		public function get throwDelayTime() : int
		{
			return _throwDelayTime;
		}

		public function get soarFrameTime() : int
		{
			return _soarFrameTime;
		}

		public function get breakFrameTime() : int
		{
			return _breakFrameTime;
		}

		public function get caromStartFrameTime() : int
		{
			return _caromStartFrameTime;
		}

		public function get isTrackTarget() : Boolean
		{
			return _isTrackTarget;
		}

//		
//		/**
//		 * 每次生效，移动的像素
//		 * @return 
//		 * 
//		 */
//		public function get moveSpeed():int
//		{
//			return _skillEffectData.moveSpeed;
//		}
//		
//		/**
//		 * 移动生效的次数
//		 * @return 
//		 * 
//		 */
//		public function get moveTimes():int
//		{
//			return _skillEffectData.moveTimes;
//		}
//		
//		/**
//		 * 每次生效的间隔
//		 * @return 
//		 * 
//		 */
//		public function get moveInterval():int
//		{
//			return _skillEffectData.moveInterval;
//		}
//		
//		/**
//		 * 持续施法动作
//		 * @return 
//		 * 
//		 */
//		public function get castingStatus():int
//		{
//			return ATKID_TO_STATUS[_skillEffectData.castingMotion];
//		}
//		
//		/**
//		 * 飞向目标的速度
//		 * @return 
//		 * 
//		 */
//		public function get flyToTargetSpeed():int
//		{
//			return _skillEffectData.flyToTargetSpeed;
//		}
//		
//		/**
//		 * 飞向目标的特效
//		 * @return 
//		 * 
//		 */
//		public function get flyToTargetAnimation():int
//		{
//			return _skillEffectData.flyToTargetAnimation;
//		}
//		
		public function get targetRole() : SceneRole
		{
			return _targetRole;
		}

//
//
//		//技能动作的死亡延迟管理...
//		private var _statusTweenMap:HashMap;	
//		public function setStatusLivingTween(status:String,tween:TweenLite):void
//		{
//			if(!_statusTweenMap)
//			{
//				_statusTweenMap = new HashMap(true);
//			}
//			_statusTweenMap.add(status,tween);
//		}
//		
//		public function getStatusLivingTween(status:String):TweenLite
//		{
//			if(_statusTweenMap)
//			{
//				return _statusTweenMap.getValue(status);
//			}
//			return null;
//		}
//		
//		/**持续技能的定时器*/
//		public var durationTween:TweenLite;
//		
//		public function get skillDis():Number
//		{
//			var dis:Number=0;
//			if(_skillID)
//			{
////				dis = Math.max(_skillData.releaseRange,_skillData.hurtRange);
//				dis = Math.max(SkillDataManager.releaseRange(_skillID),SkillDataManager.hurtRange(_skillID));
//			}
//			return dis;
//		}
//		
//		public function get canUpdatePos():Boolean
//		{
//			return SkillDataManager.isCanUpdatePos(_skillID);
//		}
//		
//		private var _targetType:uint;
//		public function get targetType():uint
//		{
//			return _targetType;
//		}
//		
		public function get spellEffectID() : int
		{
			return _spellEffectID;
		}

		public function get atkorID() : Number
		{
			return _atkorID;
		}

		public function get targetID() : Number
		{
			return _targetID;
		}

		public function get targetIsSelf() : Boolean
		{
			return _targetID == _atkorID;
		}

		public function get targetPos() : Point
		{
			return _targetPos;
		}

		public function get atkorPos() : Point
		{
			return _atkorPos;
		}

		public function get atkor() : SceneRole
		{
			return _atkor;
		}

		public function get atkMotion() : String
		{
			return _atkMotion;
		}

		public function get selfAni() : Q_SpellAnimation
		{
			return _selfAni;
		}

		public function get fromAni() : Q_SpellAnimation
		{
			return _fromSingleAni;
		}

		public function get passAni() : Q_SpellAnimation
		{
			return _passSingleAni;
		}

		public function get hurtAnimation() : Q_SpellAnimation
		{
			return _hurtAnimation;
		}

		public function get sputteringHurtAnimation() : Q_SpellAnimation
		{
			return _sputteringHurtAnimation;
		}

		public function get beatBackSpeed() : int
		{
			return _beatBackSpeed;
		}

		public function get posAni() : Q_SpellAnimation
		{
			return _posSingleAni;
		}

		public function get ghostEffect() : Boolean
		{
			return _ghostEffect;
		}

		public function get matchTerrain() : Boolean
		{
			return _matchTerrain;
		}

		public function get canWalkRelease() : Boolean
		{
			return _canWalkRelease;
		}

		public function get attackSpeed() : int
		{
			return _attackSpeed;
		}

		public function get repeatInterval() : int
		{
			return _repeatInterval;
		}

		public function get repeatTimes() : int
		{
			return _repeatTimes;
		}

		public function expendHurtTimes() : Boolean
		{
			_maxHurtTimes--;
			if (_maxHurtTimes > 0)
				return false;
			return true;
		}

		/**
		 * 是否陷阱技能
		 * @return
		 *
		 */
		public function get isTrapSpell() : Boolean
		{
			return _isTrapSpell;
		}

		public function get throwHeight() : int
		{
			return _throwHeight;
		}

		public function get throwWeightRatio() : int
		{
			return _throwWeightRatio;
		}
	}
}
