package com.game.engine2D.scene.render.ui2D
{
	import com.game.engine2D.scene.render.vo.IRenderUnitData;
	import com.game.engine2D.scene.render.vo.RenderParamData;
	import com.game.engine2D.scene.render.vo.img.RenderFaceData;
	import com.game.mainCore.core.poolObject.PoolSprite;
	import com.game.mainCore.libCore.pool.Pool;
	
	import flash.display.DisplayObjectContainer;
	import flash.filters.BitmapFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import gs.TweenLite;
	
	import org.client.mainCore.utils.DisplayUtil;
	
	/**
	 * @private
	 * 换装
	 * @author Carver
	 */
	public class UIRenderSet2D extends UIBaseObj2D
	{
		//显示和更新控制*********************************************************************************************************
		/**
		 * 是否在可视范围内 
		 * @param value
		 */		
		override public function set isInViewDistance(value:Boolean):void
		{
			if(_isInViewDistance != value)
			{
				super.isInViewDistance = value;
				//
				var ap:UIRenderUnit2D;
				var len:int = _renderUnitList.length;
				while(len-->0)
				{
					ap = _renderUnitList[len];
					if(ap)
					{
						ap.isInViewDistance = value;
					}
				}
			}
		}
		
		/**
		 * 是否在可视范围内 
		 * @param value
		 */		
		override public function set needRender(value:Boolean):void
		{
			if(_needRender != value)
			{
				super.needRender = value;
				//
				var ap:UIRenderUnit2D;
				var len:int = _renderUnitList.length;
				while(len-->0)
				{
					ap = _renderUnitList[len];
					if(ap)
					{
						ap.needRender = value;
					}
				}
			}
		}
		
		//*******************************************IDisplayable接口基本参数*******************************************
		override final public function set x(value:Number):void
		{
			if(_x != value)
			{
				_x = value;// >> 0;
				if(_graphicDis)
				{
					_graphicDis.x = (_x + _offsetX) >> 0;
				}
			}
		}
		
		override final public function set y(value:Number):void
		{
			if(_y != value)
			{
				_y = value;// >> 0;
				if(_graphicDis)
				{
					_graphicDis.y = (_y + _offsetY) >> 0;
				}
			}
		}
		
		
		/*** 偏移量x */	
		override public function set offsetX(value:Number):void
		{
			super.offsetX = value;// >> 0;
			if(_graphicDis)
			{
				_graphicDis.x = (_x + value) >> 0;
			}
		}
		
		/*** 偏移量y */	
		override public function set offsetY(value:Number):void
		{
			super.offsetY = value;// >> 0;
			if(_graphicDis)
			{
				_graphicDis.y = (_y + value) >> 0;
			}
		}
		
		/**
		 * 设置旋转
		 */	
		override final public function set rotation(value:Number):void
		{
			//旋转检查
			if(_rotation != value)
			{
				_rotation = value;
				if(_graphicDis)
				{
					_graphicDis.rotation = _rotation;
				}
				//
				updateNow = true;
			}
		}
		
		override public function set scaleX(value:Number):void
		{
			if(_scaleX != value)
			{
				_scaleX = value;
				if(_graphicDis)
				{
					_graphicDis.scaleX = value;
				}
			}
		}
		
		override public function set scaleY(value:Number):void
		{
			if(_scaleY != value)
			{
				_scaleY = value;
				if(_graphicDis)
				{
					_graphicDis.scaleY = value;
				}
			}
		}
		
		public function set colorTransform(value:ColorTransform):void
		{
			if(_graphicDis)
			{
				_graphicDis.transform.colorTransform = value;
			}
		}
		
		/**
		 * 是否与某个点发生碰撞
		 * @param $p
		 * @param $checkMouseEnabled 是否判断鼠标响应
		 */
		override public function hitPoint($p:Point):Boolean
		{
			if(!mouseEnabled)return false;
			if(!visible)return false;
			
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				var p:Point = $p.clone();
				p.x -= _finalShowX;
				p.y -= _finalShowY;
				if(ap.usable && ap.hitPoint(p))//碰撞检测
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 是否与某个矩形发生碰撞
		 * @param $rect
		 * @param $checkMouseEnabled 是否判断鼠标响应
		 */
		override public function hitRect($rect:Rectangle):Boolean
		{
			if(!mouseEnabled)return false;
			if(!visible)return false;
			
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				var rect:Rectangle = $rect.clone();
				rect.x -= x;
				rect.y -= y;
				if(ap.usable && ap.hitRect(rect))//碰撞检测
				{
					return true;
				}
			}
			return false;
		}
		
		/**销毁显示对象 */
		override public function destroy():void
		{
			recycle(this);
		}
		
		//换装部件存储*********************************************************************************************************
		/**
		 * 隐藏的换装类型
		 */	
		//		private var _hideRenderUnitTypes:Vector.<String> = new Vector.<String>;
		/**
		 * 隐藏的换装ID类型
		 */	
		private var _hideRenderUnitIds:Vector.<int> = new Vector.<int>;
		/**
		 * 换装部件集合
		 */
		private var _renderUnitList:Vector.<UIRenderUnit2D> = new Vector.<UIRenderUnit2D>;
		//-------------------------------------------------------------------------------------------------------------
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
				for each(var ru:UIRenderUnit2D in _renderUnitList)
				{
					if(ru && ru.usable)
					{
						ru.addFilter($bf);
					}
				}
			}
		}
		
		/**移除滤镜*/
		public function removeFilter($bf:BitmapFilter):void
		{
			for each(var ru:UIRenderUnit2D in _renderUnitList)
			{
				var index:int = _bitmapFilters.indexOf($bf);
				if(index!=-1)
				{
					_bitmapFilters.splice(index,1);
				}
				if(ru && ru.usable)
				{
					ru.removeFilter($bf);
				}
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
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap)
				{
					ap.removeAllFilters();
				}
			}
		}
		
		/*** 设置阴影偏移量x */	
		public function set shadowOffsetX(value:Number):void
		{
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap)
				{
					ap.shadowOffsetX = value;
				}
			}
		}
		
		/*** 设置阴影偏移量y */	
		public function set shadowOffsetY(value:Number):void
		{
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap)
				{
					ap.shadowOffsetY = value;
				}
			}
		}
		
		override public function set forceEnableBlendMode($value:Boolean):void
		{
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap)
				{
					ap.forceEnableBlendMode = $value;
				}
			}
		}
		
		//鼠标感应区*********************************************************************************************************
		//		private var _mouseRect:Rectangle;
		/**
		 * @private
		 * 扩展鼠标感应区
		 */	
		//		internal function unionMouseRect($rect:Rectangle):void
		//		{
		//			if(mouseRect!=null)
		//			{
		//				mouseRect = mouseRect.union($rect);
		//			}
		//			else
		//			{
		//				mouseRect = $rect.clone();
		//			}
		
		//			graphicSp.graphics.clear();
		//			graphicSp.graphics.lineStyle(1,0xff0000);
		//			graphicSp.graphics.drawRect(0,0,mouseRect.width,mouseRect.height);
		//			graphicSp.graphics.endFill();
		//			
		//			DisplayObjectContainer(_graphicDis).addChild(graphicSp);
		//			graphicSp.x = mouseRect.x;
		//			graphicSp.y = mouseRect.y;
		//		}
		
		public function UIRenderSet2D()
		{
			reSet(null);
		}
		
		override public function reSet($parameters:Array):void
		{
			super.reSet(null);
			//
			if(!_graphicDis)
			{
				_graphicDis = PoolSprite.create();
			}
		}
		
		//---------------------------对象池---------------------------
		private static var _cnt:int = 0;
		
		private static var _pool:Pool = new Pool("UIRenderSet2D",1000);
		/**
		 * 生成一个UIRenderUnit2D
		 * @param $type
		 * @param $value
		 */
		public static function create():UIRenderSet2D
		{
			_cnt++;
			//利用池生成
			return _pool.createObj(UIRenderSet2D) as UIRenderSet2D;
		}
		
		public static function recycle($av:UIRenderSet2D):void
		{
			_cnt--;
			//利用池回收
			_pool.disposeObj($av);
		}
		
		public static function get cnt():int
		{
			return _cnt;
		}
		//------------------------------------------------------------
		
		override public function dispose():void
		{
			TweenLite.killTweensOf(this);
			
			//标识正在释放中
			disposing = true;
			
			x = y = 0;
			offsetX = offsetY = 0;
			scaleX = scaleY = 1;
			
			_needRender = true;
			_enableShadow = false;
			_isDrawShadow = false;
			_isInViewDistance = false;
			
			//回收所有换装
			removeAllRenderUnits();
			
			//			_hideRenderUnitTypes.length = 0;
			_hideRenderUnitIds.length = 0;
			_renderUnitList.length = 0;
			
			_parent = null;
			//			mouseRect = null;
			
			rotation = 0;
			alpha = 1;
			removeAllFilters();
			
			DisplayUtil.removeAllChild(_graphicDis as DisplayObjectContainer);
			DisplayUtil.removeForParent(_graphicDis);
			PoolSprite.recycle(_graphicDis as PoolSprite);
			_graphicDis = null;
			
			super.dispose();
		}
		
		/**
		 * 是否有指定ID的换装
		 * @param $id 换装ID
		 * @param $checkResReady 是否检查资源已经准备完毕
		 */
		public function hasIDRenderUnit($id:int, $checkResReady:Boolean=false):Boolean
		{
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap.id== $id && ((!$checkResReady) || ap.resReady))
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 是否有指定类型的换装
		 * @param $type 换装类型
		 */
		public function hasTypeRenderUnits($type:String, $checkResReady:Boolean=false):Boolean
		{
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap.type == $type && ((!$checkResReady) || ap.resReady))
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 是否有相同的（主要指ID和样式）换装
		 * @param $apd 换装APD
		 * 注意：不检测回调
		 */
		public function hasSameRenderUnit($apd:RenderParamData, $checkResReady:Boolean=false):Boolean
		{
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				var apd:RenderParamData = ap.data as RenderParamData;
				if(apd && apd.equals($apd) && ((!$checkResReady) || ap.resReady))
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 是否有某个换装
		 * @param $ap 换装AP
		 * 注意：不检测回调
		 */
		public function hasRenderUnit($ap:UIRenderUnit2D,$checkResReady:Boolean=false):Boolean
		{
			var index:int = _renderUnitList.indexOf($ap);
			if(index != -1)
			{
				if($checkResReady)
				{
					return  $ap.resReady;
				}
				return true;
			}
			return false;
		}
		
		/**
		 * 查找指定ID的UIRenderUnit2D
		 * @param $id 换装ID
		 */
		public function getRenderUnitByID($id:int, $checkResReady:Boolean=false):UIRenderUnit2D
		{
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap.id == $id && ((!$checkResReady) || ap.resReady))
				{
					return ap;
				}
			}
			return null;
		}
		
		/**
		 * 获取指定类型的UIRenderUnit2D数组
		 * @param $UIRenderUnit2DType 换装类型
		 */
		public function getRenderUnitsByType($RenderUnitType:String, $checkResReady:Boolean=false):Array
		{
			var arr:Array = [];
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap.type == $RenderUnitType && ((!$checkResReady) || ap.resReady))
				{
					arr.push(ap);
				}
			}
			return arr;
		}
		
		/**
		 * 获取所有UIRenderUnit2D数组
		 * @param $UIRenderUnit2DType 换装类型
		 */
		public function getAllRenderUnits($checkResReady:Boolean=false):Array
		{
			var arr:Array = [];
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if((!$checkResReady) || ap.resReady)
				{
					arr.push(ap);
				}
			}
			return arr;
		}
		
		private var _finalShowX:Number = 0;
		public function get finalShowX():Number
		{
			return _finalShowX;
		}
		public function set finalShowX(value:Number):void
		{
			if(_finalShowX != value)
			{
				_finalShowX = value;
				
				var ap:UIRenderUnit2D;
				var len:int = _renderUnitList.length;
				while(len-->0)
				{
					ap = _renderUnitList[len];
					ap.finalShowX = value;
				}
			}
		}
		
		private var _finalShowY:Number = 0;
		public function get finalShowY():Number
		{
			return _finalShowY;
		}
		public function set finalShowY(value:Number):void
		{
			if(_finalShowY != value)
			{
				_finalShowY = value;
				
				var ap:UIRenderUnit2D;
				var len:int = _renderUnitList.length;
				while(len-->0)
				{
					ap = _renderUnitList[len];
					ap.finalShowY = value;
				}
			}
		}
		
		//加载、添加、删除-------------------------------------------------------------------------------------------------------------------
		/**
		 * 添加一项UIRenderUnit2D
		 *  @param $apd 换装数据 如果$apd==null，则创建一个空RenderParamData
		 */
		public function addRenderUnit($apd:IRenderUnitData):UIRenderUnit2D
		{
			//清空同种类型换装
			if($apd.clearSameType)
			{
				removeRenderUnitsByType($apd.type);//注意后面的参数
			}
			//清除同ID
			removeRenderUnitByID($apd.id);
			//创建一个新的
			var ap:UIRenderUnit2D = UIRenderUnit2D.create($apd);
			ap.parent = _graphicDis as DisplayObjectContainer;
			//			ap.visible = (_hideRenderUnitTypes.indexOf(ap.type)==-1 && _hideRenderUnitIds.indexOf(ap.id)==-1);//判断可见性
			ap.isDrawShadow = _isDrawShadow;
			ap.isInViewDistance = _isInViewDistance;
			ap.updateNow = true;//注意这个!!!!!!!!
			////////////////////////////////////
			if($apd.playCompleteAutoRecycle)
			{
				ap.setPlayCompleteCallBack(removeRenderUnit);//播放完了,自动移除
			}
			//添加进数组
			_renderUnitList.push(ap); 
			//需要排序
			_needSort = true;
			return ap;
		}
		
		/**
		 * 移除一项UIRenderUnit2D(此函数执行后,会检查主体换装，如果为空则启用默认换装)
		 * @param $UIRenderUnit2D
		 * @param $clearSameType 是否清空同种类型的换装
		 * @param $loadDefaultAvatar 如果没有任何主体换装存在，是否启用默认换装
		 */
		public function removeRenderUnit($renderUnit:UIRenderUnit2D,$clearSameType:Boolean=false):void
		{
			//清空同种状态换装
			if($clearSameType)
			{
				removeRenderUnitsByType($renderUnit.type);
			}
			else
			{
				var index:int = _renderUnitList.indexOf($renderUnit);
				if(index != -1)
				{
					//从数组中移除
					_renderUnitList.splice(index,1);
					//执行remove回调,回收UIRenderUnit2D
					UIRenderUnit2D.recycle($renderUnit);
					$renderUnit = null;
				}
			}
		}
		
		/**
		 * 移除指定ID的UIRenderUnit2D(此函数执行后,会检查主体换装，如果为空则启用默认换装)
		 * @param $UIRenderUnit2DID 换装类型
		 * @param $loadDefaultAvatar 如果没有任何主体换装存在，是否启用默认换装
		 */
		public function removeRenderUnitByID($renderUnitID:int):void
		{
			//检查换装内
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap.id == $renderUnitID)
				{
					var index:int = _renderUnitList.indexOf(ap);
					if(index != -1)
					{
						//从数组中移除
						_renderUnitList.splice(index,1);
					}
					//执行remove回调,回收UIRenderUnit2D
					UIRenderUnit2D.recycle(ap);
					ap = null;
					break;//注意此处break
				}
			}
			
		}
		/**
		 * 移除指定类型的UIRenderUnit2D(此函数执行后,会检查主体换装，如果为空则启用默认换装)
		 * @param $UIRenderUnit2DType 换装类型
		 * @param $loadDefaultAvatar 如果没有任何主体换装存在，是否启用默认换装
		 */
		public function removeRenderUnitsByType($renderUnitType:String):void
		{
			if($renderUnitType==null || $renderUnitType=="")return;//注意这个判断
			
			//检查换装内
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap.type == $renderUnitType)
				{
					//从数组中移除
					_renderUnitList.splice(len,1);
					//执行remove回调,回收UIRenderUnit2D
					UIRenderUnit2D.recycle(ap);
					ap = null;
				}
			}
		}
		/**
		 * 移除所有UIRenderUnit2D((此函数执行后,不会检查主体换装是否存在)
		 * @param $loadDefaultAvatar 如果没有任何主体换装存在，是否启用默认换装
		 */
		public function removeAllRenderUnits():void
		{
			//检查换装内
			var ap:UIRenderUnit2D;
			while(_renderUnitList.length)
			{
				ap = _renderUnitList.pop();
				//执行remove回调,回收UIRenderUnit2D
				UIRenderUnit2D.recycle(ap);
				ap = null;
			}
		}
		
		//显示控制-------------------------------------------------------------------------------------------------------------
		/**
		 * 显示一个UIRenderUnit2D
		 * @param $UIRenderUnit2D
		 */
		public function showRenderUnit($renderUnit:UIRenderUnit2D):void
		{
			$renderUnit.visible = true;
		}
		/**
		 * 隐藏一个UIRenderUnit2D
		 * @param $UIRenderUnit2D
		 */
		public function hideRenderUnit($renderUnit:UIRenderUnit2D):void
		{
			$renderUnit.visible = true;
		}
		/**
		 * 查看某ID的换装是否可显示
		 *  @param $id
		 */
		public function getIDRenderUnitVisible($id:int):Boolean
		{
			var index:int = _hideRenderUnitIds.indexOf($id);
			return index==-1;
		}
		/**
		 * 显示某ID换装
		 * 注意：因为UIRenderUnit2D是异步创建的（loadUIRenderUnit2D方法是异步的），所以在此方法指定的ID的UIRenderUnit2D还未加载完毕添加进角色换装时，此方法会无效
		 *  @param $id
		 */
		public function showRenderUnitByID($id:int):void
		{
			//从记录数组中移除 
			var index:int = _hideRenderUnitIds.indexOf($id);
			if(index!=-1)
			{
				_hideRenderUnitIds.splice(index,1);
			}
			
			//执行显示
			var ap:UIRenderUnit2D = getRenderUnitByID($id,false);
			if(ap!=null)
			{
				ap.visible = true;
			}
		}
		/**
		 * 隐藏某ID换装
		 * 注意：因为UIRenderUnit2D是异步创建的（loadUIRenderUnit2D方法是异步的），所以在此方法指定的ID的UIRenderUnit2D还未加载完毕添加进角色换装时，此方法会无效
		 *  @param $id
		 */
		public function hideRenderUnitByID($id:int):void
		{
			//添加进记录数组
			if (_hideRenderUnitIds.indexOf($id)==-1)
			{
				_hideRenderUnitIds.push($id);
			}
			
			//执行隐藏
			var ap:UIRenderUnit2D = getRenderUnitByID($id,false);
			if (ap!=null)
			{
				ap.visible = false;
			}
		}
		//		/**
		//		 * 查看某类型的换装是否可显示
		//		 *  @param $id
		//		 */
		//		public function getTypeRenderUnitsVisible($type:String):Boolean
		//		{
		//			return _hideRenderUnitTypes.indexOf($type) == -1;
		//		}
		//		/**
		//		 * 显示某类型换装
		//		 *  @param $type
		//		 */
		//		public function showRenderUnitsByType($type:String):void
		//		{
		//			//从记录数组中移除 
		//			var index:int = _hideRenderUnitTypes.indexOf($type);
		//			if(index!=-1)
		//			{
		//				_hideRenderUnitTypes.splice(index,1);
		//			}
		//			
		//			//执行显示
		//			var ap:UIRenderUnit2D;
		//			var len:int = _renderUnitList.length;
		//			while(len-->0)
		//			{
		//				ap = _renderUnitList[len];
		//				if(ap.type == $type)
		//				{
		//					ap.visible = true;
		//				}
		//			}
		//		}
		//		/**
		//		 * 隐藏某类型换装
		//		 *  @param $type
		//		 */
		//		public function hideRenderUnitsByType($type:String):void
		//		{
		//			//添加进记录数组
		//			if(_hideRenderUnitTypes.indexOf($type)==-1)
		//			{
		//				_hideRenderUnitTypes.push($type);
		//			}
		//			
		//			//执行隐藏
		//			var ap:UIRenderUnit2D;
		//			var len:int = _renderUnitList.length;
		//			while(len-->0)
		//			{
		//				ap = _renderUnitList[len];
		//				if(ap.type == $type)
		//				{
		//					ap.visible = false;
		//				}
		//			}
		//		}
		override public function set isDrawShadow(value:Boolean):void
		{
			_isDrawShadow = value;
			//执行隐藏
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while (len-- > 0)
			{
				ap = _renderUnitList[len];
				ap.isDrawShadow = value;
			}
		}
		
		//运行相关
		//-----------------------------------------------------------------------------------------------------------
		/**
		 * 对整个换装的每一项执行函数
		 * @param $fun 第一个参数是参数sceneCharacter, 第二个参数是UIRenderUnit2D
		 * 
		 */		
		public function forEachRenderUnit($fun:Function,...args):void
		{
			//检查换装内
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-- > 0)
			{
				ap = _renderUnitList[len];
				var arr:Array = args.concat(ap);
				$fun.apply($fun,arr);               
			}
		}
		
		/**
		 * 运行逻辑
		 * @parma $frame 帧 为0则走渲染计时计算的帧，否则选择此参数指定的帧
		 */	
		override final public function run(gapTm : uint):void
		{
			//深度排序
			if(_needSort)
			{
				_renderUnitList.sort(depthSort);
				_needSort = false;
			}
			var numChild:int = (_graphicDis as DisplayObjectContainer).numChildren;
			//运行逻辑
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			var shadowApList:Vector.<UIRenderUnit2D> = new Vector.<UIRenderUnit2D>();
			while (len-->0)
			{
				ap = _renderUnitList[len];
				if (ap.usable)
				{
					if (ap.visible)
					{
						ap.depthIndex = --numChild;
						//运行逻辑
						ap.run(gapTm);
						//--------------------------------------------------------
						if(ap.depthHasChg)
						{
							_needSort = true;
							ap.depthHasChg = false;
						}
						if(ap.enableShadow && ap.isDrawShadow)
						{
							shadowApList.push(ap);
						}
					}
				}
				else
				{
					removeRenderUnit(ap);
				}
			}
			//
			len = shadowApList.length;
			for (var i:uint=0;i<len;i++)
			{
				ap = shadowApList[len-i-1];
				ap.shadowDepthIndex = i;
			}
		}
		
		protected var _needSort:Boolean = true;
		//		/**
		//		 *向主换换装BD，之后更新换装
		//		 * @param $target 画向的目标
		//		 */
		//		override public function draw($target:IBitmapDrawable):void
		//		{
		//			//深度排序
		//			if(_needSort)
		//			{
		//				_UIRenderUnit2Ds.sort(depthSort);
		//				_needSort = false;
		//			}
		//			//绘制 并 更新各个换装部件
		//			var ap:UIRenderUnit2D;
		//			var len:int = _UIRenderUnit2Ds.length;
		//			var shadowIndex:uint = 0;
		//			while(len-->0)
		//			{
		//				ap = _UIRenderUnit2Ds[len];
		//				if(ap)
		//				{
		//					ap.depthIndex = len+_shadowIndex;
		//					ap.draw($target);//绘制 并 更新各个换装部件
		//					//
		//					if(ap.depthHasChg)
		//					{
		//						_needSort = true;
		//						ap.depthHasChg = false;
		//					}
		//					if(ap.enableShadow && ap.isDrawShadow)
		//					{
		//						shadowIndex++;
		//					}
		//				}
		//			}
		//			_shadowIndex = _shadow?1:shadowIndex;
		//		}
		
		private function depthSort(apA:UIRenderUnit2D,apB:UIRenderUnit2D):int
		{
			if(apA.depth > apB.depth)
			{
				return 1;
			}
			if(apA.depth < apB.depth)
			{
				return -1;
			}
			if(apA.id > apB.id)
			{
				return 1;
			}
			return 0;
		}
		
		/**
		 * 获取换装UIRenderUnit2D数量
		 */
		public function get length():int
		{
			return _renderUnitList.length;
		}
		
		/**
		 * 立即获取该换装片段此时此刻的位图资源数据 集合（可用于实引擎内阴影和外部残影的实现）
		 */
		public function getNowFaceList():Array
		{
			var afdList:Array = [];
			var ap:UIRenderUnit2D;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				var afd:RenderFaceData = ap.getNowRenderFaceData();
				if(afd!=null)
				{
					afdList.push(afd);
				}
			}
			return afdList;
		}
	}
}