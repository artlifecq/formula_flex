package com.game.engine3D.display
{
	import com.game.engine3D.core.poolObject.PoolContainer3D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.vo.BaseObj3D;
	
	import away3d.containers.View3D;
	
	import starling.display.Interoperation3DContainer;

	/**
	 *  用于嵌入到Starling层的3D显示对象-away3D子对象
	 * @author wewell@163.com
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-05-25 下午3:05:12
	 */
	public class InterObject3D extends Interoperation3DContainer
	{
		private var onPlayComplete : Function;
		private var _isStarted : Boolean = false;
		protected var _obj3d : BaseObj3D;
		protected var _container3D : PoolContainer3D;

		public function InterObject3D(view3D : View3D = null)
		{
			super(view3D || Stage3DLayerManager.screenView);
			_container3D = PoolContainer3D.create();
			this.addChild3D(_container3D);
		}

		public function setRenderUnit(obj3d : BaseObj3D) : void
		{
			_obj3d = obj3d;
			_obj3d.needInViewDist = false;
			_obj3d.isInViewDistance = true;
			_obj3d.needRun = true;
			_obj3d.parent = _container3D;
			_obj3d.rotationY = 0;
			if (_isStarted)
				_obj3d.startRender();
			else
				_obj3d.stopRender();
			if (_obj3d is RenderUnit3D)
			{
				RenderUnit3D(_obj3d).disableOnceMaxDuration = true;
				RenderUnit3D(_obj3d).play(0);
			}
		}

		public function addRenderUnitWith(rend : RenderParamData3D, repeat : int = 1, onPlayComplete : Function = null,addComplete:Function=null) : RenderUnit3D
		{
			if (rend == null)
			{
				return null;
			}
			this.onPlayComplete = onPlayComplete;
			var unit : RenderUnit3D;
			unit = RenderUnit3D.create(rend);
			unit.repeat = repeat;
			unit.setPlayCompleteCallBack(onPlayCompleteCallBack, this);
			unit.setAddedCallBack(addComplete);
			setRenderUnit(unit);

			if(!addComplete){//有回调的不自动播放
				unit.play(0);
			}
			
			return unit;
		}

		private function onPlayCompleteCallBack(self : InterObject3D, element : RenderUnit3D) : void
		{
			if (this.onPlayComplete != null)
				onPlayComplete(self);
			if (_obj3d != null && RenderUnit3D(_obj3d).repeat <= 1)
			{
				stop();
			}
            if (_obj3d != null && RenderUnit3D(_obj3d).repeat >= 1) {
                this.dispose();
            }
		}
		
		
		
		public function get baseObj3D() : BaseObj3D
		{
			return this._obj3d;
		}

		public function start() : void
		{
			_isStarted = true;
			if (_obj3d)
				_obj3d.startRender();
			if (_obj3d is RenderUnit3D)
			{
				RenderUnit3D(_obj3d).play(0);
			}
		}
		public function stop() : void
		{
			_isStarted = false;
			if (_obj3d)
				_obj3d.stopRender();
		}

		public function set rotationY(value : Number) : void
		{
			root3D.rotationY = value;
		}
		
		public function get rotationY() : Number
		{
			return root3D.rotationY;
		}
        
        public function play(timer : uint = 0) : void {
            if (this.parent && !this.parent.contains(this))
            {
                this.parent.addChild(this);
            }
            if (_obj3d)
            {
                _obj3d.startRender();
                if (_obj3d is RenderUnit3D)
                {
                    (_obj3d as RenderUnit3D).play(timer);
                }
            }
            _isStarted = true;
        }
        
        public function clear() : void {
            if (this.parent)
            {
                this.parent.removeChild(this);
            }
            if (_obj3d)
            {
                _obj3d.stopRender();
                if (_obj3d is RenderUnit3D)
                {
                    (_obj3d as RenderUnit3D).stop();
                }
            }
            _isStarted = false;
        }

		override public function dispose() : void
		{
			if (this.parent)
			{
				this.parent.removeChild(this);
			}
			if (_container3D)
			{
				PoolContainer3D.recycle(_container3D);
				_container3D = null;
			}
			if (_obj3d)
			{
//				_obj3d.stopRender();
                _obj3d.destroy();
				_obj3d = null;
			}
			_isStarted = false;
			onPlayComplete = null;
			super.dispose();
		}

		public function get isStarted():Boolean
		{
			return _isStarted;
		}


	}
}

