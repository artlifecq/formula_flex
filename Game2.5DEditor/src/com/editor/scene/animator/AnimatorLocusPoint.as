package com.editor.scene.animator
{
	import flash.geom.Vector3D;

	/**
	 *
	 * 动画轨迹点
	 * @author L.L.M.Sunny
	 * 创建时间：2016-03-04 上午11:12:28
	 *
	 */
	public class AnimatorLocusPoint
	{
		public var position : Vector3D;
		public var targetPos : Vector3D;

		public function AnimatorLocusPoint(position : Vector3D, targetPos : Vector3D)
		{
			this.position = position;
			this.targetPos = targetPos;
		}
	}
}
