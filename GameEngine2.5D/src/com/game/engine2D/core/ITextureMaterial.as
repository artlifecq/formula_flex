package com.game.engine2D.core
{
	import away3d.materials.TextureMaterial;
	import away3d.textures.Texture2DBase;
	
	public interface ITextureMaterial
	{
		function get width():int;
		function get height():int;
		function get texture():Texture2DBase;
		/** 开始上传 纹理 */
		function uploadTexture():void;
		/** 纹理是否已经准备好，可以使用  */
		function get textureReady():Boolean;
		/** 是否动态压缩4倍显存  */
		function get isTextureScale():Boolean;
		function get textureScale():Number;
		function dispose():void;
		function clone():TextureMaterial;
	}
}