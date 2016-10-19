package com.game.engine2D.core
{
	import away3d.textures.AsyncTexture2D;
	import away3d.textures.TextureThumbData;
	
	public class AsyncByteTexture extends AsyncTexture2D
	{
		public var userData:*;
		
		public function AsyncByteTexture(hasAlpha:Boolean, highQuality:Boolean=false, thumbData:TextureThumbData=null)
		{
			super(hasAlpha, false, highQuality, thumbData);
			this.autoRecycleEnable = true;
			this.autoRecycleDataEnable = false;
		}
	}
}