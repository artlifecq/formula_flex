package com.rpgGame.appModule.pet.sub
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.MeiRenGuanQiaData;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.PetAdvanceCfg;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
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
		
		public function setData(info:PetInfo,num:int,isShowTips:Boolean=false):void
		{
			_info=info;
			_rank=num;		
			if(isShowTips){
				var q_girl_pet:Q_girl_pet=PetCfg.getPet(info.modelId);
				var zhanli:Array=JSONUtil.decode(q_girl_pet.q_need_power);
				var prizes:Array=JSONUtil.decode(q_girl_pet.q_zone_reward);
				
				var power:int=zhanli[_rank-1];
				var prize:Array=prizes[_rank-1];
				var isTongguan:Boolean=info.passlevel>=_rank;
				var data:MeiRenGuanQiaData=new MeiRenGuanQiaData();
				data.zhanli=power;
				data.tongguanBool=isTongguan;
				data.prize=prize;
				TipTargetManager.show( this._ball, TargetTipsMaker.makeTips( TipType.MEIREN_GUANQIA_TIP, data ,true) );
			}
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