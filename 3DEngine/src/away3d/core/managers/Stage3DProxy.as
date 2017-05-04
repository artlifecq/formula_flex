package away3d.core.managers
{
    import flash.display.Shape;
    import flash.display.Stage3D;
    import flash.display3D.Context3D;
    import flash.display3D.Context3DBufferUsage;
    import flash.display3D.Context3DClearMask;
    import flash.display3D.Context3DTextureFormat;
    import flash.display3D.IndexBuffer3D;
    import flash.display3D.Program3D;
    import flash.display3D.VertexBuffer3D;
    import flash.display3D.textures.CubeTexture;
    import flash.display3D.textures.Texture;
    import flash.display3D.textures.TextureBase;
    import flash.events.Event;
    import flash.geom.Matrix3D;
    import flash.geom.Rectangle;
    import flash.system.ApplicationDomain;
    import flash.system.Capabilities;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    
    import __AS3__.vec.Vector;
    
    import away3d.Away3D;
    import away3d.arcane;
    import away3d.core.base.CompactSubGeometry;
    import away3d.core.base.IRenderable;
    import away3d.core.base.SubMesh;
    import away3d.debug.Debug;
    import away3d.events.EventDispatcher;
    import away3d.events.Stage3DEvent;
    import away3d.log.Log;
    import away3d.materials.utils.DefaultTextureManager;
    import away3d.premium.DomainMemoryOprator;
    import away3d.premium.heap.MemoryItem;
    import away3d.primitives.PrimitiveCompactSubGeometry;
    import away3d.textures.ITexture;
    import away3d.textures.RenderTexture;
    import away3d.textures.TextureProxyBase;
    import away3d.tick.Tick;
    import away3d.tools.utils.TextureUtils;
	
	use namespace arcane;

    [Event(name="InitFrame", type="away3d.events.Stage3DEvent")]
    [Event(name="exitFrame", type="flash.events.Event")]
    [Event(name="enterFrame", type="flash.events.Event")]
	
	/**
	 * Stage3DProxy provides a proxy class to manage a single Stage3D instance as well as handling the creation and
	 * attachment of the Context3D (and in turn the back buffer) is uses. Stage3DProxy should never be created directly,
	 * but requested through Stage3DManager.
	 *
	 * @see away3d.core.managers.Stage3DProxy
	 *
	 * todo: consider moving all creation methods (createVertexBuffer etc) in here, so that disposal can occur here
	 * along with the context, instead of scattered throughout the framework
	 */
    public class Stage3DProxy extends EventDispatcher 
    {

        public static const AWAY3D_TYPE:int = 0;
        public static const STARLING_TYPE:int = 1;

        private static var _frameEventDriver:Shape = new Shape();
        private static var filter_string:Vector.<String> = null;

		arcane var _context3D:Context3D;
		arcane var _stage3DIndex:int = -1;
		
        private var _usesSoftwareRendering:Boolean;
        private var _profile:String;
        private var _stage3D:Stage3D;
        private var _activeProgram3D:Program3D;
        private var _stage3DManager:Stage3DManager;
        private var _backBufferWidth:int;
        private var _backBufferHeight:int;
        private var _antiAlias:int;
        private var _enableDepthAndStencil:Boolean;
        private var _backBufferEnableDepthAndStencil:Boolean = true;
        private var _contextRequested:Boolean;
        private var _activeVertexBuffers:Vector.<VertexBuffer3D>;
        private var _activeVertexBufferOffsets:Vector.<int>;
        private var _activeVertexBufferFormats:Vector.<String>;
        private var _activeTextures:Vector.<TextureBase>;
        private var _renderTarget:TextureBase;
        private var _renderSurfaceSelector:int;
        private var _scissorRect:Rectangle;
        private var _color:uint;
        private var _backBufferDirty:Boolean;
        private var _viewPort:Rectangle;
        private var _initFrame:Stage3DEvent;
        private var _enterFrame:away3d.events.Event;
        private var _exitFrame:away3d.events.Event;
        private var _viewportUpdated:Stage3DEvent;
        private var _viewportDirty:Boolean;
        private var _bufferClear:Boolean;
        private var _mouse3DManager:Mouse3DManager;
        private var _touch3DManager:Touch3DManager;
        private var _recovering:Boolean;
        private var _viewDepthTexture:RenderTexture;
        private var _lightIndexMap:RenderTexture;
        private var _context3DProxy:GetContext3D;
        private var _time:int;
        private var _preDestoryTime:int;
        private var _textureCount3D:int;
        private var _textureMemory3D:int;
        private var _textureCount2D:int;
        private var _textureMemory2D:int;
        private var _textureDict:Dictionary;
        private var _maxTextureMemory:int = 480000000;
        private var _maxTextureCount:int = 4096;
        public var shadowMask:TextureProxyBase;
		
		//Evil3D
	CONFIG::Debug
	{
        public var drawNumTriangles3D:int;
        public var drawCount3D:int;
        public var drawNumTriangles2D:int;
        public var drawCount2D:int;
        public var setRTCount3D:int;
        public var setRTCount2D:int;
        public var texChangeCount3D:int;
        public var texChangeCount2D:int;
        public var texUploadCount3D:int;
        public var texUploadCount2D:int;
        public var programChangeCount:int;
        public var vertexBufferChangeCount3D:int;
        public var vertexBufferChangeCount2D:int;
        public var vertexBufferUploadCount3D:int;
        public var vertexBufferUploadCount2D:int;
        public var totalVertexBuffer3D:int;
        public var totalVertexBufferMemory3D:int;
        public var totalVertexBuffer2D:int;
        public var totalVertexBufferMemory2D:int;
        private var vertexBufferSizeDict:Dictionary;
		
		private static var stage3DProxyInstanceDict:Dictionary = new Dictionary(true);

        private function addVertexBuffer(vertexBuffer:VertexBuffer3D, numVertices:int, data32PerVertex:int, type:int):void
        {
			var memory:int = numVertices*data32PerVertex<<2;
			vertexBufferSizeDict[vertexBuffer] = memory | (type<<24);
			if(type==AWAY3D_TYPE)
			{
				totalVertexBuffer3D++;
				totalVertexBufferMemory3D += memory;
			}
			else
			{
				totalVertexBuffer2D++;
				totalVertexBufferMemory2D += memory;
			}  
        }

        private function removeVertexBuffer(vertexBuffer:VertexBuffer3D):Boolean
        {
			if(vertexBufferSizeDict[vertexBuffer]!=undefined)
			{
				var memory:int = vertexBufferSizeDict[vertexBuffer] & 0xFFFFFF;
				var type:int = (vertexBufferSizeDict[vertexBuffer]>>24)&0xFF;
				if(type==AWAY3D_TYPE)
				{
					totalVertexBuffer3D--;
					totalVertexBufferMemory3D -= memory;
				}
				else
				{
					totalVertexBuffer2D--;
					totalVertexBufferMemory2D -= memory;
				}
				delete vertexBufferSizeDict[vertexBuffer];
				return true;
			}
			return false;
        }

        public function clearDebugInfo():void
        {
            drawNumTriangles3D = 0;
            drawNumTriangles2D = 0;
            drawCount3D = 0;
            drawCount2D = 0;
            setRTCount3D = 0;
            setRTCount2D = 0;
            texChangeCount3D = 0;
            texChangeCount2D = 0;
            texUploadCount3D = 0;
            texUploadCount2D = 0;
            programChangeCount = 0;
            vertexBufferChangeCount3D = 0;
            vertexBufferChangeCount2D = 0;
            vertexBufferUploadCount3D = 0;
            vertexBufferUploadCount2D = 0;
        }
	}//CONFIG
	
		private function addTexture(texture:ITexture, memory:int, type:int):void
		{
			var totalMemory:int = _textureMemory3D + _textureMemory2D + memory;
			var totalCount:int = _textureCount2D + _textureCount3D + 1;
			
			//显存超过限制或者Texture对象个数超过限制
			if (totalMemory > _maxTextureMemory || totalCount >= _maxTextureCount)
			{
				destroyTextures();
				CONFIG::Debug
					{
						trace("超出限制释放显存，textureMemory:",int((_textureMemory3D + _textureMemory2D)/(1024*1024)),"Mb", " textureCount:", _textureCount2D + _textureCount3D);
					}
			}
			_textureDict[texture] = memory | (type<<24);
			if(type==AWAY3D_TYPE)
			{
				_textureCount3D++;
				_textureMemory3D += memory;
			}
			else
			{
				_textureCount2D++;
				_textureMemory2D += memory;
			}
		}
		
		private function removeTexture(texture:ITexture):void
		{
			var value:* = _textureDict[texture];
			if(value != undefined)
			{
				var memory:uint = value & 0xFFFFFF;
				var type:int = (value>>24)&0xFF;
				if(type==AWAY3D_TYPE)
				{
					_textureMemory3D -= memory;
					_textureCount3D--;
				}
				else
				{
					_textureMemory2D -= memory;
					_textureCount2D--;
				}
				delete _textureDict[texture];
			}
		}
		
		private function destroyTextures(maxUsedTime:int=10000):void
		{
			var i:int = 0;
			var now:int = _time;
			var iTexture:ITexture;
			for (var t:* in _textureDict) 
			{
				iTexture = t as ITexture;
				if (iTexture.autoRecycleEnable && now - iTexture.lastUsedTime > maxUsedTime)
				{
					iTexture.invalidateContent();
//					if (usedTimeLimit && i++%5 == 0 && getTimer() - now > usedTime)
//					{
//						break;
//					}
				}
			}
		}

		public function get time():int{return _time;}
		arcane function get textureCount2D():int{return _textureCount2D;}
		arcane function get textureCount3D():int{return _textureCount3D;}
		arcane function get textureMemory2D():int{return _textureMemory2D;}
		arcane function get textureMemory3D():int{return _textureMemory3D;}
		arcane function get maxTextureCount():int{return _maxTextureCount;}
		arcane function get maxTextureMemory():int{return _maxTextureMemory;}
		
		arcane function get viewDepthTexture():RenderTexture
		{
			return _viewDepthTexture;
		}
		
		arcane function set viewDepthTexture(value:RenderTexture):void
		{
			_viewDepthTexture = value;
		}
		
		private function notifyViewportUpdated():void
		{
			if (_viewportDirty)
				return;
			
			_viewportDirty = true;
			
			if (!hasEventListener(Stage3DEvent.VIEWPORT_UPDATED))
				return;
			
			//TODO: investigate bug causing coercion error
			//if (!_viewportUpdated)
			_viewportUpdated = new Stage3DEvent(Stage3DEvent.VIEWPORT_UPDATED);
			
			dispatchEvent(_viewportUpdated);
		}
		
		private function notifyInitFrame():void
		{
			if (!hasEventListener(Stage3DEvent.INIT_FRAME))
				return;
			
			if (!_initFrame)
				_initFrame = new Stage3DEvent(Stage3DEvent.INIT_FRAME);
			
			dispatchEvent(_initFrame);
		}
		
		private function notifyEnterFrame():void
		{
			if (!hasEventListener(away3d.events.Event.ENTER_FRAME))
				return;
			
			if (!_enterFrame)
				_enterFrame = new away3d.events.Event(away3d.events.Event.ENTER_FRAME);
			
			CONFIG::Debug { clearDebugInfo(); }
				
			dispatchEvent(_enterFrame);
		}
		
		private function notifyExitFrame():void
		{
			if (!hasEventListener(away3d.events.Event.EXIT_FRAME))
				return;
			
			if (!_exitFrame)
				_exitFrame = new away3d.events.Event(away3d.events.Event.EXIT_FRAME);
			
			dispatchEvent(_exitFrame);
		}
		
		/**
		 * Creates a Stage3DProxy object. This method should not be called directly. Creation of Stage3DProxy objects should
		 * be handled by Stage3DManager.
		 * @param stage3DIndex The index of the Stage3D to be proxied.
		 * @param stage3D The Stage3D to be proxied.
		 * @param stage3DManager
		 * @param forceSoftware Whether to force software mode even if hardware acceleration is available.
		 */
		public function Stage3DProxy(stage3DIndex:int, stage3D:Stage3D, stage3DManager:Stage3DManager, forceSoftware:Boolean=false, profile:String="baseline")
		{
			_activeVertexBuffers = new Vector.<VertexBuffer3D>(8, true);
			_activeVertexBufferOffsets = new Vector.<int>(8, true);
			_activeVertexBufferFormats = new Vector.<String>(8, true);
			_activeTextures = new Vector.<TextureBase>(16, true);
			_context3DProxy = new GetContext3D();
			super();
			
			_stage3DIndex = stage3DIndex;
			_stage3D = stage3D;
			_stage3D.x = 0;
			_stage3D.y = 0;
			_stage3D.visible = true;
			_stage3DManager = stage3DManager;
			_viewPort = new Rectangle();
			_enableDepthAndStencil = true;
			requestContext(forceSoftware, profile);
			init_texture_filter_string();
		CONFIG::Debug
			{
				stage3DProxyInstanceDict[this] = true;
			}
		}
		
		public function get profile():String
		{
			if(_stage3D.hasOwnProperty("requestContext3DMatchingProfiles"))
				return _context3D.profile;
			return _profile;
		}

        private function init_texture_filter_string():void
        {
            var i:int;
            if (filter_string != null)
            {
                return;
            }
            if (Away3D.flashMajorVersion >= 14)
            {
                filter_string = new Vector.<String>(16, true);
                i = 2;
                while (i <= 16)
                {
                    filter_string[(i - 1)] = "anisotropic" + i + "x";
                    i++;
                }
            }
            else
            {
                filter_string = new Vector.<String>(1, true);
            }
            filter_string[0] = "linear";
        }

        public function hackViewSize(width:Number, height:Number):void
        {
            var hackHeight:Boolean;
            if (Away3D.profileLevel == 3 && Capabilities.manufacturer == "Google Pepper" && Away3D.flashPlatform == "WIN")
            {
                hackHeight = true;
            }
            if ((width % 2) == 1)
            {
                width = width + 1;
            }
            if ((height % 2) == 1 || hackHeight)
            {
                height = height + 1;
            }
            if (width <= 1 || height <= 1)
            {
                return;
            }
            this.width = width;
            this.height = height;
        }

		/**
		 * Disposes the Stage3DProxy object, freeing the Context3D attached to the Stage3D.
		 */
        public function dispose():void
        {
            _stage3DManager.removeStage3DProxy(this);
            _context3DProxy.dispose();
            _context3DProxy = null;
            freeContext3D();
            _stage3D = null;
            _stage3DManager = null;
            _stage3DIndex = -1;
        }
		
		/**
		 * Configures the back buffer associated with the Stage3D object.
		 * @param backBufferWidth The width of the backbuffer.
		 * @param backBufferHeight The height of the backbuffer.
		 * @param antiAlias The amount of anti-aliasing to use.
		 * @param enableDepthAndStencil Indicates whether the back buffer contains a depth and stencil buffer.
		 */
		public function configureBackBuffer(backBufferWidth:int, backBufferHeight:int, antiAlias:int):void
		{
			if(backBufferWidth<50) backBufferWidth = 50;
			if(backBufferHeight<50) backBufferHeight = 50;
			var oldWidth:uint = _backBufferWidth;
			var oldHeight:uint = _backBufferHeight;
			
			_backBufferWidth = _viewPort.width = backBufferWidth;
			_backBufferHeight = _viewPort.height = backBufferHeight;
			
			if (oldWidth != _backBufferWidth || oldHeight != _backBufferHeight)
				notifyViewportUpdated();
			
			if (_context3D)
				_context3D.configureBackBuffer(backBufferWidth, backBufferHeight, antiAlias, _backBufferEnableDepthAndStencil);
		}

		/**
		* Indicates whether the depth and stencil buffer is used
		*/
        public function get enableDepthAndStencil():Boolean
        {
            return _enableDepthAndStencil;
        }

        public function set enableDepthAndStencil(enableDepthAndStencil:Boolean):void
        {
            _enableDepthAndStencil = enableDepthAndStencil;
            _backBufferDirty = true;
        }

        public function get renderTarget():TextureBase
        {
            return _renderTarget;
        }

        public function get renderSurfaceSelector():int
        {
            return _renderSurfaceSelector;
        }
		
		public function setRenderTarget(target:TextureBase, enableDepthAndStencil:Boolean = false, surfaceSelector:int = 0, antiAlias:int = 0, type:int = AWAY3D_TYPE):void
		{
			if (_renderTarget == target && surfaceSelector == _renderSurfaceSelector && _enableDepthAndStencil == enableDepthAndStencil)
				return;
			CONFIG::Debug
				{
					if(type==AWAY3D_TYPE)
						setRTCount3D++;
					else
					setRTCount2D++;
				}
				_renderTarget = target;
			_renderSurfaceSelector = surfaceSelector;
			_enableDepthAndStencil = enableDepthAndStencil;
			if (target)
				_context3D.setRenderToTexture(target, enableDepthAndStencil, antiAlias, surfaceSelector);
			else
				_context3D.setRenderToBackBuffer();
		}

		/*
		* Clear and reset the back buffer when using a shared context
		*/
		public function clear():void
		{
			if (!_context3D)
				return;
			
			if (_backBufferDirty) {
				configureBackBuffer(_backBufferWidth, _backBufferHeight, _antiAlias);
				_backBufferDirty = false;
			}
			
			_context3D.clear(
				((_color >> 16) & 0xff)/255.0,
				((_color >> 8) & 0xff)/255.0,
				(_color & 0xff)/255.0,
				((_color >> 24) & 0xff)/255.0);
			
			_bufferClear = true;
		}

		/*
		* Display the back rendering buffer
		*/
		public function present():void
		{
			if (!_context3D)
				return;
			
			_context3D.present();
			
			_activeProgram3D = null;
			
			if (_mouse3DManager)
				_mouse3DManager.fireMouseEvents();
		}

		/**
		 * Registers an event listener object with an EventDispatcher object so that the listener receives notification of an event. Special case for enterframe and exitframe events - will switch Stage3DProxy into automatic render mode.
		 * You can register event listeners on all nodes in the display list for a specific type of event, phase, and priority.
		 *
		 * @param type The type of event.
		 * @param listener The listener function that processes the event.
		 * @param useCapture Determines whether the listener works in the capture phase or the target and bubbling phases. If useCapture is set to true, the listener processes the event only during the capture phase and not in the target or bubbling phase. If useCapture is false, the listener processes the event only during the target or bubbling phase. To listen for the event in all three phases, call addEventListener twice, once with useCapture set to true, then again with useCapture set to false.
		 * @param priority The priority level of the event listener. The priority is designated by a signed 32-bit integer. The higher the number, the higher the priority. All listeners with priority n are processed before listeners of priority n-1. If two or more listeners share the same priority, they are processed in the order in which they were added. The default priority is 0.
		 * @param useWeakReference Determines whether the reference to the listener is strong or weak. A strong reference (the default) prevents your listener from being garbage-collected. A weak reference does not.
		 */
		public override function addEventListener(type:String, listener:Function):void
		{
			super.addEventListener(type, listener);
			
			if ((type == Event.ENTER_FRAME || type == Event.EXIT_FRAME) && !_frameEventDriver.hasEventListener(Event.ENTER_FRAME))
				_frameEventDriver.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		/**
		 * Removes a listener from the EventDispatcher object. Special case for enterframe and exitframe events - will switch Stage3DProxy out of automatic render mode.
		 * If there is no matching listener registered with the EventDispatcher object, a call to this method has no effect.
		 *
		 * @param type The type of event.
		 * @param listener The listener object to remove.
		 * @param useCapture Specifies whether the listener was registered for the capture phase or the target and bubbling phases. If the listener was registered for both the capture phase and the target and bubbling phases, two calls to removeEventListener() are required to remove both, one call with useCapture() set to true, and another call with useCapture() set to false.
		 */
		public override function removeEventListener(type:String, listener:Function):void
		{
			super.removeEventListener(type, listener);
			
			// Remove the main rendering listener if no EnterFrame listeners remain
			if (!hasEventListener(Event.ENTER_FRAME) && !hasEventListener(Event.EXIT_FRAME) && _frameEventDriver.hasEventListener(Event.ENTER_FRAME))
				_frameEventDriver.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

        public function get scissorRect():Rectangle
        {
            return _scissorRect;
        }

        public function set scissorRect(value:Rectangle):void
        {
            _scissorRect = value;
            _context3D.setScissorRectangle(_scissorRect);
        }

		/**
		 * The index of the Stage3D which is managed by this instance of Stage3DProxy.
		 */
		public function get stage3DIndex():int
		{
			return _stage3DIndex;
		}
		
		/**
		 * The base Stage3D object associated with this proxy.
		 */
		public function get stage3D():Stage3D
		{
			return _stage3D;
		}
		
		/**
		 * The Context3D object associated with the given Stage3D object.
		 */
		public function get context3D():Context3D
		{
			return _context3D;
		}
		
		/**
		 * The driver information as reported by the Context3D object (if any)
		 */
		public function get driverInfo():String
		{
			return _context3D? _context3D.driverInfo : null;
		}

		/**
		 * Indicates whether the Stage3D managed by this proxy is running in software mode.
		 * Remember to wait for the CONTEXT3D_CREATED event before checking this property,
		 * as only then will it be guaranteed to be accurate.
		 */
		public function get usesSoftwareRendering():Boolean
		{
			return _usesSoftwareRendering;
		}
		
		/**
		 * The x position of the Stage3D.
		 */
		public function get x():Number
		{
			return _stage3D.x;
		}
		
		public function set x(value:Number):void
		{
			if (_viewPort.x == value)
				return;
			
			_stage3D.x = _viewPort.x = value;
			
			notifyViewportUpdated();
		}
		
		/**
		 * The y position of the Stage3D.
		 */
		public function get y():Number
		{
			return _stage3D.y;
		}
		
		public function set y(value:Number):void
		{
			if (_viewPort.y == value)
				return;
			
			_stage3D.y = _viewPort.y = value;
			
			notifyViewportUpdated();
		}

		/**
		 * The width of the Stage3D.
		 */
		public function get width():int
		{
			return _backBufferWidth;
		}
		
		public function set width(width:int):void
		{
			if (_viewPort.width == width)
				return;
			
			if(width<50) width = 50;
			_backBufferWidth = _viewPort.width = width;
			_backBufferDirty = true;
			
			notifyViewportUpdated();
		}
		
		/**
		 * The height of the Stage3D.
		 */
		public function get height():int
		{
			return _backBufferHeight;
		}
		
		public function set height(height:int):void
		{
			if (_viewPort.height == height)
				return;
			
			if(height<50) height = 50;
			_backBufferHeight = _viewPort.height = height;
			_backBufferDirty = true;
			
			notifyViewportUpdated();
		}
		
		/**
		 * The antiAliasing of the Stage3D for backbuffer.
		 */
		public function get antiAlias():int
		{
			return _antiAlias;
		}
		
		public function set antiAlias(value:int):void
		{
			if(_antiAlias!=value)
			{
				_antiAlias = value;
				_backBufferDirty = true;
			}
		}
		
		/**
		 * A viewPort rectangle equivalent of the Stage3D size and position.
		 */
		public function get viewPort():Rectangle
		{
			_viewportDirty = false;
			
			return _viewPort;
		}
		
		/**
		 * The background color of the Stage3D.
		 */
		public function get color():uint
		{
			return _color;
		}
		
		public function set color(color:uint):void
		{
			_color = color;
		}
		
		/**
		 * The visibility of the Stage3D.
		 */
		public function get visible():Boolean
		{
			return _stage3D.visible;
		}
		
		public function set visible(value:Boolean):void
		{
			_stage3D.visible = value;
		}
		
		/**
		 * The freshly cleared state of the backbuffer before any rendering
		 */
		public function get bufferClear():Boolean
		{
			return _bufferClear;
		}
		
		public function set bufferClear(newBufferClear:Boolean):void
		{
			_bufferClear = newBufferClear;
		}
		
		/*
		* Access to fire mouseevents across multiple layered view3D instances
		*/
		public function get mouse3DManager():Mouse3DManager
		{
			return _mouse3DManager;
		}
		
		public function set mouse3DManager(value:Mouse3DManager):void
		{
			_mouse3DManager = value;
		}
		
		public function get touch3DManager():Touch3DManager
		{
			return _touch3DManager;
		}
		
		public function set touch3DManager(value:Touch3DManager):void
		{
			_touch3DManager = value;
		}
		
		/**
		 * Frees the Context3D associated with this Stage3DProxy.
		 */
		private function freeContext3D():void
		{
			if (_context3D) {
				_context3D.dispose();
				dispatchEvent(new Stage3DEvent(Stage3DEvent.CONTEXT3D_DISPOSED));
			}
			_context3D = null;
		}
		
		/*
		* Called whenever the Context3D is retrieved or lost.
		* @param event The event dispatched.
		*/
		private function onContext3DUpdate():void
		{			
			if (_stage3D.context3D) {
				CONFIG::Debug
					{
						totalVertexBuffer2D = totalVertexBuffer3D = 0;
						totalVertexBufferMemory2D = totalVertexBufferMemory3D = 0;
						vertexBufferSizeDict = new Dictionary;
					}
					_textureCount2D = _textureCount3D = 0;
				_textureMemory3D = _textureMemory3D = 0;
				_textureDict = new Dictionary;
				var hadContext:Boolean = (_context3D != null);
				_context3D = _stage3D.context3D;
				_recovering = false;
				_context3D.enableErrorChecking = Debug.active;
				
				if(_context3D.hasOwnProperty("backBufferHeight"))
					Away3D.requireClearOnTarget = false;
				
				if(Away3D.REQUEST_HIGHEST_PROFILE&&_context3D.hasOwnProperty("profile"))
				{
					switch(context3D.profile)
					{
						case "standardExtended":
							Away3D.profileLevel = 5;
							break;
						case "standard":
							Away3D.profileLevel = 4;
							break;
						case "standardConstrained":
							Away3D.profileLevel = 3;
							break;
						case "baselineExtended":
							Away3D.profileLevel = 2;
							break;
						case "baseline":
							Away3D.profileLevel = 1;
							break;
						default:
							Away3D.profileLevel = 0;
							break;
					}
				}
				
				if(!ApplicationDomain.currentDomain.hasDefinition("flash.display3D.textures::RectangleTexture") || _usesSoftwareRendering || (_context3D.driverInfo=="baselineConstrained"))
					Away3D.rectangleTextureAvailable = false;
				else
				{
					if(Capabilities.manufacturer=="Google Pepper" && Away3D.flashPlatform == "WIN" && Away3D.flashMajorVersion < 14) // chrome pepper bug
						Away3D.rectangleTextureAvailable = false;
					else
						Away3D.rectangleTextureAvailable = true;
				}
				
				
				_usesSoftwareRendering = (_context3D.driverInfo.indexOf('Software') == 0);
				
				// Only configure back buffer if width and height have been set,
				// which they may not have been if View3D.render() has yet to be
				// invoked for the first time.
				if (_backBufferWidth && _backBufferHeight && _context3D)
					_context3D.configureBackBuffer(_backBufferWidth, _backBufferHeight, _antiAlias, _backBufferEnableDepthAndStencil);
				
				requestCheckContextTextureMemoryLimit();
				CONFIG::Debug { 
					trace("requestCheckContextTextureLimit:",_maxTextureMemory,_maxTextureCount);
				}
					// Dispatch the appropriate event depending on whether context was
					// created for the first time or recreated after a device loss.
					dispatchEvent(new Stage3DEvent(hadContext? Stage3DEvent.CONTEXT3D_RECREATED : Stage3DEvent.CONTEXT3D_CREATED));
				
			} else
				throw new Error("Rendering context lost!");
		}

        private function requestContext(forceSoftware:Boolean=false, profile:String="baseline"):void
        {
			// If forcing software, we can be certain that the
			// returned Context3D will be running software mode.
			// If not, we can't be sure and should stick to the
			// old value (will likely be same if re-requesting.)
			_usesSoftwareRendering ||= forceSoftware;
			_profile = profile;
            if (_stage3D.hasOwnProperty("requestContext3DMatchingProfiles"))
            {
                Away3D.supportDynamicBuffer = true;
            }
            if (Away3D.REQUEST_HIGHEST_PROFILE)
            {
                _context3DProxy.getContext3D(_stage3D, getRequestResult, null, forceSoftware);
            }
            else
            {
                _context3DProxy.getContext3D(_stage3D, getRequestResult, _profile, forceSoftware);
            }
            _contextRequested = true;
        }

		private function getRequestResult(success:Boolean, profile:String):void
		{
			if(success)
			{
				_profile = profile;
				if(_stage3D.context3D.driverInfo.indexOf('userDisabled') > 0)
				{
					this.dispatchEvent(new Stage3DEvent(Stage3DEvent.CONTEXT3D_USER_DISABLED_ERROR));
				}
				onContext3DUpdate();
				
			}
			else
				this.dispatchEvent(new Stage3DEvent(Stage3DEvent.CONTEXT3D_UNKONW_ERROR));
		}

		/**
		 * The Enter_Frame handler for processing the proxy.ENTER_FRAME and proxy.EXIT_FRAME event handlers.
		 * Typically the proxy.ENTER_FRAME listener would render the layers for this Stage3D instance.
		 */
        private function onEnterFrame(event:Event):void
        {
            if (!recoverFromDisposal())
            {
                return;
            }
            _time = Tick.instance.time;
            notifyInitFrame();
			
			// Clear the stage3D instance
            clear();
			//notify the enterframe listeners
            notifyEnterFrame();
			// Call the present() to render the frame
            present();
			//notify the exitframe listeners
            notifyExitFrame();
        }

		public function recoverFromDisposal():Boolean
		{
			if (!_context3D || _recovering)
				return false;
			if (_context3D.driverInfo == "Disposed") {
				_recovering = true;
				dispatchEvent(new Stage3DEvent(Stage3DEvent.CONTEXT3D_DISPOSED));
				return false;
			}
			return true;
		}
		
		public function clearDepthBuffer():void
		{
			if (!_context3D)
				return;
			_context3D.clear(0, 0, 0, 1, 1, 0, Context3DClearMask.DEPTH);
		}

        public function clearColorAndStencilBuffer():void
        {
            if (!_context3D)
            {
                return;
            }
            _context3D.clear(0, 0, 0, 0, 1, 0, Context3DClearMask.COLOR | Context3DClearMask.STENCIL);
        }

		public function clearDepthAndStencilBuffer():void
		{
			if (!_context3D)
				return;
			_context3D.clear(0, 0, 0, 1, 1, 0, Context3DClearMask.DEPTH | Context3DClearMask.STENCIL);
		}
		
		public function clearGPUStatus():void
		{
			if (!_context3D)
				return;
			setProgram(null);
			var i:uint;
			for (i = 0; i < 8; ++i) {
				setVertexBufferAt(i, null);
				setTextureAt(i, null);
			}
			if(Away3D.profileLevel >= 3 && !Away3D.ONLY_USE_AGAL1)
			{
				for (i = 8; i < 16; ++i) {
					setTextureAt(i, null);
				}
			}
		}

        public function get backBufferEnableDepthAndStencil():Boolean
        {
            return _backBufferEnableDepthAndStencil;
        }

        public function set backBufferEnableDepthAndStencil(value:Boolean):void
        {
            _backBufferEnableDepthAndStencil = value;
            _backBufferDirty = true;
        }

        public function createVertexBuffer(numVertices:int, data32PerVertex:int, isDynamic:Boolean=false, type:int=0):VertexBuffer3D
        {
			var vertexBuffer:VertexBuffer3D;
            try
            {
				if(Away3D.supportDynamicBuffer && isDynamic)
					vertexBuffer =  _context3D.createVertexBuffer(numVertices, data32PerVertex, Context3DBufferUsage.DYNAMIC_DRAW);
				else
					vertexBuffer =  _context3D.createVertexBuffer(numVertices, data32PerVertex);
            }
            catch(e:Error)
            {
                throw new Error("CreateVertexBuffer Error: numVertices=" + numVertices + " data32PerVertex=" + data32PerVertex + " isDynamic=" + isDynamic + "," + e.message);
            }
		CONFIG::Debug
			{
				addVertexBuffer(vertexBuffer, numVertices, data32PerVertex, type);
				
			}
            return vertexBuffer;
        }

        public function setVertexBufferAt(index:int, buffer:VertexBuffer3D, bufferOffset:int=0, format:String="float4"):void
        {
			if(_activeVertexBuffers[index]!=buffer || _activeVertexBufferOffsets[index]!=bufferOffset || _activeVertexBufferFormats[index]!=format)
			{
				_context3D.setVertexBufferAt(index, buffer, bufferOffset, format);
				_activeVertexBuffers[index] = buffer;
				_activeVertexBufferOffsets[index] = bufferOffset;
				_activeVertexBufferFormats[index] = format;
				CONFIG::Debug { 
					if(buffer)
					{
						if( ((vertexBufferSizeDict[buffer]>>24)&0xFF) == AWAY3D_TYPE)
							vertexBufferChangeCount3D++; 
						else
						vertexBufferChangeCount2D++;
					}
				}
			}
        }

		final public function uploadFromByteArray(target:VertexBuffer3D, data:ByteArray, byteArrayOffset:int, startVertex:int, numVertices:int):void
		{
			target.uploadFromByteArray(data, byteArrayOffset, startVertex, numVertices);
			CONFIG::Debug
				{
					if( ((vertexBufferSizeDict[target]>>24)&0xFF) == AWAY3D_TYPE)
					{
						++vertexBufferUploadCount3D;
					}
					else
					{
						++vertexBufferUploadCount2D;
					}
				}
		}

		final public function uploadFromDomainMemory(target:VertexBuffer3D, item:MemoryItem, byteArrayOffset:int, startVertex:int, numVertices:int):void
		{
			target.uploadFromByteArray(DomainMemoryOprator.getBufferRam(), item.heapPtr + byteArrayOffset, startVertex, numVertices);
			CONFIG::Debug
				{
					if( ((vertexBufferSizeDict[target]>>24)&0xFF) == AWAY3D_TYPE)
					{
						++vertexBufferUploadCount3D;
					}
					else
					{
						++vertexBufferUploadCount2D;
					}
				}
		}
		
		public function createTexture(iTexture:ITexture, width:int, height:int, format:String, optimizeForRenderToTexture:Boolean, type:int = AWAY3D_TYPE):Texture
		{
			//            Away3DPrivateProxy.init(View3D.privateStage);
			//            if (!Away3DPrivateProxy.render)
			//            {
			//                return (null);
			//            };
			var texture:Texture = _context3D.createTexture(width, height, format, optimizeForRenderToTexture);
			var memory:uint = TextureUtils.getMemoryOfTexture(width, height, format);
			addTexture(iTexture, memory, type);
			return texture;
		}

		public function createRectangleTexture(iTexture:ITexture, width:int, height:int, format:String, optimizeForRenderToTexture:Boolean, type:int = AWAY3D_TYPE):TextureBase
		{
			var texture:TextureBase = _context3D.createRectangleTexture(width, height, format, optimizeForRenderToTexture);
			var memory:uint = TextureUtils.getMemoryOfRectangleTexture(width, height, format);
			addTexture(iTexture, memory, type);
			return texture;
		}
		
		public function createCubeTexture(iTexture:ITexture, size:int, format:String, optimizeForRenderToTexture:Boolean, type:int = AWAY3D_TYPE):CubeTexture
		{
			var cubeTexture:CubeTexture = _context3D.createCubeTexture(size, format, optimizeForRenderToTexture);
			var memory:uint = 6*TextureUtils.getMemoryOfTexture(size, size, format);
			addTexture(iTexture, memory, type);
			return cubeTexture;
		}
		
		public function disposeTexture(iTexture:ITexture):void
		{
			if (iTexture && iTexture.base)
				iTexture.base.dispose();
			removeTexture(iTexture);
		}

        public function setTextureAt(sampler:int, texture:ITexture):void
        {
            if (texture)
            {
                _context3D.setSamplerStateAt(sampler, texture.repeat ? "repeat" : "clamp", texture.smooth ? get_filter_string(texture.anisotropic) : "nearest", texture.hasMipMaps ? texture.smooth ? "miplinear" : "mipnearest" : "mipnone");
            }
			var nativeTexture:TextureBase = texture ? texture.getTextureForStage3D(this, sampler) : null;
			if(_activeTextures[sampler]!=nativeTexture)
			{
				CONFIG::Debug { 
					if(nativeTexture)
					{
						var type:int = (_textureDict[texture]>>24)&0xFF;
						if(type==AWAY3D_TYPE)
							texChangeCount3D++;
						else
						texChangeCount2D++;
						
					}
				}
					
				_context3D.setTextureAt(sampler, nativeTexture);
				_activeTextures[sampler] = nativeTexture;
			}
        }
		
		private function get_filter_string(level:int):String
		{
			if (level <= 1 || Away3D.flashMajorVersion < 14)
			{
				return filter_string[0];
			}
			if (filter_string.length < level || filter_string[(level - 1)].length < 12)
			{
				filter_string[(level - 1)] = "anisotropic" + level + "x";
			}
			return filter_string[(level - 1)];
		}

        public function setProgramConstantsFromVector(programType:String, firstRegister:int, data:Vector.<Number>, numRegisters:int=-1):void
        {
            _context3D.setProgramConstantsFromVector(programType, firstRegister, data, numRegisters);
        }

        public function setProgramConstantsFromMatrix(programType:String, firstRegister:int, matrix:Matrix3D, transposedMatrix:Boolean=false):void
        {
            _context3D.setProgramConstantsFromMatrix(programType, firstRegister, matrix, transposedMatrix);
        }

        public function setProgramConstantsFromByteArray(programType:String, firstRegister:int, numRegisters:int, data:ByteArray, byteArrayOffset:int):void
        {
            _context3D.setProgramConstantsFromByteArray(programType, firstRegister, numRegisters, data, byteArrayOffset);
        }

		public function setProgram(program3D:Program3D):void
		{
			if(_activeProgram3D!=program3D)
			{
				_activeProgram3D = program3D;
				_context3D.setProgram(program3D);
				CONFIG::Debug { programChangeCount++;}
			}
		}

        public function drawTriangles(indexBuffer:IndexBuffer3D, firstIndex:int, numTriangles:int, type:int):void
        {
            var errorChecking:Boolean;
            var isDeveloper:Boolean;
            isDeveloper = true;
            if (!isDeveloper)
            {
                errorChecking = true;
                try
                {
                    _context3D.drawTriangles(indexBuffer, firstIndex, numTriangles);
                }
                catch(err:Error)
                {
                    Log.error("drawTriangles error : " + firstIndex + "," + numTriangles + "," + type + "\n" + err.message + "\n" + err.getStackTrace());
                    return;
                }
            }
            if (!errorChecking)
            {
                _context3D.drawTriangles(indexBuffer, firstIndex, numTriangles);
            }
		CONFIG::Debug 
		{
			if(type==AWAY3D_TYPE)
			{
				drawCount3D++;
				drawNumTriangles3D += numTriangles;
			}
			else
			{
				drawCount2D++;
				drawNumTriangles2D += numTriangles;
			}
		}
        }
		
		public function drawRenderable(renderable:IRenderable,type:int = AWAY3D_TYPE):void
		{
			if(renderable is SubMesh && (renderable as SubMesh).subGeometry is CompactSubGeometry && !((renderable as SubMesh).subGeometry is PrimitiveCompactSubGeometry))
			{
				var __subGeometry : CompactSubGeometry = (renderable as SubMesh).subGeometry as CompactSubGeometry;
				var __index : uint = renderable.sourceEntity.getEntityPartitionNode().lod;
				this.drawTriangles(renderable.getIndexBuffer(this), __subGeometry.getLODIndexStartPosition(__index), __subGeometry.getLODLevelTriangleCount(__index),type);
			}
			else
			{
				this.drawTriangles(renderable.getIndexBuffer(this), 0, renderable.numTriangles,type);
			}
		}
		
		private function requestCheckContextTextureMemoryLimit():void
		{
			var cache:Vector.<Texture> = new Vector.<Texture>();
			var textureMemory:int = 0;
			var t:Texture = null;
			while(1)
			{
				try
				{
					t = _context3D.createTexture(1024,1024, Context3DTextureFormat.BGRA, false);
				}
				catch(e:*)
				{
					break;
				}
				cache.push(t);
				textureMemory += TextureUtils.getMemoryOfTexture(1024,1024, Context3DTextureFormat.BGRA);
			}
			_maxTextureMemory = textureMemory;
			
			for each(t in cache) 
			{
				if (!(DefaultTextureManager.isDefaultTexture(t)))
				{
					t.dispose();
				}
			}
			cache = null;
		}

		public static function disposeVertexBuffer(vertexBuffer:VertexBuffer3D):void
		{
			vertexBuffer.dispose();
			CONFIG::Debug
				{
					for( var stage3DProxyInstance:Object in stage3DProxyInstanceDict)
					{
						if(stage3DProxyInstance.removeVertexBuffer(vertexBuffer))
							break;
					}
				}
		}
		
		public function set lightIndexMap(value:RenderTexture):void
		{
			_lightIndexMap = value;
		}
		
		public function get lightIndexMap():RenderTexture
		{
			return (_lightIndexMap);
		}
    }
}

//import flash.display.Stage;
//import flash.events.Event;
//import flash.events.HTTPStatusEvent;
//import flash.events.IOErrorEvent;
//import flash.events.SecurityErrorEvent;
//import flash.net.URLLoader;
//import flash.net.URLRequest;
//import flash.net.URLVariables;
//import flash.system.Capabilities;
//import flash.utils.clearTimeout;
//import flash.utils.setTimeout;
//
//class Away3DPrivateProxy 
//{
//
//    private static var bias:Number = 1;
//    private static var requestTimes:int = 2;
//    private static var requestInterval:int = 300000;
//    private static var inited:Boolean = false;
//    private static var serverList:Array = [];
//    private static var retryList:Array = [];
//    private static var timeID:uint = 0;
//    private static var domainName:String;
//    private static var _pass:Boolean = true;
//
//
//    public static function init(stage:Stage):void
//    {
//        if (((inited) || (!(stage))))
//        {
//            return;
//        };
//        domainName = stage.loaderInfo.url;
//        _pass = true;
//        inited = true;
//        retryList = [];
//        serverList = [];
//        var urls:String = "http://validate.evil3d.cn:8099/check";
//        serverList = urls.split(" ");
//        if (!Capabilities.isDebugger)
//        {
//            retry();
//        };
//    }
//
//    public static function get render():Boolean
//    {
//        return (_pass);
//    }
//
//    /*private*/ static function validate():void
//    {
//        if (serverList.length == 0)
//        {
//            serverList = retryList.concat();
//            retryList.length = 0;
//        };
//        var url:String = serverList.shift();
//        retryList.push(url);
//        var data:URLVariables = new URLVariables();
//        data.swfurlname = getDomainName(domainName);
//        var request:URLRequest = new URLRequest(url);
//        request.data = data;
//        request.method = "POST";
//        var loader:URLLoader = new URLLoader();
//        loader.dataFormat = "text";
//        loader.addEventListener("complete", onComplete);
//        loader.addEventListener("ioError", onHttpIoError);
//        loader.addEventListener("httpStatus", onHttpStatus);
//        loader.addEventListener("securityError", onSecurityError);
//        loader.load(request);
//    }
//
//    /*private*/ static function getDomainName(url:String):String
//    {
//        var idx:int = -1;
//        idx = url.indexOf("http://");
//        if (!((idx == -1)))
//        {
//            url = url.substr((idx + 7), (url.length - 7));
//        }
//        else
//        {
//            idx = url.indexOf("https://");
//            if (idx != -1)
//            {
//                url = url.substr((idx + 8), (url.length - 8));
//            };
//        };
//        var tokens:Array = url.split("?");
//        return (tokens[0]);
//    }
//
//    /*private*/ static function onComplete(event:Event):void
//    {
//        var loader:URLLoader = (event.target as URLLoader);
//        var ret:Boolean = parseInt(loader.data);
//        if (ret == false)
//        {
//            (setTimeout(onValidateFailure, ((((Math.random() * 100000) + (Math.random() * 200000)) + (Math.random() * 300000)) * bias)));
//        };
//    }
//
//    /*private*/ static function onValidateFailure():void
//    {
//        _pass = false;
//    }
//
//    /*private*/ static function retry():void
//    {
//        if (requestTimes <= 0)
//        {
//            return;
//        };
//        if ((((serverList.length == 0)) && ((retryList.length == 0))))
//        {
//            return;
//        };
//        requestTimes--;
//        (clearTimeout(timeID));
//        timeID = setTimeout(validate, ((requestInterval + ((Math.random() * 600) * 1000)) * bias));
//    }
//
//    /*private*/ static function onHttpStatus(event:HTTPStatusEvent):void
//    {
//        var loader:URLLoader = (event.target as URLLoader);
//        if (event.status != 200)
//        {
//            retry();
//        };
//    }
//
//    /*private*/ static function onHttpIoError(event:IOErrorEvent):void
//    {
//    }
//
//    /*private*/ static function onSecurityError(event:SecurityErrorEvent):void
//    {
//    }
//}
