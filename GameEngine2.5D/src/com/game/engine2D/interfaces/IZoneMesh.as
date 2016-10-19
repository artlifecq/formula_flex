package com.game.engine2D.interfaces
{
	import away3d.containers.ObjectContainer3D;
	import away3d.core.base.data.OverrideMaterialProps;
	import away3d.materials.MaterialBase;

	public interface IZoneMesh
	{
		function set material(value:MaterialBase):void
		function get material():MaterialBase
		function get width():int
		function set width(value:int):void
		function get height():int
		function set height(value:int):void
		function run():void
		function setPosition():void
		function set x(val:Number):void
		function get x():Number
		function get y():Number	
		function set y(val:Number):void
		function get z():Number	
		function set z(val:Number):void
		function get parent():ObjectContainer3D
		function set depth(value:int):void
		function set layerType(value:uint):void
		function get overrideMaterialProps():OverrideMaterialProps
	}
}