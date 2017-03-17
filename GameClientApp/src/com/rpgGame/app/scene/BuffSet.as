package com.rpgGame.app.scene
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.state.role.control.BingDongStateReference;
	import com.rpgGame.app.state.role.control.BuffStateReference;
	import com.rpgGame.app.state.role.control.FlyUpStateReference;
	import com.rpgGame.app.state.role.control.HiddingStateReference;
	import com.rpgGame.app.state.role.control.HunLuanStateReference;
	import com.rpgGame.app.state.role.control.HushStateReference;
	import com.rpgGame.app.state.role.control.ShapeshiftingStateReference;
	import com.rpgGame.app.state.role.control.StiffStateReference;
	import com.rpgGame.app.state.role.control.StunStateReference;
	import com.rpgGame.app.state.role.control.SyncSpellActionStateReference;
	import com.rpgGame.app.state.role.control.UseSpellStateReference;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *
	 * buff状态集
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-5 下午2:05:15
	 *
	 */
	public class BuffSet implements IInstancePoolClass
	{
		private static var buffSetPool : InstancePool = new InstancePool("BuffSet", 300);
		
		/**
		 * 生成一个BuffSet
		 */
		public static function create(role : SceneRole) : BuffSet
		{
			//利用池生成BuffSet
			return buffSetPool.createObj(BuffSet, role) as BuffSet;
		}
		
		public function instanceDestroy():void
		{
			dispose();
		}
		
		public function instanceDispose():void
		{
//			dispose();
		}
		
		
		/**
		 * @private
		 * 回收一个BuffSet
		 * @param buffSet
		 */
		public static function recycle(buffSet : BuffSet) : void
		{
			//利用池回收BuffSet
			buffSetPool.disposeObj(buffSet);
		}
		
		private var _role : SceneRole;
		/**
		 * 缓存角色身上的每个buff计时器 
		 */		
		private var _buffEffectTweenMap : HashMap;
		
		/**
		 * 为角色身上添加buff效果及buff的计时器 
		 * @param buffData
		 * 
		 */		
		private function addBuffEffect(buffData : BuffData) : void
		{
			if (!_role)
				return;
			removeBuffEffect(buffData.cfgId);
			var data : Q_buff = buffData.buffData;
			
			var animations:Array = data.q_animation.split(";");
			if (data && animations)
			{
				var len : int = animations.length;
				for (var i : int = 0; i < len; i++)
				{
					var animation : int = animations[i];
					var animatData : Q_SpellAnimation = animation > 0 ? AnimationDataManager.getData(animation) : null;
					if (animatData)
					{
						SpellAnimationHelper.addBuffEffect(_role, i, RenderUnitType.BUFF + buffData.cfgId, animatData.role_res, animatData.bind_bone, 0);
					}
				}
			}
			_buffEffectTweenMap.add(buffData.cfgId,buffData.cfgId);
		}
		
		/**
		 * 更新角色身上的所有buff效果
		 * 
		 */		
		public function updateBuffEffects() : void
		{
			if (!_role)
				return;
			clear();
			var buffList : Vector.<BuffData> = (_role.data as RoleData).buffList;
			if (!buffList)
				return;
			for each (var buffData : BuffData in buffList)
			{
				addBuffEffect(buffData);
			}
		}
		
		
		/**
		 * 在角色的buff数据里再添加一条数据 
		 * @param buffData
		 * 
		 */		
		public function addBuff(buffData : BuffData) : void
		{
			var buffList : Vector.<BuffData> = (_role.data as RoleData).buffList;
			if (!buffList)
				return;
			var buffExist : Boolean = false;
			for each (var currData : BuffData in buffList)
			{
				if (currData.cfgId == buffData.cfgId)
				{
					buffExist = true;
					break;
				}
			}
			if (!buffExist)
			{
				buffList.push(buffData);
			}
            handlerRoleState(buffData);
			addBuffEffect(buffData);
			EventManager.dispatchEvent(BuffEvent.ADD_BUFF, buffData);
		}
		
		/**
		 * 根据后台的buffID删除buff 
		 * @param buffID
		 * 
		 */		
		public function removeBuffByBuffID(buffID:Number):void
		{
			if (!_role)
				return;
			var buffList : Vector.<BuffData> = (_role.data as RoleData).buffList;
			if (!buffList || buffList.length == 0)
				return;
			var len : int = buffList.length;
			for (var i : int = 0; i < len; i++)
			{
				var currData : BuffData = buffList[i];
				if (currData.buffId == buffID)
				{
					buffList.splice(i, 1);
					removeRoleState(currData);
					removeBuffEffect(currData.cfgId);
					break;
				}
			}
			
			EventManager.dispatchEvent(BuffEvent.REMOVE_BUFF, _role.id, currData.cfgId);
		}	
		
		/**
		 * 删掉角色身上的buff效果及计时器 
		 * @param stateId
		 * 
		 */		
		private function removeBuffEffect(stateId : int) : void
		{
			if (_role)
			{
				_role.avatar.removeRenderUnitsByType(RenderUnitType.BUFF + stateId);
			}
			_buffEffectTweenMap.remove(stateId);
		}
		
		public function BuffSet(role : SceneRole)
		{
			_buffEffectTweenMap = new HashMap();
			reSet([role]);
		}
		
		public function reSet($parameters : Array) : void
		{
			_role = $parameters[0];
		}
		
		private function clear() : void
		{
			var keys : Array = _buffEffectTweenMap.keys();
			for each (var stateId : * in keys)
			{
				if (_role)
				{
					_role.avatar.removeRenderUnitsByType(RenderUnitType.BUFF + stateId);
				}
			}
			_buffEffectTweenMap.clear();
		}
		
		private function removeRoleState(buffData : BuffData):void
		{
			var buffStatesStr:String = buffData.buffStates;
			var stateTypes:Array = buffStatesStr.split(",");
			for(var i:uint=0;i<stateTypes.length;i++)
			{
				removeRoleBuffState(int(stateTypes[i]));
			}
		}
		
		private function removeRoleBuffState(stateType:int):void
		{
			if (_role)
			{
				switch(stateType)
				{
					case 1://眩晕状态
						_role.stateMachine.removeState(RoleStateType.CONTROL_STUN);
						break;
					case 2://定身状态
						_role.stateMachine.removeState(RoleStateType.CONTROL_STIFF);
						break;
					case 3://沉默状态
						_role.stateMachine.removeState(RoleStateType.CONTROL_HUSH);
						break;
					case 4://混乱状态
						_role.stateMachine.removeState(RoleStateType.CONTROL_HUN_LUAN);
						break;
					case 5://隐身buff
						_role.stateMachine.removeState(RoleStateType.CONTROL_HIDDING);
						break;
					case 25:
						_role.stateMachine.removeState(RoleStateType.CONTROL_USE_SPELL);
						break;
					case 26://浮空上升buff
						_role.stateMachine.removeState(RoleStateType.CONTROL_FLY_UP);
						break;
					case 27://技能同步buff
						_role.stateMachine.removeState(RoleStateType.CONTROL_SYNC_SPELLACTION); //切换到“技能动作同步状态”
						break;
					case 199://冰冻
						_role.stateMachine.removeState(RoleStateType.CONTROL_BING_DONG);
						break;
					default:
						/*buffRef = _role.stateMachine.getReference(UnmovableStateReference) as UnmovableStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_UNMOVABLE, buffRef);*/
						break;
				}
			}
		}
		
		/**
		 * 处理角色的buff状态 
		 * @param buffData
		 * 
		 */		
		private function handlerRoleState(buffData : BuffData):void
		{
			var buffStatesStr:String = buffData.buffStates;
			var stateTypes:Array = buffStatesStr.split(",");
			for(var i:uint=0;i<stateTypes.length;i++)
			{
				everyRoleBuffState(int(stateTypes[i]),buffData);
			}
		}
		
		/**
		 * 效果类型	          适用技能	       效果详解
				1		晕眩----不能移动、跳跃、攻击
				2		定身----不能移动、跳跃
				3		沉默----不能释放基础能量获取技能之外的技能
				4		混乱
				5		隐身
				6		嘲讽----强制攻击施放嘲讽的目标
				7		减少技能CD
				8		死亡后对半径1码圆形范围内敌人造成50%秒伤伤害
				9		护盾----吸收伤害
				10		净化----清除所有负面buff
				11		驱散----移除目标身上所有有利的增益
				12		血量最多扣到1点
				13		无敌
				14		反伤（全局变量控制比例）（不反死）（配置万分比分子）
				15		牺牲（生命值每降低A%，伤害额外增加B%,A B 可配置）
				16		在一段时间内享受禁止被PK的保护，持续一段时间后或当玩家主动PK其他玩家时消失
				17		每隔一段时间加满人物的生命，直至剩余容量用完
				18		打怪获得多倍经验，持续一段时间后消失
				19		打怪获得多倍真气，持续一段时间后消失
				20		打怪获得多倍金钱，持续一段时间后消失
				21		无法跳跃（翻滚）
				22		每击中1个敌人可获得自身X%最大生命上限的血量
				23		必定触发状态BUFF
				24		消失BUFF（移除场景外）
				25		使用技能
				26		浮空BUFF
				27		动作BUFF
				28		不死，血量保持在指定值
				29		不可击退
				30		不受指定技能伤害
                34      变身
				100		增加或减少能量消耗总量
				101		增加或减少气血
				102		增加或减少能量
				103		增加或减少最大气血
				104		增加或减少最大能量
				105		增加或减少外功
				106		增加或减少内功
				107		增加或减少防御百分比
				108		增加或减少暴击率
				109		增加或减少暴击伤害
				110		增加或减少暴击抗性
				111		增加或减少生命回复
				112		增加或减少能量回复
				113		增加或减少命中率
				114		增加或减少闪避率
				115		增加或减少移动速度
				116		增加或减少攻击速度
				117		伤害加深
				118		伤害减免
				119		击中敌人获得自身X%秒伤的血量
 
		 * @param buffStateType
		 * @param buffData
		 * 
		 */		
		private function everyRoleBuffState(buffStateType:int,buffData:BuffData):void
		{
			if (_role)
			{
				var buffRef : BuffStateReference;
				switch(buffStateType)
				{
					case 1://眩晕状态
						buffRef = _role.stateMachine.getReference(StunStateReference) as StunStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_STUN, buffRef);
						break;
					case 2://定身状态
						buffRef = _role.stateMachine.getReference(StiffStateReference) as StiffStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_STIFF, buffRef);
						break;
					case 3://沉默状态
						buffRef = _role.stateMachine.getReference(HushStateReference) as HushStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_HUSH, buffRef);
						break;
					case 4://混乱状态
						buffRef = _role.stateMachine.getReference(HunLuanStateReference) as HunLuanStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_HUN_LUAN, buffRef);
						break;
					case 5://隐身buff
						buffRef = _role.stateMachine.getReference(HiddingStateReference) as HiddingStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_HIDDING, buffRef);
						break;
					case 25:
						buffRef = _role.stateMachine.getReference(UseSpellStateReference) as UseSpellStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_USE_SPELL, buffRef);
						break;
					case 26://浮空上升buff
						buffRef = _role.stateMachine.getReference(FlyUpStateReference) as FlyUpStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_FLY_UP, buffRef);
						break;
					case 27://技能同步buff
						buffRef = _role.stateMachine.getReference(SyncSpellActionStateReference) as SyncSpellActionStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_SYNC_SPELLACTION, buffRef, true); //切换到“技能动作同步状态”
						break;
                    case 34:// 变身
                        buffRef = _role.stateMachine.getReference(ShapeshiftingStateReference) as ShapeshiftingStateReference;
                        buffRef.setParams(buffData);
                        _role.stateMachine.transition(RoleStateType.CONTROL_SHAPESHIFTING, buffRef);
                        break;
					case 199://冰冻
						buffRef = _role.stateMachine.getReference(BingDongStateReference) as BingDongStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_BING_DONG, buffRef);
						break;
					default:
						/*buffRef = _role.stateMachine.getReference(UnmovableStateReference) as UnmovableStateReference;
						buffRef.setParams(buffData);
						_role.stateMachine.transition(RoleStateType.CONTROL_UNMOVABLE, buffRef);*/
						break;
				}
			}
		}
		
		public function dispose() : void
		{
			clear();
			_role = null;
		}
	}
}