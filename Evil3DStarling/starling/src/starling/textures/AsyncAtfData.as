package starling.textures
{
	import flash.display3D.textures.CubeTexture;
	import flash.display3D.textures.Texture;
	import flash.display3D.textures.TextureBase;
	import flash.utils.ByteArray;
	
	import away3d.textures.ATFData;
	import away3d.textures.TextureProxyBase;
	
	public class AsyncAtfData extends ATFData
	{
		public function AsyncAtfData(data:ByteArray, isAsync:Boolean=true)
		{
			data.position = 0;
			super(data, isAsync);
		}
		
		override public function upload(texture:TextureBase, textureProxy:TextureProxyBase):void
		{
			if (_async)
			{
				if(type == TYPE_NORMAL)
					Texture(texture).uploadCompressedTextureFromByteArray(data, 0, true);
				else
					CubeTexture(texture).uploadCompressedTextureFromByteArray(data, 0, true);
			}
			else
			{
				super.upload(texture, textureProxy);
			}
		}
		
	}
}

