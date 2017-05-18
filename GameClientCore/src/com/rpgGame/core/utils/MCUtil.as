package  com.rpgGame.core.utils
{

	import com.gameClient.utils.HashMap;
	
	import flash.geom.Point;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import feathers.controls.Label;
	import feathers.controls.List;
	
	import org.mokylin.skin.component.list.ListSkin1;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	

	
	/**
	 * @author Administrator
	 */
	public class MCUtil
	{
		
		
		
		
		public static function getSprChildNum(dis:DisplayObjectContainer):int
		{
			var num:int = dis.numChildren;
			for (var i:int = 0; i < dis.numChildren; i++)
			{
				var c:DisplayObjectContainer = dis.getChildAt(i) as DisplayObjectContainer;
				if (c != null)
				{
					num += getSprChildNum(c);
				}
			}
			
			return num;
		}
		
		/**
		 * 添加于前面
		 * 插入对象B的前面：容器.setChildIndex(对象A,容器.getChildIndex(对象B));
		 */
		public static function addBefore(con:DisplayObjectContainer, dis:DisplayObject, at:DisplayObject):void
		{
			if (con == null || dis == null || at == null)
				return;
			
			if (con.contains(at))
			{
				con.addChildAt(dis, con.getChildIndex(at));
			}
			else
			{
				con.addChild(dis);
			}
		}
		
		/**
		 * 添加唯一对象，移除其他的
		 */
		public static function addChildOnly(con:DisplayObjectContainer, dis:DisplayObject):void
		{
			removeAllChild(con);
			if (dis != null)
			{
				con.addChild(dis);
			}
		}
		
		/**
		 * 添加于后面
		 * 插入对象B的后面：容器.setChildIndex(对象A,容器.getChildIndex(对象B)-1);
		 */
		public static function addAfter(con:DisplayObjectContainer, dis:DisplayObject, at:DisplayObject):void
		{
			if (con == null || dis == null || at == null)
				return;
			
			con.addChild(dis);
			con.setChildIndex(dis, con.getChildIndex(at) - 1);
		}
		
		/**
		 * 后置
		 */
		public static function BringToBottom(mc:DisplayObject):void
		{
			if (mc == null)
				return;
			
			var parent:DisplayObjectContainer = mc.parent;
			if (parent == null)
				return;
			
			if (parent.getChildIndex(mc) != 0)
			{
				parent.setChildIndex(mc, 0);
			}
		}
		
		/**
		 * 前置
		 */	
		public static function BringToTop(mc:DisplayObject):void
		{
			if (mc == null)
				return;
			
			var parent:DisplayObjectContainer = mc.parent;
			if (parent == null)
				return;
			
			var maxIndex:int = parent.numChildren-1;
			if(parent.getChildIndex(mc) != maxIndex)
			{
				parent.setChildIndex(mc, maxIndex);
			}
		}
		
		/**
		 * 是否最前
		 */
		public static function isTop(mc:DisplayObject):Boolean
		{
			var parent:DisplayObjectContainer = mc.parent;
			if (parent == null)
				return true;
			return (parent.numChildren-1) == parent.getChildIndex(mc);
		}
		
		/**
		 * 是否最后
		 */
		public static function isBottom(mc:DisplayObject):Boolean{
			var parent:DisplayObjectContainer = mc.parent;
			if (parent == null)
				return true;
			var depth:int = parent.getChildIndex(mc);
			if (depth == 0)
			{
				return true;
			}
			return false;
		}
		
		/**
		 * 是否低于
		 */
		public static function isJustBelow(mc:DisplayObject, aboveMC:DisplayObject):Boolean
		{
			var parent:DisplayObjectContainer = mc.parent;
			if (parent == null)
				return false;
			
			if (aboveMC.parent != parent)
				return false;
			
			return parent.getChildIndex(mc) == parent.getChildIndex(aboveMC)-1;
		}
		
		/**
		 * 是否高于
		 */	
		public static function isJustAbove(mc:DisplayObject, belowMC:DisplayObject):Boolean
		{
			return isJustBelow(belowMC, mc);
		}
		
		/**
		 * 删除容器容器中指定类型的子节点 
		 * @param disc
		 * @param _type
		 * 
		 */		
		public static function removeTypeChild( disc:DisplayObjectContainer, _type:Class ):void
		{
			var delList:Vector.< DisplayObject > = getTypeChild(disc, _type);
			
			for each( var d:DisplayObject in delList )
			{
				disc.removeChild( d );
			}
		}
		
		/**
		 * 得到显示对象的某种类型的对象 
		 * @param disc
		 * @param _type
		 * 
		 */		
		public static function getTypeChild( disc:DisplayObjectContainer, _type:Class ):Vector.< DisplayObject > 
		{
			var list:Vector.< DisplayObject > = new Vector.<DisplayObject>();
			for ( var i:int = 0; i < disc.numChildren; i++ )
			{
				if ( disc.getChildAt( i ) is _type )
				{
					list.push( disc.getChildAt( i ) );
				}
			}
			
			return list;
		}
		
		/**
		 * 移除全部子
		 */
		public static function removeAllChild(disc:DisplayObjectContainer):void
		{
			if (disc == null)
				return;
			
			while (disc.numChildren > 0)
				disc.removeChildAt(0);
		}
		
		/**
		 * 移除自己
		 */
		public static function removeSelf(dis:DisplayObject):void
		{
			if (dis != null)
			{
				var disc:DisplayObjectContainer = dis.parent;
				if (disc != null && disc.contains(dis))
				{
					disc.removeChild(dis);
				}
			}
		}
		
		/**
		 * 得到舞台坐标
		 */
		public static function getStagePos(dis:DisplayObject):Point
		{
			var pt:Point = dis.localToGlobal(new Point(0, 0));
			
			return pt;
		}
		
		private static var isShake:Boolean = false;  
		/**
		 * 震动显示对象 
		 * @param dis
		 * @param times
		 * @param offset
		 * @param speed
		 * 
		 */
		public static function shakeMC(dis:DisplayObject,times:uint = 2,offset:uint = 4,speed:uint = 32):void 
		{  
			if (isShake) 
			{  
				return;  
			}  
			isShake = true;
			
			var point:Point = new Point(dis.x,dis.y);  
			var offsetXYArray:Array = [0,0];  
			var num:int = 0;  
			var u:int = setInterval(
				function():void 
				{  
					offsetXYArray[num % 2] = (num++) % 4 < 2 ? 0 : offset;  
					if (num > (times * 4 + 1))
					{  
						clearInterval(u);  
						num = 0;  
						isShake = false;  
					}  
					dis.x = offsetXYArray[0] + point.x;  
					dis.y = offsetXYArray[1] + point.y;  
				},
				speed);  
		}  
		
		/**
		 * 后置于一系列节点
		 */	
		public static function BringToBottomAt(mc:DisplayObject, arr:Array):void
		{
			if (arr == null || arr.length == 0)
				BringToBottom(mc);
			
			var parent:DisplayObjectContainer = mc.parent;
			if (parent == null)
				return;
			
			var idx:int = 999;
			for each(var dis:DisplayObject in arr)
			{
				if (dis.parent == parent)
				{
					var newidx:int = parent.getChildIndex(dis);
					if (newidx < idx)
					{
						idx = newidx;
					}
				}
			}
			
			if (idx != 999)
			{
				idx--;
				if (idx < 0)
				{
					idx = 0;
				}
				
				parent.setChildIndex(mc, idx);
			}
		}
		
		/**
		 * 得到显示对象全局坐标 
		 * @param ds
		 * @return 
		 * 
		 */
		public static function getMCGlobalPt(ds:DisplayObject):Point
		{
			var x:int = 0;
			var y:int = 0;
			
			while (ds != null)
			{
				x += ds.x;
				y += ds.y;
				ds = ds.parent;
			}
			
			return new Point(x, y);
		}
	
		/**
		 * 获取一个对象的相对位置
		 * @param curObj
		 * @param parent
		 * @return 
		 */		
		public static function GetRelativePos( curObj :DisplayObject, parent :DisplayObject ):Point
		{
			var pos :Point = new Point();
			
			while ( curObj != null && curObj != parent )
			{
				pos.x += curObj.x;
				pos.y += curObj.y;
				
				curObj = curObj.parent;
			}
			
			return pos;
		}
		/**
		 *合并hashmap,注意值只能相加 
		 * @param dstHash
		 * @param srcHash
		 * 
		 */		
		public static function mergeValueHashMap(dstHash:HashMap,srcHash:HashMap):void
		{
			if (!dstHash||!srcHash) 
			{
				return;
			}
			var keys:Array=srcHash.keys();
			var vald:int=0;
			var vals:int=0;
			for each (var key:* in keys) 
			{
				vald=dstHash.getValue(key);
				vals=srcHash.getValue(key);
				dstHash.put(key,vald+vals);
			}
			
		}
		public static function clonelab(lab:Label):Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.name =lab.name;
			temp.letterSpacing = lab.letterSpacing;
			temp.text = lab.text;
			temp.color =lab.color;
			temp.nativeFilters = lab.nativeFilters;
			temp.width = lab.width;
			temp.x = lab.x;
			temp.y = lab.y;
			return temp;
		}
	}
}