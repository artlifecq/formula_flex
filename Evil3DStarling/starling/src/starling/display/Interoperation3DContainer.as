package starling.display
{
	import flash.display3D.Context3DBlendFactor;
	import flash.display3D.Context3DCompareMode;
	import flash.display3D.Context3DStencilAction;
	import flash.display3D.Context3DTriangleFace;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import away3d.arcane;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.core.managers.Stage3DProxy;
	import away3d.core.traverse.EntityCollector;
	import away3d.enum.StencilMask;
	
	import starling.rendering.Painter;
	
	use namespace arcane;
	public class Interoperation3DContainer extends DisplayObject
	{
		private var _view3D:View3D;
		private var _scene:Scene3D;
		private var _entityCollector:EntityCollector;
		private var _root:ObjectContainer3D;
		private static var _localPoint:Point = new Point();
		private static var _globalPoint:Point = new Point();
		
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
			return new Rectangle(0,0,0,0);	
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
		
		public override function render(painter:Painter):void
		{
			painter.finishMeshBatch();
			painter.pushState();
			
			painter.excludeFromCache(this);
			painter.popState();
			
			localToGlobal(_localPoint,_globalPoint);
			_root.y = _view3D.height - _globalPoint.y;
			_root.x = _globalPoint.x;
			
			var stage3DProxy:Stage3DProxy = _view3D.stage3DProxy;
			stage3DProxy.clearGPUStatus();
			stage3DProxy.clearDepthAndStencilBuffer();
			_entityCollector.camera = _view3D.camera;
			_entityCollector.clear();
			CONFIG::Scene_Entity_Collect_Debug
				{
					var time:int = getTimer();
				}
				_scene.traversePartitions(_entityCollector, _view3D);
			_entityCollector.sortRenderables();
			CONFIG::Scene_Entity_Collect_Debug
				{
					trace("traversePartitions in Interoperation3DContainer::render : " + (getTimer() - time) + "ms");
				}
			_view3D.renderer.render(_entityCollector, _view3D);
			_entityCollector.cleanUp();
			
			//还原starling渲染属性
			stage3DProxy.clearDepthAndStencilBuffer();
			painter.clearForInteroperation();
		}
		
		protected function get root3D():ObjectContainer3D
		{
			return _root;
		}
		
		override public function dispose():void
		{
			super.dispose();
			while(_root.numChildren)_root.removeChildAt(0);
			
			_view3D = null;
			_scene = null;
			_entityCollector = null;
			_root = null;
			if(this.parent)this.parent.removeChild(this);
		}
	}
}