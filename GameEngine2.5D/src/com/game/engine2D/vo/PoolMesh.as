package com.game.engine2D.vo
{
	import com.game.engine2D.core.ATFSubTexture;
	import com.game.engine2D.scene.render.RenderUnit;
	import com.game.engine2D.utils.MaterialUtils;
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.core.base.data.OverrideMaterialProps;
	import away3d.entities.EntityLayerType;
	import away3d.entities.PlanarShadowMesh;
	import away3d.materials.MaterialBase;
	import away3d.materials.TextureMaterial;
	import away3d.textures.AsyncTexture2D;
	
	
	/**
	 * PoolMesh缓存池
	 * @author guoqing.wen
	 * 
	 */
	public class PoolMesh extends away3d.entities.PlanarShadowMesh implements IInstancePoolClass
	{
		static private const poolSize:int = 1000;
		static private var _pool:InstancePool = new InstancePool("PoolMesh_pool", poolSize);
		static private var _geometrySize:Number = 100;
		static private var _geometryPlane:PlaneFrameGeometry = new PlaneFrameGeometry(_geometrySize, _geometrySize,false);
		static private var _positionHelp:Vector3D = new Vector3D();
		
		private var _uvTransform:Matrix = new Matrix();
		private var _colorTransform:ColorTransform;
		private var _atfSubTexture:ATFSubTexture;
		private var _width:Number = 0;
		private var _height:Number = 0;
		private var _depth:int = 0;
		private var _parentBaseObj:BaseObj = null;
		private var _uvDirty:Boolean = true;
		private var _positionDirty:Boolean = true;
		private var _pos:Vector3D = new Vector3D();//上层用的x,y值
		private var _posValue:Vector3D = new Vector3D();//实际用的x,y值
		private var _posScale:Point = new Point(1,1);//实际用的scaleX,scaleY值
		private var _posGeometryScale:Point = new Point(1,1);//PlaneFrameGeometry scaleX,scaleY值
		private var _posGeometry:Point = new Point();//PlaneFrameGeometry的width,height值
		
		private var _alpha:Number = 1.0;
		private var _smooth:Boolean;
		private var _isDisposed:Boolean = false;
		private var _isDestroyed:Boolean;
		
		public function PoolMesh(parentBaseObj:BaseObj = null)
		{
			super(_geometryPlane, MaterialUtils.default1x1Texture);
			_parentBaseObj = parentBaseObj;
			_width = _height = 4;
			this.visible = false;
			this.overrideMaterialProps ||= new OverrideMaterialProps();
			this.overrideMaterialProps.colorTransform = new ColorTransform();
			this.overrideMaterialProps.appendColorTransform = true;
		}
		
		
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isDisposed():Boolean
		{
			return _isDisposed;
		}
		
		override public function get y():Number	
		{
			return _pos.y;
		}
		
		override public function get x():Number
		{
			return _pos.x;
		}
		
		override public function get z():Number
		{
			return _pos.z;
		}
		
		public function get colorTransform():ColorTransform
		{
			return _colorTransform;
		}
		
		public function set colorTransform(value:ColorTransform):void
		{
			if (_colorTransform == value)return;
			_colorTransform = value;
			var colorTransform:ColorTransform = overrideMaterialProps.colorTransform;
			if(value)
			{
				colorTransform.alphaMultiplier = value.alphaMultiplier*_alpha;
				colorTransform.alphaOffset = value.alphaOffset;
				colorTransform.blueMultiplier = value.blueMultiplier;
				colorTransform.blueOffset = value.blueOffset;
				colorTransform.greenMultiplier = value.greenMultiplier;
				colorTransform.greenOffset = value.greenOffset;
				colorTransform.redMultiplier = value.redMultiplier;
				colorTransform.redOffset = value.redOffset;
			}
			else
			{
				colorTransform.alphaMultiplier = _alpha;
				colorTransform.alphaOffset = 0;
				colorTransform.blueMultiplier = 1;
				colorTransform.blueOffset = 0;
				colorTransform.greenMultiplier = 1;
				colorTransform.greenOffset = 0;
				colorTransform.redMultiplier = 1;
				colorTransform.redOffset = 0;
			}
		}

		public function get alpha():Number
		{
			return _alpha;
		}
		
		public function set alpha(value:Number):void
		{
			if (_alpha != value){
				_alpha = value;
				this.overrideMaterialProps.colorTransform.alphaMultiplier = _colorTransform ? _colorTransform.alphaMultiplier*value : value;
			}
		}
		
		override public function set z(val:Number):void
		{
			if (_pos.z != val)
			{
				_pos.z = val;
				_posValue.z = val;
				_positionDirty = true;
			}
		}
		
		override public function set y(val:Number):void
		{
			if (_pos.y != val)
			{
				_pos.y = val;
				_posValue.y = -val;
				_positionDirty = true;
			}
		}
		
		override public function set x(val:Number):void
		{
			if (_pos.x != val)
			{
				_pos.x = val;
				_posValue.x = val;
				_positionDirty = true;
			}
		}
		
		public function get object3DScaleX():Number
		{
			return super.scaleX;
		}

		public function get object3DScaleZ():Number
		{
			return super.scaleZ;
		}

		public function get object3DScaleY():Number
		{
			return super.scaleY;
		}
		
		override public function set scaleX(val:Number):void
		{
			_posScale.x = val;
		}

		override public function set scaleY(val:Number):void
		{
			_posScale.y = val;
		}
		
		override public function get scaleX():Number
		{
			return _posScale.x;
		}
		
		override public function get scaleY():Number
		{
			return _posScale.y;
		}
		
		public function get width():int
		{
			return _width;
		}
		
		public function set width(value:int):void
		{
			_width = value;
		}
		
		public function get height():int
		{
			return _height;
		}
		
		public function set height(value:int):void
		{
			_height = value;
		}
		
		public function set texture(value:ATFSubTexture):void
		{
			if (_atfSubTexture != value)
			{
				_atfSubTexture = value;
				_width = _atfSubTexture.width;
				_height = _atfSubTexture.height;
				_uvDirty = true;
				this.material = value.parent;
			}
		}
		
		override public function set material(value:MaterialBase):void
		{
			if (material == value)
				return;
			_uvDirty = true;
			if (_atfSubTexture == null && value is TextureMaterial)
			{
				_width = TextureMaterial(value).texture.width;
				_height = TextureMaterial(value).texture.height;
				TextureMaterial(value).texture.smooth = _smooth;
			}
			super.material = value;
		}
		
		public function get texture():ATFSubTexture
		{
			return _atfSubTexture;
		}
		
		public function get depth():int
		{
			return _depth;
		}
		
		public function set depth(value:int):void
		{
			_depth = value;
		}
		
		override public function get zOffset():int
		{
			if (_parentBaseObj && _parentBaseObj.depthEnable)
				return _depth + (_parentBaseObj.finalShowY<<7);
			return _depth;
		}
		
		public function get smooth():Boolean
		{
			return _smooth;
		}
		
		public function set smooth(value:Boolean):void
		{
			_smooth = value;
			if (this.material != MaterialUtils.default1x1Texture && this.material is TextureMaterial)
			{
				TextureMaterial(this.material).texture.smooth = value;
			}
		}
		
		public function run():void
		{
			this.visible = (this.material != MaterialUtils.default1x1Texture);
			if (this.visible)
			{
				if (_atfSubTexture)
				{
					if (_width == 0)_width = _atfSubTexture.width;
					if (_height == 0)_height = _atfSubTexture.height;
					if (_uvDirty)_atfSubTexture.copyTo(_uvTransform);
				}
				else if (_uvDirty)
				{
					_uvTransform.identity();
				}
				setSize();
				setPosition();
				if (_uvDirty)
				{
					_uvDirty = false;
					this.overrideMaterialProps.overrideBlendMode = false;
					this.overrideMaterialProps.prependedUVTransform = _uvTransform;
				}
			}
		}
		
		/** 缓存池销毁对象 */
		public function instanceDestroy():void
		{
			this._isDestroyed = true;
			this.dispose();
		}
		
		/** 进入缓存池调用 */
		public function instanceDispose():void
		{
			if (this.parent)
				this.parent.removeChild(this);
			this.visible = false;
			this.material = MaterialUtils.default1x1Texture;
			this.layerType = EntityLayerType.DEFAULT;
			this.castsShadows = false;
			_atfSubTexture = null;
			_parentBaseObj = null;
			_isDisposed = true;
		}
		
		public function reSet($parameters:Array):void
		{
			_isDisposed = false;
			_smooth = false;
			_alpha = 1.0;
			_depth = 0;
			_width = _height = 4;
			_pos.setTo(0,0,0);
			_posValue.setTo(0,0,0);
			_posGeometry.setTo(0,0);
			_posScale.setTo(1.0,1.0);
			_posGeometryScale.setTo(1.0,1.0);
			_uvDirty = _positionDirty = true;
			_colorTransform = null;
			_uvTransform.identity();
			_parentBaseObj = BaseObj($parameters[0]);
			
			this.overrideMaterialProps ||= new OverrideMaterialProps();
			this.overrideMaterialProps.colorTransform = new ColorTransform();
			setSize();
			setPosition();
			if (this.planarShadowOffsetPoint)
			{
				setPlanarShadowOffset(0,0);
			}
		}
		
		public function setPosition():void
		{
			if (_positionDirty)
			{
				_positionDirty = false;
				_positionHelp.setTo(int(_posValue.x),int(_posValue.y),_posValue.z);
				this.position = _positionHelp;
			}
		}
		
		public function setSize():void
		{
			if (_posGeometry.x != _width || _posGeometry.y != _height)
			{
				_uvDirty = true;
				_posGeometry.setTo(_width, _height);
				_positionDirty = true;
				_posGeometryScale.setTo(_width/_geometrySize,_height/_geometrySize);
				if (this.castsShadows)
				{
					this.planarShadowPivotPoint ||= new Vector3D();
					this.planarShadowPivotPoint.setTo(_width/2, _pos.y < _height ? _pos.y : -_height, 0);
				}
			}
			var pValueX:Number = _posGeometryScale.x*_posScale.x;
			var pValueY:Number = _posGeometryScale.y*_posScale.y;
			if (pValueX == 0 || pValueY == 0)
			{
				var msg:String = "xxxx";
				if (_atfSubTexture)
				{
					msg = _atfSubTexture.atfPath;
				}
				else if (_parentBaseObj is RenderUnit)
				{
					msg = RenderUnit(_parentBaseObj).getFullSourchPath();
				}
				else if (this.material is TextureMaterial)
				{
					var tm:TextureMaterial = this.material as TextureMaterial
					if (tm.texture is AsyncTexture2D)
						msg = AsyncTexture2D(tm.texture).url;
				}
				throw new Error("PoolMesh发生宽高为0:" + _width + "-" +  _height + "，res:"+msg);
			}
			super.scaleX = pValueX;
			super.scaleY = pValueY;
		}
		
		public function setPlanarShadowOffset(shadowOffsetX:Number, shadowOffsetY:Number):void
		{
			this.planarShadowOffsetPoint ||= new Vector3D();
			this.planarShadowOffsetPoint.setTo(shadowOffsetX, -shadowOffsetY, 0);
		}
		
		static public function recycle($pool:PoolMesh):void
		{
			_pool.disposeObj($pool);
		}
		
		static public function create(baseObj:BaseObj = null):PoolMesh
		{
			return _pool.createObj(PoolMesh, baseObj) as PoolMesh;
		}
	}
}