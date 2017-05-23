package starling.utils {
	
	import flash.geom.Rectangle;
	
	/**
	 *　　　　　　　　┏┓　　　┏┓+ +
	 *　　　　　　　┏┛┻━━━┛┻┓ + +
	 *　　　　　　　┃　　　　　　　┃ 　
	 *　　　　　　　┃　　　━　　　┃ ++ + + +
	 *　　　　　　 ████━████ ┃+
	 *　　　　　　　┃　　　　　　　┃ +
	 *　　　　　　　┃　　　┻　　　┃
	 *　　　　　　　┃　　　　　　　┃ + +
	 *　　　　　　　┗━┓　　　┏━┛
	 *　　　　　　　　　┃　　　┃　　　　　　　　　　　
	 *　　　　　　　　　┃　　　┃ + + + +
	 *　　　　　　　　　┃　　　┃　　　　　　　　　　　
	 *　　　　　　　　　┃　　　┃ + 　　　　　　
	 *　　　　　　　　　┃　　　┃
	 *　　　　　　　　　┃　　　┃　　+　　　　　　　　　
	 *　　　　　　　　　┃　 　　┗━━━┓ + +
	 *　　　　　　　　　┃ 　　　　　　　┣┓
	 *　　　　　　　　　┃ 　　　　　　　┏┛
	 *　　　　　　　　　┗┓┓┏━┳┓┏┛ + + + +
	 *　　　　　　　　　　┃┫┫　┃┫┫
	 *　　　　　　　　　　┗┻┛　┗┻┛+ + + +
	 * 经过优化过得打包程序
	 * @author      chenbo
	 * @time        4:19:26 PM
	 * @project     Starling
	 */
	public class MiniBestRectsBinPack {
		
		/** rectangle缓存池 */
		private static var rectanglePool : Vector.<Rectangle> = new Vector.<Rectangle>();
		
		/** 用于控制最大节点数，超过该节点数将不再进行计算。 */
		public var MaxNodeSize : int = int.MAX_VALUE;
		
		private var binWidth   : int = 0;
		private var binHeight  : int = 0;
		private var remainArea : int = 0;
		private var freeRectangles : Vector.<Rectangle> = new Vector.<Rectangle>();
		
		public function MiniBestRectsBinPack(width : int, height : int) {
			reset(width, height);
		}
		
		public function reset(width : int, height : int) : void {
			
			binWidth   = width;
			binHeight  = height;
			remainArea = width * height;
			
			while (freeRectangles.length > 0) {
				putFreeRectangle(freeRectangles.pop());
			}
			
			var rect : Rectangle = getFreeRectangle();
			rect.x = 0;
			rect.y = 0;
			rect.width  = width;
			rect.height = height;
			
			freeRectangles[0] = rect;
		}
		
		/**
		 * 放置一个Rect到矩形里面。如果放置成功，rect会被重置为对应区域的rect
		 * @param rect
		 */		
		public function insert(rect : Rectangle) : Boolean {
			if (rect.width * rect.height > remainArea) {
				return false;
			}
			if (freeRectangles.length >= MaxNodeSize) {
				return false;
			}
			var find : Boolean = findBestAreaFit(rect);
			if (find) {
				placeRectangle(rect);
			}
			return find;
		}
		
		private function findBestAreaFit(fitRect : Rectangle) : Boolean {
			
			var width  : int = fitRect.width;
			var height : int = fitRect.height;
			var score0 : int = int.MAX_VALUE;
			var score1 : int = int.MAX_VALUE;
			var leftoverVert  : int = 0;
			var shortSideFit  : int = 0;
			var leftoverHoriz : int = 0;
			
			for (var i:int = 0; i < freeRectangles.length; i++) {
				
				var freeRect : Rectangle = freeRectangles[i];
				var areaFit  : int = freeRect.width * freeRect.height - width * height;
				
				if (freeRect.width >= width && freeRect.height >= height) {
					leftoverHoriz = freeRect.width - width   > 0 ? freeRect.width - width   : -freeRect.width  + width;
					leftoverVert  = freeRect.height - height > 0 ? freeRect.height - height : -freeRect.height + height;
					shortSideFit  = leftoverHoriz < leftoverVert ? leftoverHoriz : leftoverVert;
					if (areaFit < score0 || (areaFit == score0 && shortSideFit < score1)) {
						fitRect.x = freeRect.x;
						fitRect.y = freeRect.y;
						score0 = areaFit;
						score1 = shortSideFit;
						return true;
					}
				}
			}
			
			return false;
		}
		
		/**
		 * 放置一个Rectangle 
		 * @param node
		 * 
		 */		
		public function placeRectangle(node : Rectangle) : void {
			remainArea -= node.width * node.height;
			var numRectanglesToProcess : int = freeRectangles.length;
			for (var i : int = 0; i < numRectanglesToProcess; i++) {
				if (splitFreeNode(freeRectangles[i], node)) {
					putFreeRectangle(freeRectangles[i]);
					freeRectangles.splice(i, 1);
					--i;
					--numRectanglesToProcess;
				}
			}
			pruneFreeList();
		}
		
		private function splitFreeNode(freeNode:Rectangle, usedNode:Rectangle):Boolean {
			if (usedNode.x >= freeNode.x + freeNode.width  || usedNode.x + usedNode.width  <= freeNode.x ||
				usedNode.y >= freeNode.y + freeNode.height || usedNode.y + usedNode.height <= freeNode.y) {
				return false;
			}
			var newNode : Rectangle = null;
			if (usedNode.x < freeNode.x + freeNode.width && usedNode.x + usedNode.width > freeNode.x) {
				if (usedNode.y > freeNode.y && usedNode.y < freeNode.y + freeNode.height) {
					newNode = getFreeRectangle();
					newNode.x = freeNode.x;
					newNode.y = freeNode.y;
					newNode.width  = freeNode.width;
					newNode.height = usedNode.y - newNode.y;
					freeRectangles.push(newNode);
				}
				if (usedNode.y + usedNode.height < freeNode.y + freeNode.height) {
					newNode = getFreeRectangle();
					newNode.x = freeNode.x;
					newNode.y = usedNode.y + usedNode.height;
					newNode.width  = freeNode.width;
					newNode.height = freeNode.y + freeNode.height - (usedNode.y + usedNode.height);
					freeRectangles.push(newNode);
				}
			}
			
			if (usedNode.y < freeNode.y + freeNode.height && usedNode.y + usedNode.height > freeNode.y) {
				if (usedNode.x > freeNode.x && usedNode.x < freeNode.x + freeNode.width) {
					newNode = getFreeRectangle();
					newNode.x = freeNode.x;
					newNode.y = freeNode.y;
					newNode.width  = usedNode.x - newNode.x;
					newNode.height = freeNode.height;
					freeRectangles.push(newNode);
				}
				if (usedNode.x + usedNode.width < freeNode.x + freeNode.width) {
					newNode = getFreeRectangle();
					newNode.x = usedNode.x + usedNode.width;
					newNode.y = freeNode.y;
					newNode.width  = freeNode.x + freeNode.width - (usedNode.x + usedNode.width);
					newNode.height = freeNode.height;
					freeRectangles.push(newNode);
				}
			}
			return true;
		}
		
		private function pruneFreeList():void {
			for(var i:int = 0; i < freeRectangles.length; i++)
				for(var j:int = i+1; j < freeRectangles.length; j++) {
					if (isContainedIn(freeRectangles[i], freeRectangles[j])) {
						putFreeRectangle(freeRectangles[i]);
						freeRectangles.splice(i, 1);
						break;
					}
					if (isContainedIn(freeRectangles[j], freeRectangles[i])) {
						putFreeRectangle(freeRectangles[j]);
						freeRectangles.splice(j, 1);
					}
				}
		}
		
		/**
		 * 矩形区域剩余面积 
		 * @return 
		 * 
		 */		
		public function get rectRemainArea() : int {
			return remainArea;
		}
		
		/**
		 * 矩形区域宽度 
		 * @return 
		 * 
		 */		
		public function get rectWidth() : int {
			return binWidth;
		}
		
		/**
		 * 矩形区域高度 
		 * @return 
		 * 
		 */		
		public function get rectHeight() : int {
			return binHeight;
		}
		
		private static function isContainedIn(a : Rectangle, b : Rectangle) : Boolean {
			return a.x >= b.x && a.y >= b.y && a.x + a.width <= b.x + b.width && a.y + a.height <= b.y + b.height;
		}
		
		/**
		 * 获取一个空闲的rectangle 
		 * @return 
		 * 
		 */		
		public static function getFreeRectangle() : Rectangle {
			if (rectanglePool.length == 0) {
				return new Rectangle();
			} else {
				return rectanglePool.shift();
			}
		}
		
		/**
		 * 回收一个空闲的rectangle 
		 * @param rect
		 * 
		 */		
		public static function putFreeRectangle(rect : Rectangle) : void {
			rectanglePool[rectanglePool.length] = rect;
		}
		
	}
}