package com.game.engine3D.scene.render.vo
{
	import com.game.engine3D.vo.BaseObj3D;

	/**
	 *
	 * 3D渲染动画接口
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-03 下午1:26:38
	 *
	 */
	public interface IRenderAnimator
	{
		function setOwner(owner : BaseObj3D) : void;
		function update() : void;
		function dispose() : void;
	}
}
