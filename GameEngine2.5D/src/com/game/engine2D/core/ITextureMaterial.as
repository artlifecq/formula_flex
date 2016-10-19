package com.game.engine2D.core
{
	import away3d.materials.TextureMaterial;
	import away3d.textures.Texture2DBase;

	public interface ITextureMaterial
	{
		function get width():int;
		function get height():int;
		function get texture():Texture2DBase;
		function get textureParsed():Boolean;
		function dispose():void;
		function clone():TextureMaterial;
	}
}