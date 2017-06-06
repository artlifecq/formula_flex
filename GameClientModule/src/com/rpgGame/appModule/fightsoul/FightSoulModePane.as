package com.rpgGame.appModule.fightsoul
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.coreData.cfg.FightsoulModeData;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_mode;
	import com.rpgGame.coreData.role.RoleData;
	
	public class FightSoulModePane extends InterAvatar3D
	{
		private var _showAvatarData : RoleData;
		private var _level:int;
		private var _mode:RenderUnit3D;
		private var _effect:RenderUnit3D;
		public function FightSoulModePane():void
		{
			super();
			initAvatar();
		}
		
		private function initAvatar():void
		{
			_showAvatarData = new RoleData(0);
		}
		public function setModeLevel(level:int):void
		{
			if(_level==level)
				return ;
			_level = level;
			addFightSoul();
		}
		
		private function addFightSoul():void
		{
			/*if(_mode!=null)
				RenderUnit3D.recycle(_mode);
			if(_effect != null)
				RenderUnit3D.recycle(_effect);
			
			
			var data : RenderParamData3D =  new RenderParamData3D(0, "effect", ClientConfig.getEffect(modeinfo.q_effect));
			_mode = this.addRenderUnitWith(data, 0, onAddEftComplete);
			_mode.scaleX=_mode.scaleY=2;
			_mode.y = 80;
			data=new RenderParamData3D(0, "mode", ClientConfig.getFightSoul(modeinfo.q_mode));
  			_effect = this.addRenderUnitWith(data, 0, onAddEftComplete);
			_effect.scaleX=_effect.scaleY=2;
			_effect.y = 80;*/
			var modeinfo:Q_fightsoul_mode = FightsoulModeData.getModeInfoById(_level);
			this._showAvatarData.avatarInfo.setBodyResID("pc/fightsoul/"+modeinfo.q_mode,null);
			this._showAvatarData.avatarInfo.bodyEffectID2 =modeinfo.q_effect;
			this.setRoleData(this._showAvatarData);
			
			this.curRole.setScale(modeinfo.q_panleScale/100);
			this.curRole.z = modeinfo.q_panleY;
		}
		
		private function onAddEftComplete(sr3D:InterObject3D,renderUint:RenderUnit3D):void
		{
			renderUint.removeAddedCallBack(onAddEftComplete);
			
			
		}
	}
}