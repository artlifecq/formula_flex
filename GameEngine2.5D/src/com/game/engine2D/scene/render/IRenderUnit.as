package com.game.engine2D.scene.render
{
	import com.game.engine2D.scene.render.vo.IRenderUnitData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitStatus;
	import com.game.engine3D.scene.render.vo.IRenderUnit3D;
	
	public interface IRenderUnit extends IRenderUnit3D
	{
		function get data():IRenderUnitData;
		function set data($value:IRenderUnitData):void;
		function setRenderUnitStatus($rus:RenderUnitStatus):void;
	}
}