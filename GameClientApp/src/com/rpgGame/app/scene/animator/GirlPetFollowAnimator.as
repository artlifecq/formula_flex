package com.rpgGame.app.scene.animator
{
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.type.AIStateType;

	/**
	 *主玩家美人管理 
	 * @author Administrator
	 * 
	 */	
	public class GirlPetFollowAnimator implements IRenderAnimator
	{
		/**最小传送距离，超过此距离传送到主角身边**/
		public static const MIN_TRANS_DIS:int=800*800;
		/**传送到玩家附近**/
		public static const MIN_NEAR:int=180*180;
		private var _scenePet:SceneRole;
		private var _petOwner:SceneRole;
		private var _aiMachine:AIStateMachine;
		public function GirlPetFollowAnimator()
		{
			
		}
		
		public function setOwner(owner:BaseObj3D):void
		{
			this._scenePet=owner as SceneRole;
			if (_scenePet) 
			{
				_petOwner=SceneManager.getSceneObjByID(GirlPetData(_scenePet.data).ownerId) as SceneRole;
			}
			_aiMachine=new AIStateMachine(this._scenePet);
		}
		
		public function update(gapTm:uint):void
		{
			if (_scenePet&&_petOwner) 
			{
				var dis:int=MathUtil.getDistanceNoSqrt(_scenePet.pos.x,_scenePet.pos.y,_petOwner.pos.x,_petOwner.pos.y);
				_aiMachine.transition(AIStateType.AI_GIRL_FOLLOW,null,dis>=MIN_TRANS_DIS);
				_aiMachine.transition(AIStateType.AI_GIRL_ATTACK);
			}
		}
		
		public function dispose():void
		{
			if (_aiMachine) 
			{
				_aiMachine.destroy();
				_aiMachine=null;
			}
			_scenePet=null;
			_petOwner=null;
		}
	}
}