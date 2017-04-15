package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.coreData.cfg.ClientConfig;

	public class JinZhenControl
	{
		private var _content:Inter3DContainer;
		private var _index:int;
		private var renderUint:RenderUnit3D;
		private var _effect3d:InterObject3D;
		public function JinZhenControl(content:Inter3DContainer,index:int):void
		{
			_content = content;
			_index = index;
			init();
		}
		private function init():void
		{
			_effect3d= new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "mode", ClientConfig.getEffect("ui_jinzhen"));
			_effect3d.addRenderUnitWith(data, 0, null);
			_effect3d.touchable = false;
			_content.addChild3D(_effect3d);
			renderUint=RenderUnit3D(_effect3d.baseObj3D);
			renderUint.setAddedCallBack(onAddHpEft,_effect3d);
		}
		private function onAddHpEft(sr3D:InterObject3D,renderUint:RenderUnit3D):void
		{
			renderUint.removeAddedCallBack(onAddHpEft);
			if(_index==0)
			{
				_effect3d.x = 43;
				_effect3d.y = 54;
				renderUint.rotationZ = 81;
			}else if(_index==1)
			{
				_effect3d.x = 44;
				_effect3d.y = 25;
				renderUint.rotationZ = 30;
			}else if(_index ==2){
				_effect3d.x = 78;
				_effect3d.y = 17;
				renderUint.rotationZ = 0;
			}else if(_index ==3){
				_effect3d.x = 113;
				_effect3d.y = 27;
				renderUint.rotationZ = -31;
			}else if(_index ==4){
				_effect3d.x = 115;
				_effect3d.y = 54;
				renderUint.rotationZ = -81;
			}
		}
		
		public function visible(bool:Boolean):void
		{
			_effect3d.visible = bool;
		}
	}
}