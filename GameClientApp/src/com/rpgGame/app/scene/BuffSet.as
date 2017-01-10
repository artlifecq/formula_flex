package com.rpgGame.app.scene
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.info.buff.BuffInfo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitType;
	
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
			var buffList : Vector.<BuffInfo> = (_role.data as RoleData).buffList;
			if (!buffList)
				return;
			for each (var buffInfo : BuffInfo in buffList)
			{
				addBuffEffect(buffInfo);
			}
		}

		public function addBuff(buffInfo : BuffInfo) : void
		{
			var buffList : Vector.<BuffInfo> = (_role.data as RoleData).buffList;
			if (!buffList)
				return;
			var buffExist : Boolean = false;
			for each (var currInfo : BuffInfo in buffList)
			{
				if (currInfo.cfgId == buffInfo.cfgId)
				{
					buffExist = true;
					break;
				}
			}
			if (!buffExist)
			{
				buffList.push(buffInfo);
			}
			addBuffEffect(buffInfo);
			EventManager.dispatchEvent(BuffEvent.ADD_BUFF, buffInfo);
		}

		public function addBuffEffect(buffInfo : BuffInfo) : void
		{
			if (!_role)
				return;
			removeBuffEffect(buffInfo.cfgId);
			var stateProto : Q_buff = buffInfo.stateProto;
			if (stateProto && stateProto.animation)
			{
//				var len : int = stateProto.animation.length;
//				for (var i : int = 0; i < len; i++)
//				{
//					var animation : int = stateProto.animation[i];
//					var animatData : Q_SpellAnimation = animation > 0 ? AnimationDataManager.getData(animation) : null;
//					if (animatData)
//					{
//						SpellAnimationHelper.addBuffEffect(_role, i, RenderUnitType.BUFF + buffInfo.cfgId, animatData.role_res, animatData.bind_bone, 0);
//					}
//				}
			}
			var duration : Number = buffInfo.disappearTime - SystemTimeManager.curtTm;
			var tween : TweenLite = TweenLite.delayedCall(duration * 0.001, onRemoveBuff, [buffInfo.cfgId]);
			_buffEffectTweenMap.add(buffInfo.cfgId, tween);
		}

		private function onRemoveBuff(stateId : int) : void
		{
			removeBuff(stateId);
		}

		public function removeBuff(stateId : int) : void
		{
			if (!_role)
				return;
			var buffList : Vector.<BuffInfo> = (_role.data as RoleData).buffList;
			if (!buffList)
				return;
			var len : int = buffList.length;
			for (var i : int = 0; i < len; i++)
			{
				var currInfo : BuffInfo = buffList[i];
				if (currInfo.cfgId == stateId)
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

		public function dispose() : void
		{
			clear();
			_role = null;
		}
	}
}
