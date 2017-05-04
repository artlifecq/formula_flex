package starling.core
{
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Mesh;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.Pool;
	
	/**
	 *  A box that displays the current framerate, all starling meshs triangularization stats in the stage
     *  The display is updated automatically once per frame
	 * @author WEWELL
	 * 
	 */	
	public class MeshStatsDisplay extends Sprite
	{
		public function MeshStatsDisplay()
		{
			isDebugStats = true;
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
					_stackMesh.removeFromParent();
				}
				return;
			}
			
			if(!_stackMesh)
			{
				_stackMesh = new Shape();
				_stackMesh.lineStyle(5, 0xFF0000);
				_stackMesh.moveTo(0,0);
				_stackMesh.lineTo(40,0);
				_stackMesh.moveTo(0,0);
				_stackMesh.lineTo(0,40);
			}
			
			var pos:Array = _maxStackKey.split(",");
			 _stackMesh.x = int(pos[0]);
			 _stackMesh.y = int(pos[1]);
			 
			 this.addChild(_stackMesh);
		}
		
		private function updateTriangles():void
		{
			_numStageMeshs = 0;
			_maxStack = 0;
			
			_stacks = new Dictionary();
			drawTriangles(Starling.current.stage);
			
			_curNumStageMeshs = _numStageMeshs;
			_curMaxStack = _maxStack;
			
			updateMaxStackStats();
		}
		
		private function drawTriangles(container:DisplayObjectContainer):void
		{
			var len:int = container.numChildren;
			var p:Point = Pool.getPoint();
			var out:Point =Pool.getPoint();
			var state:Shape;
			var hasVisibleArea:Boolean;
			for (var i:int=0; i<len; i++)
			{
				var mesh:DisplayObject = container.getChildAt(i);
				if(mesh is DisplayObjectContainer)
				{
					if(mesh.isDebugStats)
					{
						continue;
					}
					drawTriangles(mesh as DisplayObjectContainer);
				}else if(mesh is Mesh)
				{
					p.setTo(this.x, this.y);
					mesh.localToGlobal(p, out);
					state = Mesh(mesh).getMeshStats();
					if(!state)continue;
					
					state.x = out.x;
					state.y = out.y;
					
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
					
					if(state.parent == null)	this.addChild(state);
					
					if(!mesh.hasEventListener(Event.REMOVED_FROM_STAGE, onMeshRemoveFromStage))
						mesh.addEventListener(Event.REMOVED_FROM_STAGE, onMeshRemoveFromStage);
				}
			}
			
			Pool.putPoint(p);
			Pool.putPoint(out)	
		}
		
		private function onMeshRemoveFromStage(e:Event):void
		{
			var mesh:Mesh = e.currentTarget as Mesh;
			mesh.removeEventListener(Event.REMOVED_FROM_STAGE, onMeshRemoveFromStage);
			var state:Shape = mesh.getMeshStats();
			if(state != null)state.removeFromParent();
		}
		
		private var _x:int, _y:int;
		private var _maxStack:Number, _maxStackKey:String, _curMaxStack:Number, _stackMesh:Shape;
		private var _numStageMeshs:Number, _curNumStageMeshs:Number;
		
		private var _stacks:Dictionary, _stackKey:String;
		
		public function get maxStack():Number{return _curMaxStack};
		public function get numStageMeshs():Number{return _curNumStageMeshs};
	}
}
