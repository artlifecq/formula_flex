package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.utils.PathFinderUtil;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.action.RunStateReference;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Vector3D;
	import flash.utils.getQualifiedClassName;
	
	import away3d.pathFinding.DistrictWithPath;

	/**
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-8-30 下午7:34:06
	 */

	public class ScaredState extends BuffState
	{
		private const DISTANCE : int = 200;

		private var posAry : Vector.<Vector3D>;
		private var role : SceneRole;

		public function ScaredState()
		{
			super(RoleStateType.CONTROL_SCARED);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				if (_stateReference)
				{
					if (_stateReference is ScaredStateReference)
					{
						role = (_machine.owner as SceneRole);
						if (role)
						{
							posAry = new Vector.<Vector3D>();
							posAry.push(new Vector3D(role.x, role.y, role.z - DISTANCE));
							posAry.push(new Vector3D(role.x, role.y, role.z + DISTANCE));
							posAry.push(new Vector3D(role.x - DISTANCE, role.y, role.z));
							posAry.push(new Vector3D(role.x + DISTANCE, role.y, role.z));

							var districtWithPath : DistrictWithPath = SceneManager.getDistrict((_machine.owner as SceneRole).sceneName);
							var forwardPos : Vector3D = PathFinderUtil.getForwardPointInSide(districtWithPath, (_machine.owner as SceneRole).position, posAry[0]);

							var ref : ScaredMoveStateReference = role.stateMachine.getReference(ScaredMoveStateReference) as ScaredMoveStateReference;
							ref.dispose();
							ref.setParams(posAry, _stateReference.buffData.disappearTime, /*RacingCfgData.miscData.moveSpeed*/400);
							ref.onMove(onWalkMove);
							ref.onThrough(onWalkThrough);
							ref.onStop(onWalkStop);
							ref.onEnd(onWalkEnd);
							ref.onArrive(onArrive);
							role.stateMachine.transition(RoleStateType.CONTROL_SCARED_MOVE, ref);
						}
					}
					else
						throw new Error("场景角色受惊吓状态引用必须是ScaredStateReference类型！");
				}
			}
		}

		private function onWalkStop(ref : ScaredMoveStateReference) : void
		{
		}

		private function onWalkEnd(ref : ScaredMoveStateReference) : void
		{
		}

		private function onWalkMove(ref : ScaredMoveStateReference) : void
		{
			if (_machine && !_machine.isInPool)
			{
				var runRef : RunStateReference = (ref.owner as SceneRole).stateMachine.getReference(RunStateReference) as RunStateReference;
				runRef.setParams(0, ((ref.owner as SceneRole).data as RoleData).totalStat.moveSpeed);
				(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_RUN, runRef);
			}
		}

		private function onWalkThrough(ref : ScaredMoveStateReference) : void
		{
			if (_machine && !_machine.isInPool)
			{
				var runRef : RunStateReference = (ref.owner as SceneRole).stateMachine.getReference(RunStateReference) as RunStateReference;
				runRef.setParams(0, ((ref.owner as SceneRole).data as RoleData).totalStat.moveSpeed);
				(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_RUN, runRef);
			}
		}

		private function onArrive(ref : ScaredMoveStateReference) : void
		{

		}

		override public function leave() : void
		{
			if(role)
			{
				role.stateMachine.removeState(RoleStateType.CONTROL_SCARED_MOVE);
			}
			super.leave();
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(ScaredState);
		}
		
	}
}
