package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.game.engine2D.scene.StarlingLayerManager;
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import flash.utils.clearInterval;
	import flash.utils.setTimeout;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.JiXianQieHuan;
	
	import starling.display.DisplayObjectContainer;
	
	public class JiXianNoticePanelExt extends SkinUIPanel
	{
		private var _skin:JiXianQieHuan;
		private var _effect3dCon:Inter3DContainer;
		private var _effect3d:InterObject3D;
		private var _timeOut:int;
		public function JiXianNoticePanelExt()
		{
			_skin=new JiXianQieHuan();
			super(_skin);
			_effect3dCon=new Inter3DContainer();
			_effect3dCon.x=_skin.width/2;
			_effect3dCon.y=_skin.height/2;
			MCUtil.addBefore(this,_effect3dCon,_skin.uiWords);
			this.changeMapClose=true;
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topLevel);
		}
		override protected function onShow():void
		{
			super.onShow();
			if (!_effect3d) 
			{
				_effect3d=this._effect3dCon.playInter3DAt(ClientConfig.getEffect(EffectUrl.EFFECT_UI_WARN),0,0,0);
			}
			cleartime();
			_timeOut=setTimeout(hideMe,5000);
		}
		private function cleartime():void
		{
			if (_timeOut!=0) 
			{
				clearInterval(_timeOut);
				_timeOut=0;
			}
		}
		private function hideMe():void
		{
			_timeOut=0;
			hide();
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_effect3d) 
			{
				_effect3d.dispose();
				_effect3d=null;
			}
			cleartime();
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x=(sw-this.width)/2;
			this.y=250;
		}
	}
}