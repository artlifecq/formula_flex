package com.rpgGame.core.utils
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.rpgGame.core.app.enum.PanelPosType;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import flash.geom.Point;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Shape;
	
	public class UIUtil
	{
		
		public function UIUtil()
		{
		}
		
		public static function getCircleSp(radius:Number,color:uint = 0x000000,alpha:Number = 1):Shape
		{
			var sp:Shape = new Shape();
			sp.graphics.beginFill(color,alpha);
			sp.graphics.drawCircle(0,0,radius);
			sp.graphics.endFill();
			return sp;
		}
		
		/**
		 * 
		 * @param content 弹出显示对象
		 * @param parent 显示对象所在父容器
		 * @param popAtX 相对于父容器弹出点x
		 * @param popAtY 相对于父容器弹出点y
		 * @param posType 方向 见PanelPosType
		 * @param offx 横向偏移
		 * @param offy 纵向偏移
		 * 
		 */		
		public static function popup(content:DisplayObject, parent:DisplayObjectContainer, popAtX:int, popAtY:int, posType:int, offx:int=0, offy:int=0):void
		{
			var xx : int, yy : int;
			var sw:int = parent ? parent.width : Starling.current.stage.stageWidth;
			var sh:int = parent ? parent.height : Starling.current.stage.stageHeight;
			
			switch (posType)
			{
				case PanelPosType.MIDDLE_CENTRAL:
					xx = popAtX - content.width/2 + offx;
					yy = popAtY - content.height/2 + offy;
					break;
				case PanelPosType.MIDDLE_LEFT:
					xx = popAtX - content.width -offx;
					yy = popAtY - content.height/ 2 - offy;
					break;
				case PanelPosType.MIDDLE_RIGHT:
					xx = popAtX + offx;
					yy =  popAtY - content.height/ 2 - offy;
					break;
				case PanelPosType.TOP_CENTRAL:
					xx = popAtX - content.width/2 - offx;
					yy = popAtY - content.height - offy;
					break;
				case PanelPosType.TOP_LEFT:
					xx = popAtX- content.width - offx;
					yy = popAtY- content.height -offy;
					break;
				case PanelPosType.TOP_RIGHT:
					xx = popAtX + offx;
					yy = popAtY - content.height - offy;
					break;
				case PanelPosType.BOTTOM_CENTRAL:
					xx = popAtX - content.width/2 + offx;
					yy = popAtY + offy;
					break;
				case PanelPosType.BOTTOM_LEFT:
					xx = popAtX - content.width - offx;
					yy = popAtY  + offy;
					break;
				case PanelPosType.BOTTOM_RIGHT:
					xx = popAtX + offx;
					yy = popAtY + offy;
					break;
			}
			content.x = xx;
			content.y = yy;
			if(parent != null)
			{
				parent.addChild(content);
			}
		}
		
		public static function addDisplayObject(dis:DisplayObject, parent:DisplayObjectContainer, x:Number, y:Number, width:Number=0, height:Number=0, index:int=-1):DisplayObject
		{
			dis.x = x;
			dis.y = y;
			if(width)
				dis.width = width;
			if(height)
				dis.height = height;
			if(index < 0)
				parent.addChild(dis);
			else
				parent.addChildAt(dis,index);
			return dis;
		}
		
		public static function getLinkText(text:String, event:String):String
		{
			return "<u><a href='event:"+event+"'>"+text+"</a></u>";
		}
		
		/**
		 * 清除字符串中的空格
		 * @param str
		 * @return 
		 */
		public static function trim(str:String):String
		{
			var result:String = str;
			while(result.indexOf(" ") != -1)
			{
				result = result.replace(" ","");
			}
			return result;
		}
		
		/**
		 * 
		 * 画一个扇形
		* mc the movieclip: the container of the sector.
		* x,y the center position of the sector
		* r the radius of the sector
		* angle the angle of the sector
		* startFrom the start degree counting point : 270 top, 180 left, 0 right, 90 bottom , 
		* it is counting from top in this example. 
		* color the fil lin color of the sector
		*/
/*		public static function drawSector(g:Graphics,x:Number=200,y:Number=200,r:Number=100,angle:Number=27,startFrom:Number=270,color:Number=0xff0000):void {
			
			g.clear();
			g.beginFill(color);
			g.moveTo(x,y);
			angle = (Math.abs(angle) > 360 ) ? 360 : angle;
			var n:Number = Math.ceil(Math.abs(angle) / 45 );
			var angleA:Number= angle / n;
			angleA = angleA * Math.PI / 180;
			startFrom = startFrom * Math.PI / 180;
			g.lineTo(x + r * Math.cos(startFrom),y + r * Math.sin(startFrom));
			for (var i:int = 1; i <= n; i++) 
			{
				startFrom += angleA;
				var angleMid:Number = startFrom - angleA / 2;
				var bx:Number = x + r / Math.cos(angleA / 2) * Math.cos(angleMid);
				var by:Number = y + r / Math.cos(angleA / 2) * Math.sin(angleMid);
				var cx:Number = x + r * Math.cos(startFrom);
				var cy:Number = y + r * Math.sin(startFrom);
				g.curveTo(bx,by,cx,cy);
			}
			if (angle!=360) 
			{
				g.lineTo(x,y);
			}
			g.endFill();// if you want a sector without filling color , please remove this line.
		}*/
		
		public static function alignToStageCenter(dis:DisplayObject):void
		{
			if(dis == null)
			{
				return;
			}
			dis.x = (LayerManager.stage.stageWidth - dis.width) / 2;
			dis.y = (LayerManager.stage.stageHeight - dis.height) / 2;
		}
		
		public static function alignToStageRightCenter(dis:DisplayObject):void
		{
			if(dis == null)
			{
				return;
			}
			dis.x = LayerManager.stage.stageWidth - dis.width;
			dis.y = (LayerManager.stage.stageHeight - dis.height) / 2;
		}
		public static function alignToStageRightBottom(dis:DisplayObject):void
		{
			if(dis == null)
			{
				return;
			}
			dis.x = LayerManager.stage.stageWidth - dis.width;
			dis.y = LayerManager.stage.stageHeight - dis.height - 100;
		}
		
		public static function showToCenter(disp:DisplayObject):void
		{
			if(!disp)return;
			if(disp.stage == null)
			{
				StarlingLayerManager.appUILayer.addChild(disp);
			}
			disp.x =int( (disp.stage.stageWidth - disp.width)/2);
			disp.y =int( (disp.stage.stageHeight - disp.height)/2);
		}
		
		public static function alignToParentCenter(dis:DisplayObject):void
		{
			if(dis == null)
			{
				return;
			}
			if(dis.parent == null)
			{
				return 
			}
			dis.x = (dis.parent.width - dis.width) / 2;
			dis.y = (dis.parent.height - dis.height) / 2;
		}
		
		/**
		 * 修改显示对象的注册中心到显示对象的中心，
		 * 使显示对象的rotation时能够沿着注册的中心点旋转
		 * @param $obj
		 * @param $point
		 * 
		 */		
		public static function updateRegPointToCenter(displayObj:DisplayObject):void
		{
			updateRegPoint(displayObj,new Point(displayObj.width / 2, displayObj.height / 2))
		}
		
		/**
		 * 修改显示对象的注册中心
		 * 使显示对象的rotation时能够沿着注册的中心点旋转
		 * @param $obj
		 * @param $point
		 * 
		 */		
		public static function updateRegPoint(displayObj:DisplayObject, regPoint:Point):void
		{
			if(displayObj)
			{
				var tmpPoint:Point = displayObj.parent.globalToLocal(displayObj.localToGlobal(regPoint));
				if(displayObj is DisplayObjectContainer)
				{
					var len:int = DisplayObjectContainer(displayObj).numChildren;
					while (len--)
					{
						var tmp_obj:DisplayObject = DisplayObjectContainer(displayObj).getChildAt(len);
						tmp_obj.x -=  regPoint.x;
						tmp_obj.y -=  regPoint.y;
					}
				}
				displayObj.x = tmpPoint.x;
				displayObj.y = tmpPoint.y;
			}
		}
		
	}
}