package com.game.engine2D.scene.render
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.core.ATFSubTexture;
	import com.game.engine2D.core.ITextureMaterial;
	import com.game.engine2D.scene.StatusConvert;
	import com.game.engine2D.scene.render.loader.RenderUnitLoader;
	import com.game.engine2D.scene.render.vo.IRenderUnitData;
	import com.game.engine2D.scene.render.vo.XmlImgData;
	import com.game.engine2D.scene.render.vo.img.RenderFaceData;
	import com.game.engine2D.scene.render.vo.img.RenderImgData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitStatus;
	import com.game.engine2D.tools.SceneCache;
	import com.game.engine2D.utils.RenderItemAngleUtil;
	import com.game.engine2D.utils.MaterialUtils;
	import com.game.engine2D.utils.Transformer;
	import com.game.engine2D.vo.BaseObj;
	import com.game.engine2D.vo.PoolMesh;
	import com.game.engine3D.vo.SoftOutlineData;
	import com.game.mainCore.libCore.pool.Pool;
	
	import flash.display.BlendMode;
	import flash.filters.BitmapFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.EntityLayerType;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 换装部件
	 * 说明(只Engine内部关注此说明)： ： 
	 * 渲染时，pXY = Math.round(showXY); 此将影响换装不晃来晃去
	 * @author Carver
	 */	
	public class RenderUnit extends BaseObj implements IRenderUnit
	{
		static private var _helpRect:Rectangle = new Rectangle();
		private static var _pool:Pool = new Pool("RenderUnit",2000);
		//显示和更新控制*********************************************************************************************************
		private var _resReady:Boolean = false;

		/**
		 * 资源是否准备完毕
		 */
		public function get resReady():Boolean
		{
			return _resReady;
		}
		
		/**
		 * @private
		 * 旧的数据
		 */	
		private var _oldData:OldData;
		
		/**
		 * 深度是否有改变,用于上层父类排序用
		 */
		public var depthHasChg:Boolean = false;
		
		/**
		 * 是否有优先级别(比如主角的换装)
		 */
		public var isPriority:Boolean = false;
		
		/**
		 * 渲染宽度偏僻(用于线性渲染)
		 */
		public var drawWdithOffset:Number = 0;
		
		/**
		 * 渲染宽度偏移(用于线程渲染)
		 */
		public var drawHeightOffset:Number = 0;
		
		//*********************************************原始参数数据************************************************************
		/**
		 * 生成此RenderUnit的换装源参数
		 */	
		private var _renderUnitData:IRenderUnitData;
		private var cutRect:Rectangle = new Rectangle();
		private var _hitTestX:int = int.MIN_VALUE;
		private var _hitTestY:int = int.MIN_VALUE;
		private var _showPos:Point = new Point();
		private var _softOutlineData:SoftOutlineData;
		
		/**
		 * 生成此RenderUnit的换装源参数
		 */	
		public function get data():IRenderUnitData
		{
			return _renderUnitData;
		}
		
		public function set data(value:IRenderUnitData):void
		{
			_renderUnitData = value;
		}
		
		private function getHitTestX() : Number
		{
			if (int.MIN_VALUE == _hitTestX)
			{
				if (null == currentApData)
					return 0;
				if(_renderScaleX == -1)
				{
					_hitTestX = currentApData.tx - _drawSourceTexture.width;
				} 
				else
				{
					_hitTestX = - currentApData.tx;
				}
			}
			return _hitTestX;
		}
		private function getHitTestY() : Number
		{
			if (int.MIN_VALUE == _hitTestY)
			{
				if (null == currentApData)
					return 0;

				_hitTestY = - currentApData.ty;
			}
			return _hitTestY;
		}

		/**本换装部件在场景中 的 显示位置(外部设置无效,只用来读取)*/
		override final public function get showPos():Point
		{
			if(_dynamicPosition)
			{
				_showPos = _dynamicPosition.update(this);
			}
			else
			{
				_showPos.x = x + offsetX;
				_showPos.y = y + offsetY;
			}
			return _showPos;	
		}
		
		override public function set alpha(value:Number):void
		{
			super.alpha = value;
			if(_graphicDis)
			{
				PoolMesh(_graphicDis).alpha = value;
				PoolMesh(_graphicDis).castsShadows = drawCastsShadows;
			}
		}
		
		/***x */	
		override public function set x(value:Number):void
		{
			value = value >> 0;
			if(_x != value)
			{
				_x = value;
				if(_graphicDis)
				{
					_graphicDis.x = showPos.x + cutRect.x*_renderScaleX;
					if(_graphicDis.scaleX != _renderScaleX)
					{
						_graphicDis.scaleX = _renderScaleX;
					}
				}
				
				if(_shadow)
				{
					//添加进容器
					_shadow.x = this.x+GlobalConfig2D.shadowOffsetX+_shadowOffsetX;
				}
				updateNow = true;
			}
		}
		
		/***y */	
		override public function set y(value:Number):void
		{
			value = value >> 0;
			if(_y != value)
			{
				_y = value;
				if(_graphicDis)
				{
					_graphicDis.y = showPos.y + cutRect.y;
				}
				if(_shadow)
				{
					//添加进容器
					_shadow.y = this.y+GlobalConfig2D.shadowOffsetY+_shadowOffsetY;
				}
				updateNow = true;
			}
		}
		
		/*** 偏移量x */	
		override final public function set offsetX(value:Number):void
		{
			value = value >> 0;
			if(_offsetX != value)
			{
				_offsetX = value;
				if(_graphicDis)
				{
					_graphicDis.x = showPos.x + cutRect.x*_renderScaleX;
					if(_graphicDis.scaleX != _renderScaleX)
					{
						_graphicDis.scaleX = _renderScaleX;
					}
				}
				
				updateNow = true;
			}
		}
		
		/*** 偏移量y */	
		override final public function set offsetY(value:Number):void
		{
			value = value >> 0;
			if(_offsetY != value)
			{
				_offsetY = value;
				if(_graphicDis)
				{
					_graphicDis.y = showPos.y + cutRect.y;
				}
				updateNow = true;
			}
		}
		/**
		 * 设置旋转
		 */	
		override public function set rotation(value:Number):void
		{
			throw new Error("换装部件暂时不支持选择操作...");
		}
		
		private var _isNeedScaleX:Boolean = true;
		private var _renderScaleX:int = 1;
		
		override final public function set logicAngle(value:uint):void
		{
			if(_logicAngle != value)
			{
				_logicAngle = value;
				//
				setRuStatusData(_currentRenderUnitStatus || _defaultRenderUnitStatus);//重新取一下配置数据。
				//
				updateNow = true;
			}
		}
		
		override public function set forceEnableBlendMode($value:Boolean):void
		{
			super.forceEnableBlendMode = $value;
			if(_forceEnableBlendMode || GlobalConfig2D.enableBlendMode)
			{
				if(data)
				{
					if(data.blendMode == BlendMode.NORMAL)
					{
						if(_currentRenderUnitStatus)
						{
							blendMode = _currentRenderUnitStatus.blendMode;
						}
					}
					else
					{
						blendMode = data.blendMode;
					}
				}
			}
			else
			{
				blendMode = BlendMode.NORMAL;
			}
		}
		
		public var hitTestFun:Function;
		
		/**
		 * 是否与某个点发生碰撞
		 * @param $p
		 */
		override public function hitPoint($p:Point):Boolean
		{
			if (!mouseEnabled)
				return false;
			if (!visible)
				return false;
			var pxielX:Number = $p.x - getHitTestX();
			var pxielY:Number = $p.y - getHitTestY();
			
			//容器翻转了。 内存里的位图是木有翻转的，so，减一下
			if(_renderScaleX == -1)
			{
				pxielX = _drawSourceTexture.width - pxielX;
			}
			var sourceTexture:ATFSubTexture = _drawSourceTexture as ATFSubTexture;
			if(sourceTexture!=null)
			{
				if (sourceTexture.checkHinderData(pxielX, pxielY))
				{
					return true;//256的25%
				}
			}
			return false;
		}
		
		/**
		 * 检测点是否与外围矩形发生碰撞
		 * @param $p
		 */
		public function hitRectPoint($p:Point):Boolean
		{
			if(!mouseEnabled)return false;
			if(!visible)return false;
			
			//guoqing.wen
			if(_drawSourceTexture!=null)
			{
				_helpRect.setTo(cutRect.x,cutRect.y,_drawSourceTexture.width, _drawSourceTexture.height);
				if(_helpRect.contains($p.x, $p.y)){
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 是否与某个矩形发生碰撞
		 * @param $p
		 * @param $checkMouseEnabled 是否判断鼠标响应
		 */
		override public function hitRect($rect:Rectangle):Boolean
		{
			if(!mouseEnabled)return false;
			if(!visible)return false;
			return false;
		}
		
		override public function set parent(value:ObjectContainer3D):void
		{
			super.parent = value;
			if(_shadow && _shadow.parent == _parent && _parent.getChildIndex(_shadow)!=0)
			{
				_parent.addChild(_shadow);
			}
		}
		
		override public function set layerType(value:uint):void
		{
			super.layerType = value;
			if (_graphicDis)
				PoolMesh(_graphicDis).layerType = value;
		}
		
		override public function set depth(value:int):void
		{
			if(_depth != value)
			{
				depthHasChg = true;
			}
			PoolMesh(_graphicDis).depth = value;
			super.depth = value;
		}
		
		override public function set depthIndex(value:uint):void
		{
			if(_depthIndex != value)
			{
				depthHasChg = true;
			}
			super.depthIndex = value;
			if(_shadow && _shadow.parent == _parent && _parent.getChildIndex(_shadow)!=0)
			{
				_parent.setChildIndex(_shadow,0);
			}
		}
		
		override public function set visible(value:Boolean):void
		{
			super.visible = value;
			if (value)
			{
				if (_needRender)//如果为false,就不管...
				{
					var ruStatus:RenderUnitStatus = _currentRenderUnitStatus || _defaultRenderUnitStatus;
					if(ruStatus == null && _currentStatus != 0)
					{
						var status:uint = _currentStatus;
						_currentStatus = 0;
						setStatus(status);//重置,再设置..
					}
				}
				if (_shadow && !_shadow.parent && parent && _enableShadow && _isDrawShadow)
				{
					parent.addChild(_shadow);
					parent.setChildIndex(_shadow,0);
				}
			}
			else
			{
				if (_shadow && _shadow.parent)
				{
					_shadow.parent.removeChild(_shadow);
				}
			}
		}
		
		override public function set smooth(value:Boolean):void
		{
			super.smooth = value;
			PoolMesh(_graphicDis).smooth = value;
		}
		
		override public function set needRender(value:Boolean):void
		{
			if (_needRender == value)
				return;

			super.needRender = value;
			if (!value)
				return;

			if(!_visible)//如果为false,就不管...
				return;

			var ruStatus:RenderUnitStatus = _currentRenderUnitStatus || _defaultRenderUnitStatus;
			if(ruStatus == null && _currentStatus != 0)//
			{
				var status:uint = _currentStatus;
				_currentStatus = 0;
				setStatus(status);//重置,再设置..
			}
		}
		
		/**销毁显示对象 */
		override public function destroy():void
		{
			recycle(this);
		}
		
		//各种回调，统一回传参数：	($ap:RenderUnit=null)
		//===============================================================================
		private var _addedCallBackList:Vector.<CallBackData>;
		/**
		 * @private
		 * 换装添加回调 
		 * 传回参数：(this)
		 */
		public function setAddedCallBack(value:Function,...args):void
		{
			if(!_addedCallBackList)
			{
				_addedCallBackList = new Vector.<CallBackData>;
			}
			addCallBackData(_addedCallBackList,value,args);
		}
		/**
		 * @private
		 * 移除换装添加回调 
		 * 传回参数：(this)
		 */
		public function removeAddedCallBack(value:Function):void
		{
			removeCallBackData(_addedCallBackList,value);
		}
		///-------------------------------------------------------------------------///
		private var _removedCallBackList:Vector.<CallBackData>;
		/**
		 * @private
		 * 换装移除回调(dispose方法执行完之前调用)
		 * 传回参数：(this)
		 */
		public function setRemovedCallBack(value:Function,...args):void
		{
			if(!_removedCallBackList)
			{
				_removedCallBackList = new Vector.<CallBackData>;
			}
			addCallBackData(_removedCallBackList,value,args);
		}
		/**
		 * 移除换装移除回调(dispose方法执行完之前调用)
		 */
		public function removeRemovedCallBack(value:Function):void
		{
			removeCallBackData(_removedCallBackList,value);
		}
		///-------------------------------------------------------------------------///
		private var _playBeforeStartCallBackList:Vector.<CallBackData>;
		/**
		 * @private
		 * 换装动画播放开始前回调 
		 * 传回参数：(this)
		 */
		public function setPlayBeforeStartCallBack(value:Function,...args):void
		{
			if(!_playBeforeStartCallBackList)
			{
				_playBeforeStartCallBackList = new Vector.<CallBackData>;
			}
			addCallBackData(_playBeforeStartCallBackList,value,args);
		}
		/**
		 * 移除换装动画播放开始前回调 
		 */
		public function removePlayBeforeStartCallBack(value:Function):void
		{
			removeCallBackData(_playBeforeStartCallBackList,value);
		}
		///-------------------------------------------------------------------------///
		private var _playStartCallBackList:Vector.<CallBackData>;
		/**
		 * @private
		 * 换装动画播放开始回调 
		 * 传回参数：(this)
		 */		
		public function setPlayStartCallBack(value:Function,...args):void
		{
			if(!_playStartCallBackList)
			{
				_playStartCallBackList = new Vector.<CallBackData>;
			}
			addCallBackData(_playStartCallBackList,value,args);
		}
		
		/**
		 * 移除换装动画播放开始回调 
		 */		
		public function removePlayStartCallBack(value:Function):void
		{
			removeCallBackData(_playStartCallBackList,value);
		}
		///-------------------------------------------------------------------------///
		private var _playUpdateCallBackList:Vector.<CallBackData>;
		/**
		 * @private
		 * 换装动画播放过程回调 
		 * 传回参数：(this)
		 */		
		public function setPlayUpdateCallBack(value:Function,...args):void
		{
			if(!_playUpdateCallBackList)
			{
				_playUpdateCallBackList = new Vector.<CallBackData>;
			}
			addCallBackData(_playUpdateCallBackList,value,args);
		}
		/**
		 * 换装动画播放过程回调 
		 */		
		public function removePlayUpdateCallBack(value:Function):void
		{
			removeCallBackData(_playUpdateCallBackList,value);
		}
		///-------------------------------------------------------------------------///
		private var _playCompleteCallBackList:Vector.<CallBackData>;
		/**
		 * @private
		 * 换装动画播放结束回调
		 * 传回参数：(this)
		 */		
		public function setPlayCompleteCallBack(value:Function,...args):void
		{
			if(!_playCompleteCallBackList)
			{
				_playCompleteCallBackList = new Vector.<CallBackData>;
			}
			addCallBackData(_playCompleteCallBackList,value,args);
		}
		/**
		 * 移除换装动画播放结束回调
		 */		
		public function removePlayCompleteCallBack(value:Function):void
		{
			removeCallBackData(_playCompleteCallBackList,value);
		}
		///-------------------------------------------------------------------------///
		private function addCallBackData(list:Vector.<CallBackData>,value:Function,args:Array):void
		{
			if(list)
			{
				var len:int = list.length;
				var cbData:CallBackData;
				while(len-->0)
				{
					cbData = list[len];
					if(cbData && cbData.callBackFun == value)//有了重置参数
					{
						cbData.cbFunParames = args;
						return;
					}
				}
				cbData = new CallBackData(value,args);
				list.push(cbData);
			}
		}
		
		private function removeCallBackData(list:Vector.<CallBackData>,value:Function):void
		{
			if(list)
			{
				var len:int = list.length;
				var cbData:CallBackData;
				while(len-->0)
				{
					cbData = list[len];
					if(cbData && cbData.callBackFun == value)//有了就不管了
					{
						list.splice(len,1);;
					}
				}
			}
		}
		
		final private function exceteCallBackData(list:Vector.<CallBackData>):void
		{
			if(list)
			{
				var cbList:Vector.<CallBackData> = list.concat();//拷贝一份了执行...
				var i:uint = 0;
				for(i=0;i<cbList.length;i++)
				{
					var cbData:CallBackData = cbList[i];
					if(cbData && cbData.callBackFun != null)//有了就不管了
					{
						var arr:Array = [];
						if(cbData.cbFunParames && cbData.cbFunParames.length)
						{
							arr = cbData.cbFunParames.concat(this);
						}
						else
						{
							arr = [this];
						}
						cbData.callBackFun.apply(null,arr);//临时先用着啦,为了怕有底的放改出错误来了
					}
				}
			}
		}
		
		//==============================================================================
		//位图资源**********************************************************************
		//
		private var _defaultRenderUnitStatus:RenderUnitStatus;
		private var _defaultRenderImgData:RenderImgData;
		
		/**
		 * @private
		 *	部件图片资源数据
		 */
		private var _renderImgData:RenderImgData;
		/**
		 * @private
		 *	部件图片资源
		 */
		private function get renderImg():ATFSubTexture
		{
			var texture:ATFSubTexture = null;
			var imgData:RenderImgData = null;
			var sourceKey:uint = StatusConvert.getIdByNum(_currentStatus, GlobalConfig2D.resAngleFunc(_logicAngle), currentFrame);
			if (_renderImgData){
				texture = _renderImgData.getSubTexture(String(sourceKey));
				if (texture == null)
				{
					var msg:String = "模型资源格式错误， 资源只画了一个方向，你让我播放8方向，不是搞笑？ 动作:$0 角度:" + _logicAngle + " 帧数:" + currentFrame + " 资源路径"+  _currentFullSourchPath; 
					trace(msg)
					 EventManager.dispatchEvent("renderTextNull",msg,_currentStatus);
				}
				if (texture && texture.parentI.textureParsed){
					if (_defaultRenderImgData)
						return _defaultRenderImgData.getSubTexture(String(sourceKey));
					else 
						return null;
				}
				return texture;
			}
			else if (_defaultRenderImgData){
				return _defaultRenderImgData.getSubTexture(String(sourceKey));
			}
			else {
				return null;
			}
		}

		/**
		 * @private 
		 * 绘制用的资源BD
		 */
		private var _drawSourceTexture:ATFSubTexture;
		
		private var _enableFilters:Boolean = true;
		
		public function get enableFilters():Boolean
		{
			return _enableFilters;
		}
		
		public function set enableFilters(value:Boolean):void
		{
			_enableFilters = value;
		}
		
		private var _blendMode:String = "normal";
		public function get blendMode():String
		{
			return _blendMode;
		}
		
		public function set blendMode(value:String):void
		{
			_blendMode = value;
			/*if(_graphicDis)
			{
				_graphicDis.blendMode = _blendMode;
			}*/
		}
		
		/**应用滤镜数组*/
		private const _bitmapFilters:Array = [];
		/**应用滤镜数组*/
		public function get bitmapFilters():Array{return _bitmapFilters};
		/**添加滤镜*/
		public function addFilter($bf:BitmapFilter):void
		{
		}
		
		/**移除滤镜*/
		public function removeFilter($bf:BitmapFilter):void
		{
		}
		
		/**清除所有滤镜*/
		public function removeAllFilters():void
		{
		}
		
		public function setSoftOutline(data : SoftOutlineData) : void
		{
			if (_softOutlineData == data)
				return;
			_softOutlineData = data;
			var mesh:PoolMesh = PoolMesh(_graphicDis);
			if (data)
			{
				mesh.layerType |= EntityLayerType.OUTLINE_GLOW_LAYER;
				mesh.outlineColor = data.color;
				mesh.outlineAlpha = data.alpha;
				mesh.outlineSize = data.size;
				mesh.outlineDrawLevel = data.outlineDrawLevel;
				mesh.outlineMakeUpFract = true;
			}
			else
			{
				mesh.layerType = EntityLayerType.DEFAULT;
			}
		}
		
		override public function get colorTransform():ColorTransform
		{
			return _colorTransform;
		}
		
		override public function set colorTransform(value:ColorTransform):void
		{
			super.colorTransform = value;
			if(_graphicDis)
			{
				PoolMesh(_graphicDis).colorTransform = value;
			}
		}
		
		public function addColorTransform(value:ColorTransform):void
		{
			colorTransform = value;
		}
		
		/**移除滤镜*/
		public function removeColorTransform():void
		{
			if(_graphicDis)
			{
				PoolMesh(_graphicDis).colorTransform = null;
			}
		}
		
		//当前状态信息**********************************************************************
		/**
		 * @private 
		 * 当前状态
		 */
		private var _currentStatus:uint = 0;//注意这个默认值要给空
		/**
		 * @private 
		 * 当前状态对应的资源地址
		 */
		private var _currentFullSourchPath:String = null;
		/**
		 * 获取状态对应的资源地址
		 * 
		 */	
		public function getFullSourchPath():String{return _currentFullSourchPath;}

		/**
		 * @private 
		 * 当前换装部件的当前状态的原始数据(与_currentFullSourchPath区别， _currentRenderUnitStatus只有在资源加载完毕才会有)
		 */
		private var _currentRenderUnitStatus:RenderUnitStatus;
		/**
		 * @private 
		 * 当前帧数(从0开始到totalFrame-1)
		 */
		private var _currentFrame:int = 0;

		/**
		 * 当前播放帧(0到totalFrame-1)
		 */
		public function get currentFrame():int
		{
			return _currentFrame>=_totalFrame?0:_currentFrame;
		}
		
		private var _totalFrame:int = 0;
		/**
		 * 总帧数(注意只有资源加载完毕才能获取总帧数，否则返回1, 所以请在onAdd回调发生之后中取该值)
		 */
		public function get totalFrame():int
		{
			return _totalFrame;
		}
		
		private var _keyFrame:int = -1;
		/**
		 * 关键帧(注意只有资源加载完毕才能获取总帧数，否则返回1, 所以请在onAdd回调发生之后中取该值)
		 */
		public function get keyFrame():int
		{
			return _keyFrame;
		}
		
		private var _keyFrameTm:int = -1;
		/**
		 * 到达关键帧的时间 
		 */		
		public function get keyFrameTime():int
		{
			return _keyFrameTm;
		}
		
		private var _totalFrameTm:int = -1;
		/**
		 * 动作播放完的总时间 
		 */		
		public function get totalFrameTime():int
		{
			return _totalFrameTm;
		}
		
		public function getImgApData($action:uint,$angle:uint,$frame:uint):RenderUnitData
		{
			if(_currentRenderUnitStatus==null)
			{
				return null;
			}
			var xmlImgData:XmlImgData = SceneCache.renderUnitCountShare.getShareData(_currentRenderUnitStatus.fullSourchPath) as XmlImgData;
			if(xmlImgData && xmlImgData.aps)
			{
				return xmlImgData.aps.getRenderUnitData($action,$angle,$frame);
			}
			return null;
		}
		
		//播放控制**********************************************************************
		/**
		 * 播放完毕是否停留在最后一帧
		 */	
		private var _stayAt:int = 0;
		/**
		 * 播放到某一帧后停下
		 * @param $frame 范围(1到totalFrame),不需要此设置请设置为小于等于0的数，比如0
		 */	
		public function stayAt($frame:int=0):void
		{
			_stayAt = $frame-1;
		}
		/**
		 * 是否停在最后一帧(优先级高于stayAt方法设置的值)
		 */	
		public var stayAtEnd:Boolean = false;
		/**
		 * 是否允运行帧逻辑
		 */	
		private var _playing:Boolean=true;
		/**
		 * 是否允运行帧逻辑
		 */	
		public function get playing():Boolean{return _playing;}
		/**
		 * 跳转到某一帧播放(会清空播放次数)
		 * @param $frame 范围(0到totalFrame-1)
		 */	
		public function play($frame:int=-1):void
		{
			$frame = $frame<0?_currentFrame:$frame;//如果小于0,那么就从当前帧开始播放
			
			_playing = true;
			
			//清空停留
			stayAt(0);
			
			//当前帧
			_currentFrame = $frame;
			
			//播放信息
			_playCount = 0;
			_lastTime = 0;
			_lastPlayCompleteTime = 0;
			_playBeforeStart = true;
			_playStart = true;
			_playComplete = false;
			
			updateNow = true;
		}
		/**
		 * 跳转到某一帧(会清空播放次数)
		 * @param $frame 范围(1到totalFrame)
		 */	
		public function stop($frame:int=-1):void
		{
			$frame = $frame<0?_currentFrame:$frame;//如果小于0,那么就停止当前帧
			
			_playing = false;
			
			//清空停留
			stayAt(0);
			
			//当前帧
			_currentFrame = $frame;//注意这里减1
			
			//播放信息
			_playCount = 0;
			_lastTime = 0;
			_lastPlayCompleteTime = 0;
			
			updateNow = true;
		}
		
		/**
		 * 同步播放信息
		 * @param $ap 源换装部件
		 */	
		public function syncPlayInfoFrom($ap:RenderUnit):void
		{
			_playing = $ap.playing;
			
			//清空停留
			stayAt($ap._stayAt);
			
			//当前帧
			_currentFrame = $ap._currentFrame;
			
			//播放信息
			_playCount = $ap._playCount;
			_lastTime = $ap._lastTime;
			_lastPlayCompleteTime = $ap._lastPlayCompleteTime;
			_playBeforeStart = $ap._playBeforeStart;
			_playStart = $ap._playStart;
			_playComplete = $ap._playComplete;
			
			updateNow = true;
		}
		
		/**
		 * 播放重复次数
		 * */
		public var repeat:int = 0;
		/**
		 * 播放速度倍数(播放速度将为正常播放速度的speed倍)
		 * 注意此值应该为一个大于0的值！！！不能设置为0.
		 * */
		public var speed:Number = 1;

		//当前播放信息**********************************************************************
		/**
		 * @private 
		 * 当前播放次数
		 */
		private var _playCount:int = 0;
		/**
		 * @private 
		 * 上次更新的时间(够时间间隔才能刷新)
		 */
		private var _lastTime:Number = 0;//注意此值不能给-int.MAX_VALUE,会溢出
		/**
		 * @private 
		 * 上次更新完成的时间
		 */
		private var _lastPlayCompleteTime:Number = 0;//注意此值不能给-int.MAX_VALUE,会溢出
		/**
		 * @private 
		 * 是否播放开始前
		 */
		private var _playBeforeStart:Boolean = false;
		/**
		 * @private 
		 * 是否播放开始
		 */
		private var _playStart:Boolean = false;
		/**
		 * @private 
		 * 是否播放完成
		 */
		private var _playComplete:Boolean = false;
		
		//动态位置**********************************************************************
		private var _dynamicPosition:IDynamicPosition;
		/**动态位置控制*/
		public function set dynamicPosition(value:IDynamicPosition):void
		{
			_dynamicPosition = value;
		}
		
		//其他参数**********************************************************************
		/**
		 * RenderUnit
		 * @param $avatar 所属avatar
		 * @param $apd 换装部件原始参数
		 */
		public function RenderUnit($apd:IRenderUnitData)
		{
			super([$apd]);
		}
		
		private static var _cnt:int = 0;
		
		/**
		 * 生成一个RenderUnit
		 * @param $type
		 * @param $value
		 */
		public static function create($apd:IRenderUnitData):RenderUnit
		{
			_cnt++;
			//利用池生成RenderUnit
			return _pool.createObj(RenderUnit,$apd) as RenderUnit;
		}
		
		public static function recycle($ap:RenderUnit):void
		{
			_cnt--;
			//利用池回收RenderUnit
			//$ap.dispose();
			_pool.disposeObj($ap);
		}
		
		public static function get cnt():int
		{
			return _cnt;
		}
		
		//获取、设置 状态、逻辑角度、旋转
		//-----------------------------------------------------------------------------------------------------------------------
		/**
		 * 获取状态
		 * 
		 */	
		public function get status():uint
		{
			return _currentStatus;
		}
		
		/**
		 * 设置状态
		 * @param $status 状态
		 * 
		 */	
		public function setStatus($status:uint):void
		{
			if (_currentStatus == $status)
				return;
			if (!_needRender)
				return;
			
			// 设置状态
			_currentStatus = $status;
			// 释放旧的换装
			if (_currentFullSourchPath != null)
			{
				// 释放旧的换装
				if (_currentRenderUnitStatus == null)
				{
					////停止接在旧的换装(注意此处的stopLoad参数传fasle)
					SceneCache.removeWaitingRenderUnit(this, _currentFullSourchPath, false);
				} else
				{
					//卸载旧的换装
					SceneCache.renderUnitCountShare.uninstallShareData(_currentFullSourchPath, this);
				}
			}
			
			//清空数据
			_currentFullSourchPath = null;
			_currentRenderUnitStatus = null;
			_renderImgData = null;
			
			//重置当前帧
			_currentFrame = 0;
			//
			_totalFrame = -1;
			_keyFrame = -1;
			_keyFrameTm = -1;
			_totalFrameTm = -1;
			//
			setRuStatusData(_defaultRenderUnitStatus);
			//
			//重置当前播放状态
			_playCount = 0;
			_lastTime = 0;
			_lastPlayCompleteTime = 0;
			_playBeforeStart = true;
			_playStart = true;
			_playComplete = false;
			_playing = true;
			_stayAt = 0;
			_resReady = false;
			
			//清空自己占用的绘图区
			updateNow = true;
			
			//如果是有换装图片的资源
			if (_renderUnitData && _visible)//隐藏的时候，就不处理加载了。
			{
				//记录下新的换装地址
				_currentFullSourchPath = _renderUnitData.getFullSourcePath(_currentStatus);
				if(_currentFullSourchPath == null)
				{
					_renderUnitData.getFullSourcePath(_currentStatus);
				}
				//加载新的换装
				RenderUnitLoader.loadRenderUnit(this, _currentStatus);
			} 
		}
	
		/**
		 * 设置角度
		 * @param $angle
		 */		
		public function setAngle($angle:Number):void 
		{
			logicAngle = Transformer.transAngle2LogicAngle($angle);
			//
			setRuStatusData(_currentRenderUnitStatus || _defaultRenderUnitStatus);//重新取一下配置数据。
		}
		
		/**
		 * 设置新的换装状态数据(该方法由引擎内部调用，外部不要调用)
		 * 	这里是不是应该放一个唯一标识呢， 已放置无效的回调111111111111111111111
		 * */
		public function setRenderUnitStatus($aps:RenderUnitStatus):void
		{
			if($aps.fullSourchPath != _currentFullSourchPath)
			{
				trace("啊啊啊啊啊啊,坑啊,怎么会这样,赶紧查查看!////////////////此处来了,必定会造成内存泄漏......");
				SceneCache.renderUnitCountShare.uninstallShareData($aps.fullSourchPath,this);
				return;//应该不会1111111111111111
			}
			//
			if(_forceEnableBlendMode || GlobalConfig2D.enableBlendMode)
			{
				if(_blendMode == BlendMode.NORMAL)
				{
					blendMode = $aps.blendMode;
				}
			}
			else
			{
				blendMode = BlendMode.NORMAL;
			}
			//获取状态数据
			_currentRenderUnitStatus = $aps;
			//装在新的换装
			_renderImgData = (SceneCache.renderUnitCountShare.installShareData(_currentRenderUnitStatus.fullSourchPath,this) as XmlImgData).aid;
			//注意这里也要有
			_resReady = true;
			updateNow = true;
			//执行添加回调
			exceteCallBackData(_addedCallBackList);
			//
			setRuStatusData(_currentRenderUnitStatus);//重新取一下配置数据。//
		}
		
		final private function setRuStatusData(ruStatus:RenderUnitStatus):void
		{
			if(ruStatus)
			{
				_keyFrame = ruStatus.getKeyFrame(_currentStatus,_logicAngle);
				_keyFrameTm = ruStatus.getKeyFrameTm(_currentStatus,_logicAngle);
				//
				_totalFrame = ruStatus.getTotalFrame(_currentStatus,_logicAngle);
				_totalFrameTm = ruStatus.getTotalFrameTm(_currentStatus,_logicAngle);
				
				_isNeedScaleX = ruStatus.isNeedScaleX(_currentStatus,_logicAngle);
				//
				if(_isNeedScaleX)
					_renderScaleX = RenderItemAngleUtil.getAngleScaleX(_logicAngle);
				else
					_renderScaleX = 1;
			}
			if(_currentFrame >= _totalFrame)
			{
				_currentFrame = 0;
			}
		}
		
		private var _rOffsetX:Number = 0;
		private var _rOffsetY:Number = 0;
		private var _lastDrawTm:uint = 0;
		private var _dyncTickcount:uint = 0;
		
		private var currentApData:RenderUnitData;
		
		private var _preCompleteTime:int = 0;
		private var _delyTime:int = 0;
		
		
		/**
		 * @private 
		 * 执行一步
		 * 目的：绘制 并 更新各个换装部件
		 * @parma $frame 帧 为0则走渲染计时计算的帧，否则选择此参数指定的帧
		 */	
		override final public function run(gapTm : uint):void
		{
			if (_currentStatus == 0 || _playComplete)
			{
				return;
			}
			//计算是否睡眠
			var inSleep:Boolean = false;
			var nowTime:int = GlobalConfig2D.nowTime || getTimer();	// 减少getTimer()的调用次数，提高性能;
			if(
				_renderUnitData
				&&
				_renderUnitData.sleepTime>0//如果睡眠时间大于0
				&&
				_lastPlayCompleteTime>0 //第一遍执行不睡眠
				&& 
				nowTime-_lastPlayCompleteTime<=_renderUnitData.sleepTime//在睡眠时间范围内
			)
			{
				//改变标识
				inSleep = true;
			}

			//睡眠变化
			if(_oldData.inSleep != inSleep)
			{
				_oldData.inSleep = inSleep;
				//设置渲染标志位
				updateNow = true;
			}
			
			//更新帧数
			//-------------------------------------------------------
			var ruStatus:RenderUnitStatus = _currentRenderUnitStatus || _defaultRenderUnitStatus;
			var isNeedExcuteCallBack:Boolean = false;
			if(ruStatus)//小于等于1帧的时候,就不用更新了...
			{
				if(!inSleep)//如果不在睡眠中
				{
					//播放开始前回调
					if(_playBeforeStart)
					{
						updateNow = true;
						//
						_playBeforeStart = false;
						//执行播放前回调
						exceteCallBackData(_playBeforeStartCallBackList);
					}
					//----------------------------------------------------------------------
					if(stayAtEnd && _currentFrame==_totalFrame)//如果有指定停留在最后一帧
					{
						//不处理
					}
					else if(_stayAt>0 && _stayAt==_currentFrame)//如果有指定停留帧
					{
						//不处理
					}
					else if(_playing && _totalFrame > 1)
					{
						_lastTime = _lastTime || nowTime;//第一次...不走时间执行
						//更新帧数
						var time:Number = nowTime-_lastTime;
						var frameTm:uint = ruStatus.getTime(_currentStatus,_logicAngle,_currentFrame);
						var speedFtameTM:Number = frameTm/speed;
						//如果满足刷新时间间隔
						if(time >= speedFtameTM) 
						{
							var currentDelyTime:int = time - speedFtameTM;
							if(_currentStatus == 5)
							{
								_delyTime += currentDelyTime;
								addTraceLog(type + "---" + _currentFrame + "==========跳帧, 需要" + speedFtameTM + "毫秒, 当前" +  time + " 毫秒" + "当前延迟：" + currentDelyTime +  " 总延迟:" + _delyTime + "--" + _currentFullSourchPath);
							}
							//记录下最近一次刷新的时间
							_lastTime = nowTime;
							if(currentDelyTime < 200)//浏览器最小化时帧数只有2帧
							{
								//减去此帧多出来的时间
								_lastTime -= currentDelyTime;
							}
							if(isMainChar && _currentStatus == 5)
							{
								if(type == "body")
								{
									addTraceLog("body:" + _currentFrame);
								}
								if(type == "weapon")
								{
									addTraceLog("weap:" + _currentFrame);
								}
							}
							//当前帧加1
							_currentFrame++;
							
							//如果当前帧播放到“末尾加1帧”
							if(_currentFrame >= _totalFrame) //一个循环播放完成了， 
							{
								_currentFrame = 0;
								//如果睡眠时间大于0
								if(_renderUnitData.sleepTime>0)
								{
									//记录时间
									_lastPlayCompleteTime = nowTime;
									//强制进入睡眠
									inSleep = true;
								}
								
								if(repeat!=0 && (++_playCount)>=repeat)//非无限循环
								{
									_currentFrame = _totalFrame-1;
									_playComplete = true;
								}
								var getTime:int = getTimer();
								var playGap:int = getTime - _preCompleteTime;
								if(_currentStatus == 5)
								{
									addLogMsg(type+ "---" + _currentFrame +"本次播放间隔：" + playGap + "毫秒" + "--" + _currentFullSourchPath);
									addLogMsg(type + "---" + _currentFrame +"本次延迟了：" + _delyTime + "毫秒" + "--" + _currentFullSourchPath);
									addLogMsg(type + "---" + _currentFrame +"减去延迟间隔" + (playGap - _delyTime) + "毫秒" + "--" + _currentFullSourchPath);
									addLogMsg("");
									addLogMsg("");
									_delyTime = 0;
								}
								_preCompleteTime = getTime;
							}
							//设置渲染标志位
							if(_totalFrame > 1 || _playComplete)//注意这个判断,只有大于1帧或者只有一帧但为播放完毕状态的的才复渲染了
							{
								updateNow = true;
							}
							isNeedExcuteCallBack = true;
						}else
						{
							//当前帧时间未到,暂不跳帧
							if(_currentStatus == 5)
							{
								addTraceLog(type + "---" + _currentFrame + "不跳帧, 需要" + speedFtameTM + "毫秒, 当前" +  time + " 毫秒" + "--" + _currentFullSourchPath);
							}
						}
					}
					else if (_playing && _totalFrame == 1)//增加只有1帧的动画回调
					{
						isNeedExcuteCallBack = true;
					}
				}
			}
			var graphicSp:PoolMesh = _graphicDis as PoolMesh;
			//--------------------------------------------------------
			//更新剪切矩形
			//--------------------------------------------------------
			var hasNeedRender:Boolean = needRender && visible && _graphicDis.parent;
			if(updateNow && hasNeedRender)
			{ 
				_drawSourceTexture = renderImg;//取不到的时候,就取原来的吧...
				if(_drawSourceTexture == null)//清空渲染...
				{
					graphicSp.material = MaterialUtils.default1x1Texture;
					if(_shadow)
					{
						_shadow.material = MaterialUtils.default1x1Texture;
					}
				}
				var isNeedDraw:Boolean = false;
				//可见性判断
				if(     _drawSourceTexture!=null
						&& (!inSleep)
						&& ruStatus!=null
					)
				{
					currentApData = ruStatus.getRenderUnitData(_currentStatus,_logicAngle, _currentFrame);
					if (currentApData!=null)
					{
						cutRect.x = - currentApData.tx;
						cutRect.y = - currentApData.ty;
						cutRect.width = _drawSourceTexture.width;
						cutRect.height = _drawSourceTexture.height;

						_hitTestX = int.MIN_VALUE;
						_hitTestY = int.MIN_VALUE;
						//
						isNeedDraw = true;
					}
				}

				//拷贝
				if(isNeedDraw)
				{
					if(_oldData.oldSourceBD != _drawSourceTexture)
					{
						graphicSp.texture = _drawSourceTexture;
					}
					//
					_oldData.oldSourceBD = _drawSourceTexture;
					//执行一次以后在置成false
				}
				updateNow = false;
			}
			
			if(hasNeedRender && graphicSp)
			{
				graphicSp.x = showPos.x + cutRect.x*_renderScaleX;
				graphicSp.y = showPos.y + cutRect.y;
				if(graphicSp.scaleX != _renderScaleX)
				{
					graphicSp.scaleX = _renderScaleX;
				}
				graphicSp.castsShadows = drawCastsShadows;
				graphicSp.run();
			}
			//
			if(isNeedExcuteCallBack)
			{
				execPlayCallBack();
			}
		}
		
		private function addLogMsg(msg:String):void
		{
			EventManager.dispatchEvent("Game_log",msg);
		}
		
		private var _shadow:PoolMesh;
		private function get drawCastsShadows():Boolean
		{
			var texture:ITextureMaterial = PoolMesh(_graphicDis).material as ITextureMaterial;
			if (texture && texture.textureParsed){
				return false;
			}
			return _isDrawShadow && _enableShadow && _alpha > 0;
		}
		
		override public function set isDrawShadow(value:Boolean):void
		{
			_isDrawShadow = value;
			if(!value)
			{
				if(_shadow)
				{
					PoolMesh.recycle(_shadow);
					_shadow = null;
				}
			}
		}
		
		private var _shadowDepthIndex:int = 0;
		public function set shadowDepthIndex(value:uint):void
		{
			if(_shadow && _shadow.parent == _parent && _shadowDepthIndex != value)
			{
				if(_parent.numChildren > value)
				{
					_parent.setChildIndex(_shadow,value);
				}
			}
			_shadowDepthIndex = value;
		}
		
		private var _shadowOffsetX:Number = 0;
		public function get shadowOffsetX():Number
		{
			return _shadowOffsetX;
		}
		
		public function set shadowOffsetX(value:Number):void
		{
			if (_shadowOffsetX == value)
			{
				return;
			}

			_shadowOffsetX = value;
			if (_graphicDis is PoolMesh){
				PoolMesh(_graphicDis).setPlanarShadowOffset(_shadowOffsetX, _shadowOffsetY);
			}
			if (!_shadow)
			{
				return;
			}

			if (GlobalConfig2D.shadowRenderType == GlobalConfig2D.SHADOW_SHAPE)
			{
				_shadow.x = this.x+GlobalConfig2D.shadowOffsetX+_shadowOffsetX;
			} else
			{
				if (null == cutRect)
				{
					return;
				}

				if (-1 == _renderScaleX)
				{
					_shadow.x = this.x-(_drawSourceTexture.width+cutRect.x) + GlobalConfig2D.tanShadow * cutRect.y + _shadowOffsetX;
				} 
				else
				{
					_shadow.x = this.x+cutRect.x + GlobalConfig2D.tanShadow * cutRect.y + _shadowOffsetX;
				}
			}
		}
		
		private var _shadowOffsetY:Number = 0;
		private var _enableTrace:Boolean;
		public function get shadowOffsetY():Number
		{
			return _shadowOffsetY;
		}
		
		public function set shadowOffsetY(value:Number):void
		{
			if (_shadowOffsetY != value)
			{
				_shadowOffsetY = value;
				if (_graphicDis is PoolMesh){
					PoolMesh(_graphicDis).setPlanarShadowOffset(_shadowOffsetX, _shadowOffsetY);
				}
				if(_shadow)
				{
					if (GlobalConfig2D.shadowRenderType == GlobalConfig2D.SHADOW_SHAPE)
					{
						_shadow.y = this.y+GlobalConfig2D.shadowOffsetY+_shadowOffsetY;
					} 
					else
					{
						if (null != cutRect)
						{
							_shadow.y = ((cutRect.y * GlobalConfig2D.shadowYScale)>>0)+_shadowOffsetY;
						}
					}
				}
			}
		}
		
		private function execPlayCallBack():void
		{
			//播放开始回调
			if(_playStart)
			{
				_playStart = false;
				//执行开始播放回调
				exceteCallBackData(_playStartCallBackList);
			}
			//播放过程回调
			exceteCallBackData(_playUpdateCallBackList);
			//播放结束回调
			if(_playComplete)
			{
				exceteCallBackData(_playCompleteCallBackList);
				_playComplete = false;	
			}
		}
		
		/**
		 * 立即获取该换装片段此时此刻的位图资源数据（可用于实引擎内阴影和外部残影的实现）
		 */
		public function getNowRenderFaceData():RenderFaceData
		{
			if(!usable || !visible)
			{
				return null;
			}
			var afd:RenderFaceData = new RenderFaceData();
			afd.sourceTexture =  _drawSourceTexture;//guoqing.wen
			afd.cutRect = cutRect;
			afd.id = id;
			afd.type = type;
			afd.showX = finalShowX;
			afd.showY = finalShowY;
			afd.logicAngle = _logicAngle;
			return afd;
		}
		
		/**
		 * @private 
		 * 释放
		 */
		override public function dispose():void
		{
			//标识正在释放中
			disposing = true;
			//执行移除回收回调
			exceteCallBackData(_removedCallBackList);
			//=============================================================================
			//释放缓存
			if(_currentFullSourchPath!=null)
			{
				if(_currentRenderUnitStatus==null)
				{
					//停止接在旧的换装(注意此处的stopLoad参数传true)
					SceneCache.removeWaitingRenderUnit(this,_currentFullSourchPath);
				}
				else
				{
					//释放旧的换装
					SceneCache.renderUnitCountShare.uninstallShareData(_currentFullSourchPath,this);
				}
			}
			TweenLite.killTweensOf(this);
			removeColorTransform();
			//=============================================================================
			_parent = null;
			//移除所有事件监听
			_renderUnitData = null;
			
			alpha = 1;
			removeAllFilters();
			_renderScaleX = 1;
			
			_enableFilters = true;
			_needRender = true;
			_enableShadow = false;
			_isDrawShadow = false;
			_forceEnableBlendMode = false;
			
			if(_shadow)
			{
				PoolMesh.recycle(_shadow);
				_shadow = null;
			}
			
			cutRect.setEmpty();

			_shadowOffsetX = 0;
			_shadowOffsetY = 0;
			_totalFrame = 0;
			_currentFrame = 0;
			
			if(_playBeforeStartCallBackList)
			{
				_playBeforeStartCallBackList.length = 0;
			}
			if(_playStartCallBackList)
			{
				_playStartCallBackList.length = 0;
			}
			if(_playUpdateCallBackList)
			{
				_playUpdateCallBackList.length = 0;
			}
			if(_playCompleteCallBackList)
			{
				_playCompleteCallBackList.length = 0;
			}
			if(_addedCallBackList)
			{
				_addedCallBackList.length = 0;
			}
			if(_removedCallBackList)
			{
				_removedCallBackList.length = 0;
			}
			
			_resReady = false;
			_renderImgData = null;
			_drawSourceTexture = null;
			_bitmapFilters.length = 0;
			_currentStatus = 0;
			_currentFullSourchPath = null;
			_currentRenderUnitStatus = null;
			_logicAngle = 0;
			_stayAt = 0;
			stayAtEnd = false;
			_playing = true;
			repeat = 0;
			speed = 1;
			
			_defaultRenderImgData = null;
			_defaultRenderUnitStatus = null;
			
			_playCount = 0;
			_lastTime = 0;
			_lastPlayCompleteTime = 0;
			_playBeforeStart = false;
			_playStart = false;
			_playComplete = false;
			
			_dynamicPosition = null;
			if(_graphicDis)
			{
				PoolMesh.recycle(_graphicDis as PoolMesh);
				_graphicDis = null;
			}
			
			super.dispose();
		}

		/**
		 * @private 
		 * 重置
		 */
		override public function reSet($parameters:Array):void
		{
			super.reSet(null);
			
			_renderUnitData = $parameters[0];
			id = _renderUnitData.id;
			type = _renderUnitData.type;
			repeat = _renderUnitData.repeat;
			updateNow = true;
			_mouseEnabled = _renderUnitData.mouseEnabled;
			_softOutlineData = null;
			_oldData ||= new OldData();
			_oldData.clear();
			if(!_graphicDis)  
			{
				_graphicDis = PoolMesh.create(null, this);
				//PoolMesh(_graphicDis).castsShadows = true;
			}
			PoolMesh(_graphicDis).blendMode = GlobalConfig2D.enableBlendMode?data.blendMode:BlendMode.NORMAL;
		}
		
		public function set defaultRenderData($xmlImgData:XmlImgData):void
		{
			if($xmlImgData)
			{
				_defaultRenderImgData = $xmlImgData.aid;
				_defaultRenderUnitStatus = $xmlImgData.aps;
				//
				setRuStatusData(_defaultRenderUnitStatus);
			}
			else
			{
				_defaultRenderImgData = null;
				_defaultRenderUnitStatus = null;
			}
		}
		
		public function addTraceLog(msg:String):void
		{
			if(_enableTrace)
			{
				trace(msg);
			}
		}
	}
}

import com.game.engine2D.core.ATFSubTexture;

/**
 * 旧数据记录类
 */	
class OldData
{
	public var inSleep:Boolean = false;
	public var oldSourceBD:ATFSubTexture;
	
	public function clear():void
	{
		inSleep = false;
		oldSourceBD = null;
	}
}

class CallBackData
{
	public var callBackFun:Function;
	public var cbFunParames:Array = [];
	
	public function CallBackData($callBackFun:Function,$cbFunParames:Array)
	{
		callBackFun = $callBackFun;
		cbFunParames = $cbFunParames;
	}
}