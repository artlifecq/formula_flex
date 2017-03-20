package com.rpgGame.app.manager
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.action.JumpState;
	import com.rpgGame.app.state.role.control.JumpRiseState;
	import com.rpgGame.coreData.cfg.GlobalSettingCfgData;
	import com.rpgGame.coreData.clientConfig.GlobalSetting;
	import com.rpgGame.coreData.configEnum.EnumGlobalSetting;

	/**
	 *
	 * 全局设置管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-29 下午2:30:12
	 *
	 */
	public class GlobalSettingManager
	{
		public static function init() : void
		{
			var setting : GlobalSetting = GlobalSettingCfgData.getSettingInfo(EnumGlobalSetting.DEFAULT_SETTING);
			if (setting)
			{
				RenderUnit3D.setGlassPassColor(setting.glassPassColor);
				JumpState.JUMP_SPEED_RATIO = setting.jumpSpeedRatio;
				JumpState.SECOND_JUMP_SPEED_RATIO = setting.secondJumpSpeedRatio;
				JumpState.JUMP_END_TIME = setting.jumpEndTime;
				JumpState.SECOND_JUMP_END_TIME = setting.secondJumpEndTime;
				JumpState.JUMP_BREAK_TIME = setting.jumpBreakTime;
				JumpState.SECOND_JUMP_BREAK_TIME = setting.secondJumpBreakTime;
				JumpState.JUMP_START_TIME = setting.jumpStartTime;
				JumpState.SECOND_JUMP_START_TIME = setting.secondJumpStartTime;
				JumpState.SECOND_JUMP_PROBABILITY = setting.secondJumpProbability;
				JumpRiseState.JUMP_HEIGHT = setting.jumpHeight;
				JumpRiseState.SECOND_JUMP_HEIGHT = setting.secondJumpHeight;
//				RoleStateUtil.deathStateEffectType = setting.deathStateEffectType;
				SceneRoleSelectManager.setOutlineData(setting.outlineEffectSize, setting.outlineEffectStrength, setting.outlineEffectQuality, setting.outlineEnemyColor, 
					setting.outlineFriendColor, setting.outlineNeutralColor);
			}
			update();
		}

		public static function update() : void
		{

		}

		public function GlobalSettingManager()
		{
		}
	}
}
