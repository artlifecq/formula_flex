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
		protected var _unit : BaseObj3D;
		protected var _container3D : PoolContainer3D;

		public function InterObject3D(view3D : View3D = null)
		{
			super(view3D || Stage3DLayerManager.screenView);
			_container3D = PoolContainer3D.create();
			this.addChild3D(_container3D);
		}

		public function setRenderUnit(unit : BaseObj3D) : void
		{
			_unit = unit;
			_unit.needInViewDist = false;
			_unit.isInViewDistance = true;
			_unit.needRun = true;
			_unit.parent = _container3D;
			if (_isStarted)
				_unit.startRender();
			else
				_unit.stopRender();
		}

		public function addRenderUnitWith(rend : RenderParamData3D, repeat : int = 1, onPlayComplete : Function = null,addComplete:Function=null) : RenderUnit3D
		{
			if (rend == null)
			{
				return null;
			}

			var unit : RenderUnit3D;
			unit = RenderUnit3D.create(rend);
			unit.setPlayCompleteCallBack(onPlayCompleteCallBack, this);
			unit.setAddedCallBack(addComplete);
			setRenderUnit(unit);

			unit.repeat = repeat;
			unit.rotationY = 0;
			if(!addComplete){//有回调的不自动播放
				unit.play(0);
			}
			this.onPlayComplete = onPlayComplete;
			return unit;
		}

		private function onPlayCompleteCallBack(self : InterObject3D, element : RenderUnit3D) : void
		{
			if (this.onPlayComplete != null)
				onPlayComplete(self);
			if (_unit != null && RenderUnit3D(_unit).repeat <= 1)
			{
				stop();
			}
		}

		public function get baseObj3D() : BaseObj3D
		{
			return this._unit;
		}

		public function start() : void
		{
			_isStarted = true;
			if (_unit)
				_unit.startRender();
		}

		public function stop() : void
		{
			_isStarted = false;
			if (_unit)
				_unit.stopRender();
		}

		public function set rotationY(value : Number) : void
		{
			root3D.rotationY = value;
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
			if (_unit)
			{
				_unit.stopRender();
				_unit.parent = null;
				_unit.graphicDis = null;
				if (_unit is RenderUnit3D)
				{
					(_unit as RenderUnit3D).destroy();
				}
				_unit = null;
			}
			_isStarted = false;
			onPlayComplete = null;
			super.dispose();
		}

	}
}

