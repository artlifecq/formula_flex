package com.rpgGame.appModule.dungeon.genuine
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObjectContainer;
	import away3d.events.Event;

	public class StarEffect extends Inter3DContainer
	{
		private var _image:UIAsset;
		private var _effect3D:InterObject3D;
		private var _index:int 
		public function StarEffect(image:UIAsset,index:int):void
		{
			_image = image;
			_index = index;
		}
		public function reset():void
		{
			_image.visible = false;
		}
		
		private function initPartner():void
		{
			if(this.parent!=null)
				return ;
			var partner:DisplayObjectContainer = _image.parent;
			partner.addChild(this);
			this.x = _image.x + _image.width/2;
			this.y = _image.y + _image.height/2;
		}
		private function removeFormPartner():void
		{
			if(this.parent==null)
				return ;
			var partner:DisplayObjectContainer = _image.parent;
			partner.removeChild(this);
		}
		
		public function playEffect():void
		{
			_effect3D = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui"+_index, ClientConfig.getEffect("ui_xingxing"));
			data.forceLoad=true;//ui上的3d特效强制加载
			_effect3D.addRenderUnitWith(data, 1, playCompleteHandler);
			addChild3D(_effect3D);
			initPartner();
		}
		
		private function playCompleteHandler(renderUint:*):void
		{
			this.removeChild3D(_effect3D,true);
			_effect3D = null;
			removeFormPartner();
			_image.visible = true;
			this.dispatchEventWith(Event.COMPLETE,false,this._index);
		}
		public function stopEffect():void
		{
			if (_effect3D)
			{
				_effect3D.stop();
			}
		}
	}
}