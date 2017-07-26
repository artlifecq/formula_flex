package com.rpgGame.appModule.pet.sub
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;

	public class PetZoneBall
	{
		private var _ball:UIAsset;
		private var _effCon:Inter3DContainer;
		private var _effectState:Boolean;
		private var _info:PetInfo;
		private var _rank:int=0;
		public function PetZoneBall(ui:UIAsset)
		{
			this._ball=ui;
			init();
		}
		
		private function init():void
		{
			GrayFilter.gray(this._ball);
		}
		
		public function setData(info:PetInfo,num:int):void
		{
			_info=info;
			_rank=num;			
			
		}
		
		private static function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		public function setEffect(bool:Boolean):void
		{
			if (bool==_effectState) 
			{
				return;
			}
			_effectState=bool;
			if (bool) 
			{
				if (!_effCon) 
				{
					_effCon=new Inter3DContainer();
					_effCon.x=_ball.width/2;
					_effCon.y=_ball.height/2;
					this._ball.addChild(_effCon);
					_effCon.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_PET_BALL),0,0,0,null,addEft);
				}
				this._ball.filter=null;
			}
			else
			{
				if (_effCon) 
				{
					_effCon.dispose();
					_effCon=null;
				}
				GrayFilter.gray(this._ball);
			}
		}
	}
}