package com.game.engine2D.core
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.display3D.textures.TextureBase;
	
	import starling.textures.ConcreteTexture;
	
	/**
	 * 地图贴图 
	 * @author guoqing.wen
	 * 
	 */
	public class AsyncMapTexture extends ConcreteTexture
	{
		public var userData:*;
		private var _isDispose:Boolean;
		public function AsyncMapTexture(hasAlpha:Boolean = false)
		{
			super(hasAlpha, false, null);
			compressed = false;
			_asyncUpload = false;
		}
		
		public function get baseTexture():TextureBase
		{
			if (_isDispose)return null;
			return getTextureForStage3D(Stage3DLayerManager.stage3DProxy, 0);
		}
		
		public function get isDispose():Boolean
		{
			return _isDispose;
		}
		
		override public function dispose():void
		{
			_isDispose = true;
			super.dispose();
		}
	}
}