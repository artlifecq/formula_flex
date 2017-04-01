package com.game.engine2D.core
{
	import away3d.Away3D;
	import away3d.textures.AsyncTexture2D;
	import away3d.textures.TextureThumbData;
	
	public class AsyncByteTexture extends AsyncTexture2D
	{
		public var userData:*;
		
		public function AsyncByteTexture(hasAlpha:Boolean, highQuality:Boolean=false, thumbData:TextureThumbData=null)
		{
			super(hasAlpha, false, highQuality, true, thumbData, Away3D.ATF_ASYNC_UPLOAD);
			this.autoRecycleEnable = true;
			this.autoRecycleDataEnable = false;
		}
		
		/**抬高优先级.*/
		public function uplevelParsePriority():void
		{
			if(_textureDataLoader)
			{
				_textureDataLoader.uplevelParsePriority(1);
			}
		}
	}
}