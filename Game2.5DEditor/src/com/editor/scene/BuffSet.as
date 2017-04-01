package com.editor.scene
{
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.RenderUnitType;
	import com.editor.fight.spell.ReleaseSpellInfo;
	import com.editor.fight.spell.SpellAnimationHelper;
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;

	import flash.geom.Vector3D;

	import gs.TweenLite;

	import org.client.mainCore.ds.HashMap;

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

		public function addBuffEffect(info : ReleaseSpellInfo) : void
		{
			if (!_role)
				return;
			var stateId : int = 1000;
			removeBuffEffect(stateId);
			var roleReses : Array = TabelFieldHelper.getSpellStateRoleEffects(info.spellData, _role.stateMachine.isRiding);
			if (roleReses)
			{
				var mBindBones : Array = TabelFieldHelper.getSpellStateBindNodes(info.spellData, _role.stateMachine.isRiding);
				var mOffset : Array = TabelFieldHelper.getSpellStateEffectOffsets(info.spellData);
				var mScale : Array = TabelFieldHelper.getSpellStateEffectScales(info.spellData);
				var len : int = roleReses.length;
				for (var i : int = 0; i < len; i++)
				{
					var roleRes : String = roleReses[i];
					var bindBone : String = mBindBones ? mBindBones[i] : null;
					var offset : Vector3D = mOffset ? mOffset[i] : null;
					var scale : Vector3D = mScale ? mScale[i] : null;
					SpellAnimationHelper.addBuffEffect(_role, i, RenderUnitType.BUFF + stateId, roleRes, bindBone, false, 0, offset, scale);
				}
				var duration : Number = 5000; //暂时用5秒
				var tween : TweenLite = TweenLite.delayedCall(duration * 0.001, onRemoveBuffEffect, [stateId]);
				_buffEffectTweenMap.add(stateId, tween);
			}
		}

		public function removeBuffEffect(stateId : int) : void
		{
			if (_role)
				_role.avatar.removeRenderUnitsByType(RenderUnitType.BUFF + stateId);
			var tween : TweenLite = _buffEffectTweenMap.getValue(stateId) as TweenLite;
			if (tween)
			{
				tween.kill();
				_buffEffectTweenMap.remove(stateId);
			}
		}

		private function onRemoveBuffEffect(stateId : int) : void
		{
			removeBuffEffect(stateId);
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
				removeBuffEffect(stateId);
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
