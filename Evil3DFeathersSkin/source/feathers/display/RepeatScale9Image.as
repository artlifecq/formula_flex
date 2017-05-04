/*
Feathers
Copyright 2012-2015 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.display
{
	import flash.display.BitmapData;
	import flash.errors.IllegalOperationError;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import away3d.tools.utils.TextureUtils;
	
	import feathers.core.IValidating;
	import feathers.core.ValidationQueue;
	import feathers.textures.RepeatScale9Textures;
	import feathers.themes.GuiTheme;
	import feathers.utils.display.getDisplayObjectDepthFromStage;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.MeshBatch;
	import starling.events.Event;
	import starling.rendering.Painter;
	import starling.styles.IMeshStyle;
	import starling.styles.MeshStyle;
	import starling.textures.IStarlingTexture;
	import starling.utils.MatrixUtil;
	import starling.utils.Pool;
	
	[Exclude(name="numChildren",kind="property")]
	[Exclude(name="isFlattened",kind="property")]
	[Exclude(name="addChild",kind="method")]
	[Exclude(name="addChildAt",kind="method")]
	[Exclude(name="broadcastEvent",kind="method")]
	[Exclude(name="broadcastEventWith",kind="method")]
	[Exclude(name="contains",kind="method")]
	[Exclude(name="getChildAt",kind="method")]
	[Exclude(name="getChildByName",kind="method")]
	[Exclude(name="getChildIndex",kind="method")]
	[Exclude(name="removeChild",kind="method")]
	[Exclude(name="removeChildAt",kind="method")]
	[Exclude(name="removeChildren",kind="method")]
	[Exclude(name="setChildIndex",kind="method")]
	[Exclude(name="sortChildren",kind="method")]
	[Exclude(name="swapChildren",kind="method")]
	[Exclude(name="swapChildrenAt",kind="method")]
	[Exclude(name="flatten",kind="method")]
	[Exclude(name="unflatten",kind="method")]
	
	/**
	 * Scales an image with nine regions to maintain the aspect ratio of the
	 * corners regions. The top and bottom regions stretch horizontally, and the
	 * left and right regions scale vertically. The center region stretches in
	 * both directions to fill the remaining space.
	 * 
	 * author wewell@163.com
	 */
	public class RepeatScale9Image extends DisplayObjectContainer implements IValidating, IMeshStyle
	{
		/**
		 * @private
		 */
		private static const HELPER_MATRIX:Matrix = new Matrix();
		
		/**
		 * @private
		 */
		private static const HELPER_POINT:Point = new Point();
		
		/**
		 * @private
		 */
		private static var helperImage:Image;
		
		/**
		 * @private
		 */
		private static var helperClipRectangle:Rectangle;
		private static var helperBounds:Rectangle;
		
		/**
		 * @private
		 */
		private static var helperTileGrid:Rectangle;
		
		/**
		 * Constructor.
		 */
		public function RepeatScale9Image(textures:RepeatScale9Textures)
		{
			super();
			this.textures = textures;
			this._hitArea = new Rectangle();
			this.readjustSize();
			
			this._batch = new MeshBatch();
			this._batch.touchable = false;
			this.addChild(this._batch);
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		/**
		 * @private
		 */
		private var _propertiesChanged:Boolean = true;
		
		/**
		 * @private
		 */
		private var _layoutChanged:Boolean = true;
		
		/**
		 * @private
		 */
		private var _renderingChanged:Boolean = true;
		
		/**
		 * @private
		 */
		private var _frame:Rectangle;
		
		/**
		 * @private
		 */
		private var _textures:RepeatScale9Textures;
		
		/**
		 * @private
		 */
		private var _topClipTexture:IStarlingTexture;
		private var _bottomClipTexture:IStarlingTexture;
		private var _leftClipTexture:IStarlingTexture;
		private var _rightClipTexture:IStarlingTexture;
		private var _centerRightClipTexture:IStarlingTexture;
		private var _centerBottomClipTexture:IStarlingTexture;
		private var _centerRightBottomClipTexture:IStarlingTexture;
		
		/**
		 * The textures displayed by this image.
		 *
		 * <p>In the following example, the textures are changed:</p>
		 *
		 * <listing version="3.0">
		 * image.textures = new RepeatScale9Textures( texture, scale9Grid );</listing>
		 */
		public function get textures():RepeatScale9Textures
		{
			return this._textures;
		}
		
		/**
		 * @private
		 */
		public function set textures(value:RepeatScale9Textures):void
		{
			if(!value)
			{
				throw new IllegalOperationError("RepeatScale9Image textures cannot be null.");
			}
			if(this._textures == value)
			{
				return;
			}
			this._textures = value;
			var texture:IStarlingTexture = this._textures.texture;
			this._frame = new Rectangle(0, 0, texture.width, texture.height);
			this._layoutChanged = true;
			this._renderingChanged = true;
			this.invalidate();
		}
		
		/**
		 * @private
		 */
		private var _width:Number = NaN;
		
		/**
		 * @private
		 */
		override public function get width():Number
		{
			return this._width;
		}
		
		/**
		 * @private
		 */
		override public function set width(value:Number):void
		{
			if(this._width == value)
			{
				return;
			}
			this._width = this._hitArea.width = value;
			this._layoutChanged = true;
			this.invalidate();
		}
		
		/**
		 * @private
		 */
		private var _height:Number = NaN;
		
		/**
		 * @private
		 */
		override public function get height():Number
		{
			return this._height;
		}
		
		/**
		 * @private
		 */
		override public function set height(value:Number):void
		{
			if(this._height == value)
			{
				return;
			}
			this._height = this._hitArea.height = value;
			this._layoutChanged = true;
			this.invalidate();
		}
		
		/**
		 * @private
		 */
		private var _color:uint = 0xffffff;
		
		/**
		 * The color value to pass to the images.
		 *
		 * <p>In the following example, the color is changed:</p>
		 *
		 * <listing version="3.0">
		 * image.color = 0xff00ff;</listing>
		 *
		 * @default 0xffffff
		 */
		public function get color():uint
		{
			return this._color;
		}
		
		/**
		 * @private
		 */
		public function set color(value:uint):void
		{
			if(this._color == value)
			{
				return;
			}
			this._color = value;
			this._propertiesChanged = true;
			this.invalidate();
		}
		
		/**
		 * @private
		 */
		private var _useSeparateBatch:Boolean = false;
		
		/**
		 * Determines if the regions are batched normally by Starling or if
		 * they're batched separately.
		 *
		 * <p>In the following example, the separate batching is disabled:</p>
		 *
		 * <listing version="3.0">
		 * image.useSeparateBatch = false;</listing>
		 *
		 * @default true
		 */
		public function get useSeparateBatch():Boolean
		{
			return this._useSeparateBatch;
		}
		
		/**
		 * @private
		 */
		public function set useSeparateBatch(value:Boolean):void
		{
			if(this._useSeparateBatch == value)
			{
				return;
			}
			this._useSeparateBatch = value;
			this._renderingChanged = true;
			this.invalidate();
		}
		
		/**
		 * @private
		 */
		private var _hitArea:Rectangle;
		
		/**
		 * @private
		 */
		private var _batch:MeshBatch;
		
		/**
		 * @private
		 */
		private var _isValidating:Boolean = false;
		
		/**
		 * @private
		 */
		private var _isInvalid:Boolean = false;
		
		/**
		 * @private
		 */
		private var _validationQueue:ValidationQueue;
		
		/**
		 * @private
		 */
		private var _depth:int = -1;
		
		/**
		 * @copy feathers.core.IValidating#depth
		 */
		public function get depth():int
		{
			return this._depth;
		}
		
		/**
		 * @private
		 */
		public override function getBounds(targetSpace:DisplayObject, resultRect:Rectangle=null):Rectangle
		{
			if(!resultRect)
			{
				resultRect = new Rectangle();
			}
			
			var minX:Number = Number.MAX_VALUE, maxX:Number = -Number.MAX_VALUE;
			var minY:Number = Number.MAX_VALUE, maxY:Number = -Number.MAX_VALUE;
			
			if (targetSpace == this) // optimization
			{
				minX = this._hitArea.x;
				minY = this._hitArea.y;
				maxX = this._hitArea.x + this._hitArea.width;
				maxY = this._hitArea.y + this._hitArea.height;
			}
			else
			{
				this.getTransformationMatrix(targetSpace, HELPER_MATRIX);
				
				MatrixUtil.transformCoords(HELPER_MATRIX, this._hitArea.x, this._hitArea.y, HELPER_POINT);
				minX = minX < HELPER_POINT.x ? minX : HELPER_POINT.x;
				maxX = maxX > HELPER_POINT.x ? maxX : HELPER_POINT.x;
				minY = minY < HELPER_POINT.y ? minY : HELPER_POINT.y;
				maxY = maxY > HELPER_POINT.y ? maxY : HELPER_POINT.y;
				
				MatrixUtil.transformCoords(HELPER_MATRIX, this._hitArea.x, this._hitArea.y + this._hitArea.height, HELPER_POINT);
				minX = minX < HELPER_POINT.x ? minX : HELPER_POINT.x;
				maxX = maxX > HELPER_POINT.x ? maxX : HELPER_POINT.x;
				minY = minY < HELPER_POINT.y ? minY : HELPER_POINT.y;
				maxY = maxY > HELPER_POINT.y ? maxY : HELPER_POINT.y;
				
				MatrixUtil.transformCoords(HELPER_MATRIX, this._hitArea.x + this._hitArea.width, this._hitArea.y, HELPER_POINT);
				minX = minX < HELPER_POINT.x ? minX : HELPER_POINT.x;
				maxX = maxX > HELPER_POINT.x ? maxX : HELPER_POINT.x;
				minY = minY < HELPER_POINT.y ? minY : HELPER_POINT.y;
				maxY = maxY > HELPER_POINT.y ? maxY : HELPER_POINT.y;
				
				MatrixUtil.transformCoords(HELPER_MATRIX, this._hitArea.x + this._hitArea.width, this._hitArea.y + this._hitArea.height, HELPER_POINT);
				minX = minX < HELPER_POINT.x ? minX : HELPER_POINT.x;
				maxX = maxX > HELPER_POINT.x ? maxX : HELPER_POINT.x;
				minY = minY < HELPER_POINT.y ? minY : HELPER_POINT.y;
				maxY = maxY > HELPER_POINT.y ? maxY : HELPER_POINT.y;
			}
			
			resultRect.x = minX;
			resultRect.y = minY;
			resultRect.width  = maxX - minX;
			resultRect.height = maxY - minY;
			
			return resultRect;
		}
		
		/**
		 * @private
		 */
		override public function hitTest(localPoint:Point):DisplayObject
		{
			if(!this.visible || !this.touchable)
			{
				return null;
			}
			return this._hitArea.containsPoint(localPoint) ? this : null;
		}
		
		/**
		 * @private
		 */
		override public function render(painter:Painter):void
		{
			if(this._isInvalid)
			{
				this.validate();
			}
			super.render(painter);
		}
		
		/**
		 * @copy feathers.core.IValidating#validate()
		 */
		public function validate():void
		{
			if(!this._isInvalid)
			{
				return;
			}
			if(this._isValidating)
			{
				if(this._validationQueue)
				{
					//we were already validating, and something else told us to
					//validate. that's bad.
					this._validationQueue.addControl(this, true);
				}
				return;
			}
			this._isValidating = true;
			if(this._propertiesChanged || this._layoutChanged || this._renderingChanged)
			{
				this._batch.batchable = !this._useSeparateBatch;
				this._batch.clear();
				
				if(!helperImage)
				{
					//because RepeatScale9Textures enforces it, we know for sure that
					//this texture will have a size greater than zero, so there
					//won't be an error from Quad.
					helperImage = new Image(this._textures.middleCenter);
				}
				if(!helperClipRectangle)
				{
					helperClipRectangle = new Rectangle();
				}
				if(!helperTileGrid)
				{
					helperTileGrid = new Rectangle();
				}
				if(!helperBounds)
				{
					helperBounds = new Rectangle();
				}
				helperImage.color = this._color;
				
				var grid:Rectangle = this._textures.scale9Grid;
				var scaledLeftWidth:Number = grid.x;
				var scaledRightWidth:Number = (this._frame.width - grid.x - grid.width);
				var sumLeftAndRight:Number = scaledLeftWidth + scaledRightWidth;
				if(sumLeftAndRight > this._width)
				{
					var distortionScale:Number = (this._width / sumLeftAndRight);
					scaledLeftWidth *= distortionScale;
					scaledRightWidth *= distortionScale;
					sumLeftAndRight = scaledLeftWidth + scaledRightWidth;
				}
				var scaledCenterWidth:Number = this._width - sumLeftAndRight;
				var scaledTopHeight:Number = grid.y;
				var scaledBottomHeight:Number = (this._frame.height - grid.y - grid.height);
				var sumTopAndBottom:Number = scaledTopHeight + scaledBottomHeight;
				if(sumTopAndBottom > this._height)
				{
					distortionScale = (this._height / sumTopAndBottom);
					scaledTopHeight *= distortionScale;
					scaledBottomHeight *= distortionScale;
					sumTopAndBottom = scaledTopHeight + scaledBottomHeight;
				}
				var scaledMiddleHeight:Number = this._height - sumTopAndBottom;
				var helperImageNum:int;
				var index:int;
				var clipWidth:int;
				var clipHeight:int;
				
				var tiles:Number;
				var styleName:String = this._textures.styleName;
				var texture:IStarlingTexture = this._textures.texture;
				var bd:BitmapData;
				var clip:Rectangle = GuiTheme.ins.copyScale9GridRect( styleName );
				var img:Image;
				
				/**repeat by cpu, only one drawCall, if numTtiles > Guitheme.checkGpuRepeatTileCount and the texture is potTexture , draw replace with gpu and add one drawCall **/
				if(scaledTopHeight > 0)
				{
					if(scaledLeftWidth > 0)
					{
						helperBounds.setTo(0 ,0, scaledLeftWidth, scaledTopHeight);
						fillMesh(helperImage, helperBounds, _textures.topLeft);
					}
					
					if(scaledCenterWidth > 0)
					{
						helperBounds.setTo(scaledLeftWidth ,0, scaledCenterWidth, scaledTopHeight);
						fillMesh(helperImage, helperBounds, _textures.topCenter, Pool.getRectangle(clip.x,0,clip.width, clip.y));
					}
					
					if(scaledRightWidth > 0)
					{
						helperBounds.setTo(_width - scaledRightWidth, 0, scaledRightWidth, scaledTopHeight);
						fillMesh(helperImage, helperBounds, _textures.topRight);
					}
				}
				
				if(scaledMiddleHeight > 0)
				{
					if(scaledLeftWidth > 0)
					{
						helperBounds.setTo(0, scaledTopHeight, scaledLeftWidth, scaledMiddleHeight);
						fillMesh(helperImage, helperBounds, _textures.middleLeft, Pool.getRectangle(0,clip.y,clip.x, clip.height));
					}
					
					if(scaledCenterWidth > 0)
					{
							helperBounds.setTo(scaledLeftWidth, scaledTopHeight, scaledCenterWidth, scaledMiddleHeight);
							fillMesh(helperImage, helperBounds, _textures.middleCenter, clip);
					}
					
					if(scaledRightWidth > 0)
					{
						helperBounds.setTo(this._width - scaledRightWidth, scaledTopHeight, scaledRightWidth, scaledMiddleHeight);
						fillMesh(helperImage, helperBounds, _textures.middleRight, Pool.getRectangle(clip.x+clip.width, clip.y, scaledRightWidth, clip.height));
					}
				}
				
				if(scaledBottomHeight > 0)
				{
					if(scaledLeftWidth > 0)
					{
						helperBounds.setTo(0, this._height - scaledBottomHeight, scaledLeftWidth, scaledBottomHeight);
						fillMesh(helperImage, helperBounds, _textures.bottomLeft);
					}
					
					if(scaledCenterWidth > 0)
					{
						helperBounds.setTo(scaledLeftWidth, this._height - scaledBottomHeight, scaledCenterWidth, scaledBottomHeight);
						fillMesh(helperImage, helperBounds, _textures.bottomCenter, Pool.getRectangle(clip.x, clip.y+clip.height, clip.width, scaledBottomHeight));
					}
					
					if(scaledRightWidth > 0)
					{
						helperBounds.setTo(_width - scaledRightWidth, _height - scaledBottomHeight, scaledRightWidth, scaledBottomHeight);
						fillMesh(helperImage, helperBounds, _textures.bottomRight);
					}
				}
			}
			
			this._propertiesChanged = false;
			this._layoutChanged = false;
			this._renderingChanged = false;
			this._isInvalid = false;
			this._isValidating = false;
		}
		
		private function fillMesh(mesh:Image, bounds:Rectangle, texture:IStarlingTexture,clip:Rectangle=null):void
		{
			/** if numTtiles > Guitheme.checkGpuRepeatTileCount and the texture is potTexture , draw replace with gpu then add one drawCall **/
			var numTiles:int = (bounds.width/texture.width) * (bounds.height/texture.height);
			
			var repeatWithGpu:Boolean = false;
			var isBatch:Boolean = true;
			if(clip != null && numTiles > GuiTheme.checkGpuRepeatTileCount)
			{
				var clipTexture:IStarlingTexture = GuiTheme.ins.getBitmapDataClipTexture(this._textures.styleName, clip);
				repeatWithGpu = clipTexture && clipTexture.root == clipTexture && TextureUtils.isPowerOfTwo(clipTexture.width) && TextureUtils.isPowerOfTwo(clipTexture.height);
			}
			
			if(repeatWithGpu)
			{
				isBatch = false;
				texture = clipTexture;
				mesh = new Image(clipTexture);
			}
			
			mesh.texture = texture;
			mesh.readjustSize();
			mesh.x  = bounds.x;
			mesh.y = bounds.y;
			mesh.width = bounds.width;
			mesh.height = bounds.height;
			mesh.tileGrid = numTiles > 1 ? helperTileGrid : null;
			mesh.setupVerticesImmediately();
			if(isBatch)
			{
				this._batch.addMesh(mesh);
			}else
			{
				this.addChild(mesh);
			}
		}
		
		/**
		 * Readjusts the dimensions of the image according to its current
		 * textures. Call this method to synchronize image and texture size
		 * after assigning textures with a different size.
		 */
		public function readjustSize(width:int=-1, height:int=-1):void
		{
			this.width = width < 0 ? this._frame.width : width;
			this.height = height < 0 ? this._frame.height : height;
		}
		
		/**
		 * @private
		 */
		protected function invalidate():void
		{
			if(this._isInvalid)
			{
				return;
			}
			this._isInvalid = true;
			if(!this._validationQueue)
			{
				return;
			}
			this._validationQueue.addControl(this, false);
		}
		
		/**
		 * @private
		 */
		private function addedToStageHandler(event:Event):void
		{
			this._depth = getDisplayObjectDepthFromStage(this);
			this._validationQueue = ValidationQueue.forStarling(Starling.current);
			if(this._isInvalid)
			{
				this._validationQueue.addControl(this, false);
			}
		}
		
		private var _style:MeshStyle;
		public function get style():MeshStyle { return _style; }
		public function set style(value:MeshStyle):void
		{
			if(_style == value)return;
			_style = value;
			if(_batch)
			{
				_batch.setStyle(value);
			}
		}
	}
}

