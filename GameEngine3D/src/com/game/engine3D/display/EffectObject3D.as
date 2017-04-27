package com.game.engine3D.display
{
	import com.game.engine3D.core.poolObject.PoolContainer3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	
	import away3d.containers.View3D;

	public class EffectObject3D extends InterObject3D
	{
		private var _isdispose:Boolean=false;
		public function EffectObject3D(view3D : View3D = null,isdispose:Boolean=false)
		{
			super(view3D);
			_isdispose=isdispose;
		}
		
		/**是否需要播放完了销毁*/
		public function get isdispose():Boolean
		{
			return _isdispose;
		}

		/**
		 * @private
		 */
		public function set isdispose(value:Boolean):void
		{
			_isdispose = value;
		}

		/**跳转到特效的百分比*/
		public function gotoPercent(percent:Number) : void
		{
			if (_unit != null)
			{
				var rend:RenderUnit3D=_unit as RenderUnit3D;
				if(rend!=null&&rend.totalDuration>0)
				{
					
					if(percent>=0)
					{
						rend.stop(int(percent*rend.totalDuration));
						rend.startRender();
					}
					else
					{
						rend.stop(0);
						rend.stopRender();
					}
					
				}
				
				
			}
			
		}
		
		
		
		/**设置速度，相对于总时间*/
		public function setSpeed(speed:Number) : void
		{
			if (_unit != null)
			{
				var rend:RenderUnit3D=_unit as RenderUnit3D;
				if(rend!=null)
				{
					rend.animateSpeed=speed;
				}
				
			}
		}
		
		/**
		 * 播放特效
		 * @param repeat 播放次数 针对动画里面只播放一次的没用
		 * @param speed 播放速度
		 * 
		 */		
		public function playEffect(repeat:int=0,speed:Number=1):void
		{
			if (_unit != null)
			{
				var unit:RenderUnit3D=_unit as RenderUnit3D;
				if(unit!=null)
				{
					unit.repeat = repeat;
					unit.play(0);
					unit.animateSpeed=speed;
					this.start();
				}
				
			}
		/*	var unit:RenderUnit3D=this.baseObj3D as RenderUnit3D;
			if(unit!=null)
			{
				unit.repeat = repeat;
				unit.play(0);
				unit.animateSpeed=speed;
				this.start();
			}
			*/
			
		}
		/**停止特效*/
		public function stopEffect():void
		{
			if (_unit != null)
			{
				var unit:RenderUnit3D=_unit as RenderUnit3D;
				if(unit!=null)
				{
					unit.stop();
					this.stop();	
				}
				
			}
			
			/*var unit:RenderUnit3D=this.baseObj3D as RenderUnit3D;
			if(unit!=null)
			{
				unit.stop();
				this.stop();	
			}*/
			
		}
		override public function dispose() : void
		{
			if(_isdispose)
			{
				super.dispose();
			}
		}
	}
}