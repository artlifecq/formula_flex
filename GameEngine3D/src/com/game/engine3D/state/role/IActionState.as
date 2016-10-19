package com.game.engine3D.state.role
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;

	/**
	 *
	 * 场景角色动作状态接口
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public interface IActionState extends IState
	{
		function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void;
		function syncAnimation(isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void;
		function setAnimationSpeed(role : BaseRole, render : RenderUnit3D, speedRatio : Number = 1) : void;
		function syncAnimationSpeed(speedRatio : Number) : void;
		function get isFreeze() : Boolean;
		function get speedRatio() : Number;
	}
}
