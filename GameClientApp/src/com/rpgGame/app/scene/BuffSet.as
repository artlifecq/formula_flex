package com.rpgGame.app.scene
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.state.role.control.BuffStateReference;
	import com.rpgGame.app.state.role.control.HunLuanStateReference;
	import com.rpgGame.app.state.role.control.HushStateReference;
	import com.rpgGame.app.state.role.control.StiffStateReference;
	import com.rpgGame.app.state.role.control.StunStateReference;
	import com.rpgGame.app.state.role.control.UnmovableStateReference;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *
	 * buff状态集
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-5 下午2:05:15
	 *
	 */
	public class BuffSet implements IPoolClass
	{
		private static var buffSetPool : Pool = new Pool("BuffSet", 300);
		
		/**
		 * 生成一个BuffSet
		 */
		public static function create(role : SceneRole) : BuffSet
		{
			//利用池生成BuffSet
			return buffSetPool.createObj(BuffSet, role) as BuffSet;
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
		private var _buffEffectTweenMap : HashMap;
		
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
			addBuffEffect(buffData);
			EventManager.dispatchEvent(BuffEvent.ADD_BUFF, buffData);
		}
		
		private function addBuffEffect(buffData : BuffData) : void
		{
			if (!_role)
				return;
			handlerRoleState(buffData);
			
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
			var duration : Number = buffData.disappearTime - SystemTimeManager.curtTm;
			var tween : TweenLite = TweenLite.delayedCall(duration * 0.001, onRemoveBuff, [buffData.cfgId]);
			_buffEffectTweenMap.add(buffData.cfgId, tween);
		}
		
		private function onRemoveBuff(stateId : int) : void
		{
			removeBuff(stateId);
		}
		
		public function removeBuffByBuffID(buffID:Number):void
		{
			if (!_role)
				return;
			var buffList : Vector.<BuffData> = (_role.data as RoleData).buffList;
			if (!buffList)
				return;
			var len : int = buffList.length;
			for (var i : int = 0; i < len; i++)
			{
				var currData : BuffData = buffList[i];
				if (currData.buffId == buffID)
				{
					buffList.splice(i, 1);
					break;
				}
			}
			removeBuffEffect(currData.cfgId);
			EventManager.dispatchEvent(BuffEvent.REMOVE_BUFF, _role.id, currData.cfgId);
		}
		
		public function removeBuff(stateId : int) : void
		{
			if (!_role)
				return;
			var buffList : Vector.<BuffData> = (_role.data as RoleData).buffList;
			if (!buffList)
				return;
			var len : int = buffList.length;
			for (var i : int = 0; i < len; i++)
			{
				var currData : BuffData = buffList[i];
				if (currData.cfgId == stateId)
				{
					buffList.splice(i, 1);
					break;
				}
			}
			removeBuffEffect(stateId);
			EventManager.dispatchEvent(BuffEvent.REMOVE_BUFF, _role.id, stateId);
		}
		
		private function removeBuffEffect(stateId : int) : void
		{
			if (_role)
			{
				_role.avatar.removeRenderUnitsByType(RenderUnitType.BUFF + stateId);
			}
			var tween : TweenLite = _buffEffectTweenMap.getValue(stateId) as TweenLite;
			if (tween)
			{
				tween.kill();
				_buffEffectTweenMap.remove(stateId);
			}
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
				var tween : TweenLite = _buffEffectTweenMap.getValue(stateId) as TweenLite;
				if (tween)
				{
					tween.kill(); 
				}
			}
			_buffEffectTweenMap.clear();
		}
		
		private function handlerRoleState(buffData : BuffData):void
		{
			if (_role)
			{
				var buffRef : BuffStateReference;
				if (buffData.dizziness) //眩晕
				{
					buffRef = _role.stateMachine.getReference(StunStateReference) as StunStateReference;
					buffRef.setParams(buffData.disappearTime);
					_role.stateMachine.transition(RoleStateType.CONTROL_STUN, buffRef);
				}
				else if (buffData.freeze) //不能移动
				{
					buffRef = _role.stateMachine.getReference(UnmovableStateReference) as UnmovableStateReference;
					buffRef.setParams(buffData.disappearTime);
					_role.stateMachine.transition(RoleStateType.CONTROL_UNMOVABLE, buffRef);
				}
				else if (buffData.silence) //沉默
				{
					buffRef = _role.stateMachine.getReference(HushStateReference) as HushStateReference;
					buffRef.setParams(buffData.disappearTime);
					_role.stateMachine.transition(RoleStateType.CONTROL_HUSH, buffRef);
				}
				else if (buffData.chaos) //混乱
				{
					buffRef = _role.stateMachine.getReference(HunLuanStateReference) as HunLuanStateReference;
					buffRef.setParams(buffData.disappearTime);
					_role.stateMachine.transition(RoleStateType.CONTROL_HUN_LUAN, buffRef);
				}
				else if (false) //定身
				{
					buffRef = _role.stateMachine.getReference(StiffStateReference) as StiffStateReference;
					buffRef.setParams(buffData.disappearTime);
					_role.stateMachine.transition(RoleStateType.CONTROL_STIFF, buffRef);
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