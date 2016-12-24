package com.editor.data
{
	import com.editor.cfg.ConfigData;
	import com.editor.manager.DataStructuresManager;

	import flash.utils.Dictionary;

	/**
	 *
	 * 数据表字段数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-17 上午11:32:15
	 *
	 */
	dynamic public class TabelFieldData extends ConfigData
	{
		/////////////////////////////////////字段类型////////////////////////////////////////
		public static const ID_FIELD : String = "ID_FIELD";
		public static const NAME_FIELD : String = "NAME_FIELD";
		public static const FILE_PATH_FIELD : String = "FILE_PATH_FIELD";
		public static const FILE_DIRE_FIELD : String = "FILE_DIRE_FIELD";
		public static const FEATURE_TYPE_FIELD : String = "FEATURE_TYPE_FIELD";
		public static const SUB_FEATURE_TYPE_FIELD : String = "SUB_FEATURE_TYPE_FIELD";
		public static const FUNC_TAG_FIELD : String = "FUNC_TAG_FIELD";
		public static const FIELD_NAME_FIELD : String = "FIELD_NAME_FIELD";
		public static const FIELD_EXPRESSION_FIELD : String = "FIELD_EXPRESSION_FIELD";
		public static const LINK_TABEL_FIELD : String = "LINK_TABEL_FIELD";
		public static const FIELD_LABEL_FIELD : String = "FIELD_LABEL_FIELD";
		public static const DEFAULT_VALUE_FIELD : String = "DEFAULT_VALUE_FIELD";
		public static const PARENT_TABLE_FIELD_FIELD : String = "PARENT_TABLE_FIELD_FIELD";
		public static const DATA_PROVIDED_FIELD_FIELD : String = "DATA_PROVIDED_FIELD_FIELD";
		public static const ORDER_FIELD : String = "ORDER_FIELD";

		public static const unListableFields : Array = [FILE_PATH_FIELD, FILE_DIRE_FIELD, FIELD_NAME_FIELD, FIELD_EXPRESSION_FIELD, //
			FEATURE_TYPE_FIELD, SUB_FEATURE_TYPE_FIELD, FUNC_TAG_FIELD, LINK_TABEL_FIELD, FIELD_LABEL_FIELD, DEFAULT_VALUE_FIELD, PARENT_TABLE_FIELD_FIELD, //
			DATA_PROVIDED_FIELD_FIELD, ORDER_FIELD];

		/////////////////////////////////////场景字段类型////////////////////////////////////////
		public static const SCENE_RES_FIELD : String = "SCENE_RES_FIELD";

		/////////////////////////////////////技能字段类型////////////////////////////////////////
		public static const SPELL_RELEASE_ROLE_EFFECT_FIELD : String = "SPELL_RELEASE_ROLE_EFFECT_FIELD";
		public static const SPELL_RELEASE_RIDING_ROLE_EFFECT_FIELD : String = "SPELL_RELEASE_RIDING_ROLE_EFFECT_FIELD";
		public static const SPELL_RELEASE_BIND_BONE_FIELD : String = "SPELL_RELEASE_BIND_BONE_FIELD";
		public static const SPELL_RELEASE_RIDING_BIND_BONE_FIELD : String = "SPELL_RELEASE_RIDING_BIND_BONE_FIELD";
		public static const SPELL_RELEASE_RIDING_SCENE_EFFECT_FIELD : String = "SPELL_RELEASE_RIDING_SCENE_EFFECT_FIELD";
		public static const SPELL_RELEASE_SCENE_EFFECT_FIELD : String = "SPELL_RELEASE_SCENE_EFFECT_FIELD";
		public static const SPELL_RELEASE_EFFECT_OFFSET_X_FIELD : String = "SPELL_RELEASE_EFFECT_OFFSET_X_FIELD";
		public static const SPELL_RELEASE_EFFECT_OFFSET_Y_FIELD : String = "SPELL_RELEASE_EFFECT_OFFSET_Y_FIELD";
		public static const SPELL_RELEASE_EFFECT_OFFSET_Z_FIELD : String = "SPELL_RELEASE_EFFECT_OFFSET_Z_FIELD";
		public static const SPELL_RELEASE_EFFECT_SCALE_X_FIELD : String = "SPELL_RELEASE_EFFECT_SCALE_X_FIELD";
		public static const SPELL_RELEASE_EFFECT_SCALE_Y_FIELD : String = "SPELL_RELEASE_EFFECT_SCALE_Y_FIELD";
		public static const SPELL_RELEASE_EFFECT_SCALE_Z_FIELD : String = "SPELL_RELEASE_EFFECT_SCALE_Z_FIELD";
		public static const SPELL_SELF_ROLE_EFFECT_FIELD : String = "SPELL_SELF_ROLE_EFFECT_FIELD";
		public static const SPELL_SELF_RIDING_ROLE_EFFECT_FIELD : String = "SPELL_SELF_RIDING_ROLE_EFFECT_FIELD";
		public static const SPELL_SELF_BIND_BONE_FIELD : String = "SPELL_SELF_BIND_BONE_FIELD";
		public static const SPELL_SELF_RIDING_BIND_BONE_FIELD : String = "SPELL_SELF_RIDING_BIND_BONE_FIELD";
		public static const SPELL_SELF_SCENE_EFFECT_FIELD : String = "SPELL_SELF_SCENE_EFFECT_FIELD";
		public static const SPELL_SELF_RIDING_SCENE_EFFECT_FIELD : String = "SPELL_SELF_RIDING_SCENE_EFFECT_FIELD";
		public static const SPELL_SELF_EFFECT_OFFSET_X_FIELD : String = "SPELL_SELF_EFFECT_OFFSET_X_FIELD";
		public static const SPELL_SELF_EFFECT_OFFSET_Y_FIELD : String = "SPELL_SELF_EFFECT_OFFSET_Y_FIELD";
		public static const SPELL_SELF_EFFECT_OFFSET_Z_FIELD : String = "SPELL_SELF_EFFECT_OFFSET_Z_FIELD";
		public static const SPELL_SELF_EFFECT_SCALE_X_FIELD : String = "SPELL_SELF_EFFECT_SCALE_X_FIELD";
		public static const SPELL_SELF_EFFECT_SCALE_Y_FIELD : String = "SPELL_SELF_EFFECT_SCALE_Y_FIELD";
		public static const SPELL_SELF_EFFECT_SCALE_Z_FIELD : String = "SPELL_SELF_EFFECT_SCALE_Z_FIELD";
		public static const SPELL_FLY_SCENE_EFFECT_FIELD : String = "SPELL_FLY_SCENE_EFFECT_FIELD";
		public static const SPELL_FLY_RIDING_SCENE_EFFECT_FIELD : String = "SPELL_FLY_RIDING_SCENE_EFFECT_FIELD";
		public static const SPELL_THROW_BIND_BONE_FIELD : String = "SPELL_THROW_BIND_BONE_FIELD";
		public static const SPELL_THROW_RIDING_BIND_BONE_FIELD : String = "SPELL_THROW_RIDING_BIND_BONE_FIELD";
		public static const SPELL_HURT_ROLE_EFFECT_FIELD : String = "SPELL_HURT_ROLE_EFFECT_FIELD";
		public static const SPELL_HURT_RIDING_ROLE_EFFECT_FIELD : String = "SPELL_HURT_RIDING_ROLE_EFFECT_FIELD";
		public static const SPELL_HURT_BIND_BONE_FIELD : String = "SPELL_HURT_BIND_BONE_FIELD";
		public static const SPELL_HURT_RIDING_BIND_BONE_FIELD : String = "SPELL_HURT_RIDING_BIND_BONE_FIELD";
		public static const SPELL_HURT_SCENE_EFFECT_FIELD : String = "SPELL_HURT_SCENE_EFFECT_FIELD";
		public static const SPELL_HURT_RIDING_SCENE_EFFECT_FIELD : String = "SPELL_HURT_RIDING_SCENE_EFFECT_FIELD";
		public static const SPELL_HURT_EFFECT_OFFSET_X_FIELD : String = "SPELL_HURT_EFFECT_OFFSET_X_FIELD";
		public static const SPELL_HURT_EFFECT_OFFSET_Y_FIELD : String = "SPELL_HURT_EFFECT_OFFSET_Y_FIELD";
		public static const SPELL_HURT_EFFECT_OFFSET_Z_FIELD : String = "SPELL_HURT_EFFECT_OFFSET_Z_FIELD";
		public static const SPELL_HURT_EFFECT_SCALE_X_FIELD : String = "SPELL_HURT_EFFECT_SCALE_X_FIELD";
		public static const SPELL_HURT_EFFECT_SCALE_Y_FIELD : String = "SPELL_HURT_EFFECT_SCALE_Y_FIELD";
		public static const SPELL_HURT_EFFECT_SCALE_Z_FIELD : String = "SPELL_HURT_EFFECT_SCALE_Z_FIELD";

		//溅射伤害特效 
		public static const SPELL_SPUTTERING_HURT_ROLE_EFFECT_FIELD : String = "SPELL_SPUTTERING_HURT_ROLE_EFFECT_FIELD";
		public static const SPELL_SPUTTERING_HURT_RIDING_ROLE_EFFECT_FIELD : String = "SPELL_SPUTTERING_HURT_RIDING_ROLE_EFFECT_FIELD";
		public static const SPELL_SPUTTERING_HURT_BIND_BONE_FIELD : String = "SPELL_SPUTTERING_HURT_BIND_BONE_FIELD";
		public static const SPELL_SPUTTERING_RIDING_HURT_BIND_BONE_FIELD : String = "SPELL_SPUTTERING_RIDING_HURT_BIND_BONE_FIELD";
		public static const SPELL_SPUTTERING_HURT_SCENE_EFFECT_FIELD : String = "SPELL_SPUTTERING_HURT_SCENE_EFFECT_FIELD";
		public static const SPELL_SPUTTERING_HURT_RIDING_SCENE_EFFECT_FIELD : String = "SPELL_SPUTTERING_HURT_RIDING_SCENE_EFFECT_FIELD";
		public static const SPELL_SPUTTERING_HURT_EFFECT_OFFSET_X_FIELD : String = "SPELL_SPUTTERING_HURT_EFFECT_OFFSET_X_FIELD";
		public static const SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Y_FIELD : String = "SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Y_FIELD";
		public static const SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Z_FIELD : String = "SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Z_FIELD";
		public static const SPELL_SPUTTERING_HURT_EFFECT_SCALE_X_FIELD : String = "SPELL_SPUTTERING_HURT_EFFECT_SCALE_X_FIELD";
		public static const SPELL_SPUTTERING_HURT_EFFECT_SCALE_Y_FIELD : String = "SPELL_SPUTTERING_HURT_EFFECT_SCALE_Y_FIELD";
		public static const SPELL_SPUTTERING_HURT_EFFECT_SCALE_Z_FIELD : String = "SPELL_SPUTTERING_HURT_EFFECT_SCALE_Z_FIELD";

		public static const SPELL_CAROM_START_FRAME_TIME_FIELD : String = "SPELL_CAROM_START_FRAME_TIME_FIELD";
		public static const AVATAR_MOTION_FIELD : String = "AVATAR_MOTION_FIELD";
		public static const BASE_ACTION_SPEED_FIELD : String = "BASE_ACTION_SPEED_FIELD";
		public static const SPELL_RELEASE_RANGE_FIELD : String = "SPELL_RELEASE_RANGE_FIELD";
		public static const SPELL_KEEP_SPACING_FIELD : String = "SPELL_KEEP_SPACING_FIELD";
		public static const SPELL_HURT_RANGE_FIELD : String = "SPELL_HURT_RANGE_FIELD";
		public static const SPELL_HURT_SHAPE_FIELD : String = "SPELL_HURT_SHAPE_FIELD";
		public static const SPELL_HURT_ANGLE_FIELD : String = "SPELL_HURT_ANGLE_FIELD";
		public static const SPELL_BREAKABLE_FRAME_TIME_FIELD : String = "SPELL_BREAKABLE_FRAME_TIME_FIELD";
		public static const SPELL_FLY_SPEED_FIELD : String = "SPELL_FLY_SPEED_FIELD";
		public static const SPELL_FLY_TIME_FIELD : String = "SPELL_FLY_TIME_FIELD";
		public static const SPELL_IS_FLY_CROSS_FIELD : String = "SPELL_IS_FLY_CROSS_FIELD";
		public static const SPELL_IS_ADAPTIVE_TARGET_HEIGHT_FIELD : String = "SPELL_IS_ADAPTIVE_TARGET_HEIGHT_FIELD";
		public static const SPELL_DEST_SCENE_EFFECT_FIELD : String = "SPELL_DEST_SCENE_EFFECT_FIELD";
		public static const SPELL_DEST_RIDING_SCENE_EFFECT_FIELD : String = "SPELL_DEST_RIDING_SCENE_EFFECT_FIELD";
		public static const SPELL_DEST_EFFECT_OFFSET_X_FIELD : String = "SPELL_DEST_EFFECT_OFFSET_X_FIELD";
		public static const SPELL_DEST_EFFECT_OFFSET_Y_FIELD : String = "SPELL_DEST_EFFECT_OFFSET_Y_FIELD";
		public static const SPELL_DEST_EFFECT_OFFSET_Z_FIELD : String = "SPELL_DEST_EFFECT_OFFSET_Z_FIELD";
		public static const SPELL_DEST_EFFECT_SCALE_X_FIELD : String = "SPELL_DEST_EFFECT_SCALE_X_FIELD";
		public static const SPELL_DEST_EFFECT_SCALE_Y_FIELD : String = "SPELL_DEST_EFFECT_SCALE_Y_FIELD";
		public static const SPELL_DEST_EFFECT_SCALE_Z_FIELD : String = "SPELL_DEST_EFFECT_SCALE_Z_FIELD";
		public static const SPELL_IS_TRAP_SPELL_FIELD : String = "SPELL_IS_TRAP_SPELL_FIELD";
		public static const SPELL_REPEAT_INTERVAL_FIELD : String = "SPELL_REPEAT_INTERVAL_FIELD";
		public static const SPELL_REPEAT_TIMES_FIELD : String = "SPELL_REPEAT_TIMES_FIELD";

		public static const SPELL_BLINK_TYPE_FIELD : String = "SPELL_BLINK_TYPE_FIELD";
		public static const SPELL_BLINK_SPEED_FIELD : String = "SPELL_BLINK_SPEED_FIELD";
		public static const SPELL_BLINK_HEIGHT_FIELD : String = "SPELL_BLINK_HEIGHT_FIELD";

		public static const SPELL_SOAR_FRAME_TIME_FIELD : String = "SPELL_SOAR_FRAME_TIME_FIELD";
		public static const SPELL_HIT_FRAME_TIME_FIELD : String = "SPELL_HIT_FRAME_TIME_FIELD";
		public static const SPELL_THROW_DELAY_TIME_FIELD : String = "SPELL_THROW_DELAY_TIME_FIELD";
		public static const SPELL_THROW_HEIGHT_FIELD : String = "SPELL_THROW_HEIGHT_FIELD";
		public static const SPELL_THROW_WEIGHT_RATIO_FIELD : String = "SPELL_THROW_WEIGHT_RATIO_FIELD";
		public static const SPELL_GHOST_EFFECT_FIELD : String = "SPELL_GHOST_EFFECT_FIELD";
		public static const SPELL_BEAT_BACK_DISTANCE_FIELD : String = "SPELL_BEAT_BACK_DISTANCE_FIELD";
		public static const SPELL_BEAT_BACK_SPEED_FIELD : String = "SPELL_BEAT_BACK_SPEED_FIELD";
		public static const SPELL_DEAD_LAUNCH_HEIGHT_FIELD : String = "SPELL_DEAD_LAUNCH_HEIGHT_FIELD";
		public static const SPELL_DEAD_BEAT_DISTANCE_FIELD : String = "SPELL_DEAD_BEAT_DISTANCE_FIELD";
		public static const SPELL_DEAD_BEAT_SPEED_FIELD : String = "SPELL_DEAD_BEAT_SPEED_FIELD";
		public static const SPELL_DEAD_LAUNCH_DISTANCE_FIELD : String = "SPELL_DEAD_LAUNCH_DISTANCE_FIELD";
		public static const SPELL_DEAD_LAUNCH_SPEED_FIELD : String = "SPELL_DEAD_LAUNCH_SPEED_FIELD";
		public static const SPELL_IS_TRACK_TARGET_FIELD : String = "SPELL_IS_TRACK_TARGET_FIELD";

		public static const SPELL_RELEASE_DELAY_TIME_FIELD : String = "SPELL_RELEASE_DELAY_TIME_FIELD";
		public static const SPELL_HURT_DELAY_TIME_FIELD : String = "SPELL_HURT_DELAY_TIME_FIELD";
		public static const SPELL_RELATE_SPELLS_FIELD : String = "SPELL_RELATE_SPELLS_FIELD";
		public static const SPELL_CAST_TIME_FIELD : String = "SPELL_CAST_TIME_FIELD";
		public static const MATCH_TERRAIN_FIELD : String = "MATCH_TERRAIN_FIELD";
		public static const SPELL_STATE_ROLE_EFFECT_FIELD : String = "SPELL_STATE_ROLE_EFFECT_FIELD";
		public static const SPELL_STATE_RIDING_ROLE_EFFECT_FIELD : String = "SPELL_STATE_RIDING_ROLE_EFFECT_FIELD";
		public static const SPELL_STATE_BIND_NODE_FIELD : String = "SPELL_STATE_BIND_NODE_FIELD";
		public static const SPELL_STATE_RIDING_BIND_NODE_FIELD : String = "SPELL_STATE_RIDING_BIND_NODE_FIELD";
		public static const SPELL_STATE_EFFECT_OFFSET_X_FIELD : String = "SPELL_STATE_EFFECT_OFFSET_X_FIELD";
		public static const SPELL_STATE_EFFECT_OFFSET_Y_FIELD : String = "SPELL_STATE_EFFECT_OFFSET_Y_FIELD";
		public static const SPELL_STATE_EFFECT_OFFSET_Z_FIELD : String = "SPELL_STATE_EFFECT_OFFSET_Z_FIELD";
		public static const SPELL_STATE_EFFECT_SCALE_X_FIELD : String = "SPELL_STATE_EFFECT_SCALE_X_FIELD";
		public static const SPELL_STATE_EFFECT_SCALE_Y_FIELD : String = "SPELL_STATE_EFFECT_SCALE_Y_FIELD";
		public static const SPELL_STATE_EFFECT_SCALE_Z_FIELD : String = "SPELL_STATE_EFFECT_SCALE_Z_FIELD";

		/////////////////////////////////////怪物字段类型////////////////////////////////////////
		public static const AVATAR_BODY_RES_FIELD : String = "AVATAR_BODY_RES_FIELD";
		public static const AVATAR_HAIR_RES_FIELD : String = "AVATAR_HAIR_RES_FIELD";
		public static const AVATAR_WEAPON_RES_FIELD : String = "AVATAR_WEAPON_RES_FIELD";
		public static const AVATAR_MOUNT_RES_FIELD : String = "AVATAR_MOUNT_RES_FIELD";
		public static const AVATAR_MOUNT_ANIMAT_RES_FIELD : String = "AVATAR_MOUNT_ANIMAT_RES_FIELD";
		public static const ENTITY_COUNT_FIELD : String = "ENTITY_COUNT_FIELD";
		public static const ENTITY_SIZE_SCALE_FIELD : String = "ENTITY_SIZE_SCALE_FIELD";
		public static const ENTITY_SIZE_RADIUS_FIELD : String = "ENTITY_SIZE_RADIUS_FIELD";
		public static const AREA_BLOCK_FIELD : String = "AREA_BLOCK_FIELD";
		public static const DISTRIBUTE_BLOCK_FIELD : String = "DISTRIBUTE_BLOCK_FIELD";
		public static const TRAIL_POINT_X_FIELD : String = "TRAIL_POINT_X_FIELD";
		public static const TRAIL_POINT_Y_FIELD : String = "TRAIL_POINT_Y_FIELD";
		public static const TRAIL_POINT_Z_FIELD : String = "TRAIL_POINT_Z_FIELD";
		public static const TRAIL_POINT_SPEED_FIELD : String = "TRAIL_POINT_SPEED_FIELD";
		public static const TILT_ANGLE_FIELD : String = "TILT_ANGLE_FIELD";

		/////////////////////////////////////NPC字段类型////////////////////////////////////////
		public static const ENTITY_POS_X_FIELD : String = "ENTITY_POS_X_FIELD";
		public static const ENTITY_POS_Y_FIELD : String = "ENTITY_POS_Y_FIELD";
		public static const ENTITY_OFFSET_UP_FIELD : String = "ENTITY_OFFSET_UP_FIELD";
		public static const ENTITY_DIRECTION_FIELD : String = "ENTITY_DIRECTION_FIELD";
		public static const EFFECT_OFFSET_X_FIELD : String = "EFFECT_OFFSET_X_FIELD";
		public static const EFFECT_OFFSET_Y_FIELD : String = "EFFECT_OFFSET_Y_FIELD";
		public static const EFFECT_OFFSET_Z_FIELD : String = "EFFECT_OFFSET_Z_FIELD";
		public static const SCENE_FIELD : String = "SCENE_FIELD";

		/////////////////////////////////////传送字段类型////////////////////////////////////////
		public static const EFFECT_RES_FIELD : String = "EFFECT_RES_FIELD";
		public static const EFFECT_METHOD_TYPE_RES_FIELD : String = "EFFECT_METHOD_TYPE_RES_FIELD";
		public static const EFFECT_BIND_NODE_FIELD : String = "EFFECT_BIND_NODE_FIELD";

		/////////////////////////////////////基础字段名////////////////////////////////////////
		public static var ID_FIELD_NAME : String = "id";
		public static var NAME_FIELD_NAME : String = "name";
		public static var FILE_PATH_FIELD_NAME : String = "filePath";
		public static var FILE_DIRE_FIELD_NAME : String = "fileDire";
		public static var FEATURE_TYPE_FIELD_NAME : String = "featureType";
		public static var SUB_FEATURE_TYPE_FIELD_NAME : String = "subFeatureType";
		public static var FUNC_TAG_FIELD_NAME : String = "funcTag";
		public static var FIELD_NAME_FIELD_NAME : String = "fieldName";
		public static var FIELD_EXPRESSION_FIELD_NAME : String = "fieldExpression";
		public static var LINK_TABEL_FIELD_NAME : String = "linkTabel";
		public static var FIELD_LABEL_FIELD_NAME : String = "fieldLabel";
		public static var PARENT_TABLE_FIELD_FIELD_NAME : String = "parentTabelField";
		public static var DATA_PROVIDED_FIELD_FIELD_NAME : String = "dataProvidedField";
		public static var ORDER_FIELD_NAME : String = "order";

		//////////////////////////////////////////////////////////////////////////////////////

		public static var fieldTypeByKind : Dictionary = new Dictionary();

		private static function initFieldKinds() : void
		{
			//////////////////////////////////////技能字段//////////////////////////////////
			var spellFields : Array = fieldTypeByKind["spell"] = [];
			spellFields.push(SPELL_BREAKABLE_FRAME_TIME_FIELD);
			spellFields.push(SPELL_RELEASE_RANGE_FIELD);
			spellFields.push(SPELL_KEEP_SPACING_FIELD);
			spellFields.push(SPELL_HURT_RANGE_FIELD);
			spellFields.push(SPELL_HURT_SHAPE_FIELD);
			spellFields.push(SPELL_HURT_ANGLE_FIELD);
			spellFields.push(SPELL_RELEASE_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_RELEASE_RIDING_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_RELEASE_BIND_BONE_FIELD);
			spellFields.push(SPELL_RELEASE_RIDING_BIND_BONE_FIELD);
			spellFields.push(SPELL_RELEASE_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_RELEASE_RIDING_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_RELEASE_EFFECT_OFFSET_X_FIELD);
			spellFields.push(SPELL_RELEASE_EFFECT_OFFSET_Y_FIELD);
			spellFields.push(SPELL_RELEASE_EFFECT_OFFSET_Z_FIELD);
			spellFields.push(SPELL_RELEASE_EFFECT_SCALE_X_FIELD);
			spellFields.push(SPELL_RELEASE_EFFECT_SCALE_Y_FIELD);
			spellFields.push(SPELL_RELEASE_EFFECT_SCALE_Z_FIELD);
			spellFields.push(SPELL_SELF_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_SELF_RIDING_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_SELF_BIND_BONE_FIELD);
			spellFields.push(SPELL_SELF_RIDING_BIND_BONE_FIELD);
			spellFields.push(SPELL_SELF_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_SELF_RIDING_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_SELF_EFFECT_OFFSET_X_FIELD);
			spellFields.push(SPELL_SELF_EFFECT_OFFSET_Y_FIELD);
			spellFields.push(SPELL_SELF_EFFECT_OFFSET_Z_FIELD);
			spellFields.push(SPELL_SELF_EFFECT_SCALE_X_FIELD);
			spellFields.push(SPELL_SELF_EFFECT_SCALE_Y_FIELD);
			spellFields.push(SPELL_SELF_EFFECT_SCALE_Z_FIELD);
			spellFields.push(SPELL_FLY_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_FLY_RIDING_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_THROW_BIND_BONE_FIELD);
			spellFields.push(SPELL_THROW_RIDING_BIND_BONE_FIELD);
			spellFields.push(SPELL_HURT_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_HURT_RIDING_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_HURT_BIND_BONE_FIELD);
			spellFields.push(SPELL_HURT_RIDING_BIND_BONE_FIELD);
			spellFields.push(SPELL_HURT_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_HURT_RIDING_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_HURT_EFFECT_OFFSET_X_FIELD);
			spellFields.push(SPELL_HURT_EFFECT_OFFSET_Y_FIELD);
			spellFields.push(SPELL_HURT_EFFECT_OFFSET_Z_FIELD);
			spellFields.push(SPELL_HURT_EFFECT_SCALE_X_FIELD);
			spellFields.push(SPELL_HURT_EFFECT_SCALE_Y_FIELD);
			spellFields.push(SPELL_HURT_EFFECT_SCALE_Z_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_RIDING_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_BIND_BONE_FIELD);
			spellFields.push(SPELL_SPUTTERING_RIDING_HURT_BIND_BONE_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_RIDING_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_EFFECT_OFFSET_X_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Y_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Z_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_EFFECT_SCALE_X_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_EFFECT_SCALE_Y_FIELD);
			spellFields.push(SPELL_SPUTTERING_HURT_EFFECT_SCALE_Z_FIELD);
			spellFields.push(SPELL_DEST_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_DEST_RIDING_SCENE_EFFECT_FIELD);
			spellFields.push(SPELL_DEST_EFFECT_OFFSET_X_FIELD);
			spellFields.push(SPELL_DEST_EFFECT_OFFSET_Y_FIELD);
			spellFields.push(SPELL_DEST_EFFECT_OFFSET_Z_FIELD);
			spellFields.push(SPELL_DEST_EFFECT_SCALE_X_FIELD);
			spellFields.push(SPELL_DEST_EFFECT_SCALE_Y_FIELD);
			spellFields.push(SPELL_DEST_EFFECT_SCALE_Z_FIELD);
			spellFields.push(SPELL_CAROM_START_FRAME_TIME_FIELD);
			spellFields.push(SPELL_REPEAT_INTERVAL_FIELD);
			spellFields.push(SPELL_IS_TRAP_SPELL_FIELD);
			spellFields.push(SPELL_REPEAT_TIMES_FIELD);
			spellFields.push(SPELL_FLY_SPEED_FIELD);
			spellFields.push(SPELL_FLY_TIME_FIELD);
			spellFields.push(SPELL_IS_FLY_CROSS_FIELD);
			spellFields.push(SPELL_IS_ADAPTIVE_TARGET_HEIGHT_FIELD);
			spellFields.push(SPELL_BLINK_TYPE_FIELD);
			spellFields.push(SPELL_BLINK_SPEED_FIELD);
			spellFields.push(SPELL_BLINK_HEIGHT_FIELD);
			spellFields.push(SPELL_DEAD_LAUNCH_HEIGHT_FIELD);
			spellFields.push(SPELL_DEAD_BEAT_DISTANCE_FIELD);
			spellFields.push(SPELL_DEAD_BEAT_SPEED_FIELD);
			spellFields.push(SPELL_DEAD_LAUNCH_DISTANCE_FIELD);
			spellFields.push(SPELL_DEAD_LAUNCH_SPEED_FIELD);
			spellFields.push(SPELL_IS_TRACK_TARGET_FIELD);
			spellFields.push(SPELL_SOAR_FRAME_TIME_FIELD);
			spellFields.push(SPELL_HIT_FRAME_TIME_FIELD);
			spellFields.push(SPELL_THROW_DELAY_TIME_FIELD);
			spellFields.push(SPELL_THROW_HEIGHT_FIELD);
			spellFields.push(SPELL_THROW_WEIGHT_RATIO_FIELD);
			spellFields.push(SPELL_GHOST_EFFECT_FIELD);
			spellFields.push(SPELL_BEAT_BACK_DISTANCE_FIELD);
			spellFields.push(SPELL_BEAT_BACK_SPEED_FIELD);
			spellFields.push(SPELL_RELEASE_DELAY_TIME_FIELD);
			spellFields.push(SPELL_HURT_DELAY_TIME_FIELD);
			spellFields.push(SPELL_RELATE_SPELLS_FIELD);
			spellFields.push(SPELL_CAST_TIME_FIELD);
			spellFields.push(SPELL_STATE_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_STATE_RIDING_ROLE_EFFECT_FIELD);
			spellFields.push(SPELL_STATE_BIND_NODE_FIELD);
			spellFields.push(SPELL_STATE_RIDING_BIND_NODE_FIELD);
			spellFields.push(SPELL_STATE_EFFECT_OFFSET_X_FIELD);
			spellFields.push(SPELL_STATE_EFFECT_OFFSET_Y_FIELD);
			spellFields.push(SPELL_STATE_EFFECT_OFFSET_Z_FIELD);
			spellFields.push(SPELL_STATE_EFFECT_SCALE_X_FIELD);
			spellFields.push(SPELL_STATE_EFFECT_SCALE_Y_FIELD);
			spellFields.push(SPELL_STATE_EFFECT_SCALE_Z_FIELD);

			//////////////////////////////////////布置字段//////////////////////////////////
			var decorateFields : Array = fieldTypeByKind["decorate"] = [];
			decorateFields.push(ENTITY_POS_X_FIELD);
			decorateFields.push(ENTITY_POS_Y_FIELD);
			decorateFields.push(ENTITY_OFFSET_UP_FIELD);
			decorateFields.push(EFFECT_OFFSET_X_FIELD);
			decorateFields.push(EFFECT_OFFSET_Y_FIELD);
			decorateFields.push(EFFECT_OFFSET_Z_FIELD);
			decorateFields.push(ENTITY_DIRECTION_FIELD);
			decorateFields.push(SCENE_FIELD);
			decorateFields.push(EFFECT_RES_FIELD);
			decorateFields.push(EFFECT_BIND_NODE_FIELD);
			decorateFields.push(EFFECT_METHOD_TYPE_RES_FIELD);
			decorateFields.push(AREA_BLOCK_FIELD);
			decorateFields.push(DISTRIBUTE_BLOCK_FIELD);
			decorateFields.push(TRAIL_POINT_X_FIELD);
			decorateFields.push(TRAIL_POINT_Y_FIELD);
			decorateFields.push(TRAIL_POINT_Z_FIELD);
			decorateFields.push(TRAIL_POINT_SPEED_FIELD);
			decorateFields.push(TILT_ANGLE_FIELD);
			decorateFields.push(ENTITY_SIZE_RADIUS_FIELD);
			decorateFields.push(ENTITY_SIZE_SCALE_FIELD);
			decorateFields.push(ENTITY_COUNT_FIELD);
			decorateFields.push(AVATAR_MOUNT_RES_FIELD);
			decorateFields.push(AVATAR_MOUNT_ANIMAT_RES_FIELD);
			decorateFields.push(AVATAR_WEAPON_RES_FIELD);
			decorateFields.push(AVATAR_HAIR_RES_FIELD);
			decorateFields.push(AVATAR_BODY_RES_FIELD);
			decorateFields.push(MATCH_TERRAIN_FIELD);
			decorateFields.push(AVATAR_MOTION_FIELD);
			decorateFields.push(BASE_ACTION_SPEED_FIELD);
		}
		initFieldKinds();

		public static var fieldLabelByType : Dictionary = new Dictionary();

		private static function initFieldLabels() : void
		{
			//////////////////////////////////////基础字段//////////////////////////////////
			fieldLabelByType[ID_FIELD] = "ID";
			fieldLabelByType[NAME_FIELD] = "名称";
			fieldLabelByType[FILE_PATH_FIELD] = "文件路径";
			fieldLabelByType[FILE_DIRE_FIELD] = "文件目录";
			fieldLabelByType[FEATURE_TYPE_FIELD] = "特性类型";
			fieldLabelByType[SUB_FEATURE_TYPE_FIELD] = "次特性类型";
			fieldLabelByType[FUNC_TAG_FIELD] = "功能标签";
			fieldLabelByType[FIELD_NAME_FIELD] = "字段名";
			fieldLabelByType[FIELD_EXPRESSION_FIELD] = "字段表达式";
			fieldLabelByType[LINK_TABEL_FIELD] = "链接表";
			fieldLabelByType[FIELD_LABEL_FIELD] = "字段标签";
			fieldLabelByType[DEFAULT_VALUE_FIELD] = "默认值";
			fieldLabelByType[PARENT_TABLE_FIELD_FIELD] = "父表字段";
			fieldLabelByType[DATA_PROVIDED_FIELD_FIELD] = "数据提供字段";
			fieldLabelByType[ORDER_FIELD] = "排序";

			//////////////////////////////////////场景字段//////////////////////////////////
			fieldLabelByType[SCENE_RES_FIELD] = "场景资源";

			//////////////////////////////////////技能字段//////////////////////////////////
			fieldLabelByType[SPELL_BREAKABLE_FRAME_TIME_FIELD] = "可打断帧时间";
			fieldLabelByType[SPELL_RELEASE_RANGE_FIELD] = "技能释放范围";
			fieldLabelByType[SPELL_KEEP_SPACING_FIELD] = "技能保持间距";
			fieldLabelByType[SPELL_HURT_RANGE_FIELD] = "技能伤害范围";
			fieldLabelByType[SPELL_HURT_SHAPE_FIELD] = "技能伤害图形";
			fieldLabelByType[SPELL_HURT_ANGLE_FIELD] = "技能伤害角度";
			fieldLabelByType[SPELL_RELEASE_ROLE_EFFECT_FIELD] = "起手角色特效";
			fieldLabelByType[SPELL_RELEASE_RIDING_ROLE_EFFECT_FIELD] = "骑乘起手角色特效";
			fieldLabelByType[SPELL_RELEASE_BIND_BONE_FIELD] = "起手绑定骨骼";
			fieldLabelByType[SPELL_RELEASE_RIDING_BIND_BONE_FIELD] = "骑乘起手绑定骨骼";
			fieldLabelByType[SPELL_RELEASE_SCENE_EFFECT_FIELD] = "起手场景特效";
			fieldLabelByType[SPELL_RELEASE_RIDING_SCENE_EFFECT_FIELD] = "骑乘起手场景特效";
			fieldLabelByType[SPELL_RELEASE_EFFECT_OFFSET_X_FIELD] = "起手特效X偏移";
			fieldLabelByType[SPELL_RELEASE_EFFECT_OFFSET_Y_FIELD] = "起手特效Y偏移";
			fieldLabelByType[SPELL_RELEASE_EFFECT_OFFSET_Z_FIELD] = "起手特效Z偏移";
			fieldLabelByType[SPELL_RELEASE_EFFECT_SCALE_X_FIELD] = "起手特效X缩放";
			fieldLabelByType[SPELL_RELEASE_EFFECT_SCALE_Y_FIELD] = "起手特效Y缩放";
			fieldLabelByType[SPELL_RELEASE_EFFECT_SCALE_Z_FIELD] = "起手特效Z缩放";
			fieldLabelByType[SPELL_SELF_ROLE_EFFECT_FIELD] = "自身角色特效";
			fieldLabelByType[SPELL_SELF_RIDING_ROLE_EFFECT_FIELD] = "骑乘自身角色特效";
			fieldLabelByType[SPELL_SELF_BIND_BONE_FIELD] = "自身绑定骨骼";
			fieldLabelByType[SPELL_SELF_RIDING_BIND_BONE_FIELD] = "骑乘自身绑定骨骼";
			fieldLabelByType[SPELL_SELF_SCENE_EFFECT_FIELD] = "自身场景特效";
			fieldLabelByType[SPELL_SELF_RIDING_SCENE_EFFECT_FIELD] = "骑乘自身场景特效";
			fieldLabelByType[SPELL_SELF_EFFECT_OFFSET_X_FIELD] = "自身特效X偏移";
			fieldLabelByType[SPELL_SELF_EFFECT_OFFSET_Y_FIELD] = "自身特效Y偏移";
			fieldLabelByType[SPELL_SELF_EFFECT_OFFSET_Z_FIELD] = "自身特效Z偏移";
			fieldLabelByType[SPELL_SELF_EFFECT_SCALE_X_FIELD] = "自身特效X缩放";
			fieldLabelByType[SPELL_SELF_EFFECT_SCALE_Y_FIELD] = "自身特效Y缩放";
			fieldLabelByType[SPELL_SELF_EFFECT_SCALE_Z_FIELD] = "自身特效Z缩放";
			fieldLabelByType[SPELL_FLY_SCENE_EFFECT_FIELD] = "飞行场景特效";
			fieldLabelByType[SPELL_FLY_RIDING_SCENE_EFFECT_FIELD] = "骑乘飞行场景特效";
			fieldLabelByType[SPELL_THROW_BIND_BONE_FIELD] = "投掷绑定骨骼";
			fieldLabelByType[SPELL_THROW_RIDING_BIND_BONE_FIELD] = "骑乘投掷绑定骨骼";
			fieldLabelByType[SPELL_HURT_ROLE_EFFECT_FIELD] = "受击角色特效";
			fieldLabelByType[SPELL_HURT_RIDING_ROLE_EFFECT_FIELD] = "骑乘受击角色特效";
			fieldLabelByType[SPELL_HURT_BIND_BONE_FIELD] = "受击绑定骨骼";
			fieldLabelByType[SPELL_HURT_RIDING_BIND_BONE_FIELD] = "骑乘受击绑定骨骼";
			fieldLabelByType[SPELL_HURT_SCENE_EFFECT_FIELD] = "受击场景特效";
			fieldLabelByType[SPELL_HURT_RIDING_SCENE_EFFECT_FIELD] = "骑乘受击场景特效";
			fieldLabelByType[SPELL_HURT_EFFECT_OFFSET_X_FIELD] = "受击特效X偏移";
			fieldLabelByType[SPELL_HURT_EFFECT_OFFSET_Y_FIELD] = "受击特效Y偏移";
			fieldLabelByType[SPELL_HURT_EFFECT_OFFSET_Z_FIELD] = "受击特效Z偏移";
			fieldLabelByType[SPELL_HURT_EFFECT_SCALE_X_FIELD] = "受击特效X缩放";
			fieldLabelByType[SPELL_HURT_EFFECT_SCALE_Y_FIELD] = "受击特效Y缩放";
			fieldLabelByType[SPELL_HURT_EFFECT_SCALE_Z_FIELD] = "受击特效Z缩放";
			fieldLabelByType[SPELL_SPUTTERING_HURT_ROLE_EFFECT_FIELD] = "受击溅射角色特效";
			fieldLabelByType[SPELL_SPUTTERING_HURT_RIDING_ROLE_EFFECT_FIELD] = "骑乘受击溅射角色特效";
			fieldLabelByType[SPELL_SPUTTERING_HURT_BIND_BONE_FIELD] = "受击溅射绑定骨骼";
			fieldLabelByType[SPELL_SPUTTERING_RIDING_HURT_BIND_BONE_FIELD] = "骑乘受击溅射绑定骨骼";
			fieldLabelByType[SPELL_SPUTTERING_HURT_SCENE_EFFECT_FIELD] = "受击溅射场景特效";
			fieldLabelByType[SPELL_SPUTTERING_HURT_RIDING_SCENE_EFFECT_FIELD] = "骑乘受击溅射场景特效";
			fieldLabelByType[SPELL_SPUTTERING_HURT_EFFECT_OFFSET_X_FIELD] = "受击溅射特效X偏移";
			fieldLabelByType[SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Y_FIELD] = "受击溅射特效Y偏移";
			fieldLabelByType[SPELL_SPUTTERING_HURT_EFFECT_OFFSET_Z_FIELD] = "受击溅射特效Z偏移";
			fieldLabelByType[SPELL_SPUTTERING_HURT_EFFECT_SCALE_X_FIELD] = "受击溅射特效X缩放";
			fieldLabelByType[SPELL_SPUTTERING_HURT_EFFECT_SCALE_Y_FIELD] = "受击溅射特效Y缩放";
			fieldLabelByType[SPELL_SPUTTERING_HURT_EFFECT_SCALE_Z_FIELD] = "受击溅射特效Z缩放";
			fieldLabelByType[SPELL_DEST_SCENE_EFFECT_FIELD] = "目标场景特效";
			fieldLabelByType[SPELL_DEST_RIDING_SCENE_EFFECT_FIELD] = "骑乘目标场景特效";
			fieldLabelByType[SPELL_DEST_EFFECT_OFFSET_X_FIELD] = "目标特效X偏移";
			fieldLabelByType[SPELL_DEST_EFFECT_OFFSET_Y_FIELD] = "目标特效Y偏移";
			fieldLabelByType[SPELL_DEST_EFFECT_OFFSET_Z_FIELD] = "目标特效Z偏移";
			fieldLabelByType[SPELL_DEST_EFFECT_SCALE_X_FIELD] = "目标特效X缩放";
			fieldLabelByType[SPELL_DEST_EFFECT_SCALE_Y_FIELD] = "目标特效Y缩放";
			fieldLabelByType[SPELL_DEST_EFFECT_SCALE_Z_FIELD] = "目标特效Z缩放";
			fieldLabelByType[SPELL_CAROM_START_FRAME_TIME_FIELD] = "连招起手帧时间";
			fieldLabelByType[SPELL_IS_TRAP_SPELL_FIELD] = "是否陷阱技能";
			fieldLabelByType[SPELL_REPEAT_INTERVAL_FIELD] = "技能生效时间间隔";
			fieldLabelByType[SPELL_REPEAT_TIMES_FIELD] = "技能生效次数";
			fieldLabelByType[SPELL_FLY_SPEED_FIELD] = "飞行速度";
			fieldLabelByType[SPELL_FLY_TIME_FIELD] = "飞行时间";
			fieldLabelByType[SPELL_IS_FLY_CROSS_FIELD] = "是否飞行穿越";
			fieldLabelByType[SPELL_IS_ADAPTIVE_TARGET_HEIGHT_FIELD] = "是否匹配目标高度";
			fieldLabelByType[SPELL_BLINK_TYPE_FIELD] = "冲锋类型";
			fieldLabelByType[SPELL_BLINK_SPEED_FIELD] = "冲锋速度";
			fieldLabelByType[SPELL_BLINK_HEIGHT_FIELD] = "冲锋高度";
			fieldLabelByType[SPELL_DEAD_LAUNCH_HEIGHT_FIELD] = "死亡击飞高度";
			fieldLabelByType[SPELL_DEAD_LAUNCH_DISTANCE_FIELD] = "死亡击飞距离";
			fieldLabelByType[SPELL_DEAD_LAUNCH_SPEED_FIELD] = "死亡击飞速度";
			fieldLabelByType[SPELL_IS_TRACK_TARGET_FIELD] = "是否跟踪目标";
			fieldLabelByType[SPELL_DEAD_BEAT_DISTANCE_FIELD] = "死亡击退距离";
			fieldLabelByType[SPELL_DEAD_BEAT_SPEED_FIELD] = "死亡击退速度";
			fieldLabelByType[SPELL_SOAR_FRAME_TIME_FIELD] = "腾飞帧时间";
			fieldLabelByType[SPELL_HIT_FRAME_TIME_FIELD] = "判定帧时间";
			fieldLabelByType[SPELL_THROW_DELAY_TIME_FIELD] = "投掷延迟时间";
			fieldLabelByType[SPELL_THROW_HEIGHT_FIELD] = "投掷高度";
			fieldLabelByType[SPELL_THROW_WEIGHT_RATIO_FIELD] = "投掷分量比";
			fieldLabelByType[SPELL_GHOST_EFFECT_FIELD] = "残影效果";
			fieldLabelByType[SPELL_BEAT_BACK_DISTANCE_FIELD] = "击退距离";
			fieldLabelByType[SPELL_BEAT_BACK_SPEED_FIELD] = "击退速度";
			fieldLabelByType[SPELL_RELEASE_DELAY_TIME_FIELD] = "释放延迟时间";
			fieldLabelByType[SPELL_HURT_DELAY_TIME_FIELD] = "受击延迟时间";
			fieldLabelByType[SPELL_RELATE_SPELLS_FIELD] = "技能连招技列表";
			fieldLabelByType[SPELL_CAST_TIME_FIELD] = "技能投放时间";
			fieldLabelByType[MATCH_TERRAIN_FIELD] = "是否匹配地形";
			fieldLabelByType[SPELL_STATE_ROLE_EFFECT_FIELD] = "技能状态角色特效";
			fieldLabelByType[SPELL_STATE_RIDING_ROLE_EFFECT_FIELD] = "骑乘技能状态角色特效";
			fieldLabelByType[SPELL_STATE_BIND_NODE_FIELD] = "技能状态绑定节点";
			fieldLabelByType[SPELL_STATE_RIDING_BIND_NODE_FIELD] = "骑乘技能状态绑定节点";
			fieldLabelByType[SPELL_STATE_EFFECT_OFFSET_X_FIELD] = "技能状态特效X偏移";
			fieldLabelByType[SPELL_STATE_EFFECT_OFFSET_Y_FIELD] = "技能状态特效Y偏移";
			fieldLabelByType[SPELL_STATE_EFFECT_OFFSET_Z_FIELD] = "技能状态特效Z偏移";
			fieldLabelByType[SPELL_STATE_EFFECT_SCALE_X_FIELD] = "技能状态特效X缩放";
			fieldLabelByType[SPELL_STATE_EFFECT_SCALE_Y_FIELD] = "技能状态特效Y缩放";
			fieldLabelByType[SPELL_STATE_EFFECT_SCALE_Z_FIELD] = "技能状态特效Z缩放";

			//////////////////////////////////////怪物字段//////////////////////////////////
			fieldLabelByType[AVATAR_BODY_RES_FIELD] = "换装身体资源";
			fieldLabelByType[AVATAR_HAIR_RES_FIELD] = "换装头发资源";
			fieldLabelByType[AVATAR_WEAPON_RES_FIELD] = "换装武器资源";
			fieldLabelByType[AVATAR_MOUNT_RES_FIELD] = "换装坐骑资源";
			fieldLabelByType[AVATAR_MOUNT_ANIMAT_RES_FIELD] = "换装坐骑动画资源";
			fieldLabelByType[ENTITY_COUNT_FIELD] = "实体数量";
			fieldLabelByType[ENTITY_SIZE_SCALE_FIELD] = "实体尺寸缩放";
			fieldLabelByType[ENTITY_SIZE_RADIUS_FIELD] = "实体半径";
			fieldLabelByType[AREA_BLOCK_FIELD] = "区域块";
			fieldLabelByType[DISTRIBUTE_BLOCK_FIELD] = "分布";
			fieldLabelByType[TRAIL_POINT_X_FIELD] = "轨迹点X";
			fieldLabelByType[TRAIL_POINT_Y_FIELD] = "轨迹点Y";
			fieldLabelByType[TRAIL_POINT_Z_FIELD] = "轨迹点Z";
			fieldLabelByType[TRAIL_POINT_SPEED_FIELD] = "轨迹点速度";
			fieldLabelByType[TILT_ANGLE_FIELD] = "俯仰角";
			fieldLabelByType[AVATAR_MOTION_FIELD] = "换装动作";
			fieldLabelByType[BASE_ACTION_SPEED_FIELD] = "基准动作速度";

			//////////////////////////////////////NPC字段//////////////////////////////////
			fieldLabelByType[ENTITY_POS_X_FIELD] = "实体X坐标";
			fieldLabelByType[ENTITY_POS_Y_FIELD] = "实体Y坐标";
			fieldLabelByType[ENTITY_OFFSET_UP_FIELD] = "实体上方偏移";
			fieldLabelByType[EFFECT_OFFSET_X_FIELD] = "特效X偏移";
			fieldLabelByType[EFFECT_OFFSET_Y_FIELD] = "特效Y偏移";
			fieldLabelByType[EFFECT_OFFSET_Z_FIELD] = "特效Z偏移";
			fieldLabelByType[ENTITY_DIRECTION_FIELD] = "实体方向";
			fieldLabelByType[SCENE_FIELD] = "场景";

			//////////////////////////////////////传送字段//////////////////////////////////
			fieldLabelByType[EFFECT_RES_FIELD] = "特效资源";
			fieldLabelByType[EFFECT_BIND_NODE_FIELD] = "特效绑定节点";
			fieldLabelByType[EFFECT_METHOD_TYPE_RES_FIELD] = "效果方法特效资源";
		}
		initFieldLabels();

		private static var fieldNameByType : Dictionary = new Dictionary();

		private static function initFieldNames() : void
		{
			fieldNameByType[ID_FIELD] = ID_FIELD_NAME;
			fieldNameByType[NAME_FIELD] = NAME_FIELD_NAME;
			fieldNameByType[FILE_PATH_FIELD] = FILE_PATH_FIELD_NAME;
			fieldNameByType[FILE_DIRE_FIELD] = FILE_DIRE_FIELD_NAME;
			fieldNameByType[FEATURE_TYPE_FIELD] = FEATURE_TYPE_FIELD_NAME;
			fieldNameByType[SUB_FEATURE_TYPE_FIELD] = SUB_FEATURE_TYPE_FIELD_NAME;
			fieldNameByType[FUNC_TAG_FIELD] = FUNC_TAG_FIELD_NAME;
			fieldNameByType[FIELD_NAME_FIELD] = FIELD_NAME_FIELD_NAME;
			fieldNameByType[FIELD_EXPRESSION_FIELD] = FIELD_EXPRESSION_FIELD_NAME;
			fieldNameByType[LINK_TABEL_FIELD] = LINK_TABEL_FIELD_NAME;
			fieldNameByType[FIELD_LABEL_FIELD] = FIELD_LABEL_FIELD_NAME;
			fieldNameByType[DEFAULT_VALUE_FIELD] = DEFAULT_VALUE_FIELD;
			fieldNameByType[PARENT_TABLE_FIELD_FIELD] = PARENT_TABLE_FIELD_FIELD_NAME;
			fieldNameByType[DATA_PROVIDED_FIELD_FIELD] = DATA_PROVIDED_FIELD_FIELD_NAME;
			fieldNameByType[ORDER_FIELD] = ORDER_FIELD_NAME;
		}
		initFieldNames();

		public static function setTabelFieldTips(tabel : TabelData) : void
		{
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			var fieldTips : Dictionary = configDesc.fieldTips;
			fieldTips[FILE_PATH_FIELD_NAME] = "【文件路径】指定的配置文件或目录类型配置的模板文件";
			fieldTips[FILE_DIRE_FIELD_NAME] = "【文件目录】目录类型配置，选择后【文件路径】将作为模板文件";
			fieldTips[FEATURE_TYPE_FIELD_NAME] = "【特性类型】用于确定数据表主要用于某种功能";
			fieldTips[SUB_FEATURE_TYPE_FIELD_NAME] = "【次特性类型】用于确定数据表主要用于某种功能，仅当数据表作为次表时生效";
		}

		public static function getFieldName(type : String) : String
		{
			var name : String = fieldNameByType[type];
			return name || type;
		}

		public static function getFieldLabel(type : String) : String
		{
			var label : String = fieldLabelByType[type];
			return label || type;
		}

		public static function getFieldTypeByName(name : String) : String
		{
			for (var type : String in fieldNameByType)
			{
				var tmpName : String = fieldNameByType[type];
				if (tmpName == name)
					return type;
			}
			return name;
		}

		public static function getFieldLabelByName(name : String, tabelField : TabelFieldData = null) : String
		{
			var type : String = getFieldTypeByName(name);
			var label : String = fieldLabelByType[type];
			if (!label && tabelField)
				label = tabelField.mFieldLabel;
			return label || ConfigData.getOriginalFieldName(name);
		}

		public static function isUnListableFields(fieldType : String) : Boolean
		{
			if (unListableFields.indexOf(fieldType) != -1)
				return true;
			return false;
		}

		public static function setInternalField(field : TabelFieldData) : void
		{
			if (field.name == SCENE_RES_FIELD)
			{
				field.mLinkTabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapDataConfigName).id;
			}
			else if (field.name == AVATAR_BODY_RES_FIELD //
				|| field.name == AVATAR_HAIR_RES_FIELD //
				|| field.name == AVATAR_WEAPON_RES_FIELD //
				|| field.name == AVATAR_MOUNT_RES_FIELD //
				|| field.name == AVATAR_MOUNT_ANIMAT_RES_FIELD)
			{
				field.mLinkTabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName).id;
			}
			else if (field.name == SPELL_RELEASE_ROLE_EFFECT_FIELD //
				|| field.name == SPELL_RELEASE_RIDING_ROLE_EFFECT_FIELD //
				|| field.name == SPELL_RELEASE_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_RELEASE_RIDING_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_SELF_ROLE_EFFECT_FIELD //
				|| field.name == SPELL_SELF_RIDING_ROLE_EFFECT_FIELD //
				|| field.name == SPELL_SELF_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_SELF_RIDING_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_FLY_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_FLY_RIDING_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_HURT_ROLE_EFFECT_FIELD //
				|| field.name == SPELL_HURT_RIDING_ROLE_EFFECT_FIELD //
				|| field.name == SPELL_HURT_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_HURT_RIDING_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_SPUTTERING_HURT_ROLE_EFFECT_FIELD //
				|| field.name == SPELL_SPUTTERING_HURT_RIDING_ROLE_EFFECT_FIELD //
				|| field.name == SPELL_SPUTTERING_HURT_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_SPUTTERING_HURT_RIDING_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_DEST_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_DEST_RIDING_SCENE_EFFECT_FIELD //
				|| field.name == SPELL_STATE_ROLE_EFFECT_FIELD //
				|| field.name == SPELL_STATE_RIDING_ROLE_EFFECT_FIELD //
				|| field.name == EFFECT_RES_FIELD //
				|| field.name == EFFECT_METHOD_TYPE_RES_FIELD //
				)
			{
				field.mLinkTabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.EffectResConfigName).id;
			}
		}

		private var _isKey : Boolean = false;
		public var linkEnable : Boolean = true;
		public var isInternal : Boolean = false;

		public function TabelFieldData(name : String, fieldName : String, fieldExpression : String, linkTabel : int, fieldLabel : String, parentTabelField : String, dataProvidedField : String, defaultValue : String)
		{
			super();
			this.name = name;
			mFieldName = fieldName;
			mFieldExpression = fieldExpression;
			mLinkTabel = linkTabel;
			mFieldLabel = fieldLabel;
			mParentTabelField = parentTabelField;
			mDataProvidedField = dataProvidedField;
			mDefaultValue = defaultValue;
		}

		public function get isKey() : Boolean
		{
			return _isKey;
		}

		public function get isKeyFlag() : String
		{
			return _isKey ? "●" : "";
		}

		public function set isKey(value : Boolean) : void
		{
			_isKey = value;
		}

		public function get mFieldLabel() : String
		{
			return this[FIELD_LABEL_FIELD_NAME];
		}

		public function set mFieldLabel(value : String) : void
		{
			this[FIELD_LABEL_FIELD_NAME] = value;
		}

		public function get mDefaultValue() : String
		{
			return this[DEFAULT_VALUE_FIELD];
		}

		public function set mDefaultValue(value : String) : void
		{
			this[DEFAULT_VALUE_FIELD] = value;
		}

		public function get mFieldName() : String
		{
			return this[FIELD_NAME_FIELD_NAME];
		}

		public function set mFieldName(value : String) : void
		{
			this[FIELD_NAME_FIELD_NAME] = value;
		}

		public function get mFieldExpression() : String
		{
			return this[FIELD_EXPRESSION_FIELD_NAME];
		}

		public function set mFieldExpression(value : String) : void
		{
			this[FIELD_EXPRESSION_FIELD_NAME] = value;
		}

		public function get mLinkTabel() : int
		{
			return this[LINK_TABEL_FIELD_NAME];
		}

		public function set mLinkTabel(value : int) : void
		{
			this[LINK_TABEL_FIELD_NAME] = value;
		}

		public function get mLinkTabelLabel() : String
		{
			return mLinkTabel > 0 ? mLinkTabel + "" : "";
		}

		public function get mParentTabelField() : String
		{
			return this[PARENT_TABLE_FIELD_FIELD_NAME];
		}

		public function set mParentTabelField(value : String) : void
		{
			this[PARENT_TABLE_FIELD_FIELD_NAME] = value;
		}

		public function get mDataProvidedField() : String
		{
			return this[DATA_PROVIDED_FIELD_FIELD_NAME];
		}

		public function set mDataProvidedField(value : String) : void
		{
			this[DATA_PROVIDED_FIELD_FIELD_NAME] = value;
		}
	}
}
