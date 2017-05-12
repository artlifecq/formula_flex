package com.game.engine2D.core
{
	import away3d.library.assets.IAsset;
	import away3d.materials.methods.EffectMethodBase;
	import away3d.textures.Texture2DBase;
	
	public interface ITextureMaterial extends IAsset
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
		function get index():int;
		function set index(value:int):void;
		function clone():ITextureMaterial;
		function addMethod(method:EffectMethodBase):void;
		function removeMethod(method:EffectMethodBase):void;
		function hasMethod(method:EffectMethodBase):Boolean;
	}
}