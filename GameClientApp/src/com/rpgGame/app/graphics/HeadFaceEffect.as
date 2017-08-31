package com.rpgGame.app.graphics
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	
	public class HeadFaceEffect extends Inter3DContainer
	{
		private var _tw:int;
		private var _th:int;
		private var _url:String;
		public function HeadFaceEffect()
		{
			super();
			
		}

		public function get url():String
		{
			return _url;
		}

		public function playEffect(w:int,h:int,url : String, x : int, y : int, repeat : int = 1, onPlayComplete : Function = null,addComplete:Function=null) : InterObject3D
		{
			this._tw=w;
			this._th=h;
			this._url=url;
			return playInter3DAt(url,x,y,repeat,onPlayComplete,addComplete);
		}
		override public function get width():Number
		{
			return 0;
		}
		override public function get height():Number
		{
			return _th;
		}
	}
}