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
			var modeinfo:Q_fightsoul_mode = FightsoulModeData.getModeInfoById(_level);
			this._showAvatarData.avatarInfo.setBodyResID("pc/fightsoul/"+modeinfo.q_mode,null);
			this._showAvatarData.avatarInfo.bodyEffectID =modeinfo.q_effect;
			this._showAvatarData.avatarInfo.bodyEffectID2 =modeinfo.q_effect1;
			this.setRoleData(this._showAvatarData);
			
			var scale:Number = modeinfo.q_panleScale/100;
			this.curRole.setScale(scale);
			this.curRole.z = -modeinfo.q_panleY*scale;
		}
	}
}