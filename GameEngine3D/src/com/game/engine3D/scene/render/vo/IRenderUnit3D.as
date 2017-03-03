package com.game.engine3D.scene.render.vo
{
	import com.game.engine3D.vo.SoftOutlineData;
	
	/**
	 *
	 * 3D元渲染单元接口
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 下午4:16:33
	 *
	 */
	public interface IRenderUnit3D
	{
		function get mouseEnabled() : Boolean;
		function set mouseEnabled(value : Boolean) : void;
		function get usable() : Boolean;
		function get renderParamData() : RenderParamData3D;
		function setSoftOutline(data : SoftOutlineData) : void
	}
}