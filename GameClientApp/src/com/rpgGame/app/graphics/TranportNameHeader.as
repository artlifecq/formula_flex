package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	
	import org.mokylin.skin.mainui.map.TranpprtLevel;
	
	import starling.display.Sprite;

	public class TranportNameHeader  extends Sprite implements IInstancePoolClass
	{
		private static var tranportNameHeaderPool : InstancePool = new InstancePool("TranportNameHeader", 300);
		/**创建*/
		public static function create() : TranportNameHeader
		{
			return tranportNameHeaderPool.createObj(TranportNameHeader) as TranportNameHeader;
		}
		/**回收*/
		public static function recycle(bar : TranportNameHeader) : void
		{
			tranportNameHeaderPool.recycleObj(bar);
		}
		/*-----------------------------------------------------*/
		private var _skin :TranpprtLevel;
		public function TranportNameHeader()
		{
			super();
			_skin = new TranpprtLevel();
			_skin.toSprite(this);
			_isDestroyed = false;
			_isDisposed = false;
		}
		
		public function setLevel(level:int):void
		{
			_skin.num.label=""+level;
		}
		
		
		
		/*-------------------接口实现----------------------------------*/
		
		private var _isDestroyed : Boolean=false; 
		private var _isDisposed : Boolean;
		public function instanceDestroy() : void
		{
			putInPool();
			dispose();
			_isDestroyed = true;
		}
		public function reSet(parameters:Array):void
		{
			_isDisposed = false;
		}
		public function putInPool() : void
		{
			if (parent != null)
				parent.removeChild(this);
			_isDisposed = true;
		}
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isInPool():Boolean
		{
			return _isDisposed;
		}
	}
}