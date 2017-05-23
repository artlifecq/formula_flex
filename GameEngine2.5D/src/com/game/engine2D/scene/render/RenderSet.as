package com.game.engine2D.scene.render
{
	import com.game.engine2D.SceneCharacter;
	import com.game.engine2D.scene.render.vo.IRenderUnitData;
	import com.game.engine2D.scene.render.vo.RenderParamData;
	import com.game.engine2D.scene.render.vo.img.RenderFaceData;
	import com.game.engine2D.vo.BaseObj;
	import com.game.engine2D.vo.PoolContainer;
	import com.game.mainCore.libCore.pool.Pool;
	
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import gs.TweenLite;
	
	/**
	 * @private
	 * 换装
	 * @author Carver
	 */
	public class RenderSet extends BaseObj
	{
		public function RenderSet()
		{
			super(null);
		}
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
				var ap:RenderUnit;
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
				var ap:RenderUnit;
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
		
		override public function set alpha(value:Number):void
		{
			super.alpha = value;
			var i:int = _renderUnitList.length;
			while(i-- > 0)
			{
				_renderUnitList[i].alpha = value;
			}
		}
		
		override final public function set x(value:Number):void
		{
			if(_x != value)
			{
				_x = value;// >> 0;
				this.finalShowX = value;
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
				this.finalShowY = value;
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
					_graphicDis.rotationZ = -value;
				}
				smooth = (value != 0);
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
		
		override public function set colorTransform(value:ColorTransform):void
		{
			if (colorTransform == value)return;
			super.colorTransform = value;
			
			var i:int = _renderUnitList.length;
			while(i-- > 0)
			{
				_renderUnitList[i].colorTransform = value;
			}
		}
		
		override public function set smooth(value:Boolean):void
		{
			super.smooth = value;
			var i:int = _renderUnitList.length;
			while(i-- > 0)
			{
				_renderUnitList[i].smooth = value;
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
			
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				var p:Point = $p.clone();
				p.x -= finalShowX;
				p.y -= finalShowY;
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
			
			var ap:RenderUnit;
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
		/**
		 * 检测点是否与外围矩形发生碰撞
		 */
		public function hitRectPoint($p:Point):Boolean
		{
			if(!mouseEnabled)return false;
			if(!visible)return false;
			
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				var point:Point = $p.clone();
				point.x -= x;
				point.y -= y;
				if(ap.usable && ap.hitRectPoint(point))//碰撞检测
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
		private var _renderUnitList:Vector.<RenderUnit> = new Vector.<RenderUnit>;
		//-------------------------------------------------------------------------------------------------------------
		/*** 设置阴影偏移量x */	
		public function set shadowOffsetX(value:Number):void
		{
			var ap:RenderUnit;
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
			var ap:RenderUnit;
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
			var ap:RenderUnit;
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
		
		override public function reSet($parameters:Array):void
		{
			super.reSet(null);
			mouseEnabled = true;
			_graphicDis = PoolContainer.create();
			_graphicDis.name = "RenderSet";
			_graphicDis.rotationX = 0;
			_graphicDis.rotationY = 0;
			_graphicDis.rotationZ = 0;
		}
		
		//---------------------------对象池---------------------------
		private static var _cnt:int = 0;
		
		private static var _pool:Pool = new Pool("RenderSet",1000);
		/**
		 * 生成一个RenderUnit
		 * @param $type
		 * @param $value
		 */
		public static function create():RenderSet
		{
			_cnt++;
			//利用池生成
			return _pool.createObj(RenderSet) as RenderSet;
		}
		
		public static function recycle($av:RenderSet):void
		{
			if ($av && !$av.disposing)
			{
				_cnt--;
				//利用池回收
				_pool.disposeObj($av);
			}
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
			rotation = 0;
			alpha = 1;
			
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
			
			if (_graphicDis)
				PoolContainer.recycle(_graphicDis as PoolContainer);
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
			var ap:RenderUnit;
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
			var ap:RenderUnit;
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
			var ap:RenderUnit;
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
		public function hasRenderUnit($ap:RenderUnit,$checkResReady:Boolean=false):Boolean
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
		 * 查找指定ID的RenderUnit
		 * @param $id 换装ID
		 */
		public function getRenderUnitByID($id:int, $checkResReady:Boolean=false):RenderUnit
		{
			var ap:RenderUnit;
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
		 * 获取指定类型的RenderUnit数组
		 * @param $renderUnitType 换装类型
		 */
		public function getRenderUnitsByType($renderUnitType:String, $checkResReady:Boolean=false):Array
		{
			var arr:Array = [];
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap.type == $renderUnitType && ((!$checkResReady) || ap.resReady))
				{
					arr.push(ap);
				}
			}
			return arr;
		}
		
		/**
		 * 获取所有RenderUnit数组
		 * @param $renderUnitType 换装类型
		 */
		public function getAllRenderUnits($checkResReady:Boolean=false):Array
		{
			var arr:Array = [];
			var ap:RenderUnit;
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
		
		override public function set finalShowX(value:Number):void
		{
			if(finalShowX != value)
			{
				super.finalShowX = value;
				
				var ap:RenderUnit;
				var len:int = _renderUnitList.length;
				while(len-->0)
				{
					ap = _renderUnitList[len];
					ap.finalShowX = value;
				}
			}
		}
		
		override public function set finalShowY(value:Number):void
		{
			if(finalShowY != value)
			{
				super.finalShowY = value;
				
				var ap:RenderUnit;
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
		 * 添加一项RenderUnit
		 *  @param $apd 换装数据 如果$apd==null，则创建一个空RenderParamData
		 */
		public function addRenderUnit($apd:IRenderUnitData):RenderUnit
		{
			//清空同种类型换装
			if($apd.clearSameType)
			{
				removeRenderUnitsByType($apd.type);//注意后面的参数
			}
			//清除同ID
			removeRenderUnitByID($apd.id);
			//创建一个新的
			var ap:RenderUnit = RenderUnit.create($apd);
			ap.parent = _graphicDis;
			//			ap.visible = (_hideRenderUnitTypes.indexOf(ap.type)==-1 && _hideRenderUnitIds.indexOf(ap.id)==-1);//判断可见性
			ap.isDrawShadow = _isDrawShadow;
			ap.isInViewDistance = _isInViewDistance;
			ap.updateNow = true;//注意这个!!!!!!!!
			ap.finalShowX = this.finalShowX;
			ap.finalShowY = this.finalShowY;
			ap.isMainChar = isMainChar;
			ap.depthEnable = this.depthEnable;
			//			ap.layerType = this.layerType;
			ap.renderSet = this;
			////////////////////////////////////
			if($apd.playCompleteAutoRecycle)
			{
				ap.setPlayCompleteCallBack(removeRenderUnit);//播放完了,自动移除
			}
			//添加进数组
			_renderUnitList.push(ap); 
			return ap;
		}
		
		/**
		 * 移除一项RenderUnit(此函数执行后,会检查主体换装，如果为空则启用默认换装)
		 * @param $renderUnit
		 * @param $clearSameType 是否清空同种类型的换装
		 * @param $loadDefaultAvatar 如果没有任何主体换装存在，是否启用默认换装
		 */
		public function removeRenderUnit($renderUnit:RenderUnit,$clearSameType:Boolean=false):void
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
					//执行remove回调,回收renderUnit
					RenderUnit.recycle($renderUnit);
					$renderUnit = null;
				}
			}
		}
		
		/**
		 * 移除指定ID的RenderUnit(此函数执行后,会检查主体换装，如果为空则启用默认换装)
		 * @param $renderUnitID 换装类型
		 * @param $loadDefaultAvatar 如果没有任何主体换装存在，是否启用默认换装
		 */
		public function removeRenderUnitByID($renderUnitID:int):void
		{
			//检查换装内
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap.id == $renderUnitID)
				{
					var index:int = _renderUnitList.indexOf(ap);
					if(index != -1)
					{
						_renderUnitList.splice(index,1);
					}
					//执行remove回调,回收renderUnit
					RenderUnit.recycle(ap);
					ap = null;
					break;//注意此处break
				}
			}
			
		}
		/**
		 * 移除指定类型的RenderUnit(此函数执行后,会检查主体换装，如果为空则启用默认换装)
		 * @param $renderUnitType 换装类型
		 * @param $loadDefaultAvatar 如果没有任何主体换装存在，是否启用默认换装
		 */
		public function removeRenderUnitsByType($renderUnitType:String):void
		{
			if($renderUnitType==null || $renderUnitType=="")return;//注意这个判断
			
			//检查换装内
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while(len-->0)
			{
				ap = _renderUnitList[len];
				if(ap.type == $renderUnitType)
				{
					//从数组中移除
					_renderUnitList.splice(len,1);
					//执行remove回调,回收renderUnit
					RenderUnit.recycle(ap);
					ap = null;
				}
			}
		}
		/**
		 * 移除所有RenderUnit((此函数执行后,不会检查主体换装是否存在)
		 * @param $loadDefaultAvatar 如果没有任何主体换装存在，是否启用默认换装
		 */
		public function removeAllRenderUnits():void
		{
			//检查换装内
			var ap:RenderUnit;
			while(_renderUnitList.length)
			{
				ap = _renderUnitList.pop();
				//执行remove回调,回收renderUnit
				RenderUnit.recycle(ap);
				ap = null;
			}
		}
		
		//显示控制-------------------------------------------------------------------------------------------------------------
		/**
		 * 显示一个RenderUnit
		 * @param $renderUnit
		 */
		public function showRenderUnit($renderUnit:RenderUnit):void
		{
			$renderUnit.visible = true;
		}
		/**
		 * 隐藏一个RenderUnit
		 * @param $renderUnit
		 */
		public function hideRenderUnit($renderUnit:RenderUnit):void
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
		 * 注意：因为RenderUnit是异步创建的（loadRenderUnit方法是异步的），所以在此方法指定的ID的RenderUnit还未加载完毕添加进角色换装时，此方法会无效
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
			var ap:RenderUnit = getRenderUnitByID($id,false);
			if(ap!=null)
			{
				ap.visible = true;
			}
		}
		/**
		 * 隐藏某ID换装
		 * 注意：因为RenderUnit是异步创建的（loadRenderUnit方法是异步的），所以在此方法指定的ID的RenderUnit还未加载完毕添加进角色换装时，此方法会无效
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
			var ap:RenderUnit = getRenderUnitByID($id,false);
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
		//			var ap:RenderUnit;
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
		//			var ap:RenderUnit;
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
		
		override public function set planarRenderLayer(value:uint):void
		{
			_planarRenderLayer = value;
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while (len-- > 0)
			{
				ap = _renderUnitList[len];
				ap.planarRenderLayer = value;
			}
		}
		
		override public function set isDrawShadow(value:Boolean):void
		{
			_isDrawShadow = value;
			//执行隐藏
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while (len-- > 0)
			{
				ap = _renderUnitList[len];
				ap.isDrawShadow = value;
			}
		}
		
		override public function set layerType(value:uint):void
		{
			super.layerType = value;
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while (len-- > 0)
			{
				ap = _renderUnitList[len];
				ap.layerType = value;
			}
		}
		
		override public function set depth(value:int):void
		{
			super.depth = value;
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while (len-- > 0)
			{
				ap = _renderUnitList[len];
				ap.depth = value;
			}
		}
		
		override public function set depthEnable(value:Boolean):void
		{
			super.depthEnable = value;
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while (len-- > 0)
			{
				ap = _renderUnitList[len];
				ap.depthEnable = value;
			}
		}
		
		//运行相关
		//-----------------------------------------------------------------------------------------------------------
		/**
		 * 对整个换装的每一项执行函数
		 * @param $fun 第一个参数是参数sceneCharacter, 第二个参数是RenderUnit
		 * 
		 */		
		public function forEachRenderUnit($fun:Function,scene:*):void
		{
			//检查换装内
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while(len-- > 0)
			{
				ap = _renderUnitList[len];
				//				var arr:Array = args.concat(ap);
				//				$fun.apply($fun,[scene,ap]);      
				$fun(scene,ap);
			}
		}
		
		/**
		 * 运行逻辑
		 * @parma $frame 帧 为0则走渲染计时计算的帧，否则选择此参数指定的帧
		 */	
		override final public function run(gmTime:uint):void
		{
			//运行逻辑
			var ap:RenderUnit;
			var len:int = _renderUnitList.length;
			while (len-->0)
			{
				ap = _renderUnitList[len];
				if (ap.usable)
				{
					if (ap.visible)
					{
						ap.run(gmTime);
					}
				}
				else
				{
					removeRenderUnit(ap);
				}
			}
		}
		
		/**
		 * 获取换装RenderUnit数量
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
			var ap:RenderUnit;
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
		
		override public function set isMainChar(value:Boolean):void
		{
			super.isMainChar = value;
			var i:int = _renderUnitList.length;
			while(i-- > 0)
			{
				_renderUnitList[i].isMainChar = value;
			}
		}
	}
}