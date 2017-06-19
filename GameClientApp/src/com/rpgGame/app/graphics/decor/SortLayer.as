package  com.rpgGame.app.graphics.decor
{
	import com.rpgGame.core.utils.MCUtil;
	
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 装饰布局管理
	 * 布局格式，参见 xrope.LayoutAlign 
	 * 
	 * @author YanQ
	 */
	internal class SortLayer
	{ 
		public static const LAYOUT_U:int=0;
		public static const LAYOUT_L:int=1;
		public static const LAYOUT_RB:int=2;
		private var _type:int = 0;
		private var sortList:Array = new Array();
		private var _sourceContainer:DisplayObjectContainer;
		
		private var offsetY:int = -DecorCtrl.CONTAINER_HEIGHT;
		private var offsetX:int = 0;
		
		public function SortLayer( sourceContainer:DisplayObjectContainer, type:int )
		{
			_sourceContainer = sourceContainer;
			_type = type;
			
			init();
		}
		
		private function init():void
		{
			switch ( _type )
			{
				case LAYOUT_L:
					offsetY = 0;
					break;
			}
		}
		
		public function Dispose():void
		{
			removeAll();
			_sourceContainer = null;
			sortList = null;
		}
		
		/**
		 * 添加一个组件到顶区域 
		 * @param obj ，目标对象
		 * @param sortLevel 排列层级， -1表示默认往上添加, 0表示最低层
		 */		
		public function add( obj:DisplayObject, sortLevel:int = -1, pos:Point = null, gap:int = 0 ):void
		{
			if ( _sourceContainer.contains(obj) )
				return;//排列只涉及坐标 已经有了的就不用remove再add了
			_sourceContainer.addChild( obj );
			obj.visible = _visible;
			sortList.unshift( new SortObject( obj, sortLevel ) );
			
			if ( sortLevel != -1 )
				sortLevelList();
			else
				layout(gap);	// -1直接往后排就行了 这里可以考虑存个offX或offY 直接定位
		}
		
		public function addNotSort( obj:DisplayObject, sortLevel:int = -1, pos:Point = null, gap:int = 0 ):void
		{
			if ( _sourceContainer.contains(obj) ) return;
			_sourceContainer.addChild( obj );
		}
		
		/**
		 * 移除单类布局中所有子项
		 * */
		public function removeAll():void		
		{
			while ( sortList.length )
			{
				var sobj:SortObject = sortList.shift() as SortObject;
				MCUtil.removeSelf( sobj.display );
			}
		}
		
		/**
		 * 删除一个组件 
		 * @param obj
		 */		
		public function remove( obj:DisplayObject ):void
		{
			var slayout:Boolean = false;
			
			var i:int = sortList.length;
			while ( --i > -1 )
			{
				if ( sortList[i].display == obj )
				{
					sortList.splice( i, 1 );
					MCUtil.removeSelf( obj );
					slayout = true;
					break;
				}
			}
			
			if ( slayout )
				layout();
		}
		
		public function sortLevelList():void
		{
			sortList.sortOn( "sortLevel", Array.NUMERIC); 
			layout();
		}
		
		private var _visible:Boolean = true;
		public function get visible():Boolean
		{
//			if ( sortList.length == 0 )
//				return false;
//			
//			for ( var i:int = 0; i < sortList.length; i ++ )
//			{
//				if ( sortList[i].display.visible == false )
//					return false;
//			}
//			return true;
			return _visible;
		}
		
		public function set visible(value:Boolean):void
		{
			for ( var i:int = 0; i < sortList.length; i ++ )
				sortList[i].display.visible = value;
			_visible = value;
		}
		
		public function set y(value:int):void
		{
			offsetY = value;
		}
		
		public function set x(value:int):void
		{
			offsetX = value;
		}
		
		public function layout(gap:int = 2):void
		{
			var i:int;
			var length:int = sortList.length;
			var display:DisplayObject;
			var disW:int;
			var disH:int;
			var offX:int;
			var offY:int;
			if ( _type ==LAYOUT_U )
			{
				offY = offsetY;
				i = length;
				while ( --i > -1 )
				{
					display = sortList[i].display;
					display.x = offsetX-display.width * .5;
					offY -= display.height + gap;
					display.y = offY;
				}
			}
			else if ( _type ==LAYOUT_RB )
			{
				offX = offsetX;
				i = length;
				while ( --i > -1 )
				{
					display = sortList[i].display;
					display.y = offsetY-display.height;
					display.x = offX;
					offX += display.width;
					trace("mingzi1 :"+display+":"+display.x+"_"+display.y);
				}
			}
			else if ( _type == LAYOUT_L )
			{
				offX = offsetX;
				i = length;
				while ( --i > -1 )
				{
					display = sortList[i].display;
					if( sortList[i].sizePos )
					{
						disW = sortList[i].sizePos.x;
						disH = sortList[i].sizePos.y;
					}
					else
					{
						disW = display.width;
						disH = display.height;
					}
					offX -= disW;
					display.y = offsetY;
					display.x = offX;
					trace("mingzi2 :"+display+":"+display.x+"_"+display.y);
				}
			}
		}
	}
}

 
import flash.geom.Point;
import starling.display.DisplayObject;

internal class SortObject
{
	private var _display:DisplayObject = null;
	private var _sortLevel:int = 0;
	private var _sizePos:Point = null;
	
	public function SortObject( d:DisplayObject, level:int, pos:Point = null )
	{
		_display = d;
		_sortLevel = level;
		_sizePos = pos;
	}
	
	public function get sortLevel():int
	{
		return _sortLevel;
	}
	
	public function get display():DisplayObject
	{
		return _display;
	}
	
	public function get sizePos():Point
	{
		return _sizePos;
	}
}