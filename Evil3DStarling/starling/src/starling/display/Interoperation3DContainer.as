package starling.display
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import away3d.arcane;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.core.managers.Stage3DProxy;
	import away3d.core.traverse.EntityCollector;
	
	import starling.rendering.Painter;
	import starling.utils.RectangleUtil;
	
	use namespace arcane;
	public class Interoperation3DContainer extends DisplayObject
	{
		private var _view3D:View3D;
		private var _scisssorRect:Rectangle;
		private var _hitArea:Rectangle;
		private var _scene:Scene3D;
		private var _entityCollector:EntityCollector;
		private var _root:ObjectContainer3D;
		private static var _localPoint:Point = new Point();
		private static var _globalPoint:Point = new Point();
		private static var _stageViewPort:Rectangle = new Rectangle();
		private static var _intersectionRect:Rectangle = new Rectangle();
		private static var _globalScisssorRect:Rectangle = new Rectangle();
		
		private var _painter:Painter;
		
		public function Interoperation3DContainer(view3D:View3D)
		{
			super();
			_view3D = view3D;
			_scene = new Scene3D;
			_scene.view = _view3D;
			_entityCollector = new EntityCollector();
			_root = new ObjectContainer3D();
			_scene.addChild(_root);
		}
		
		override public function getBounds(targetSpace:DisplayObject, resultRect:Rectangle=null):Rectangle
		{
			resultRect ||= new Rectangle(0,0,0,0);	
			_hitArea ? resultRect.setTo(_hitArea.x, _hitArea.y, _hitArea.width, _hitArea.height) : resultRect.setEmpty();
			return resultRect;
		}
		
		public function addChild3D(child:ObjectContainer3D):ObjectContainer3D
		{
			return _root.addChild(child);
		}
		
		public function removeChild3D(child:ObjectContainer3D):void
		{
			_root.removeChild(child);
		}
		
		public function get view3D():View3D
		{
			return _view3D;
		}
		
		public function set view3D(value:View3D):void
		{
			_view3D = value;
		}
		
		public function get scisssorRect():Rectangle
		{
			return _scisssorRect;
		}
		
		public function set scisssorRect(value:Rectangle):void
		{
			_scisssorRect = value;
		}
		
		public function set hitArea(value:Rectangle):void
		{
			_hitArea = value;
		}
		
		public override function render(painter:Painter):void
		{
			_painter = painter;
			
			localToGlobal(_localPoint,_globalPoint);
			_root.y = _view3D.height - _globalPoint.y;
			_root.x = _globalPoint.x;
			
			var stage3DProxy:Stage3DProxy = _view3D.stage3DProxy;
			_entityCollector.camera = _view3D.camera;
			_entityCollector.clear();
			
			CONFIG::Scene_Entity_Collect_Debug
				{
					var time:int = getTimer();
				}
				_scene.traversePartitions(_entityCollector, _view3D);
			_entityCollector.sortRenderables();
			_view3D.updateLights(_entityCollector,_view3D);
			CONFIG::Scene_Entity_Collect_Debug
				{
					trace("traversePartitions in Interoperation3DContainer::render : " + (getTimer() - time) + "ms");
				}

			if(_entityCollector._entities.length > 0)
			{
				_painter.finishMeshBatch();
				_painter.renderInter3D(this);
				_painter.stencilReferenceValue = _painter.stencilReferenceValue;
			}
			else
				_entityCollector.cleanUp();
			
			
		}
		
		public function doRender():void
		{
			var stage3DProxy:Stage3DProxy = _view3D.stage3DProxy;
			stage3DProxy.clearGPUStatus();
			stage3DProxy.clearDepthAndStencilBuffer();
			
			if(_scisssorRect)
			{
				_stageViewPort.setTo(0, 0, stage3DProxy.width, stage3DProxy.height);
				_globalScisssorRect.setTo(_globalPoint.x +_scisssorRect.x , _globalPoint.y+_scisssorRect.y, _scisssorRect.width, _scisssorRect.height);
				var intersectionRect:Rectangle = RectangleUtil.intersect(_globalScisssorRect, _stageViewPort, _intersectionRect);
			}
			if(!_scisssorRect)
			{
				_view3D.renderer.render(_entityCollector, _view3D, null, null);
			}else if(intersectionRect && intersectionRect.width && intersectionRect.height){
				_view3D.renderer.render(_entityCollector, _view3D, null, intersectionRect);
			}
			_entityCollector.cleanUp();
			//还原starling渲染属性
			stage3DProxy.clearDepthAndStencilBuffer();
			_painter.clearForInteroperation();
		}
		
		protected function get root3D():ObjectContainer3D
		{
			return _root;
		}
		
		override public function dispose():void
		{
			super.dispose();
			if(_root)
			{
				while(_root.numChildren)_root.removeChildAt(0);
			}
			
			_view3D = null;
			_scene = null;
			_entityCollector = null;
			_root = null;
			if(this.parent)this.parent.removeChild(this);
		}
	}
}