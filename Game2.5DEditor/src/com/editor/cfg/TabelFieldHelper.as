package com.editor.cfg
{
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;
	import com.editor.manager.DataStructuresManager;

	import flash.geom.Vector3D;

	/**
	 *
	 * 数据表字段助手
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-29 下午2:30:12
	 *
	 */
	public class TabelFieldHelper
	{
		public function TabelFieldHelper()
		{
		}

		public static function getRes(tabelName : String, data : ConfigData) : String
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SCENE_RES_FIELD, data);
			return values ? values[0] : null;
		}

		public static function getPosX(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.ENTITY_POS_X_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getPosY(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.ENTITY_POS_Y_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getOffsetUp(data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.ENTITY_OFFSET_UP_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getEffectOffsetX(data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.EFFECT_OFFSET_X_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getEffectOffsetY(data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.EFFECT_OFFSET_Y_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getEffectOffsetZ(data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.EFFECT_OFFSET_Z_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getDirection(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.ENTITY_DIRECTION_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getScene(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SCENE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function isBoundArea(tabel : TabelData, fieldData : TabelFieldData) : Boolean
		{
			if (!tabel)
				return false;

			var xField : TabelFieldData = tabel.getField("x");
			if (!xField || xField.mDataProvidedField != fieldData.name)
				return false;
			var yField : TabelFieldData = tabel.getField("y");
			if (!yField || yField.mDataProvidedField != fieldData.name)
				return false;
			var widthField : TabelFieldData = tabel.getField("width");
			if (!widthField || widthField.mDataProvidedField != fieldData.name)
				return false;
			var heightField : TabelFieldData = tabel.getField("height");
			if (!heightField || heightField.mDataProvidedField != fieldData.name)
				return false;
			return true;
		}

		public static function getArea(tabel : TabelData, data : ConfigData, fieldData : TabelFieldData) : String
		{
			var xField : TabelFieldData = tabel.getField("x");
			if (!xField || xField.mDataProvidedField != fieldData.name)
				return data[fieldData.mFieldName];
			var yField : TabelFieldData = tabel.getField("y");
			if (!yField || yField.mDataProvidedField != fieldData.name)
				return data[fieldData.mFieldName];
			var widthField : TabelFieldData = tabel.getField("width");
			if (!widthField || widthField.mDataProvidedField != fieldData.name)
				return data[fieldData.mFieldName];
			var heightField : TabelFieldData = tabel.getField("height");
			if (!heightField || heightField.mDataProvidedField != fieldData.name)
				return data[fieldData.mFieldName];

			var minX : String = data[xField.mFieldName];
			var minY : String = data[yField.mFieldName];
			var width : String = data[widthField.mFieldName];
			var height : String = data[heightField.mFieldName];

			return minX + "=" + minY + ";" + //
				int(int(minX) + int(width)) + "=" + minY + ";" + //
				int(int(minX) + int(width)) + "=" + int(int(minY) + int(height)) + ";" + //
				minX + "=" + int(int(minY) + int(height)); //
		}

		public static function setArea(tabel : TabelData, data : ConfigData, fieldData : TabelFieldData, value : String) : void
		{
			var xField : TabelFieldData = tabel.getField("x");
			if (!xField || xField.mDataProvidedField != fieldData.name)
			{
				data.setValue(fieldData.mFieldName, value);
				return;
			}
			var yField : TabelFieldData = tabel.getField("y");
			if (!yField || yField.mDataProvidedField != fieldData.name)
			{
				data.setValue(fieldData.mFieldName, value);
				return;
			}
			var widthField : TabelFieldData = tabel.getField("width");
			if (!widthField || widthField.mDataProvidedField != fieldData.name)
			{
				data.setValue(fieldData.mFieldName, value);
				return;
			}
			var heightField : TabelFieldData = tabel.getField("height");
			if (!heightField || heightField.mDataProvidedField != fieldData.name)
			{
				data.setValue(fieldData.mFieldName, value);
				return;
			}

			var minXKey : String = xField.mFieldName;
			var minYKey : String = yField.mFieldName;
			var widthKey : String = widthField.mFieldName;
			var heightKey : String = heightField.mFieldName;

			var minXValue : Number = Infinity;
			var minYValue : Number = Infinity;
			var maxXValue : Number = -Infinity;
			var maxYValue : Number = -Infinity;

			var areaVPosArr : Array = value.split(";");
			for each (var mposStr : String in areaVPosArr)
			{
				var pArr : Array = mposStr.split("=");
				var posx : int = pArr[0];
				var posy : int = pArr[1];
				if (posx < minXValue)
					minXValue = posx;
				if (posx > maxXValue)
					maxXValue = posx;
				if (posy < minYValue)
					minYValue = posy;
				if (posy > maxYValue)
					maxYValue = posy;
			}

			data.setValue(minXKey, minXValue);
			data.setValue(minYKey, minYValue);
			data.setValue(widthKey, int(maxXValue - minXValue));
			data.setValue(heightKey, int(maxYValue - minYValue));
		}

		public static function getTrailX(data : ConfigData, datas : Array = null) : Array
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.TRAIL_POINT_X_FIELD, data, true, datas);
			return values;
		}

		public static function getTrailY(data : ConfigData) : Array
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.TRAIL_POINT_Y_FIELD, data);
			return values;
		}

		public static function getTrailZ(data : ConfigData) : Array
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.TRAIL_POINT_Z_FIELD, data);
			return values;
		}

		public static function getTrailSpeed(data : ConfigData) : Array
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.TRAIL_POINT_SPEED_FIELD, data);
			return values;
		}

		public static function getTiltAngle(data : ConfigData) : Array
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.TILT_ANGLE_FIELD, data);
			return values;
		}

		public static function getAvatarBodyRes(data : ConfigData) : String
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.AVATAR_BODY_RES_FIELD, data);
			return values ? values[0] : null;
		}

		public static function getAvatarHairRes(tabelName : String, data : ConfigData) : String
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.AVATAR_HAIR_RES_FIELD, data);
			return values ? values[0] : null;
		}

		public static function getAvatarWeaponRes(data : ConfigData) : String
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.AVATAR_WEAPON_RES_FIELD, data);
			return values ? values[0] : null;
		}

		public static function getAvatarMountRes(tabelName : String, data : ConfigData) : String
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.AVATAR_MOUNT_RES_FIELD, data);
			return values ? values[0] : null;
		}

		public static function getAvatarMountAnimatRes(tabelName : String, data : ConfigData) : String
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.AVATAR_MOUNT_ANIMAT_RES_FIELD, data);
			return values ? values[0] : null;
		}

		public static function getEntityCount(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.ENTITY_COUNT_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getEntitySizeScale(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.ENTITY_SIZE_SCALE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getEntityRadius(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.ENTITY_SIZE_RADIUS_FIELD, data);
			return values ? values[0] : 0;
		}

		private static function getSpellEffectRes(field : String, data : ConfigData) : String
		{
			var tabelValues : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(field, data);
			var effectRes : String = tabelValues ? tabelValues[0] : null;
			if (effectRes == null)
			{
				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
				if (tabel)
				{
					var fieldData : TabelFieldData = tabel.getField(field);
					if (fieldData && fieldData.mFieldName)
					{
						var kvgs : Array = fieldData.mFieldName.split("=");
						if (kvgs.length > 1)
						{
							var key : String = kvgs[0];
							var values : Array = String(kvgs[1]).split("+");
							if (key == "res")
							{
								effectRes = "";
								for each (var value : String in values)
								{
									var fieldValue : String = data[value];
									if (fieldValue)
										effectRes += fieldValue;
									else
										effectRes += value;
								}
							}
						}
					}
				}
			}
			return effectRes;
		}

		public static function getReleaseRoleEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_RELEASE_RIDING_ROLE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_RELEASE_ROLE_EFFECT_FIELD, data);
			}
		}

		public static function getReleaseSceneEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_RELEASE_RIDING_SCENE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_RELEASE_SCENE_EFFECT_FIELD, data);
			}
		}

		public static function getReleaseBindBone(data : ConfigData, isRiding : Boolean) : String
		{
			var values : Array;
			if (isRiding)
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_RIDING_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
			else
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
		}

		public static function getReleaseEffectOffset(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_EFFECT_OFFSET_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_EFFECT_OFFSET_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_EFFECT_OFFSET_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getReleaseEffectScale(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_EFFECT_SCALE_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_EFFECT_SCALE_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_EFFECT_SCALE_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getSelfRoleEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_SELF_RIDING_ROLE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_SELF_ROLE_EFFECT_FIELD, data);
			}
		}

		public static function getSelfSceneEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_SELF_RIDING_SCENE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_SELF_SCENE_EFFECT_FIELD, data);
			}
		}

		public static function getSelfBindBone(data : ConfigData, isRiding : Boolean) : String
		{
			var values : Array;
			if (isRiding)
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SELF_RIDING_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
			else
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SELF_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
		}

		public static function getSelfEffectOffset(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SELF_EFFECT_OFFSET_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SELF_EFFECT_OFFSET_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SELF_EFFECT_OFFSET_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getSelfEffectScale(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SELF_EFFECT_SCALE_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SELF_EFFECT_SCALE_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SELF_EFFECT_SCALE_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getCaromStartFrameTime(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_CAROM_START_FRAME_TIME_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getMotion(data : ConfigData) : Array
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.AVATAR_MOTION_FIELD, data);
			return values;
		}

		public static function getOnceMotion(data : ConfigData) : String
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.AVATAR_MOTION_FIELD, data);
			return values ? values[0] : null;
		}

		public static function getBaseActionSpeed(data : ConfigData) : Array
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.BASE_ACTION_SPEED_FIELD, data);
			return values;
		}

		public static function getReleaseRange(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_RANGE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getKeepSpacing(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_KEEP_SPACING_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getHurtRange(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_RANGE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getHurtShape(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_SHAPE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getHurtAngle(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_ANGLE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getBreakableFrameTime(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_BREAKABLE_FRAME_TIME_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getFlySpeed(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_FLY_SPEED_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getFlyTime(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_FLY_TIME_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getFlySceneEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_FLY_RIDING_SCENE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_FLY_SCENE_EFFECT_FIELD, data);
			}
		}

		public static function getThrowBindBone(data : ConfigData, isRiding : Boolean) : String
		{
			var values : Array;
			if (isRiding)
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_THROW_RIDING_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
			else
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_THROW_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
		}

		public static function getHurtRoleEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_HURT_RIDING_ROLE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_HURT_ROLE_EFFECT_FIELD, data);
			}
		}

		public static function getHurtBindBone(data : ConfigData, isRiding : Boolean) : String
		{
			var values : Array;
			if (isRiding)
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
			else
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_RIDING_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
		}

		public static function getHurtSceneEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_HURT_RIDING_SCENE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_HURT_SCENE_EFFECT_FIELD, data);
			}
		}

		public static function getHurtEffectOffset(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_EFFECT_OFFSET_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_EFFECT_OFFSET_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_EFFECT_OFFSET_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getHurtEffectScale(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_EFFECT_SCALE_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_EFFECT_SCALE_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_EFFECT_SCALE_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getSputteringHurtRoleEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_SPUTTERING_HURT_RIDING_ROLE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_SPUTTERING_HURT_ROLE_EFFECT_FIELD, data);
			}
		}

		public static function getSputteringHurtBindBone(data : ConfigData, isRiding : Boolean) : String
		{
			var values : Array;
			if (isRiding)
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SPUTTERING_RIDING_HURT_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
			else
			{
				values = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SPUTTERING_HURT_BIND_BONE_FIELD, data);
				return values ? values[0] : null;
			}
		}

		public static function getSputteringHurtSceneEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_SPUTTERING_HURT_RIDING_SCENE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_SPUTTERING_HURT_SCENE_EFFECT_FIELD, data);
			}
		}

		public static function getSputteringHurtEffectOffset(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SPUTTERING_HURT_EFFECT_OFFSET_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getSputteringHurtEffectScale(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SPUTTERING_HURT_EFFECT_SCALE_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SPUTTERING_HURT_EFFECT_SCALE_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SPUTTERING_HURT_EFFECT_SCALE_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getDestSceneEffect(data : ConfigData, isRiding : Boolean) : String
		{
			if (isRiding)
			{
				return getSpellEffectRes(TabelFieldData.SPELL_DEST_RIDING_SCENE_EFFECT_FIELD, data);
			}
			else
			{
				return getSpellEffectRes(TabelFieldData.SPELL_DEST_SCENE_EFFECT_FIELD, data);
			}
		}

		public static function getDestEffectOffset(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEST_EFFECT_OFFSET_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEST_EFFECT_OFFSET_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEST_EFFECT_OFFSET_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getDestEffectScale(data : ConfigData) : Vector3D
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEST_EFFECT_SCALE_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEST_EFFECT_SCALE_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEST_EFFECT_SCALE_Z_FIELD, data);
			return new Vector3D(valueXs ? valueXs[0] : 0, valueYs ? valueYs[0] : 0, valueZs ? valueZs[0] : 0);
		}

		public static function getIsFlyCross(tabelName : String, data : ConfigData) : Boolean
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_IS_FLY_CROSS_FIELD, data);
			return values ? (values[0] == "1") : false;
		}

		public static function getIsAdaptiveTargetHeight(tabelName : String, data : ConfigData) : Boolean
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_IS_ADAPTIVE_TARGET_HEIGHT_FIELD, data);
			return values ? (values[0] == "1") : false;
		}

		public static function getIsTrapSpell(tabelName : String, data : ConfigData) : Boolean
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_IS_TRAP_SPELL_FIELD, data);
			return values ? (values[0] == "1") : false;
		}

		public static function getRepeatInterval(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_REPEAT_INTERVAL_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getRepeatTimes(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_REPEAT_TIMES_FIELD, data);
			var repeatTimes : int = values ? values[0] : 0;
			return repeatTimes > 0 ? repeatTimes : 1;
		}

		public static function getBlinkType(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_BLINK_TYPE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getBlinkSpeed(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_BLINK_SPEED_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getBlinkHeight(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_BLINK_HEIGHT_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getSoarFrameTime(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SOAR_FRAME_TIME_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getHitFrameTime(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HIT_FRAME_TIME_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getThrowDelayTime(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_THROW_DELAY_TIME_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getThrowHeight(data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_THROW_HEIGHT_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getThrowWeightRatio(data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_THROW_WEIGHT_RATIO_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getGhostEffect(tabelName : String, data : ConfigData) : Boolean
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_SOAR_FRAME_TIME_FIELD, data);
			return values ? (values[0] == "1") : false;
		}

		public static function getBeatBackDistance(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_BEAT_BACK_DISTANCE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getBeatBackSpeed(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_BEAT_BACK_SPEED_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getDeadLaunchHeight(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEAD_LAUNCH_HEIGHT_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getDeadLaunchDistance(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEAD_LAUNCH_DISTANCE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getDeadLaunchSpeed(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEAD_LAUNCH_SPEED_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getIsTrackTarget(tabelName : String, data : ConfigData) : Boolean
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_IS_TRACK_TARGET_FIELD, data);
			return values ? (values[0] == "1") : false;
		}

		public static function getDeadBeatDistance(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEAD_BEAT_DISTANCE_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getDeadBeatSpeed(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_DEAD_BEAT_SPEED_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getReleaseDelayTime(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELEASE_DELAY_TIME_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getHurtDelayTime(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_HURT_DELAY_TIME_FIELD, data);
			return values ? values[0] : 0;
		}

		public static function getRelateSpells(data : ConfigData) : String
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_RELATE_SPELLS_FIELD, data);
			return values ? values[0] : null;
		}

		public static function getCastTime(tabelName : String, data : ConfigData) : int
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_CAST_TIME_FIELD, data);
			return values ? values[0] : 0;
		}

		/**
		 * 是否匹配地形
		 */
		public static function getMatchTerrain(data : ConfigData) : Boolean
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.MATCH_TERRAIN_FIELD, data);
			return values ? (values[0] == "1") : false;
		}

		public static function getSpellStateRoleEffects(data : ConfigData, isRiding : Boolean) : Array
		{
			if (isRiding)
			{
				return DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_RIDING_ROLE_EFFECT_FIELD, data);
			}
			else
			{
				return DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_ROLE_EFFECT_FIELD, data);
			}
		}

		public static function getSpellStateBindNodes(data : ConfigData, isRiding : Boolean) : Array
		{
			if (isRiding)
			{
				return DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_RIDING_BIND_NODE_FIELD, data);
			}
			else
			{
				return DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_BIND_NODE_FIELD, data);
			}
		}

		public static function getSpellStateEffectOffsets(data : ConfigData) : Array
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_EFFECT_OFFSET_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_EFFECT_OFFSET_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_EFFECT_OFFSET_Z_FIELD, data);
			var len : int = valueXs ? valueXs.length : 0;
			var values : Array = len > 0 ? [] : null;
			for (var i : int = 0; i < len; i++)
			{
				values.push(new Vector3D(valueXs ? valueXs[i] : 0, valueYs ? valueYs[i] : 0, valueZs ? valueZs[i] : 0));
			}
			return values;
		}

		public static function getSpellStateEffectScales(data : ConfigData) : Array
		{
			var valueXs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_EFFECT_SCALE_X_FIELD, data);
			var valueYs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_EFFECT_SCALE_Y_FIELD, data);
			var valueZs : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.SPELL_STATE_EFFECT_SCALE_Z_FIELD, data);
			var len : int = valueXs ? valueXs.length : 0;
			var values : Array = len > 0 ? [] : null;
			for (var i : int = 0; i < len; i++)
			{
				values.push(new Vector3D(valueXs ? valueXs[i] : 0, valueYs ? valueYs[i] : 0, valueZs ? valueZs[i] : 0));
			}
			return values;
		}

		public static function getRelateSpellList(data : ConfigData) : Array
		{
			var mRelateSpells : String = getRelateSpells(data);
			if (mRelateSpells)
				return mRelateSpells.split(";");
			return null;
		}

		public static function getEffectRes(data : ConfigData) : Array
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.EFFECT_RES_FIELD, data);
			return values;
		}

		public static function getEffectBindNode(data : ConfigData) : Array
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.EFFECT_BIND_NODE_FIELD, data);
			return values;
		}

		public static function getEffectMethodTypeRes(data : ConfigData) : String
		{
			var values : Array = DataStructuresManager.getInstance().getTabelFieldValueFromRoot(TabelFieldData.EFFECT_METHOD_TYPE_RES_FIELD, data);
			return values ? values[0] : null;
		}
	}
}
