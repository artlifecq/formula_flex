package com.editor.manager
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.GlobalSettingConfig;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelName;
	import com.editor.data.TabelData;
	import com.editor.state.role.RoleStateUtil;
	import com.game.engine3D.scene.render.RenderUnit3D;

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
			update();
		}

		public static function update() : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.GlobalSettingConfigName);
			if (tabel)
			{
				var desc : ConfigDesc = tabel.getConfigDesc();
				var datas : Array = ConfigData.getCfgByFieldValue(desc, "key", "DEFAULT_SETTING");
				if (datas.length > 0)
				{
					var setting : GlobalSettingConfig = datas[0];
					RenderUnit3D.setGlassPassColor(setting.mGlassPassColor);

					RoleStateUtil.deathStateEffectType = setting.mDeathStateEffectType;
					MouseManager.setOutlineData(setting.mOutlineEffectSize, setting.mOutlineEffectStrength, setting.mOutlineEffectQuality, setting.mOutlineEnemyColor, setting.mOutlineFriendColor, setting.mOutlineNeutralColor);
				}
				EditorCameraManager.updateProperty();
				SceneRoleManager.getInstance().updatePreviewState();
			}
		}

		public function GlobalSettingManager()
		{
		}
	}
}
