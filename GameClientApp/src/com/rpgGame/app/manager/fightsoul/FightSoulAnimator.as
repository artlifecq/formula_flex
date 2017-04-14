package com.rpgGame.app.manager.fightsoul
{
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.vo.BaseObj3D;
	
	public class FightSoulAnimator implements IRenderAnimator
	{
		private var _render : BaseObj3D;
		private var _delayTime:Number = 0;
		private static const TotalRunTime:Number = 5000;
		private static const RoundConst:Number = 100;
		
		public function setOwner(owner : BaseObj3D) : void
		{
			_render = owner;
		}
		public function update(gapTm:uint) : void
		{
			_delayTime +=gapTm;
			if(_delayTime>=TotalRunTime)
				_delayTime -=TotalRunTime;
			var percent:Number = Math.PI*2*_delayTime/TotalRunTime;
			_render.x = RoundConst*Math.sin(percent);
			_render.z = RoundConst*Math.cos(percent);
		}
		public function dispose() : void
		{
			_render = null;
		}
	}
}