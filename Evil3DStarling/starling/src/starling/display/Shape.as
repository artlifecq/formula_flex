package starling.display
{
	import flash.geom.Point;
	
	import starling.geom.Polygon;
	import starling.utils.Pool;

	/**
	 * 兼容老项目 
	 * @author wewell@163.com
	 * 
	 */	
	public class Shape extends Canvas
	{
		private var _lineThickness:Number;
		private var _startX:Number;
		private var _startY:Number;
		
		public function Shape()
		{
			super();
		}
		
		public function get graphics():Shape
		{
			return this;
		}
		
		public function lineStyle(thickness:Number = 1.0,  color:uint = 0, alpha:Number=1.0):void
		{
			_lineThickness = thickness;
			this.beginFill(color, alpha);
		}
		
		public function drawRect(x:Number, y:Number, width:Number, height:Number):void
		{
			super.drawRectangle(x, y, width, height);
		}
		
		public function drawRoundRect(x:Number, y:Number, width:Number, height:Number, radios:int=0):void
		{
			super.drawRectangle(x, y, width, height);
		}
		
		/** Removes all existing vertices. */
		override public function clear():void
		{
			super.clear();
			if(_line)_line.length = 0;
		}
		
		public function moveTo(x:Number, y:Number):void
		{
			_startX = x;
			_startY = y;
			
			if(_line == null)
			{
				_line =  []
			}
			_line.length = 0;
			var p:Point = Pool.getPoint(x,y);
			_line.push(p);
		}
		
		private var _line:Array;
		public function lineTo(x:Number, y:Number):void
		{
			var vertices:Array =  [];
			var indices:Array = [];
			var p:Point = Pool.getPoint(x,y);
			_line.push(p);
			
			creatLineVertices(_line, _lineThickness, vertices);
			while(_line.length)Pool.putPoint(_line.pop());
			
			var polygon:Polygon = new Polygon(vertices);
			drawPolygon(polygon);
			
			moveTo(x, y);
		}
		
		///////////////////////////////////
		// Static helper methods
		///////////////////////////////////
		[inline]
		protected static function creatLineVertices( _line:Array, thickness:Number,  vertices:Array=null):Array 
		{
			if(!vertices)vertices = [];
			
			const PI:Number = Math.PI;
			var lastD0:Number = 0;
			var lastD1:Number = 0;
			var degenerate:uint = 0;
			var idx:uint = 0;
			var treatAsFirst:Boolean;
			var treatAsLast:Boolean;
			var startIndex : int = 0;
			var vertCounter:int = startIndex;
			var indiciesCounter:int = startIndex;
			var prevV1xPos:Number = 0.0;
			var prevV1xNeg:Number = 0.0;
			var prevV1yPos:Number = 0.0;
			var prevV1yNeg:Number = 0.0;
			var usePreviousVertPositionsOnNextLoop:Boolean = false;
			var usePreviousVertPositions:Boolean = false;
			var numVertices:int = _line.length;
			
			
			for ( var i:int = startIndex; i < numVertices; i++ )
			{
				idx = i;
				treatAsFirst = (idx == 0);
				treatAsLast = ( idx == numVertices - 1 )
				if ( usePreviousVertPositionsOnNextLoop )
				{
					usePreviousVertPositionsOnNextLoop = false;
					usePreviousVertPositions = true;
				}
				else 
					usePreviousVertPositions = false;
				
				var treatAsRegular:Boolean = treatAsFirst == false && treatAsLast == false;
				
				var idx0:uint = treatAsFirst ? idx : ( idx - 1 );
				var idx2:uint = treatAsLast ? idx : ( idx + 1 );
				
				var v0:Point = _line[idx0];
				var v1:Point = _line[idx];
				var v2:Point = _line[idx2];
				
				var vThickness:Number = thickness;
				
				var v0x:Number = v0.x;
				var v0y:Number = v0.y;
				var v1x:Number = v1.x;
				var v1y:Number = v1.y;
				var v2x:Number = v2.x;
				var v2y:Number = v2.y;
				
				var d0x:Number = v1x - v0x;
				var d0y:Number = v1y - v0y;
				var d1x:Number = v2x - v1x;
				var d1y:Number = v2y - v1y;
				
				if ( treatAsRegular == false )
				{
					if ( treatAsLast )
					{
						v2x += d0x;
						v2y += d0y;
						
						d1x = v2x - v1x;
						d1y = v2y - v1y;
					}
					
					if ( treatAsFirst )
					{
						v0x -= d1x;
						v0y -= d1y;
						
						d0x = v1x - v0x;
						d0y = v1y - v0y;
					}
				}
				
				var d0:Number = Math.sqrt( d0x*d0x + d0y*d0y );
				var d1:Number = Math.sqrt( d1x*d1x + d1y*d1y );
				
				var elbowThickness:Number = vThickness*0.5;
				if ( treatAsRegular )
				{
					if ( d0 == 0 )
						d0 = lastD0;
					else
						lastD0 = d0;
					
					if ( d1 == 0 )
						d1 = lastD1;
					else
						lastD1 = d1;
					
					// Thanks to Tom Clapham for spotting this relationship.
					var dot:Number = (d0x * d1x + d0y * d1y) / (d0 * d1);
					var arcCosDot:Number = Math.acos(dot);
					elbowThickness /= Math.sin( (PI-arcCosDot) * 0.5);
					
					if ( elbowThickness != elbowThickness ) // faster NaN comparison
					{
						elbowThickness = vThickness*0.5;
					}
					else if ( elbowThickness > vThickness * 4 )
					{
						elbowThickness = vThickness * 4;
					}
					if ( dot <= 0 && d1 < vThickness * 0.5)
					{
						usePreviousVertPositionsOnNextLoop = true;
					}
				}
				else
				{
					lastD0 = d0;
					lastD1 = d1;
				}
				
				var n0x:Number = -d0y / d0;
				var n0y:Number =  d0x / d0;
				var n1x:Number = -d1y / d1;
				var n1y:Number =  d1x / d1;
				
				var cnx:Number = n0x + n1x;
				var cny:Number = n0y + n1y;
				
				var c:Number = (1/Math.sqrt( cnx*cnx + cny*cny )) * elbowThickness;
				cnx *= c;
				cny *= c;
				
				var v1xPos:Number = v1x + cnx;
				var v1yPos:Number = v1y + cny;
				var v1xNeg:Number = ( degenerate ) ? v1xPos : ( v1x - cnx );
				var v1yNeg:Number = ( degenerate ) ? v1yPos : ( v1y - cny );
				
				//把一个点分解成相临的两个点, 并且保证顶点顺序为(0,1,2,0,2,3);
				if(int(vertCounter/4) % 2 == 0)
				{
					//p1
					vertices[vertCounter++] = usePreviousVertPositions == false ? v1xPos : prevV1xPos;
					vertices[vertCounter++] = usePreviousVertPositions == false ? v1yPos : prevV1yPos;
					
					//p2
					vertices[vertCounter++] = v1xNeg;
					vertices[vertCounter++] = v1yNeg;
				}else
				{
					//p2
					vertices[vertCounter++] = v1xNeg;
					vertices[vertCounter++] = v1yNeg;
					
					//p1
					vertices[vertCounter++] = usePreviousVertPositions == false ? v1xPos : prevV1xPos;
					vertices[vertCounter++] = usePreviousVertPositions == false ? v1yPos : prevV1yPos;
				}
				
				prevV1xPos = v1xPos;
				prevV1xNeg = v1xNeg;
				prevV1yPos = v1yPos;
				prevV1yNeg = v1yNeg;
			}
			return vertices;
		}
	}
}