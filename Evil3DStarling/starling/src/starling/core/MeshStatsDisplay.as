package starling.core
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Mesh;
	import starling.utils.Pool;
	
	/**
	 *  A box that displays the current framerate, all starling meshs triangularization stats in the stage
     *  The display is updated automatically once per frame
	 * @author WEWELL
	 * 
	 */	
	public class MeshStatsDisplay extends flash.display.Sprite
	{
		private var canvas:flash.display.Shape;
		
		public function MeshStatsDisplay()
		{
			canvas = new flash.display.Shape();
			this.addChild(canvas);
			this.mouseEnabled = this.mouseChildren = false;
			
			addEventListener(Event.ADDED_TO_STAGE,_addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE,_removeFromStage);
		}
		
		private function _addedToStage(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function _removeFromStage(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void
		{
			updateTriangles();
		}
		
		private function updateMaxStackStats():void
		{
			if(_curMaxStack < 5)
			{
				if(_stackMesh && _stackMesh.parent)
				{
					_stackMesh.parent.removeChild(_stackMesh);
				}
				return;
			}
			
			if(!_stackMesh)
			{
				_stackMesh = new Shape();
				_stackMesh.graphics.lineStyle(5, 0xFF0000);
				_stackMesh.graphics.moveTo(0,0);
				_stackMesh.graphics.lineTo(40,0);
				_stackMesh.graphics.moveTo(0,0);
				_stackMesh.graphics.lineTo(0,40);
			}
			
			var pos:Array = _maxStackKey.split(",");
			 _stackMesh.x = int(pos[0]);
			 _stackMesh.y = int(pos[1]);
			 
			 this.addChild(_stackMesh);
		}
		
		private function updateTriangles():void
		{
			canvas.graphics.clear();
			
			_numStageMeshs = 0;
			_maxStack = 0;
			
			_stacks = {};
			drawTriangles(Starling.current.stage);
			
			_curNumStageMeshs = _numStageMeshs;
			_curMaxStack = _maxStack;
			
			updateMaxStackStats();
		}
		
		private function drawTriangles(container:DisplayObjectContainer, parentVisible:Boolean=true, pSacleX:Number=1, pScaleY:Number=1):void
		{
			var len:int = container.numChildren;
			var p:Point = Pool.getPoint();
			var out:Point =Pool.getPoint();
			var g:Graphics = canvas.graphics;
			var color:uint = 0xFFFFFF;
			for (var i:int=0; i<len; i++)
			{
				var mesh:DisplayObject = container.getChildAt(i);
				
				if(mesh is DisplayObjectContainer)
				{
					drawTriangles(mesh as DisplayObjectContainer, mesh.visible && parentVisible && mesh.alpha > 0.0, mesh.scaleX, mesh.scaleY);
				}else if(mesh is Mesh)
				{
					p.setTo(this.x, this.y);
					mesh.localToGlobal(p, out);
					color = (parentVisible && mesh.visible && mesh.alpha > 0.0) ? 0xFF0000 : (mesh.alpha <=0.01 ? 0xFF00FF : 0x00FF00);
					g.lineStyle(1, color, 0.5, true);
					if(pSacleX < 0)out.x -= mesh.width;
					if(pScaleY < 0)out.y -= mesh.height;
					Mesh(mesh).drawMeshStats(g, out.x, out.y);
					
					_x = out.x;
					_y = out.y;
					
					_numStageMeshs++;
					_stackKey = _x + "," + _y;
					
					if(_stacks.hasOwnProperty(_stackKey))
					{
						_stacks[_stackKey]++;
						if(_maxStack < _stacks[_stackKey])
						{
							_maxStack = _stacks[_stackKey];
							_maxStackKey = _stackKey;
						}
					}else
					{
						_stacks[_stackKey] = 0;
					}
				}
			}
			
			Pool.putPoint(p);
			Pool.putPoint(out)	
		}
		
		private var _x:int, _y:int;
		private var _maxStack:Number, _maxStackKey:String, _curMaxStack:Number, _stackMesh:Shape;
		private var _numStageMeshs:Number, _curNumStageMeshs:Number;
		
		private var _stacks:Object, _stackKey:String;
		
		public function get maxStack():Number{return _curMaxStack};
		public function get numStageMeshs():Number{return _curNumStageMeshs};
	}
}
