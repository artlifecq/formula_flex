package away3d.core.managers
{
   import flash.utils.Dictionary;
   import away3d.containers.View3D;
   import away3d.core.pick.PickingCollisionVO;
   import away3d.events.MouseEvent3D;
   import flash.geom.Vector3D;
   import flash.events.MouseEvent;
   import away3d.core.pick.IPicker;
   import away3d.containers.ObjectContainer3D;
   import flash.display.Stage;
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import away3d.core.pick.PickingType;
   
   public class Mouse3DManager extends Object
   {
      
      private static var _view3Ds:Dictionary;
      
      private static var _view3DLookup:Vector.<View3D>;
      
      private static var _viewCount:int = 0;
      
      protected static var _collidingObject:PickingCollisionVO;
      
      private static var _previousCollidingObject:PickingCollisionVO;
      
      private static var _collidingViewObjects:Vector.<PickingCollisionVO>;
      
      private static var _queuedEvents:Vector.<MouseEvent3D> = new Vector.<MouseEvent3D>();
      
      private static var _mouseUp:MouseEvent3D = new MouseEvent3D("mouseUp3d");
      
      private static var _mouseClick:MouseEvent3D = new MouseEvent3D("click3d");
      
      private static var _mouseOut:MouseEvent3D = new MouseEvent3D("mouseOut3d");
      
      private static var _mouseDown:MouseEvent3D = new MouseEvent3D("mouseDown3d");
      
      private static var _mouseMove:MouseEvent3D = new MouseEvent3D("mouseMove3d");
      
      private static var _mouseOver:MouseEvent3D = new MouseEvent3D("mouseOver3d");
      
      private static var _mouseWheel:MouseEvent3D = new MouseEvent3D("mouseWheel3d");
      
      private static var _mouseDoubleClick:MouseEvent3D = new MouseEvent3D("doubleClick3d");
      
      private static var _rightMouseDown:MouseEvent3D = new MouseEvent3D("rightMouseDown3d");
      
      private static var _rightMouseUp:MouseEvent3D = new MouseEvent3D("rightMouseUp3d");
      
      private static var _rightClick:MouseEvent3D = new MouseEvent3D("rightClick3d");
      
      private static var _previousCollidingView:int = -1;
      
      private static var _collidingView:int = -1;
       
      private var _activeView:View3D;
      
      private var _updateDirty:Boolean = true;
      
      private var _nullVector:Vector3D;
      
      private var _mouseMoveEvent:MouseEvent;
      
      private var _forceMouseMove:Boolean;
      
      private var _mousePicker:IPicker;
      
      private var _childDepth:int = 0;
      
      private var _collidingDownObject:PickingCollisionVO;
      
      private var _collidingUpObject:PickingCollisionVO;
      
      private var _enabled:Boolean = true;
      
      public function Mouse3DManager()
      {
         _nullVector = new Vector3D();
         _mouseMoveEvent = new MouseEvent("mouseMove");
         _mousePicker = PickingType.RAYCAST_FIRST_ENCOUNTERED;
         super();
         if(!_view3Ds)
         {
            _view3Ds = new Dictionary();
            _view3DLookup = new Vector.<View3D>();
         }
      }
      
      public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      public function set enabled(value:Boolean) : void
      {
         _enabled = value;
      }
      
      public function cleanQuenedEvents() : void
      {
         _queuedEvents.length = 0;
      }
      
      public function updateCollider(view:View3D) : void
      {
         if(!_enabled)
         {
            return;
         }
         _previousCollidingView = _collidingView;
         if(view)
         {
            if(view.stage3DProxy.bufferClear)
            {
               _collidingViewObjects = new Vector.<PickingCollisionVO>(_viewCount);
            }
            if(view.getBounds(view.parent).contains(view.mouseX + view.x,view.mouseY + view.y))
            {
               if(!_collidingViewObjects)
               {
                  _collidingViewObjects = new Vector.<PickingCollisionVO>(_viewCount);
               }
               var _loc2_:* = _mousePicker.getViewCollision(view.mouseX,view.mouseY,view);
               _collidingViewObjects[_view3Ds[view]] = _loc2_;
               _collidingObject = _loc2_;
            }
         }
      }
      
      public function fireMouseEvents() : void
      {
         var i:* = 0;
         var len:* = 0;
         var event:* = null;
         var dispatcher:* = null;
         var distance:* = NaN;
         var view:* = null;
         var v:* = 0;
         if(!_enabled)
         {
            return;
         }
         if(_collidingViewObjects)
         {
            _collidingObject = null;
            distance = Infinity;
            for(v = _viewCount - 1; v >= 0; )
            {
               view = _view3DLookup[v];
               if(_collidingViewObjects[v] && (view.layeredView || _collidingViewObjects[v].rayEntryDistance < distance))
               {
                  distance = _collidingViewObjects[v].rayEntryDistance;
                  _collidingObject = _collidingViewObjects[v];
                  if(view.layeredView)
                  {
                     break;
                  }
               }
               v--;
            }
         }
         if(_collidingObject != _previousCollidingObject)
         {
            if(_previousCollidingObject)
            {
               queueDispatch(_mouseOut,_mouseMoveEvent,_previousCollidingObject);
            }
            if(_collidingObject)
            {
               queueDispatch(_mouseOver,_mouseMoveEvent,_collidingObject);
            }
         }
         if(_forceMouseMove && _collidingObject)
         {
            queueDispatch(_mouseMove,_mouseMoveEvent,_collidingObject);
         }
         len = _queuedEvents.length;
         for(i = 0; i < len; )
         {
            event = _queuedEvents[i];
            dispatcher = event.object;
            while(dispatcher && !dispatcher._ancestorsAllowMouseEnabled)
            {
               dispatcher = dispatcher.parent;
            }
            if(dispatcher)
            {
               dispatcher.dispatchEvent(event);
            }
            i++;
         }
         _queuedEvents.length = 0;
         _updateDirty = false;
         _previousCollidingObject = _collidingObject;
      }
      
      public function addViewLayer(view:View3D) : void
      {
         var stg:Stage = view.stage;
         if(!view.stage3DProxy.mouse3DManager)
         {
            view.stage3DProxy.mouse3DManager = this;
         }
         if(!hasKey(view))
         {
            _view3Ds[view] = 0;
         }
         _childDepth = 0;
         traverseDisplayObjects(stg);
         _viewCount = _childDepth;
         _collidingViewObjects = null;
      }
      
      public function enableMouseListeners(view:View3D) : void
      {
         view.addEventListener("click",onClick);
         view.addEventListener("doubleClick",onDoubleClick);
         view.addEventListener("mouseDown",onMouseDown);
         view.addEventListener("mouseMove",onMouseMove);
         view.addEventListener("mouseUp",onMouseUp);
         view.addEventListener("mouseWheel",onMouseWheel);
         view.addEventListener("mouseOver",onMouseOver);
         view.addEventListener("mouseOut",onMouseOut);
         view.addEventListener("rightMouseDown",onRightMouseDown);
         view.addEventListener("rightMouseUp",onRightMouseUp);
         view.addEventListener("rightClick",onRightClick);
      }
      
      public function disableMouseListeners(view:View3D) : void
      {
         view.removeEventListener("click",onClick);
         view.removeEventListener("doubleClick",onDoubleClick);
         view.removeEventListener("mouseDown",onMouseDown);
         view.removeEventListener("mouseMove",onMouseMove);
         view.removeEventListener("mouseUp",onMouseUp);
         view.removeEventListener("mouseWheel",onMouseWheel);
         view.removeEventListener("mouseOver",onMouseOver);
         view.removeEventListener("mouseOut",onMouseOut);
         view.removeEventListener("rightMouseDown",onRightMouseDown);
         view.removeEventListener("rightMouseUp",onRightMouseUp);
         view.removeEventListener("rightClick",onRightClick);
      }
      
      public function dispose() : void
      {
         _mousePicker.dispose();
      }
      
      private function queueDispatch(event:MouseEvent3D, sourceEvent:MouseEvent, collider:PickingCollisionVO = null) : void
      {
         event.ctrlKey = sourceEvent.ctrlKey;
         event.altKey = sourceEvent.altKey;
         event.shiftKey = sourceEvent.shiftKey;
         event.delta = sourceEvent.delta;
         event.screenX = sourceEvent.localX;
         event.screenY = sourceEvent.localY;
         if(!collider)
         {
            var collider:* = _collidingObject;
         }
         if(collider)
         {
            event.object = collider.entity;
            event.renderable = collider.renderable;
            event.uv = collider.uv;
            event.localPosition = collider.localPosition?collider.localPosition.clone():null;
            event.localNormal = collider.localNormal?collider.localNormal.clone():null;
            event.index = collider.index;
            event.subGeometryIndex = collider.subGeometryIndex;
         }
         else
         {
            event.uv = null;
            event.object = null;
            event.localPosition = _nullVector;
            event.localNormal = _nullVector;
            event.index = 0;
            event.subGeometryIndex = 0;
         }
         _queuedEvents.push(event);
      }
      
      private function reThrowEvent(event:MouseEvent) : void
      {
         var nextView:* = undefined;
         if(!_activeView)
         {
            return;
         }
         var _loc5_:* = 0;
         var _loc4_:* = _view3Ds;
         for(var v in _view3Ds)
         {
            if(v != _activeView && _view3Ds[v] < _view3Ds[_activeView])
            {
               if(v.mouseEnabled)
               {
                  if(!nextView || _view3Ds[v] > _view3Ds[nextView])
                  {
                     nextView = v;
                  }
               }
            }
         }
         if(nextView)
         {
            nextView.dispatchEvent(event);
         }
      }
      
      private function hasKey(view:View3D) : Boolean
      {
         var _loc4_:* = 0;
         var _loc3_:* = _view3Ds;
         for(var v in _view3Ds)
         {
            if(v === view)
            {
               return true;
            }
         }
         return false;
      }
      
      private function traverseDisplayObjects(container:DisplayObjectContainer) : void
      {
         var child:* = null;
         var childCount:int = container.numChildren;
         var c:* = 0;
         for(c = 0; c < childCount; )
         {
            child = container.getChildAt(c);
            var _loc7_:* = 0;
            var _loc6_:* = _view3Ds;
            for(var v in _view3Ds)
            {
               if(child == v)
               {
                  _view3Ds[child] = _childDepth;
                  _view3DLookup[_childDepth] = v;
                  _childDepth = _childDepth + 1;
               }
            }
            if(child is DisplayObjectContainer)
            {
               traverseDisplayObjects(child as DisplayObjectContainer);
            }
            c++;
         }
      }
      
      private function onMouseMove(event:MouseEvent) : void
      {
         if(_collidingObject)
         {
            _mouseMoveEvent = §§dup(event);
            queueDispatch(_mouseMove,event);
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      private function onMouseOut(event:MouseEvent) : void
      {
         _activeView = null;
         if(_collidingObject)
         {
            queueDispatch(_mouseOut,event,_collidingObject);
         }
         _updateDirty = true;
      }
      
      private function onMouseOver(event:MouseEvent) : void
      {
         _activeView = event.currentTarget as View3D;
         if(_collidingObject && _previousCollidingObject != _collidingObject)
         {
            queueDispatch(_mouseOver,event,_collidingObject);
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      private function onClick(event:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseClick,event);
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      private function onDoubleClick(event:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseDoubleClick,event);
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      private function onMouseDown(event:MouseEvent) : void
      {
         _activeView = event.currentTarget as View3D;
         updateCollider(_activeView);
         if(_collidingObject)
         {
            queueDispatch(_mouseDown,event);
            _previousCollidingObject = _collidingObject;
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      private function onMouseUp(event:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseUp,event);
            _previousCollidingObject = _collidingObject;
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      private function onRightMouseDown(event:MouseEvent) : void
      {
         _activeView = event.currentTarget as View3D;
         updateCollider(_activeView);
         if(_collidingObject)
         {
            queueDispatch(_rightMouseDown,event);
            _previousCollidingObject = _collidingObject;
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      private function onRightMouseUp(event:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_rightMouseUp,event);
            _previousCollidingObject = _collidingObject;
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      private function onRightClick(event:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_rightClick,event);
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      private function onMouseWheel(event:MouseEvent) : void
      {
         if(_collidingObject)
         {
            queueDispatch(_mouseWheel,event);
         }
         else
         {
            reThrowEvent(event);
         }
         _updateDirty = true;
      }
      
      public function get forceMouseMove() : Boolean
      {
         return _forceMouseMove;
      }
      
      public function set forceMouseMove(value:Boolean) : void
      {
         _forceMouseMove = value;
      }
      
      public function get mousePicker() : IPicker
      {
         return _mousePicker;
      }
      
      public function set mousePicker(value:IPicker) : void
      {
         _mousePicker = value;
      }
   }
}
