package com.game.engine3D.display
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	/**
	 * 可以嵌入到Starling层的3D显示对象容器-starling容器
	 * @author wewell@163.com
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-05-25 下午3:05:12
	 *
	 */
	public class Inter3DContainer extends Sprite
	{
		private static var LOCAL_POINT : Point = new Point();

		public function Inter3DContainer()
		{
			super();
		}

		//==========================================================================
		//                                UI上显示3D渲染对象-相关方法
		//==========================================================================
		protected var _inter3DObjs : Vector.<InterObject3D>;
		private var _inter3DContainers : Vector.<Inter3DContainer>;
		protected var _numChildren3D : int;

		/**
		 * 在此UI上播放一个3特效
		 * @param url 特效url,定义在EffectUrl类中
		 * @param x,y 3D对象相对于此界面(0,0)的坐标
		 * @param repeat 重复播放次数，默认为1,即播放一次;0表示无限次
		 * @param onPlayComplete 播放完成后的回调
		 * @param objId 自定义的对象ID,用于区分同一url对应3D对象的不同实例,便于停止或删除等操作
		 * @scale 缩放比，美术人员一般输出都比较大，这里需要缩小
		 *
		 */
		public function playInter3DAt(url : String, x : int, y : int, repeat : int = 1, onPlayComplete : Function = null,addComplete:Function=null) : InterObject3D
		{
			var sr3D : InterObject3D = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui", url);
			data.forceLoad=true;//ui上的3d特效强制加载
			sr3D.addRenderUnitWith(data, repeat, onPlayComplete,addComplete);

			sr3D.x = x;
			sr3D.y = y;
			addChild3D(sr3D);
			return sr3D;
		}
		
		/**
		 *在UI上添加一个特效，播放播放只是添加 
		 * @param url
		 * @param isdispose 是否播放完了销毁
		 * @param onPlayComplete
		 * @param addComplete
		 * @return 
		 * 
		 */		
		public function addInter3D(url : String, isdispose :Boolean=false, onPlayComplete : Function = null,addComplete:Function=null) : EffectObject3D
		{
			var sr3D : EffectObject3D = new EffectObject3D(null,isdispose);
			var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui", url);
			data.forceLoad=true;
			var unit:RenderUnit3D=sr3D.addRenderUnitWith(data, 0, onPlayComplete,addEft);
			function addEft(render:RenderUnit3D):void
			{
				if(render)
				{
					render.stop();
					render.stopRender();
					sr3D.stop();
					sr3D.stopEffect();
					
				}
				if(addComplete!=null)
				{
					addComplete(render);
				}
				
			}
			if(unit)
			{
				unit.stop();
				unit.stopRender();
				sr3D.stop();
				sr3D.stopEffect();
				
			}
			addChild3D(sr3D);
			return sr3D;
		}
		public function addChild3D(child : InterObject3D,index:int = -1) : void
		{
			if(index<0)
				this.addChild(child);
			else
				this.addChildAt(child,index);
			if (!_inter3DObjs)
			{
				_inter3DObjs = new Vector.<InterObject3D>();
			}
			if (_inter3DObjs.indexOf(child) < 0)
			{
				_inter3DObjs.push(child);

				_numChildren3D++;
			}
			child.start();
			LOCAL_POINT.x = this.x;
			LOCAL_POINT.y = this.y;
			if (this.parent)
			{
				var point : Point = this.parent.localToGlobal(LOCAL_POINT);
				onUpdateFadeAlphaRectPos(child, point.x, point.y);
			}
		}

		public function removeChild3D(child : InterObject3D, dispose : Boolean = false) : void
		{
			if (this.contains(child))
				this.removeChild(child, dispose);

			if (_numChildren3D > 0)
			{
				var index : int = _inter3DObjs.indexOf(child);
				if (index != -1)
				{
					_inter3DObjs.splice(index, 1);
					_numChildren3D--;
					if(dispose)child.dispose();
				}
			}
		}

		/*		public function isInter3DInStage(sr3D : InterObject3D) : Boolean
				{
					return sr3D.hostContainer && sr3D.hostContainer.stage != null;
				}

				public function removeInter3DById(url : String, objId : int = 0, dispose : Boolean = false) : InterObject3D
				{
					return _inter3DObjByKey ? removeInter3D(_inter3DObjByKey[name + "_" + objId], dispose) : null;
				}

				public function startInter3D(url : String, objId : int = 0) : void
				{
					var sr3D : InterObject3D = _inter3DObjByKey ? _inter3DObjByKey[name + "_" + objId] : null;
					if (sr3D != null)
						sr3D.start();
				}

				public function stopInter3D(url : String, objId : int = 0) : void
				{
					var sr3D : InterObject3D = _inter3DObjByKey ? _inter3DObjByKey[name + "_" + objId] : null;
					if (sr3D != null)
						sr3D.stop();
				}*/

		public function startRender3D() : void
		{
			if (_numChildren3D > 0)
			{
				var child : InterObject3D;
				for each (child in _inter3DObjs)
				{
					child.start();
				}
			}
		}

		public function stopRender3D() : void
		{
			if (_numChildren3D > 0)
			{
				var child : InterObject3D;
				for each (child in _inter3DObjs)
				{
					child.stop();
				}
			}
		}

		/*		public function removeAllInter3D(dispose : Boolean = false) : void
				{
					var sr3D : InterObject3D;
					for each (sr3D in _inter3DObjByKey)
					{
						removeInter3D(sr3D, dispose);
					}
					if (dispose)
					{
						_inter3DObjByKey = null;
						if (_inter3DObjs)
						{
							_inter3DObjs.length = 0;
							_inter3DObjs = null
						}
					}
				}

				override public function removeFromParent(dispose : Boolean = false) : void
				{
					removeAllInter3D(dispose);
					super.removeFromParent(dispose);
				}*/

		override public function addChild(child : DisplayObject) : DisplayObject
		{
			if (child is Inter3DContainer)
			{
				add3DContainer(child as Inter3DContainer);
			}
			return super.addChild(child);
		}

		override public function addChildAt(child : DisplayObject, index : int) : DisplayObject
		{
			if (child is Inter3DContainer)
			{
				add3DContainer(child as Inter3DContainer);
			}
			return super.addChildAt(child, index);
		}

		override public function removeChild(child : DisplayObject, dispose : Boolean = false) : DisplayObject
		{
			if (child is Inter3DContainer)
			{
				remove3DContainer(child as Inter3DContainer, dispose);
			}
			return super.removeChild(child, dispose);
		}

		override public function removeChildAt(index : int, dispose : Boolean = false) : DisplayObject
		{
			var inter3DContainer : Inter3DContainer = getChildAt(index) as Inter3DContainer;
			if (inter3DContainer)
			{
				remove3DContainer(inter3DContainer);
			}
			return super.removeChildAt(index, dispose);
		}

		private function add3DContainer(inter3DContainer : Inter3DContainer) : void
		{
			if (_inter3DContainers == null)
			{
				_inter3DContainers = new Vector.<Inter3DContainer>()
			}
			if (_inter3DContainers.indexOf(inter3DContainer) < 0)
			{
				_inter3DContainers.push(inter3DContainer);
			}
		}

		private function remove3DContainer(inter3DContainer : Inter3DContainer, dispose : Boolean = false) : void
		{
			if (_inter3DContainers)
			{
				var index : int = _inter3DContainers.indexOf(inter3DContainer);
				if (index >= 0)
				{
					_inter3DContainers.splice(index, 1);
					if(dispose)
					{
						inter3DContainer.dispose();
					}
				}
			}
		}

		override public function set x(value : Number) : void
		{
			super.x = value;
			onUpdate3DPosition();
		}

		override public function set y(value : Number) : void
		{
			super.y = value;
			onUpdate3DPosition();
		}

		public function get numChildren3D() : int
		{
			return _numChildren3D;
		}

		protected function onUpdate3DPosition() : void
		{
			if (_numChildren3D > 0 && this.stage != null)
				updateFadeAlphaRectPos();
			if (_inter3DContainers)
			{
				for each (var inter3DContainer : Inter3DContainer in _inter3DContainers)
				{
					inter3DContainer.onUpdate3DPosition();
				}
			}
		}

		public function updateFadeAlphaRectPos() : void
		{
			if (!this.parent || !_inter3DObjs)
			{
				return;
			}
			LOCAL_POINT.x = this.x;
			LOCAL_POINT.y = this.y;
			var point : Point = this.parent.localToGlobal(LOCAL_POINT);
			var sr3D : InterObject3D;
			for each (sr3D in _inter3DObjs)
			{
				onUpdateFadeAlphaRectPos(sr3D, point.x, point.y);
			}
		}

		protected function onUpdateFadeAlphaRectPos(sr3D : InterObject3D, x : int, y : int) : void
		{
		}
		
		override public function dispose():void
		{
			if (this.parent) 
			{
				this.removeFromParent();
			}
			var len:int = _inter3DObjs ? _inter3DObjs.length : 0;
			var i:int;
			var inter3DObj:InterObject3D;
			var interContainer:Inter3DContainer;
			for(i = 0; i<len; i++)
			{
				inter3DObj = _inter3DObjs[i];
				if(inter3DObj)inter3DObj.dispose();
			}
			len = _inter3DContainers ? _inter3DContainers.length : 0;
			for(i=0; i<len; i++)
			{
				interContainer = _inter3DContainers[i];
				if(interContainer)interContainer.dispose();
			}
			
			_inter3DObjs = null;
			_inter3DContainers = null;
			super.dispose();
		}
	}
}


