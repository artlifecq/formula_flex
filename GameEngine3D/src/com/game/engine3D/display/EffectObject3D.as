package com.game.engine3D.display
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	
	import away3d.containers.View3D;

	public class EffectObject3D extends InterObject3D
	{
		public function EffectObject3D(view3D : View3D = null)
		{
			super(view3D);
		}
		
		/**跳转到特效的百分比*/
		public function gotoPercent(percent:Number) : void
		{
			if (_unit != null)
			{
				var rend:RenderUnit3D=_unit as RenderUnit3D;
				if(rend.totalDuration>0)
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
				rend.animateSpeed=speed;
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
			var unit:RenderUnit3D=this.baseObj3D as RenderUnit3D;
			unit.repeat = repeat;
			unit.play(0);
			unit.animateSpeed=speed;
			this.start();
			
		}
		/**停止特效*/
		public function stopEffect():void
		{
			var unit:RenderUnit3D=this.baseObj3D as RenderUnit3D;
			unit.stop();
			this.stop();
		}
		
	}
}