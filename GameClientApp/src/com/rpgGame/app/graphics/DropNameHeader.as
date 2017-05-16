package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.rpgGame.app.scene.SceneRole;
	
	import org.mokylin.skin.app.roll.Roll_DaojuDi;
	
	import starling.display.Sprite;
	
	public class DropNameHeader extends Sprite implements IInstancePoolClass
	{
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
			dropNameHeaderPool.disposeObj(bar);
		}
		private var _skin :Roll_DaojuDi;
		public function DropNameHeader()
		{
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
		
		public function instanceDestroy() : void
		{
			instanceDispose();
			dispose();
		}
		
		
		
		public function instanceDispose() : void
		{
			if (parent != null)
				parent.removeChild(this);
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
		}
		
		public function get isDestroyed():Boolean
		{
			// TODO Auto Generated method stub
			return false;
		}
		
		public function get isDisposed():Boolean
		{
			// TODO Auto Generated method stub
			return false;
		}
		
	}
}