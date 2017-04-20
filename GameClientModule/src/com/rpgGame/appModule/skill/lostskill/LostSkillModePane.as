package com.rpgGame.appModule.skill.lostskill
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	
	public class LostSkillModePane extends InterObject3D
	{
		private var _qdata:Q_lostskill_open;
		private var _effect:RenderUnit3D;
		public function LostSkillModePane():void
		{
			super();
		}
		
		
		public function setModedata(data:Q_lostskill_open):void
		{
			if(_qdata==data)
				return ;
			_qdata = data;
			addFightSoul();
		}
		
		private function addFightSoul():void
		{
			if(_effect != null)
				RenderUnit3D.recycle(_effect);
			
			var data : RenderParamData3D = new RenderParamData3D(0, "effect", ClientConfig.getEffect(_qdata.q_effect));
			_effect = this.addRenderUnitWith(data, 0, null);
		}
		
		private function onAddEftComplete(sr3D:InterObject3D,renderUint:RenderUnit3D):void
		{
			renderUint.removeAddedCallBack(onAddEftComplete);
//			renderUint.scaleX=renderUint.scaleY=0.6;
		}
	}
}