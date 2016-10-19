package com.game.engine2D.core
{
	import flash.display3D.textures.CubeTexture;
	import flash.display3D.textures.Texture;
	import flash.display3D.textures.TextureBase;
	import flash.utils.ByteArray;
	
	import away3d.textures.ATFData;
	import away3d.textures.TextureProxyBase;
	
	public class ATFByteData extends ATFData
	{
		public var isAsync:Boolean = false;
		public function ATFByteData(data:ByteArray)
		{
			data.position = 0;
			super(data);
		}
		
		override public function upload(texture:TextureBase, textureProxy:TextureProxyBase):void
		{
			if (isAsync)
			{
				if(type == TYPE_NORMAL)
					Texture(texture).uploadCompressedTextureFromByteArray(data, 0, isAsync);
				else
					CubeTexture(texture).uploadCompressedTextureFromByteArray(data, 0, isAsync);
			}
			else
			{
				super.upload(texture, textureProxy);
			}
		}
		
	}
}