package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	
	import org.mokylin.skin.app.roll.Roll_DaojuDi;
	
	import starling.display.Sprite;
	
	public class DropNameHeader extends Sprite implements IInstancePoolClass
	{
		private var _isDestroyed : Boolean;
		private var _isDisposed : Boolean;
		
		private static var dropNameHeaderPool : InstancePool = new InstancePool("DropNameHeaderPool", 300);
		/**
		 * 生成一个HeadBloodBar
		 */
		public static function create() : DropNameHeader
		{
			//利用池生成HeadBloodBar
			return dropNameHeaderPool.createObj(DropNameHeader) as DropNameHeader;
		}
		/**
		 * @private
		 * 回收一个HeadBloodBar
		 * @param bar
		 */
		public static function recycle(bar : HeadBloodBar) : void
		{
			//利用池回收HeadBloodBar
			dropNameHeaderPool.recycleObj(bar);
		}
		private var _skin :Roll_DaojuDi;
		public function DropNameHeader()
		{
			_isDestroyed = false;
			super();
			_skin = new Roll_DaojuDi();
			_skin.toSprite(this);
			reSet(null);
		}
		
		public function haveOwner(value:Boolean):void
		{
			_skin.uiLock.visible = value;
		}
						
		public function isSelect(value:Boolean):void
		{
			_skin.uiSelect.visible = value;
			_skin.uiBg.visible = !value;
		}
		
		public function setSzie(w:Number,h:Number):void
		{
			_skin.width = w;
			_skin.height = h;
		}
		
		public function instanceDestroy() : void
		{
			putInPool();
			dispose();
			_isDestroyed = true;
		}
		
		public function putInPool() : void
		{
			if (parent != null)
				parent.removeChild(this);
			_isDisposed = true;
		}
		
		public function get realHeight() : uint
		{
			return this._skin.height;
		}
		
		public function get realWidth() : uint
		{
			return this._skin.width;
		}
		public function reSet(parameters:Array):void
		{
			_isDisposed = false;
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