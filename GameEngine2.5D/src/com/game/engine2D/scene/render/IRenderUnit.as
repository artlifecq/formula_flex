package com.game.engine2D.scene.render
{
	import com.game.engine2D.scene.render.vo.IRenderUnitData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitStatus;

	public interface IRenderUnit
	{
		function get usable():Boolean;
		function set usable($value:Boolean):void;
		function get data():IRenderUnitData;
		function set data($value:IRenderUnitData):void;
		
		function setRenderUnitStatus($rus:RenderUnitStatus):void;
	}
}