package com.rpgGame.appModule.skill.lostskill
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	public class LostSkillModePane extends InterObject3D
	{
		private var _qdata:Q_lostskill_open;
		private var _effect:RenderUnit3D;
		public function LostSkillModePane():void
		{
			super();
		}
		
		private var _state:SkillStateInfo;
		public function setModedata(data:Q_lostskill_open,state:SkillStateInfo):void
		{
			if(_qdata==data)
				return ;
			_qdata = data;
			_state = state;
			addFightSoul();
		}
		
		private function addFightSoul():void
		{
			if(_effect != null)
			{
				_effect.stopRender();
				RenderUnit3D.recycle(_effect);
				_effect = null;
			}
			if(_state==null)
				return ;
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