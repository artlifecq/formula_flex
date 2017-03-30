package com.rpgGame.app.ui.main.shortcut
{
	
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Mesh;
	import starling.geom.Polygon;
	import starling.rendering.IndexData;
	import starling.rendering.VertexData;
	
	public class DrawBow extends DisplayObjectContainer
	{
		private var _w:uint;
		private var _h:uint;
		private var _polygons:Vector.<Polygon>;
		private var _fillColor:uint;
		private var _fillAlpha:Number;
		public function DrawBow(w:uint=10,h:uint = 10,color:uint = 0x000000,alpha:Number= 1.0):void
		{
			_w = w;
			_h = h;
			_fillColor = color;
			_fillAlpha = alpha;
			_polygons = new Vector.<Polygon>();
			touchGroup = true;
			super();
		}
		
		override public function dispose():void
		{
			_polygons.length = 0;
			super.dispose();
		}
		public function drawAngle(startAngle:Number,endAngle:Number):void
		{
			appendPolygon( new Bow(0,0, _w, _h,startAngle, endAngle));
		}
		public function clear():void
		{
			removeChildren(0,-1,true);
			_polygons.length = 0;
		}
		public override function hitTest(localPoint:Point):DisplayObject
		{
			if (!visible || !touchable || !hitTestMask(localPoint)) return null;
			
			// we could also use the standard hit test implementation, but the polygon class can
			// do that much more efficiently (it contains custom implementations for circles, etc).
			
			for (var i:int = 0, len:int = _polygons.length; i < len; ++i)
				if (_polygons[i].containsPoint(localPoint)) return this;
			
			return null;
		}
		private function appendPolygon(polygon:Polygon):void
		{
			var vertexData:VertexData = new VertexData();
			var indexData:IndexData =polygon.triangulate(null);
			polygon.copyToVertexData(vertexData);
			
			vertexData.colorize("color", _fillColor, _fillAlpha);
			
			addChild(new Mesh(vertexData, indexData));
			_polygons[_polygons.length] = polygon;
		}
		
	}
}
import flash.errors.IllegalOperationError;
import flash.utils.getQualifiedClassName;

import starling.geom.Polygon;
import starling.rendering.IndexData;
class ImmutablePolygon extends Polygon
{
	private var _frozen:Boolean;
	
	public function ImmutablePolygon(vertices:Array)
	{
		super(vertices);
		_frozen = true;
	}
	
	override public function addVertices(...args):void
	{
		if (_frozen) throw getImmutableError();
		else super.addVertices.apply(this, args);
	}
	
	override public function setVertex(index:int, x:Number, y:Number):void
	{
		if (_frozen) throw getImmutableError();
		else super.setVertex(index, x, y);
	}
	
	override public function reverse():void
	{
		if (_frozen) throw getImmutableError();
		else super.reverse();
	}
	
	override public function set numVertices(value:int):void
	{
		if (_frozen) throw getImmutableError();
		else super.reverse();
	}
	
	private function getImmutableError():Error
	{
		var className:String = getQualifiedClassName(this).split("::").pop();
		var msg:String = className + " cannot be modified. Call 'clone' to create a mutable copy.";
		return new IllegalOperationError(msg);
	}
}

class Bow extends ImmutablePolygon
{
	private var _x:Number;
	private var _y:Number;
	private var _width:Number;
	private var _height:Number;
	private var _startAngle:Number;
	private var _endAngle:Number;
	private var _changeAngle:Number;
	private var _indexList:Vector.<int>;
	private var _topIndex:int = 0;
	public function Bow(x:Number, y:Number, width:Number, height:Number,startAngle:Number,endAngle:Number):void
	{
		_x = x;
		_y = y;
		_width = width;
		_height = height;
		_changeAngle = Math.atan(_height/_width);
		_startAngle = startAngle;
		_endAngle = endAngle;
		super(getVertices());
	}
	
	private function getVertices():Array
	{
		var numSides:int = Math.PI * (_width + _height) / 4.0;
		if (numSides < 6) numSides = 6;
		
		while(_startAngle>_endAngle)
		{
			_endAngle +=Math.PI*2;
		}
		var vertices:Array = [];
		var distanceAngle:Number = _endAngle - _startAngle;
		numSides = Math.ceil(numSides*distanceAngle/(2*Math.PI));
		var angleDelta:Number =distanceAngle / numSides;
		var angle:Number = _startAngle;
		vertices[0] = _x;
		vertices[1] = _y;
		for (var i:int=1; i<=numSides; ++i)
		{
			vertices[i * 2] = Math.cos(angle) * _width + _x;
			vertices[i * 2 + 1] = Math.sin(angle) * _height + _y;
			angle += angleDelta;
		}
		
		return vertices;
	}
	
	override public function triangulate(indexData:IndexData=null, offset:int=0):IndexData
	{
		if (indexData == null) indexData = new IndexData((numVertices - 2) * 3);
		
		var from:uint = 1;
		var to:uint = numVertices - 1;
		
		for (var i:int=from; i<to; ++i)
			indexData.addTriangle(offset, offset + i, offset + i + 1);
		
		return indexData;
	}

	override public function contains(x:Number, y:Number):Boolean
	{
		return x >= _x && x <= _x + _width &&y >= _y && y <= _y + _height;
	}
	
	override public function get area():Number
	{
		return _width * _height;
	}
	
	override public function get isSimple():Boolean
	{
		return true;
	}
	
	override public function get isConvex():Boolean
	{
		return true;
	}
}
