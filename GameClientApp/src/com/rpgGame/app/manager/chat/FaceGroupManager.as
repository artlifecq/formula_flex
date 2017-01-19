package com.rpgGame.app.manager.chat
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.coreData.clientConfig.FaceInfo;

	/**
	 * 表情面板的管理类，全局只需要有一个表情面板就可以了，每一次调用show方法时传递一个回调方法，方便在各种聊天系统中使用 
	 * @author mandragora
	 * 
	 */	
	public class FaceGroupManager
	{
		public function FaceGroupManager()
		{
			FaceLoadManager.loadFace(initFaceGroup);
		}
		
		private var _needShow : Boolean = false;
		private var _posX : Number = 0;
		private var _posY : Number = 0;
		private var _isInit : Boolean = false;
		
		private static var _instance : FaceGroupManager;
		
		public static function get instance():FaceGroupManager
		{
			if(!_instance)
				_instance = new FaceGroupManager();
			return _instance;
		}
		
		private var _faceGroup : Object;//FaceGroup;
		
		private var _touchFun:Function;

		private function initFaceGroup():void
		{
			_faceGroup = new FaceGroup();
			if(_needShow)
				showGroup();
			_isInit = true;
		}
		
		public function touchTargetFun(faceInfo:FaceInfo):void
		{
			_touchFun && _touchFun(faceInfo);
			_faceGroup.remove();
		}
		/**
		 * 显示表情容器，如果不指定位置，将默认鼠标位置为最下面，点击一次后隐藏（或五秒内无任何操作）
		 * @param fun
		 * @param posX
		 * @param posY
		 * 
		 */		
		public function showOrHide(fun:Function,posX:Number = 0,posY:Number = 0):void
		{
			if(!_faceGroup || !_faceGroup.parent)
			{
				_touchFun = fun;
				_posX = posX;
				_posY = posY;
				if(!_isInit)
				{
					_needShow = true;
					return;
				}
				showGroup();
			}
			else
			{
				if(_faceGroup)
				{
					_faceGroup.remove();
				}
			}
		}
		
		private function showGroup():void
		{
			var posx : Number = 0;
			var posy : Number = 0;
			if(_posX !=0 || _posY!=0)
			{
				posx = _posX /*- _faceGroup.width + 10*/;
				posy = _posY - _faceGroup.height;
			}else
			{
				posy =  Stage3DLayerManager.stage.mouseY - _faceGroup.height - 10;
				posx = Stage3DLayerManager.stage.mouseX - _faceGroup.width * 0.5;
			}
			_faceGroup.x = posx;
			_faceGroup.y = posy;
			_faceGroup.show();
		}
		
	}
}