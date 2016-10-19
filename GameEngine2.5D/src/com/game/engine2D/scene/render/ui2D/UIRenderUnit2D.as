package com.game.engine2D.scene.render.ui2D
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.scene.render.IDynamicPosition;
	import com.game.engine2D.scene.render.IRenderUnit;
	import com.game.engine2D.scene.render.loader.RenderUnitLoader;
	import com.game.engine2D.scene.render.vo.IRenderUnitData;
	import com.game.engine2D.scene.render.vo.XmlImgData;
	import com.game.engine2D.scene.render.vo.img.RenderFaceData;
	import com.game.engine2D.scene.render.vo.img.RenderImgData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitStatus;
	import com.game.engine2D.tools.SceneCache;
	import com.game.engine2D.utils.RenderItemAngleUtil;
	import com.game.engine2D.utils.RenderUnitShadowUtil;
	import com.game.engine2D.utils.Transformer;
	import com.game.mainCore.core.poolObject.PoolBitmap;
	import com.game.mainCore.core.poolObject.PoolShape;
	import com.game.mainCore.libCore.log.ZLog;
	import com.game.mainCore.libCore.pool.Pool;
	import com.game.mainCore.libCore.utils.Fun;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import gs.TweenLite;
	
	import org.client.mainCore.utils.BitmapDataUtil;
	import org.client.mainCore.utils.DisplayUtil;
	
	/**
	 * 换装部件
	 * 说明(只Engine内部关注此说明)： ： 
	 * 渲染时，pXY = Math.round(showXY); 此将影响换装不晃来晃去
	 * @author Carver
	 */	
	public class UIRenderUnit2D extends UIBaseObj2D implements IRenderUnit
	{
		private static var _pool:Pool = new Pool("UIRenderUnit2D",2000);
		
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
		/**设置之前的初始记录*/
		private var _initColorTF:ColorTransform;
		/**
		 * 生成此RenderUnit的换装源参数
		 */	
		private var _renderUnitData:IRenderUnitData;
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
		
		private var cutRect:Rectangle = new Rectangle();
		
		private var _hitTestX:int = int.MIN_VALUE;
		private var _hitTestY:int = int.MIN_VALUE;

		private var _showPos:Point = new Point();
		
		private var _bmdShadowSource:BitmapData = null;
		private var _bmdShadowScaleSource:BitmapData = null;
		
		private function getHitTestX() : Number
		{
			if (int.MIN_VALUE == _hitTestX)
			{
				if (null == currentApData)
					return 0;
				if(_renderScaleX == -1)
				{
					_hitTestX = currentApData.tx - _drawSourceBitmapData.width;
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
				_showPos.x = _x + _offsetX;
				_showPos.y = _y + _offsetY;
			}
			return _showPos;	
		}
		
		/***x */	
		override final public function set x(value:Number):void
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
		override  final public function set y(value:Number):void
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
		
		private var _renderScaleX:int = 1;
		
		override final public function set logicAngle(value:uint):void
		{
			if(_logicAngle != value)
			{
				_logicAngle = value;
				//
				_renderScaleX = RenderItemAngleUtil.getAngleScaleX(_logicAngle);
				//
				setRuStatusData(_currentRenderUnitStatus || _defaultRenderUnitStatus);//重新取一下配置数据。
				//
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
			
//			return this._graphicDis.hitTestPoint($p.x, $p.y, true);
			var sourceBD:BitmapData = _drawSourceBitmapData;
			if(sourceBD!=null)
				
			{
				//检测下BitmapData是否被dispose了
				if(!BitmapDataUtil.isAvailable(sourceBD))
				{
					ZLog.add("RenderUnit.hitPoint sourceBD被dispose了");
					return false;
				}
//				var pixelValue:uint = sourceBD.getPixel32($p.x-cutRect.x+_sourcePoint.x, $p.y-cutRect.y+_sourcePoint.y) >>> 24;
//				var pxielX:Number = $p.x - hitTestRect.x;
//				var pxielY:Number = $p.y - hitTestRect.y;
				var pxielX:Number = $p.x - getHitTestX();
				var pxielY:Number = $p.y - getHitTestY();

				//容器翻转了。 内存里的位图是木有翻转的，so，减一下
				if(_renderScaleX == -1)
				{
					pxielX = _drawSourceBitmapData.width - pxielX;
				}
//				var pixelValue:uint = sourceBD.getPixel32(pxielX,pxielY) >>> 24;
//				if(pixelValue!=0x00)return true;
				if(sourceBD.getPixel32(pxielX,pxielY) >>> 30)	// 等价代码 if ((sourceBD.getPixel32(pxielX,pxielY)>>24) > 64)
				{
					return true;//256的25%
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
			
			var sourceBD:BitmapData = _drawSourceBitmapData;
			if(sourceBD!=null)
			{
				//检测下BitmapData是否被dispose了
				if(!BitmapDataUtil.isAvailable(sourceBD))
				{
					ZLog.add("RenderUnit.hitRect sourceBD被dispose了");
					return false;
				}
				var rect:Rectangle = sourceBD.getColorBoundsRect(0xFF000000, 0x00000000,false);
				rect.x = rect.x +cutRect.x;
				rect.y = rect.y +cutRect.y;
				if(rect.intersects($rect))return true;
			}
			return false;
		}
		
		override public function set parent(value:DisplayObjectContainer):void
		{
			super.parent = value;
			if(_shadow && _shadow.parent == _parent && _parent.getChildIndex(_shadow)!=0)
			{
				_parent.addChildAt(_shadow,0);
			}
		}
		
		override public function set depth(value:int):void
		{
			if(_depth != value)
			{
				depthHasChg = true;
			}
			super.depth = value;
		}
		
		override public function set depthIndex(value:uint):void
		{
			if(_depthIndex != value)
			{
				depthHasChg = true;
			}
			super.depthIndex = value;
//			if(_shadow && _shadow.parent == _parent && _parent.getChildIndex(_shadow)!=0)
//			{
//				_parent.setChildIndex(_shadow,0);
//			}
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
					parent.addChildAt(_shadow,0);
				}
			}
			else
			{
				if (_shadow)
				{
					DisplayUtil.removeForParent(_shadow);
				}
			}
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
						
//						try
//						{
//							var k:Sprite = Sprite(cbData.callBackFun);
//						}
//						catch(err:Error)
//						{
//							var fn:String = err.message.replace(/.+::(\w+\/\w+)\(\)\}\@.+/,"$1");
//							fn = err.message?(err.message.replace(/.+ (function\-\d+) .+/i,"$1")):fn;
//							trace(fn,arr); 
//						}
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
		private function get renderImg():BitmapData
		{
			var imgData:RenderImgData = _renderImgData || _defaultRenderImgData;
			return imgData?imgData.getBitmapData(_currentStatus, _logicAngle, currentFrame):null;
		}
		
		/**
		 * @private 
		 * 绘制用的资源BD
		 */
		private var _drawSourceBitmapData:BitmapData;
		
		
		private var _enableFilters:Boolean = true;
		
		public function get enableFilters():Boolean
		{
			return _enableFilters;
		}
		
		public function set enableFilters(value:Boolean):void
		{
			_enableFilters = value;
			if(value)
			{
				if(_graphicDis)
				{
					_graphicDis.filters = _bitmapFilters;
				}
			}
			else
			{
				if(_graphicDis)
				{
					_graphicDis.filters = null;
				}
			}
		}
		
		private var _blendMode:String = "normal";
		public function get blendMode():String
		{
			return _blendMode;
		}
		
		public function set blendMode(value:String):void
		{
			_blendMode = value;
			if(_graphicDis)
			{
				_graphicDis.blendMode = _blendMode;
			}
		}
		
		/**应用滤镜数组*/
		private const _bitmapFilters:Array = [];
		/**应用滤镜数组*/
		public function get bitmapFilters():Array{return _bitmapFilters};
		
		/**添加滤镜*/
		public function addFilter($bf:BitmapFilter):void
		{
			if($bf)
			{
				var index:int = _bitmapFilters.indexOf($bf);
				if(index != -1)
				{
					_bitmapFilters.splice(index,1);
				}
				_bitmapFilters.push($bf);
				
				if(_graphicDis && _enableFilters)
				{
					_graphicDis.filters = _bitmapFilters;
				}
			}
		}
		
		/**移除滤镜*/
		public function removeFilter($bf:BitmapFilter):void
		{
			var index:int = _bitmapFilters.indexOf($bf);
			if(index!=-1)
			{
				_bitmapFilters.splice(index,1);
			}
			if(_graphicDis)
			{
				_graphicDis.filters = _bitmapFilters;
			}
		}
		
		/**清除所有滤镜*/
		public function removeAllFilters():void
		{
			_bitmapFilters.length = 0;
			if(_graphicDis)
			{
				_graphicDis.filters = null;
			}
		}
		
		/**添加滤镜*/
		public function addColorTransform($colorTrans:ColorTransform):void
		{
			if(_graphicDis)
			{
				if(_initColorTF == null)
				{
					_initColorTF = _graphicDis.transform.colorTransform;
				}
				_graphicDis.transform.colorTransform = $colorTrans;
			}
		}
		
		/**移除滤镜*/
		public function removeColorTransform():void
		{
			if(_graphicDis)
			{
				if(_initColorTF)
				{
					_graphicDis.transform.colorTransform = _initColorTF;
				}
			}
		}
		
		public var finalShowX:Number;
		public var finalShowY:Number;
		
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
		
//		/**
//		 * 获取此RenderUnit对应的配置和位图信息(注意只有资源加载完毕才能获取此信息，否则返回null, 所以请在onAdd回调发生之后中取该值)
//		 * 注意：基于性能考虑，此信息对外提供时没有创建副本，所以一定不要再外部改变该信息，否则可能引起出错。
//		 */
//		public function get xmlImgData():XmlImgData
//		{
//			if(_currentRenderUnitStatus==null)
//			{
//				return null;
//			}
//			return SceneCache.avatarCountShare.getShareData(_currentRenderUnitStatus.fullSourchPath) as XmlImgData;
//		}
		
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
		public function syncPlayInfoFrom($ap:UIRenderUnit2D):void
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
		public function UIRenderUnit2D($apd:IRenderUnitData)
		{
			reSet([$apd]);
		}
		
		private static var _cnt:int = 0;
		
		/**
		 * 生成一个RenderUnit
		 * @param $type
		 * @param $value
		 */
		public static function create($apd:IRenderUnitData):UIRenderUnit2D
		{
			_cnt++;
			//利用池生成RenderUnit
			return _pool.createObj(UIRenderUnit2D,$apd) as UIRenderUnit2D;
		}
		
		public static function recycle($ap:UIRenderUnit2D):void
		{
			_cnt--;
			//利用池回收RenderUnit
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
		
		/**
		 * @private 
		 * 执行一步
		 * 目的：绘制 并 更新各个换装部件
		 * @parma $frame 帧 为0则走渲染计时计算的帧，否则选择此参数指定的帧
		 */	
		override final public function run(gapTm : uint):void
		{
			if(
				_currentStatus==0
				|| _playComplete
				)
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
						//如果满足刷新时间间隔
						if(time >= frameTm/speed) 
						{
							//记录下最近一次刷新的时间
							_lastTime = nowTime;
							//当前帧加1
							_currentFrame++;
							
							//如果当前帧播放到“末尾加1帧”
							if(_currentFrame >= _totalFrame)
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
							}
							//设置渲染标志位
							if(_totalFrame > 1 || _playComplete)//注意这个判断,只有大于1帧或者只有一帧但为播放完毕状态的的才复渲染了
							{	
								updateNow = true;
							}
							isNeedExcuteCallBack = true;
						}
					}
				}
			}
			
			//--------------------------------------------------------
			//更新剪切矩形
			//--------------------------------------------------------
			var hasNeedRender:Boolean = needRender && visible && _graphicDis.stage;
			if(updateNow && hasNeedRender)
			{ 
				_drawSourceBitmapData = renderImg;//取不到的时候,就取原来的吧...
				
//				var graphicSp:Shape = _graphicDis as Shape;
				var graphicSp:Bitmap = _graphicDis as Bitmap;
				if(_drawSourceBitmapData == null)//清空渲染...
				{
//					graphicSp.graphics.clear();
					graphicSp.bitmapData = null;
					if(_shadow)
					{
						_shadow.graphics.clear();
					}
				}
				var isNeedDraw:Boolean = false;
				//可见性判断
				if(     _drawSourceBitmapData!=null
						&& (!inSleep)
						&& ruStatus!=null
					)
				{
					currentApData = ruStatus.getRenderUnitData(_currentStatus,_logicAngle, _currentFrame);
					if (currentApData!=null)
					{
						cutRect.x = - currentApData.tx;
						cutRect.y = - currentApData.ty;
						cutRect.width = _drawSourceBitmapData.width;
						cutRect.height = _drawSourceBitmapData.height;
 
						_hitTestX = int.MIN_VALUE;
						_hitTestY = int.MIN_VALUE;
						//
						isNeedDraw = true;
					}
				}
				//拷贝
				if(isNeedDraw)
				{
					var bmdShadow:BitmapData;
					var sourceBD:BitmapData = _drawSourceBitmapData;
					var drawWdith:Number = sourceBD.width + drawWdithOffset;
					var drawHeight:Number = sourceBD.height + drawHeightOffset;
					if(_oldData.oldSourceBD != _drawSourceBitmapData)
					{
//						graphicSp.graphics.clear();
//						if(GlobalConfig.isShowDrawRect)
//						{
//							graphicSp.graphics.lineStyle(1,0xff0000);
//						}
//						graphicSp.graphics.beginBitmapFill(sourceBD);
//						graphicSp.graphics.drawRect(0,0,drawWdith,drawHeight);
//						graphicSp.graphics.endFill();
						graphicSp.bitmapData = sourceBD;
						
						_lastDrawTm = GlobalConfig2D.nowTime;// getTimer();
						//
						if(_enableShadow && _isDrawShadow)
						{
							var isFirstNew:Boolean = false;
							if(_shadow==null)
							{
								_shadow = PoolShape.create();//new Shape();
								isFirstNew = true;
							}
							if(!_shadow.parent)
							{
								parent.addChildAt(_shadow,0);
							}
							//先清空
							_shadow.graphics.clear();
							if (GlobalConfig2D.shadowRenderType != GlobalConfig2D.SHADOW_SHAPE)
							{
								if (_renderScaleX == -1)
								{
									if (_drawSourceBitmapData != _bmdShadowScaleSource)
									{
										RenderUnitShadowUtil.removeApScaleCache(_bmdShadowScaleSource);
										bmdShadow = RenderUnitShadowUtil.getApScaleCache(_drawSourceBitmapData);
										_bmdShadowScaleSource = _drawSourceBitmapData;
									}
								} 
								else
								{
									if (_drawSourceBitmapData != _bmdShadowSource)
									{
										RenderUnitShadowUtil.removeApScaleCache(_bmdShadowSource);
										bmdShadow = RenderUnitShadowUtil.getApCache(_drawSourceBitmapData);
										_bmdShadowSource = _drawSourceBitmapData;
									}
								}
								
								if (bmdShadow)
								{
									//填充图像
									_shadow.graphics.beginBitmapFill(bmdShadow);
									_shadow.graphics.drawRect(0, 0, bmdShadow.width, bmdShadow.height);
									_shadow.graphics.endFill();
								}
							} 
							else
							{
								//---------------------------------------------------------------------------------
								//一个共用的矩阵
								var ma:Matrix = new Matrix();
								ma.identity();
								ma.scale(1,GlobalConfig2D.shadowYScale);
								
								//依次将各个换装部件画向影子并压缩图像
								var errorValue:Number = 0;//误差修正（修正因为缩放和倾斜带来的小数误差问题,111111111临时这么解决下）
								var tx:int = -cutRect.x;
								var ty:int = -cutRect.y;
								ma.tx = -errorValue-tx -errorValue;
								ma.ty = (-errorValue-ty)*GlobalConfig2D.shadowYScale;

								//填充图像
								_shadow.graphics.beginBitmapFill(_drawSourceBitmapData,ma,false);
								_shadow.graphics.drawRect(-tx,-(ty*GlobalConfig2D.shadowYScale)>>0,cutRect.width-errorValue*2,((cutRect.height-errorValue*2)*GlobalConfig2D.shadowYScale)>>0);//.drawRect(afd.cutRect.x,afd.cutRect.y,afd.cutRect.width,afd.cutRect.height);
								_shadow.graphics.endFill();
								
								if (isFirstNew)
								{
									//转变颜色
									var ctf:ColorTransform = new ColorTransform();
									ctf.color = 0x000000;
									ctf.alphaMultiplier = GlobalConfig2D.shadowAlpha;
									_shadow.transform.colorTransform = ctf;
									
									var bf:BlurFilter = new BlurFilter(2,2,BitmapFilterQuality.LOW);
									_shadow.filters = [bf];

									//增加倾斜
									ma.identity();
									ma.tx = _shadow.x;
									ma.ty = _shadow.y;
									ma.c = GlobalConfig2D.tanShadow;
									_shadow.transform.matrix = ma;
//									_shadow.cacheAsBitmap = true;
								}
							}
						}
					}
					
					if (_shadow)
					{
						if (GlobalConfig2D.shadowRenderType != GlobalConfig2D.SHADOW_SHAPE)
						{
							var t:Number = GlobalConfig2D.tanShadow;
							var ox:Number;
							if (_renderScaleX == -1)
							{
								ox = (cutRect.y * GlobalConfig2D.tanShadow - ((cutRect.y * GlobalConfig2D.tanShadow) >> 0)) * GlobalConfig2D.tanShadow;
								_shadow.x = showPos.x - cutRect.right + t * cutRect.y + _shadowOffsetX + ox;
							} 
							else
							{
								ox = (cutRect.y * GlobalConfig2D.tanShadow - ((cutRect.y * GlobalConfig2D.tanShadow) >> 0)) * GlobalConfig2D.tanShadow;
								_shadow.x = showPos.x + cutRect.x + t * cutRect.y + _shadowOffsetX + ox;
							}
							var oy:Number = (_drawSourceBitmapData.height * GlobalConfig2D.shadowYScale - ((_drawSourceBitmapData.height * GlobalConfig2D.shadowYScale) >> 0)) * (1-GlobalConfig2D.shadowYScale);
							_shadow.y = showPos.y + cutRect.y * GlobalConfig2D.shadowYScale + oy + _shadowOffsetY;

						}
						else
						{
							//添加进容器
							_shadow.x = this.x+GlobalConfig2D.shadowOffsetX+_shadowOffsetX;
							_shadow.y = this.y+GlobalConfig2D.shadowOffsetY+_shadowOffsetY;
							//
							_shadow.scaleX = _renderScaleX;
						}
					}
					//
					_oldData.oldSourceBD = _drawSourceBitmapData;
					//执行一次以后在置成false
				}
				updateNow = false;
			}
			
			if(hasNeedRender)
			{
				_graphicDis.x = showPos.x + cutRect.x*_renderScaleX;
				_graphicDis.y = showPos.y + cutRect.y;
				
				if(_graphicDis.scaleX != _renderScaleX)
				{
					_graphicDis.scaleX = _renderScaleX;
				}
			}
			
			//
			if(isNeedExcuteCallBack)
			{
				execPlayCallBack();
			}
//			else if ((GlobalConfig.shadowRenderType==GlobalConfig.SHADOW_DYNC_CACHE) && (!(_dyncTickcount++&63)))
//			{
//				if (_isDrawShadow)
//				{
//					// 每帧都要查询一次阴影缓存，否则在只有一帧的动画中可能会被释放掉，查询的性能消耗为一次hash表查询，性能影响不会太大
//					var bitmapData:BitmapData = avatarImg;
//					if (bitmapData)
//					{
//						bmdShadow = (_avatarScaleX!=-1)?RenderUnitShadowUtil.getApCache(bitmapData):RenderUnitShadowUtil.getApScaleCache(bitmapData);
//					}
//				}
//			}
		}
		
//		private var _time:uint = 0;
		
		
//		/**
//		 * 可见性判断 
//		 * @return 
//		 * 
//		 */		
//		private function isAvailable(inSleep:Boolean):Boolean
//		{
//			var available:Boolean =  
//				visible
//				&& _drawSourceBitmapData!=null
//				&& (!inSleep)
//				&& _currentRenderUnitStatus!=null//如过状态资源存在（比如：武器的打坐状态， 武器的跳跃状态 等）
//				&&
//				_isInViewDistance
//			return available;
//		}
//		
//		/**
//		 * @private 
//		 * 将换装部件画向主换装BD
//		 * @param $target 画向的目标
//		 */
//		override public function draw($target:IBitmapDrawable):void
//		{o
//			if(
//				!_resReady
//				|| !_currentStatus
//				|| _currentStatus=="")
//			{
//				return;
//			}
//			if(updateNow)
//			{
//				//播放开始前回调
//				if(_playBeforeStart)
//				{
//					_playBeforeStart = false;
//					//执行播放前回调
//					exceteCallBackData(_playBeforeStartCallBackList);
//				}
//				var isNeedDraw:Boolean = visible && _isInViewDistance;
//				//拷贝
//				if(isNeedDraw)
//				{
//					if(_drawSourceBitmapData)
//					{
//						drawGraphicSP(_drawSourceBitmapData,cutRect);
//					}
//					else
//					{
//						var graphicSp:Shape = _graphicDis as Shape;
//						graphicSp.graphics.clear();
//						if(_shadow)
//						{
//							_shadow.graphics.clear();
//						}
//					}
//				}
//				execPlayCallBack();
//			}
//		}
//		
//		private function drawGraphicSP(sourceBD:BitmapData,rect:Rectangle):void
//		{
//			var scaleX:int = _avatarScaleX;
//			var graphicSp:Shape = _graphicDis as Shape;
//			var drawWdith:Number = sourceBD.width + drawWdithOffset;
//			var drawHeight:Number = sourceBD.height + drawHeightOffset;
//			if(_oldData.oldSourceBD != _drawSourceBitmapData)
//			{
//				graphicSp.graphics.clear();
//				graphicSp.graphics.beginBitmapFill(sourceBD);
//				graphicSp.graphics.drawRect(0,0,drawWdith,drawHeight);
//				graphicSp.graphics.endFill();
//				//
//				if(_enableShadow && _isDrawShadow)
//				{
//					drawShadow(sourceBD,rect,scaleX);
//				}
//			}
//			//
//			_graphicDis.x = showPos.x + rect.x*scaleX;
//			_graphicDis.y = showPos.y + rect.y;
//			if(graphicSp.scaleX != scaleX)
//			{
//				graphicSp.scaleX = scaleX;
//			}
//			//
//			if(_shadow)
//			{
//				//添加进容器
//				_shadow.x = this.x+GlobalConfig.shadowOffsetX+_shadowOffsetX;
//				_shadow.y = this.y+GlobalConfig.shadowOffsetY+_shadowOffsetY;
//				//
//				_shadow.scaleX = scaleX;
//			}
//			//
//			_oldData.oldSourceBD = _drawSourceBitmapData;
//			//执行一次以后在置成falsh
//			updateNow = false;
//		}
		
		private var _shadow:Shape;
		
		override public function set isDrawShadow(value:Boolean):void
		{
			_isDrawShadow = value;
			if(!value)
			{
				if(_shadow)
				{
					DisplayUtil.removeForParent(_shadow);
					//
					PoolShape.recycle(_shadow as PoolShape);
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
					_shadow.x = this.x-(_drawSourceBitmapData.width+cutRect.x) + GlobalConfig2D.tanShadow * cutRect.y + _shadowOffsetX;
				} 
				else
				{
					_shadow.x = this.x+cutRect.x + GlobalConfig2D.tanShadow * cutRect.y + _shadowOffsetX;
				}
			}
		}
		
		private var _shadowOffsetY:Number = 0;
		public function get shadowOffsetY():Number
		{
			return _shadowOffsetY;
		}
		
		public function set shadowOffsetY(value:Number):void
		{
			if (_shadowOffsetY != value)
			{
				_shadowOffsetY = value;
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
		
		//
//		private function drawShadow(sourceBD:BitmapData,rect:Rectangle,avatarScaleX:int=1):void
//		{
//			//--------------------------------------------------------------------------------------------//
//			//			if(!_shadow)
//			//			{
//			//				_shadow = new RenderUnitShadow();
//			//				parent.addChildAt(_shadow,0);
//			//			}
//			//			_shadow.update(sourceBD);
//			//			//
//			//			_shadow.x = showPos.x + rect.x;
//			//			_shadow.y = showPos.y + rect.y;
//			//			if(_shadow.scaleX != avatarScaleX)
//			//			{
//			//				_shadow.scaleX = avatarScaleX;
//			//			}
//			//			if(avatarScaleX == -1)
//			//			{
//			//				_shadow.x = showPos.x-rect.x;
//			//			}
//			//--------------------------------------------------------------------------------------------//
//			var isFirstNew:Boolean = false;
//			//否则
//			//保证存在
//			if(_shadow==null)
//			{
//				_shadow = new Shape();
//				isFirstNew = true;
//			}
//			if(!_shadow.parent)
//			{
//				parent.addChildAt(_shadow,0);
//			}
//			
//			//先清空
//			_shadow.graphics.clear();
//			
//			//方法1(优点 ：性能较高  缺点：同一角色不同阴影之间有重叠 加深)
//			//---------------------------------------------------------------------------------
//			//一个共用的矩阵
//			var ma:Matrix = new Matrix();
//			ma.identity();
//			ma.scale(1,GlobalConfig.shadowYScale);
//			
//			//依次将各个换装部件画向影子并压缩图像
//			var errorValue:Number = 0;//误差修正（修正因为缩放和倾斜带来的小数误差问题,111111111临时这么解决下）
//			var tx:int = -cutRect.x;
//			var ty:int = -cutRect.y;
//			ma.tx = -_sourcePoint.x-errorValue-tx -errorValue;
//			ma.ty = (-_sourcePoint.y-errorValue-ty)*GlobalConfig.shadowYScale;
//			
//			//填充图像
//			_shadow.graphics.beginBitmapFill(_drawSourceBitmapData,ma,false);
//			_shadow.graphics.drawRect(-tx,-ty*GlobalConfig.shadowYScale,cutRect.width-errorValue*2,Math.floor((cutRect.height-errorValue*2)*GlobalConfig.shadowYScale));//.drawRect(afd.cutRect.x,afd.cutRect.y,afd.cutRect.width,afd.cutRect.height);
//			_shadow.graphics.endFill();
//			
//			if(isFirstNew)
//			{
//				//转变颜色
//				var ctf:ColorTransform = new ColorTransform();
//				ctf.color = 0x000000;
//				ctf.alphaMultiplier = GlobalConfig.shadowAlpha;
//				_shadow.transform.colorTransform = ctf;
//				
//				var bf:BlurFilter = new BlurFilter(2,2,BitmapFilterQuality.LOW);
//				_shadow.filters = [bf];
//				
//				//增加倾斜
//				ma.identity();
//				ma.tx = _shadow.x;
//				ma.ty = _shadow.y;
//				var rad:Number = GlobalConfig.shadowAngle/180 * Math.PI;
//				ma.c = Math.tan(rad);
//				_shadow.transform.matrix = ma;
//			}
//		}
		
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
			afd.sourceBitmapData =  _drawSourceBitmapData;
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
				DisplayUtil.removeForParent(_shadow);
				Fun.clearChildren(_shadow,true);
				//
				PoolShape.recycle(_shadow as PoolShape);
				_shadow = null;
				
				RenderUnitShadowUtil.removeApCache(_bmdShadowSource);
				RenderUnitShadowUtil.removeApCache(_bmdShadowScaleSource);
				_bmdShadowSource = null;				
				_bmdShadowScaleSource = null;
			}
			
			cutRect.setEmpty();

			_x = 0;
			_y = 0;
			_offsetX = 0;
			_offsetY = 0;
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
			_drawSourceBitmapData = null;
			_bitmapFilters.length = 0;
			_currentStatus = 0;
			_currentFullSourchPath = null;
			_currentRenderUnitStatus = null;
			_logicAngle = 0;
			_rotation = 0;
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
			_initColorTF = null;
			if(_graphicDis)
			{
				_graphicDis.x = 0;
				_graphicDis.y = 0;
				DisplayUtil.removeForParent(_graphicDis);
				//
//				PoolShape.recycle(_graphicDis as PoolShape);
				PoolBitmap.recycle(_graphicDis as PoolBitmap);
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
			_mouseEnabled = _renderUnitData.mouseEnabled;
			
			updateNow = true;
			
			if(!_oldData)
			{
				_oldData = new OldData();
			}
			else
			{
				_oldData.clear();
			}
			
			if(!_graphicDis)  
			{
				_graphicDis = PoolBitmap.create();
			}
			blendMode = (_forceEnableBlendMode || GlobalConfig2D.enableBlendMode)?data.blendMode:BlendMode.NORMAL;
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
	}
}

import flash.display.BitmapData;

/**
 * 旧数据记录类
 */	
class OldData
{
	public var inSleep:Boolean = false;
	public var oldSourceBD:BitmapData;
	
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