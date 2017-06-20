package  com.rpgGame.app.graphics.decor
{
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	

	
	/**
	 * 显示对象装饰类
	 * 通过布局管理器管理零散装饰组件，比如血条，名字，挂牌等等。
	 * <p>┏┳┳┓</p>
	 * <p>┣╋╋┫</p>
	 * <p>┣╋╋┫</p>
	 * <p>┗┻┻┛</p>
	 *  采用9宫格布局的思路，显示对象居9宫格的中间，组件可放置 在9个不同的位置，然后每个单宫在由SortLayerContainer(垂直排序)或其他布局管理
	 * 一共分为 :
	 * lt, t, rt,         左上，顶，右顶
	 * l   c  r     ==    左       中     右    
	 * lb  b  rb          左下    下    右下
	 * @author YanQ
	 */	
	public class DecorCtrl
	{
		// 血条选区高度
		//public static const BLOOD_BOUNDBOX_HEIGHT :int = 22;
		// 头顶血条和包围盒的间隙高度
		public static const BOUNDBOX_TOP_OFF :int = 0;
		
		public static const CONTAINER_WIDTH :int = 200;
		public static const CONTAINER_HEIGHT :int = 0;
		
		private static var SORT_VALUE:int=100;
		
		public static const TOP_HPMP :int = SORT_VALUE--;
		public static const TOP_NAME :int = SORT_VALUE--;
		public static const TOP_GUILD :int = SORT_VALUE--;
		public static const TOP_CHENGHAO :int = SORT_VALUE--;
		public static const TOP_HUBAOCHENGHAO :int = SORT_VALUE--;
		public static const TOP_NPCCHENGHAO :int = SORT_VALUE--;
		
		private var topLayer :SortLayer = null;
		private var rightBottomLayer :SortLayer = null;
		
		private var _decorTarge :DisplayObjectContainer;
		
		public function DecorCtrl( decorTarge :DisplayObjectContainer )
		{
			super();
			
			_decorTarge = decorTarge;
			
			topLayer = new SortLayer( _decorTarge, SortLayer.LAYOUT_U );
			rightBottomLayer = new SortLayer( _decorTarge, SortLayer.LAYOUT_RB );
//			SortLayerContainer.LEFT_TYPE
		}
		
		public function Dispose():void
		{
			topLayer.Dispose();
			rightBottomLayer.Dispose();
			topLayer = null;
			rightBottomLayer = null;
		}
		
		/**
		 * 添加一个组件到顶区域 
		 * @param obj ，目标对象
		 * @param sortLevel 排列层级， -1表示默认往上添加, 0表示最低层
		 */		
		public function addTop( obj :DisplayObject, sortLevel :int = -1 ):void
		{
            if (obj == null)
                return;
			topLayer.add( obj, sortLevel );
		}
		
		public function addTopNotSort( obj :DisplayObject):void
		{
			if (obj == null) return;
			
			topLayer.addNotSort( obj );
		}
		
		public function sortTop():void
		{
			topLayer.sortLevelList();
		}
		
		public function get topPosY():Number
		{
//			if( topLayer != null )
//				return topLayer.y;
			return 0;
		}
		
		/**
		 * 删除一个组件 
		 * @param obj
		 */		
		public function removeTop( obj :DisplayObject ):void
		{
            if (obj == null || obj.parent == null)
                return;
            
			topLayer.remove( obj );
		}
		
		/**
		 * 添加一个组件到顶区域 
		 * @param obj ，目标对象
		 * @param sortLevel 排列层级， -1表示默认往上添加, 0表示最低层
		 */		
		public function addRB( obj :DisplayObject, sortLevel :int = -1 ):void
		{
            if (obj == null)
                return;
            
			rightBottomLayer.add( obj, sortLevel );
		}
		
		public function sortRB():void
		{   
			rightBottomLayer.sortLevelList();
		}
		
		/**
		 * 删除一个组件 
		 * @param obj
		 */		
		public function removeRB( obj :DisplayObject ):void
		{
            if (obj == null || obj.parent == null)
                return;
            
			rightBottomLayer.remove( obj );
		}
		
		public function removeAll():void		
		{
			topLayer.removeAll();
			rightBottomLayer.removeAll();
		}
		
		private var _curW :int = CONTAINER_WIDTH;
		private var _curTH :int = CONTAINER_HEIGHT;
		private var _curTX :int = 0;
		/**
		 * 改变布局偏移位置
		 * @param _width
		 * @param _height
		 */		
		public function reSize( _width :int, _topOffy :int, topOffx :int = 0 ):void
		{
			if ( _curW != _width )
			{
				_curW = rightBottomLayer.x = _width;
				rightBottomLayer.layout();
			}
			
			if ( _curTH != -_topOffy || _curTX != topOffx )
			{
				_curTH = topLayer.y = -_topOffy;
				_curTX = topLayer.x = topOffx;
				topLayer.layout();
			}
			
//			rightBottomLayer.y = -DecorMgr.CONTAINER_HEIGHT;
		}
        
        public function showTop(b :Boolean):void
        {
            if (topLayer.visible != b)
                topLayer.visible = b;
        }
        
        public function showRightBottom(b :Boolean):void
        {
            if (rightBottomLayer.visible != b)
                rightBottomLayer.visible = b;
        }
	}
}