package com.rpgGame.app.manager.fight
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	
	import starling.display.Sprite;
	
	/**
	 * 瓢字列表容器
	 *@author dik
	 *2017-8-6下午3:43:30
	 **/
	public class AttChangeListCont extends Sprite implements IInstancePoolClass
	{
		private static var pool : InstancePool = new InstancePool("AttChangeListCont", 300);
		
		public static function create() : AttChangeListCont
		{
			return pool.createObj(AttChangeListCont) as AttChangeListCont;
		}
		
		public static function recycle(item:AttChangeListCont):void
		{
			while(item.numChildren>0){
				item.removeChildAt(0);
			}
			item.x=item.y=0;
			pool.recycleObj(item);
		}
		
		private var _isDisposed:Boolean;
		private var _isDestroyed:Boolean;
		
		public function AttChangeListCont()
		{
			super();
		}
		
		public function instanceDestroy() : void
		{
			putInPool();
			dispose();
			_isDestroyed = true;
		}
		
		public function putInPool() : void
		{
			if (parent)
			{
				parent.removeChild(this);
			}
			_isDisposed = true;
		}
		
		public function reSet(parameters : Array) : void
		{
			
		}
		
		public function get isInPool():Boolean
		{
			return _isDisposed;
		}
		
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
	}
}