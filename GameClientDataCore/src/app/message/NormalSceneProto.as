package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NormalSceneProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CAN_ENTER_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NormalSceneProto.can_enter_level", "canEnterLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_enter_level$field:int;

		private var hasField$0:uint = 0;

		public function clearCanEnterLevel():void {
			hasField$0 &= 0xfffffffe;
			can_enter_level$field = new int();
		}

		public function get hasCanEnterLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set canEnterLevel(value:int):void {
			hasField$0 |= 0x1;
			can_enter_level$field = value;
		}

		public function get canEnterLevel():int {
			return can_enter_level$field;
		}

		/**
		 *  @private
		 */
		public static const RECOMMEND_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NormalSceneProto.recommend_level", "recommendLevel", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var recommend_level$field:int;

		public function clearRecommendLevel():void {
			hasField$0 &= 0xfffffffd;
			recommend_level$field = new int();
		}

		public function get hasRecommendLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set recommendLevel(value:int):void {
			hasField$0 |= 0x2;
			recommend_level$field = value;
		}

		public function get recommendLevel():int {
			return recommend_level$field;
		}

		/**
		 *  @private
		 */
		public static const IS_NORMAL_SCENE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.NormalSceneProto.is_normal_scene", "isNormalScene", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_normal_scene$field:Boolean;

		public function clearIsNormalScene():void {
			hasField$0 &= 0xfffffffb;
			is_normal_scene$field = new Boolean();
		}

		public function get hasIsNormalScene():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isNormalScene(value:Boolean):void {
			hasField$0 |= 0x4;
			is_normal_scene$field = value;
		}

		public function get isNormalScene():Boolean {
			return is_normal_scene$field;
		}

		/**
		 *  @private
		 */
		public static const SELF_COUNTRY_DEATH_RETURN_SCENE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NormalSceneProto.self_country_death_return_scene_id", "selfCountryDeathReturnSceneId", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var self_country_death_return_scene_id$field:int;

		public function clearSelfCountryDeathReturnSceneId():void {
			hasField$0 &= 0xfffffff7;
			self_country_death_return_scene_id$field = new int();
		}

		public function get hasSelfCountryDeathReturnSceneId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set selfCountryDeathReturnSceneId(value:int):void {
			hasField$0 |= 0x8;
			self_country_death_return_scene_id$field = value;
		}

		public function get selfCountryDeathReturnSceneId():int {
			return self_country_death_return_scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const OTHER_COUNTRY_DEATH_RETURN_SCENE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NormalSceneProto.other_country_death_return_scene_id", "otherCountryDeathReturnSceneId", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var other_country_death_return_scene_id$field:int;

		public function clearOtherCountryDeathReturnSceneId():void {
			hasField$0 &= 0xffffffef;
			other_country_death_return_scene_id$field = new int();
		}

		public function get hasOtherCountryDeathReturnSceneId():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set otherCountryDeathReturnSceneId(value:int):void {
			hasField$0 |= 0x10;
			other_country_death_return_scene_id$field = value;
		}

		public function get otherCountryDeathReturnSceneId():int {
			return other_country_death_return_scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const POET:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.NormalSceneProto.poet", "poet", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var poet$field:flash.utils.ByteArray;

		public function clearPoet():void {
			poet$field = null;
		}

		public function get hasPoet():Boolean {
			return poet$field != null;
		}

		public function set poet(value:flash.utils.ByteArray):void {
			poet$field = value;
		}

		public function get poet():flash.utils.ByteArray {
			return poet$field;
		}

		/**
		 *  @private
		 */
		public static const IS_HIDE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.NormalSceneProto.is_hide", "isHide", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_hide$field:Boolean;

		public function clearIsHide():void {
			hasField$0 &= 0xffffffdf;
			is_hide$field = new Boolean();
		}

		public function get hasIsHide():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isHide(value:Boolean):void {
			hasField$0 |= 0x20;
			is_hide$field = value;
		}

		public function get isHide():Boolean {
			return is_hide$field;
		}

		/**
		 *  @private
		 */
		public static const IS_CLUSTERED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.NormalSceneProto.is_clustered", "isClustered", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_clustered$field:Boolean;

		public function clearIsClustered():void {
			hasField$0 &= 0xffffffbf;
			is_clustered$field = new Boolean();
		}

		public function get hasIsClustered():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set isClustered(value:Boolean):void {
			hasField$0 |= 0x40;
			is_clustered$field = value;
		}

		public function get isClustered():Boolean {
			return is_clustered$field;
		}

		/**
		 *  @private
		 */
		public static const IS_COUNTRY_WAR_MAP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.NormalSceneProto.is_country_war_map", "isCountryWarMap", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_country_war_map$field:Boolean;

		public function clearIsCountryWarMap():void {
			hasField$0 &= 0xffffff7f;
			is_country_war_map$field = new Boolean();
		}

		public function get hasIsCountryWarMap():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set isCountryWarMap(value:Boolean):void {
			hasField$0 |= 0x80;
			is_country_war_map$field = value;
		}

		public function get isCountryWarMap():Boolean {
			return is_country_war_map$field;
		}

		/**
		 *  @private
		 */
		public static const IS_COUNTRY_MILITARY_SUBSIBY_MAP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.NormalSceneProto.is_country_military_subsiby_map", "isCountryMilitarySubsibyMap", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_country_military_subsiby_map$field:Boolean;

		public function clearIsCountryMilitarySubsibyMap():void {
			hasField$0 &= 0xfffffeff;
			is_country_military_subsiby_map$field = new Boolean();
		}

		public function get hasIsCountryMilitarySubsibyMap():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set isCountryMilitarySubsibyMap(value:Boolean):void {
			hasField$0 |= 0x100;
			is_country_military_subsiby_map$field = value;
		}

		public function get isCountryMilitarySubsibyMap():Boolean {
			return is_country_military_subsiby_map$field;
		}

		/**
		 *  @private
		 */
		public static const IS_LIMIT_ZHAN_CHE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.NormalSceneProto.is_limit_zhan_che", "isLimitZhanChe", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_limit_zhan_che$field:Boolean;

		public function clearIsLimitZhanChe():void {
			hasField$0 &= 0xfffffdff;
			is_limit_zhan_che$field = new Boolean();
		}

		public function get hasIsLimitZhanChe():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set isLimitZhanChe(value:Boolean):void {
			hasField$0 |= 0x200;
			is_limit_zhan_che$field = value;
		}

		public function get isLimitZhanChe():Boolean {
			return is_limit_zhan_che$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCanEnterLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, can_enter_level$field);
			}
			if (hasRecommendLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, recommend_level$field);
			}
			if (hasIsNormalScene) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_normal_scene$field);
			}
			if (hasSelfCountryDeathReturnSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, self_country_death_return_scene_id$field);
			}
			if (hasOtherCountryDeathReturnSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, other_country_death_return_scene_id$field);
			}
			if (hasPoet) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, poet$field);
			}
			if (hasIsHide) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_hide$field);
			}
			if (hasIsClustered) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_clustered$field);
			}
			if (hasIsCountryWarMap) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_country_war_map$field);
			}
			if (hasIsCountryMilitarySubsibyMap) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_country_military_subsiby_map$field);
			}
			if (hasIsLimitZhanChe) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_limit_zhan_che$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var can_enter_level$count:uint = 0;
			var recommend_level$count:uint = 0;
			var is_normal_scene$count:uint = 0;
			var self_country_death_return_scene_id$count:uint = 0;
			var other_country_death_return_scene_id$count:uint = 0;
			var poet$count:uint = 0;
			var is_hide$count:uint = 0;
			var is_clustered$count:uint = 0;
			var is_country_war_map$count:uint = 0;
			var is_country_military_subsiby_map$count:uint = 0;
			var is_limit_zhan_che$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 3:
					if (can_enter_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.canEnterLevel cannot be set twice.');
					}
					++can_enter_level$count;
					this.canEnterLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (recommend_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.recommendLevel cannot be set twice.');
					}
					++recommend_level$count;
					this.recommendLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (is_normal_scene$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.isNormalScene cannot be set twice.');
					}
					++is_normal_scene$count;
					this.isNormalScene = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					if (self_country_death_return_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.selfCountryDeathReturnSceneId cannot be set twice.');
					}
					++self_country_death_return_scene_id$count;
					this.selfCountryDeathReturnSceneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (other_country_death_return_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.otherCountryDeathReturnSceneId cannot be set twice.');
					}
					++other_country_death_return_scene_id$count;
					this.otherCountryDeathReturnSceneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (poet$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.poet cannot be set twice.');
					}
					++poet$count;
					this.poet = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 9:
					if (is_hide$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.isHide cannot be set twice.');
					}
					++is_hide$count;
					this.isHide = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 10:
					if (is_clustered$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.isClustered cannot be set twice.');
					}
					++is_clustered$count;
					this.isClustered = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 11:
					if (is_country_war_map$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.isCountryWarMap cannot be set twice.');
					}
					++is_country_war_map$count;
					this.isCountryWarMap = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 12:
					if (is_country_military_subsiby_map$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.isCountryMilitarySubsibyMap cannot be set twice.');
					}
					++is_country_military_subsiby_map$count;
					this.isCountryMilitarySubsibyMap = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 13:
					if (is_limit_zhan_che$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalSceneProto.isLimitZhanChe cannot be set twice.');
					}
					++is_limit_zhan_che$count;
					this.isLimitZhanChe = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
