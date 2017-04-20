package com.rpgGame.core.ui
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import away3d.core.base.Geometry;
	import away3d.entities.Mesh;
	
	import feathers.controls.ProgressBar;
	
	/**
	 *与特效的进度条
	 *@author dik
	 *2017-4-20下午2:14:13
	 */
	public class AwdProgressBar extends SkinUI
	{
		private var _bar:ProgressBar;
		private var _eftRender:RenderUnit3D;
		private var _eft3d:InterObject3D;
		private var _bgMesh:Mesh;
		
		public function AwdProgressBar(bar:ProgressBar,eftName:String)
		{
			bar.removeFromParent();
			this._bar=bar;
			super();
			this.x=_bar.x;
			this.y=_bar.y;
			_bar.x=_bar.y=0;
			this.addChild(_bar);
			_eft3d=this.playInter3DAt(ClientConfig.getEffect(eftName),0,_bar.height>>1,0,null,onAddEft);
		}
		
		private function onAddEft(render:RenderUnit3D):void
		{
			_eftRender=render;
			_eftRender.play(0);
			_eftRender.scaleX=this.value/this.maximum;
			_bgMesh=render.getChildByName("bg") as Mesh;
			if(_bgMesh){
				var geometry:Geometry=_bgMesh.geometry;
				trace(123);
			}			
		}
		override public function dispose():void
		{
			super.dispose();
			_eft3d.dispose();
			_eftRender.stopRender();
			_eftRender.dispose();
		}
		
		public function get value() : Number
		{
			return this._bar.value;
		}
		
		public function set value(newValue:Number) : void
		{
			this._bar.value=newValue;
			if(_eftRender){
				_eftRender.scaleX=this.value/this.maximum;
			}
		}
		
		public function get minimum() : Number
		{
			return this._bar.minimum;
		}
		
		public function set minimum(value:Number) : void
		{
			this._bar.minimum=value;
		}
		
		public function get maximum() : Number
		{
			return this._bar.maximum;
		}
		
		public function set maximum(value:Number) : void
		{
			this._bar.maximum=value;
			if(_eftRender){
				_eftRender.scaleX=this.value/this.maximum;
			}
		}
		
	}
}