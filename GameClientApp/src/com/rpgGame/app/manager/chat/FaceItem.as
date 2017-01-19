package com.rpgGame.app.manager.chat
{
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	import com.rpgGame.coreData.type.AssetUrl;
	
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	
	import starling.display.Sprite;
	
	/**
	 * 单个表情
	 * @author mandragora
	 * 
	 */	
	public class FaceItem extends Sprite
	{
		private var _mc : UIMovieClip;
		private var _bg : UIAsset;
		private var _isCreate : Boolean = false;
		private var _faceInfo : FaceInfo;
		public function FaceItem(faceInfo : FaceInfo = null)
		{
			_faceInfo = faceInfo;
			super();
			create();
		}

		private function create():void
		{
			if(_isCreate)
				return;
			_isCreate = true;
			_bg = new UIAsset();
			_bg.styleName = AssetUrl.FACE_BG_ASSET;
			_bg.width = 32;
			_bg.height = 32;
			addChild(_bg);
			_mc = new UIMovieClip();
			_mc.frameRate = 6;
			_mc.autoPlay = true;
			updateStyleClass();
			addChild(_mc);
		}
		
		public function get faceInfo():FaceInfo
		{
			return _faceInfo;
		}
		/**
		 * 重设表情的皮肤 
		 * @param value
		 * 
		 */		
		public function set faceInfo(value:FaceInfo):void
		{
			_faceInfo = value;
			updateStyleClass();
		}
		
		private function updateStyleClass():void
		{
			if( _mc && _faceInfo && _faceInfo.faceClass)
			{
				_mc.styleClass = _faceInfo.faceClass;
				_mc.validate();
			}
			
		}
		
	}
}