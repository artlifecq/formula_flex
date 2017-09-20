package  com.rpgGame.app.fight.spell.ui
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.SpellEffectDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.netData.structs.Position;
	
	import flash.geom.Point;

	/**
	 *
	 * 释放技能信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *
	 */
	public class ReleaseSpellUIInfo 
	{
		/**
		 *  
		 * @param msg
		 * @param waitCache
		 * @return 
		 * 
		 */		
		public static function setReleaseInfo(skillId:int,role:SceneRole,damage:int=0,completeCall:Function=null,hitCall:Function=null) : ReleaseSpellUIInfo
		{
			var info : ReleaseSpellUIInfo = new ReleaseSpellUIInfo();
		
			info.readFrom(skillId,role,damage,completeCall,hitCall);

			return info;
		}
		private var _releaseCompleteCall:Function;
		private var _hitCallBack:Function;
		private var _spellData:Q_skill_model;
		
		private var _spellEffectID : int = 0; //技能表现形式ID
		private var _spellEffectData : Q_SpellEffect;
		
		private var _releaseAngle : int = 0;
		private var _attackSpeed : int = 0;
		
		private var _atkMotion : String; //对动作
		private var _fromSingleAni : Q_SpellAnimation; //施法动画
		private var _selfAni : Q_SpellAnimation; //自身动画
		
		private var _posSingleAni : Q_SpellAnimation; //对地动画
		private var _passSingleAni : Q_SpellAnimation; //弹道动画
		private var _ribbonImg:String;

		private var _damage:int;
		/**
		 * 动作完成
		 */
		public var motionFinish : Boolean = false;
		private var _atkorID : Number = 0;
		private var _atkor : SceneRole = null;
		/**
		 * 动作起手帧时间
		 */
		private var _caromStartFrameTime : int = 0;
		/**
		 * 抬手特效开始时间 
		 */		
		private var _startSelfFrameTime:int = 0;
		/**
		 * 打断帧时间
		 */
//		private var _breakFrameTime : int = 0;
		/**
		 * 判定帧时间
		 */
		private var _hitFrameTime : int = 0;
		/**
		 * 释放延迟
		 */
//		private var _delayTime : int = 0;
		
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
		
		private var _atkorPos : Point;
		private var _targetID : Number = 0; //施法目标对象id,客户端可能找不到目标对象
		private var _targetRole : SceneRole;
		private var _targetPos : Point;
		
		//弹道相关的后端信息
		private var _flyTargetPosList:Vector.<Position>;
		private var _flyTargets:Vector.<SceneRole>;
		
		private var _ghostEffect : Boolean;
		private var _matchTerrain : Boolean;
		/**
		 *  能够边走边放
		 */		
		private var _canWalkRelease : Boolean; //
		
		
		/**
		 * 是否是追踪弹道 
		 */		
		private var _isTrackTarget : Boolean;
		
		/**
		 * 是否是陷进技能 
		 */		
//		private var _isTrapSpell : Boolean;
		/**
		 * 在一次陷进技能中，要有几次计算伤害 
		 */		
//		private var _repeatTimes : int = 0;
		/**
		 * 每一次的计算伤害时间间隔 
		 */		
//		private var _repeatInterval : int = 0;
		/**
		 * 陷阱技能最大伤害波数
		 */
//		private var _maxHurtTimes : int = 0;
		/**
		 * 投掷高度
		 */
		private var _throwHeight : int = 0;
		/**
		 * 投掷分量比
		 */
		private var _throwWeightRatio : int = 0;
		
		//---弹道技能相关表信息
		
		private var _flyCount:int = 0;
		
		private var _flyInterval:int = 0;

		public function ReleaseSpellUIInfo() : void
		{
		}

		/**
		 * 初始化一些技能特效的信息 
		 * @param flySceneObjID
		 * @param msg
		 * 
		 */		
		public function readFrom(skillId:int,role:SceneRole,damage:int,completeCall:Function=null,hitCall:Function=null) : void
		{
		
			_atkor=role;	
			_releaseCompleteCall=completeCall;
			_hitCallBack=hitCall;
			this._damage=damage;
			if(_atkor == null)
			{
				GameLog.addShow("ui攻击者为空!攻击者服务器ID为：\t");
				return;
			}
			_spellData = SpellDataManager.getSpellData(skillId);
			_atkorPos = new Point(_atkor.x, _atkor.z);
			readSpellEffectData(_spellData.q_spell_effect);
		}
		
		public function readSpellEffectData(spellEffectID:int):void
		{
			_spellEffectID = spellEffectID;
			_spellEffectData = SpellEffectDataManager.getData(_spellEffectID);
			if (_spellEffectData)
			{
				//动作.
				_atkMotion = _spellEffectData.attack_motion;
				
				_fromSingleAni = AnimationDataManager.getData(_spellEffectData.cast_animation);
				_selfAni = AnimationDataManager.getData(_spellEffectData.self_dest_animation);
				_posSingleAni = AnimationDataManager.getData(_spellEffectData.dest_animation);
				_passSingleAni = AnimationDataManager.getData(_spellEffectData.fly_animation);
				_ribbonImg = _spellEffectData.ribbon_img;
				
				_startSelfFrameTime = _spellEffectData.start_frame_time;//抬手特效开始时间
				_caromStartFrameTime = _spellEffectData.carom_start_frame_time;//动作从那帧开始播放
//				_breakFrameTime = _spellEffectData.break_frame_time;//暂时没有用
				_hitFrameTime = _spellEffectData.hit_frame_time;//到这个时间上，会在地面上有特效,也会有伤害飘字，如果设置了hurtdelay的话，会以这个时间为主--弹道技能的话，是用来控制什么时候来播放弹道技能，内部循环
				
				_soarFrameTime = _spellEffectData.soar_frame_time;//
				_throwDelayTime = _spellEffectData.throw_delay_time;//
				
				_castTime = _spellEffectData.cast_time;//当释放技能的时候，会锁定角色的时间
				
				_blinkType = _spellData.q_blink_type;
				_blinkSpeed = _spellData.q_blink_speed;
				_blinkHeight = _spellData.q_blink_height;
	
				
				_ghostEffect = _spellEffectData.ghost_effect;
				_matchTerrain = false;
				_canWalkRelease = _spellData.q_can_walk_release;//是否边走边放
				
			
				
				//陷进相关表字段信息
//				_isTrapSpell = _spellData.q_skill_type == 1;
//				_repeatTimes = _spellData.q_skill_time;
//				_repeatInterval = _spellData.q_skill_ground_period;
//				_maxHurtTimes = _spellData.q_skill_act_num;
				
				//以下是弹道相关表信息
//				_delayTime = _spellEffectData.delay_time;//跟弹道有关系
				
				_throwHeight = _spellEffectData.throw_height;
				_throwWeightRatio = _spellEffectData.throw_weight_ratio;
				
				_isTrackTarget = _spellData.q_fly_follow;
				_flyCount = _spellData.q_fly_count;
				_flyInterval = _spellData.q_fly_spacing;
			}
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
		
		public function get startFrameTime():int
		{
			return _startSelfFrameTime;
		}

		public function get hitFrameTime() : int
		{
			return _hitFrameTime;
		}

//		public function get delayTime() : int
//		{
//			return _delayTime;
//		}

		public function get soarFrameTime() : int
		{
			return _soarFrameTime;
		}

//		public function get breakFrameTime() : int
//		{
//			return _breakFrameTime;
//		}

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
        
        public function set atkor(value : SceneRole) : void {
            this._atkor = value;
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
		
		public function get ribbonImg():String
		{
			return _ribbonImg;
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

		public function get throwHeight() : int
		{
			return _throwHeight;
		}

		public function get throwWeightRatio() : int
		{
			return _throwWeightRatio;
		}
		
		public function get flyCount():int
		{
			return _flyCount;
		}
		
		public function get flyInterval():int
		{
			return _flyInterval;
		}
		
		public function get throwDelayTime() : int
		{
			return _throwDelayTime;
		}

		public function get flyTargetPosList():Vector.<Position>
		{
			return _flyTargetPosList;
		}
        
        public function set flyTargetPosList(value : Vector.<Position>) : void {
            this._flyTargetPosList = value;
        }

		public function get flyTargets():Vector.<SceneRole>
		{
			return _flyTargets;
		}
        
        public function set flyTargets(value : Vector.<SceneRole>) : void {
            this._flyTargets = value;
        }

		public function get spellData():Q_skill_model
		{
			return _spellData;
		}

		public function set spellData(value:Q_skill_model):void
		{
			_spellData = value;
		}
		
		public function get isAttachUnit():Boolean
		{
			return _spellData.q_performType==1;
		}

		public function get releaseCompleteCall():Function
		{
			return _releaseCompleteCall;
		}

		public function get damage():int
		{
			return _damage;
		}

		public function get hitCallBack():Function
		{
			return _hitCallBack;
		}

		


	}
}
