package com.rpgGame.appModule.jingmai.sub
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import starling.display.DisplayObjectContainer;

	public class JinMaiBtnEffect
	{
		private static const EFFECT_ARR:Array=["ui_jingmaidizi_huang","ui_jingmaidizi_cheng","ui_jingmaidizi_lv","ui_jingmaidizi_lan","ui_jingmaidizi_zi","ui_jingmaidizi_hong"];
		private var _target:DisplayObjectContainer;
		private var _effectUrl:String;
		private var _effectCon:Inter3DContainer;
		private var _effect3d:InterObject3D;
		public function JinMaiBtnEffect(btn:DisplayObjectContainer,meridianId:int)
		{
			this._target=btn;
			_effectCon=new Inter3DContainer();
			_effectCon.x=40;
			_effectCon.y=40;
			_target.addChild(_effectCon);
			_effectUrl=EFFECT_ARR[meridianId-1];
		}
		public function showEffect():void
		{
			if (!_effect3d) 
			{
				_effect3d=_effectCon.playInter3DAt(ClientConfig.getEffect(_effectUrl),0,0,0,null,addEft)
			}
		}
		public function clearEffect():void
		{
			if (_effect3d) 
			{
				_effect3d.dispose();
				_effect3d=null;
			}
		}
		private static function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
	}
}