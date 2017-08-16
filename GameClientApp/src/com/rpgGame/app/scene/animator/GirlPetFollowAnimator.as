package com.rpgGame.app.scene.animator
{
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.type.AIStateType;
	
	import flash.utils.getTimer;

	/**
	 *主玩家美人管理 
	 * @author Administrator
	 * 
	 */	
	public class GirlPetFollowAnimator implements IRenderAnimator
	{
		/**最小传送距离，超过此距离传送到主角身边**/
		public static const MIN_TRANS_DIS:int=700*700;
		/**大于这个值，就要寻路到玩家身边**/
		public static const MIN_NEAR:int=300*300;
		public static const MIN_NEAR_2:int=300;
		private var _scenePet:SceneRole;
		private var _petOwner:SceneRole;
		private var _aiMachine:AIStateMachine;
		private var _preTime:Number;
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
			_preTime = 0;
		}
		
		public function update(gapTm:uint):void
		{
			var curTime:Number =getTimer();
			if ((curTime - _preTime) < 200)
			{
				return;
			}
			_preTime = curTime;
			if (_scenePet&&_petOwner) 
			{
				var dis:int=MathUtil.getDistanceNoSqrt(_scenePet.pos.x,_scenePet.pos.y,_petOwner.pos.x,_petOwner.pos.y);
				_aiMachine.transition(AIStateType.AI_GIRL_FOLLOW,null,dis>=MIN_TRANS_DIS);
				_aiMachine.transition(AIStateType.AI_GIRL_ATTACK);
				_aiMachine.transition(AIStateType.AI_GIRL_SPEAK);
				_aiMachine.transition(AIStateType.AI_NONE);//AI_GIRL_ATTACK);
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