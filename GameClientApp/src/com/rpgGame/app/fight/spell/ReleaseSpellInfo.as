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
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.info.buff.BuffInfo;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.info.fight.FightSingleHurt;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.fight.bean.AttackResultInfo;
	import com.rpgGame.netData.fight.message.ResAttackResultMessage;
	import com.rpgGame.netData.fight.message.ResAttackVentToClientMessage;
	import com.rpgGame.netData.fight.message.ResFightBroadcastMessage;
	import com.rpgGame.netData.fight.message.SCAttackerResultMessage;
	
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
			if(msg is ResFightBroadcastMessage || msg is ResAttackVentToClientMessage)
			{
				info.readFrom(flySceneObjID, msg);
			}
			else if(msg is SCAttackerResultMessage)
			{
				createResults(info, msg as SCAttackerResultMessage);
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

		/**
		 * 1.如果是新的技能产生的伤害结果（缓存为null），
		 * 2.旧的技能产生的伤害结果，且动作已经播放完，则返回 false 
		 * 
		 * @param flySceneObjID
		 * @return 
		 * 
		 */		
		public static function isCurrReleaseInfo(flySceneObjID : int) : Boolean
		{
			var info : ReleaseSpellInfo = _releaseInfoById[flySceneObjID];
			return info && !info.motionFinish;
		}

		private var _spellData:Q_skill_model;
		
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
		public function readFrom(flySceneObjID : int, msg : Message) : void
		{
			_flySceneObjID = flySceneObjID;//
			
			if(msg is ResFightBroadcastMessage)
			{
				var fightTargetMsg:ResFightBroadcastMessage = msg as ResFightBroadcastMessage;
				_spellData = SpellDataManager.getSpellData(fightTargetMsg.skillModelId);
				
				_releaseAngle = fightTargetMsg.fightDirection;
				_releaseAngle = (_releaseAngle + 270) % 360;
				
				_atkorID = fightTargetMsg.personId.ToGID();
				if (_atkorID > 0)
				{
					_atkor = SceneManager.getSceneObjByID(_atkorID) as SceneRole;
					if (_atkor && !_atkor.usable)
						_atkor = null;
				}
				
				_targetID = fightTargetMsg.fightTarget.ToGID();
				if (_targetID > 0)
				{
					_targetRole = SceneManager.getSceneObjByID(_targetID) as SceneRole;
					if (_targetRole && !_targetRole.usable)
						_targetRole = null;
				}
				
				_atkorPos = new Point(_atkor.x, _atkor.y);
				_targetPos = new Point(_targetRole.x, _targetRole.y);
			}
			else if(msg is ResAttackVentToClientMessage)
			{
				var fightPosMsg:ResAttackVentToClientMessage = msg as ResAttackVentToClientMessage;
				_spellData = SpellDataManager.getSpellData(fightPosMsg.fightType);
				
				_releaseAngle = fightPosMsg.fightDirection;
				_releaseAngle = (_releaseAngle + 270) % 360;
				
				_atkorID = fightPosMsg.playerid.ToGID();
				if (_atkorID > 0)
				{
					_atkor = SceneManager.getSceneObjByID(_atkorID) as SceneRole;
					if (_atkor && !_atkor.usable)
						_atkor = null;
				}
				
				_atkorPos = new Point(_atkor.x, _atkor.y);
				_targetPos = new Point(fightPosMsg.pos.x, fightPosMsg.pos.y);
			}
			
			readSpellEffectData(_spellData.q_spell_effect);
		}
		
		private function readSpellEffectData(spellEffectID:int):void
		{
			_spellEffectID = spellEffectID;
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
				
				_caromStartFrameTime = _spellEffectData.carom_start_frame_time;//暂时没有用
				_breakFrameTime = _spellEffectData.break_frame_time;//暂时没有用
				_hitFrameTime = _spellEffectData.hit_frame_time;//到这个时间上，会在地面上有特效,也会有伤害飘字，如果设置了hurtdelay的话，会以这个时间为主
				_delayTime = _spellEffectData.delay_time;//跟弹道有关系
				_hurtDelay = _spellEffectData.hurt_delay;//伤害飘字的时间
				_soarFrameTime = _spellEffectData.soar_frame_time;//
				_throwDelayTime = _spellEffectData.throw_delay_time;//
				
				_castTime = _spellEffectData.cast_time;//当释放技能的时候，会锁定角色的时间
				
				_blinkType = _spellData.q_blink_type;
				_blinkSpeed = _spellData.q_blink_speed;
				_blinkHeight = _spellData.q_blink_height;
				
				_beatBackSpeed = _spellData.q_beat_back_speed;
				
				_ghostEffect = _spellEffectData.ghost_effect;
				_matchTerrain = false;
				_canWalkRelease = _spellData.q_can_walk_release;
				
				_deadLaunchHeight = _spellData.q_dead_launch_height;
				_deadLaunchDistance = _spellData.q_dead_launch_distance;
				_deadLaunchSpeed = _spellData.q_dead_launch_speed;
				_deadBeatDistance = _spellData.q_dead_beat_distance;
				_deadBeatSpeed = _spellData.q_dead_beat_speed;
				_deadBeatProbability = _spellData.q_dead_beat_probability;
				_deadLaunchProbability = _spellData.q_dead_launch_probability;
				
				_isTrackTarget = _spellEffectData.is_track_target;
				_isTrapSpell = _spellData.q_skill_type == 1;//暂时这么写，因为目前是把地面特效暂时当成陷阱技能
				_repeatTimes = _spellData.q_skill_time;
				_repeatInterval = _spellData.q_skill_ground_period;
				_maxHurtTimes = _spellData.q_skill_act_num;
				_throwHeight = _spellEffectData.throw_height;
				_throwWeightRatio = _spellEffectData.throw_weight_ratio;
			}
		}

		/**
		 * 技能造成的伤害和buff列表处理（通用）
		 * @param info
		 * @param buffer
		 *
		 */
		private static function createResults(info : ReleaseSpellInfo, msg : SCAttackerResultMessage) : void
		{
			//类型和血量
			var stateList : Vector.<BuffInfo> = new Vector.<BuffInfo>;
			var hurtList : Vector.<FightHurtResult> = new Vector.<FightHurtResult>;
			var hurtCharList : Vector.<SceneRole> = new Vector.<SceneRole>;
			var isHited : Boolean = false;
			var roleID : Number = 0;
			var resultInfo:AttackResultInfo;
			var isState : Boolean = false;//现在还没有技能触发buff的功能，暂时不走这里面的逻辑
			
			for(var i:uint = 0;i<msg.infos.length;i++)
			{
				resultInfo = msg.infos[i];
				roleID = resultInfo.targetId.ToGID();
				if (isState) //是否状态效果（buff/debuff）
				{
//					var buffInfo : BuffInfo = new BuffInfo(roleID);
//					buffInfo.cfgId = buffer.readVarint32();
//					buffInfo.curtStackCount = buffer.readVarint32();
//					buffInfo.disappearTime = buffer.readVarint64();
//					stateList.push(buffInfo);
				}
				else
				{
					var hurtResultVO : FightHurtResult = new FightHurtResult(roleID);
					hurtResultVO.curLife = resultInfo.damage;
					
					var hasPositionChange:Boolean = (resultInfo.newPos.x != 0 || resultInfo.newPos.y != 0);
					
					hurtResultVO.hasPositionChange = hasPositionChange;
					if (hurtResultVO.hasPositionChange)
					{
						hurtResultVO.newPosition = new Point(resultInfo.newPos.x, resultInfo.newPos.y);
					}
					
					
					hurtResultVO.attackerId = resultInfo.attackerId.ToGID();
					
					var hasStiffTime : Boolean = false;//击飞时间，暂时没有，所以先为false
					if (hasStiffTime)
					{
						hurtResultVO.stiffTime = 0;
					}
					
					var hurtTimes : int = 1; //伤害次数
					for (var hurtTimeI : int = 0; hurtTimeI < hurtTimes; hurtTimeI++) //hp - 3*50 = curLife
					{
						var hurtTypeAmount : int = resultInfo.damage;
						var hurtType : int = resultInfo.fightResult
						var hurtAmount : int = resultInfo.damage; //本次
						var sVo : FightSingleHurt = new FightSingleHurt(hurtType, hurtAmount, roleID);
						hurtResultVO.addHurt(sVo);
					}
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
			if (_spellData)
				return _spellData.q_is_fly_cross;
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
			if (_spellData)
				return _spellData.q_fly_time;
			return 0;
		}

		/**
		 * 沿直线飞行的技能速度
		 * @return
		 *
		 */
		public function get flySpeed() : int
		{
			if (_spellData)
				return _spellData.q_fly_speed;
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
			return _blinkType;
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

		/**
		 * 自身动画 
		 * @return 
		 * 
		 */		
		public function get selfAni() : Q_SpellAnimation
		{
			return _selfAni;
		}

		/**
		 * 施法动画 
		 * @return 
		 * 
		 */		
		public function get fromAni() : Q_SpellAnimation
		{
			return _fromSingleAni;
		}

		/**
		 * 弹道动画 
		 * @return 
		 * 
		 */		
		public function get passAni() : Q_SpellAnimation
		{
			return _passSingleAni;
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

		/**
		 * 对地动画 
		 * @return 
		 * 
		 */		
		public function get posAni() : Q_SpellAnimation
		{
			return _posSingleAni;
		}

		/**
		 * 是否开启幻影 
		 * @return 
		 * 
		 */		
		public function get ghostEffect() : Boolean
		{
			return _ghostEffect;
		}

		/**
		 * 是否适配地形 
		 * @return 
		 * 
		 */		
		public function get matchTerrain() : Boolean
		{
			return _matchTerrain;
		}

		/**
		 * 是否可以边走边放技能 
		 * @return 
		 * 
		 */		
		public function get canWalkRelease() : Boolean
		{
			return _canWalkRelease;
		}

		/**
		 * 攻击速度 
		 * @return 
		 * 
		 */		
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
//			return false;
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
