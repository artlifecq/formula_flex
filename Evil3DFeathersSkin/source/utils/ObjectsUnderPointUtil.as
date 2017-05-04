package utils{
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.utils.MatrixUtil;
	
	/**
	 * @author shamruk see:https://gist.github.com/shamruk
	 * @modify wewell@163.com
	 */	
	public class ObjectsUnderPointUtil {
		
		private static const sHelperMatrix : Matrix = new Matrix();
		private static const sHelperPoint : Point = new Point();
		
		/**
		 /* It is a getObjectsUnderPoint replacement
		 /*
		 /* Not done:
		 /* 1) ignores touchGroups for now
		 /* 2) stage is not included, and not checked if got in stage
		 */
		public static function findObjectsUnderPoint(display : DisplayObject, localPoint : Point, forTouch : Boolean, to : Vector.<DisplayObject>) : void {
			if (forTouch && (!display.visible || !display.touchable)) {
				return;
			}
			if (display is DisplayObjectContainer) {
				if (display is Sprite) {
					var sprite : Sprite = display as Sprite;
					if (sprite.mask && !sprite.hitTestMask(localPoint)) {
						return;
					}
				}
				const container : DisplayObjectContainer = DisplayObjectContainer(display);
				const localX : Number = localPoint.x;
				const localY : Number = localPoint.y;
				const numChildren : int = container.numChildren;
				for (var i : int = numChildren - 1; i >= 0; --i) {
					const child : DisplayObject = container.getChildAt(i);
					container.getTransformationMatrix(child, sHelperMatrix);
					MatrixUtil.transformCoords(sHelperMatrix, localX, localY, sHelperPoint);
					findObjectsUnderPoint(child, sHelperPoint, forTouch, to);
				}
			} else if (display.hitTest(localPoint)) {
				to.push(display);
			}
		}
	}
}