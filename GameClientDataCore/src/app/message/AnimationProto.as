package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AnimationProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AnimationProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_RES:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.AnimationProto.scene_res", "sceneRes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var scene_res$field:String;

		public function clearSceneRes():void {
			scene_res$field = null;
		}

		public function get hasSceneRes():Boolean {
			return scene_res$field != null;
		}

		public function set sceneRes(value:String):void {
			scene_res$field = value;
		}

		public function get sceneRes():String {
			return scene_res$field;
		}

		/**
		 *  @private
		 */
		public static const DELAY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AnimationProto.delay", "delay", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var delay$field:int;

		public function clearDelay():void {
			hasField$0 &= 0xfffffffd;
			delay$field = new int();
		}

		public function get hasDelay():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set delay(value:int):void {
			hasField$0 |= 0x2;
			delay$field = value;
		}

		public function get delay():int {
			return delay$field;
		}

		/**
		 *  @private
		 */
		public static const LOOP_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AnimationProto.loop_count", "loopCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var loop_count$field:int;

		public function clearLoopCount():void {
			hasField$0 &= 0xfffffffb;
			loop_count$field = new int();
		}

		public function get hasLoopCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set loopCount(value:int):void {
			hasField$0 |= 0x4;
			loop_count$field = value;
		}

		public function get loopCount():int {
			return loop_count$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ON_ROLE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.AnimationProto.is_on_role", "isOnRole", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_on_role$field:Boolean;

		public function clearIsOnRole():void {
			hasField$0 &= 0xfffffff7;
			is_on_role$field = new Boolean();
		}

		public function get hasIsOnRole():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isOnRole(value:Boolean):void {
			hasField$0 |= 0x8;
			is_on_role$field = value;
		}

		public function get isOnRole():Boolean {
			return is_on_role$field;
		}

		/**
		 *  @private
		 */
		public static const SOUND_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.AnimationProto.sound_name", "soundName", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var sound_name$field:String;

		public function clearSoundName():void {
			sound_name$field = null;
		}

		public function get hasSoundName():Boolean {
			return sound_name$field != null;
		}

		public function set soundName(value:String):void {
			sound_name$field = value;
		}

		public function get soundName():String {
			return sound_name$field;
		}

		/**
		 *  @private
		 */
		public static const NEED_ROTATION:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.AnimationProto.need_rotation", "needRotation", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var need_rotation$field:Boolean;

		public function clearNeedRotation():void {
			hasField$0 &= 0xffffffef;
			need_rotation$field = new Boolean();
		}

		public function get hasNeedRotation():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set needRotation(value:Boolean):void {
			hasField$0 |= 0x10;
			need_rotation$field = value;
		}

		public function get needRotation():Boolean {
			return need_rotation$field;
		}

		/**
		 *  @private
		 */
		public static const RANDOM_RANGE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AnimationProto.random_range", "randomRange", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var random_range$field:int;

		public function clearRandomRange():void {
			hasField$0 &= 0xffffffdf;
			random_range$field = new int();
		}

		public function get hasRandomRange():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set randomRange(value:int):void {
			hasField$0 |= 0x20;
			random_range$field = value;
		}

		public function get randomRange():int {
			return random_range$field;
		}

		/**
		 *  @private
		 */
		public static const ROLE_RES:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.AnimationProto.role_res", "roleRes", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var role_res$field:String;

		public function clearRoleRes():void {
			role_res$field = null;
		}

		public function get hasRoleRes():Boolean {
			return role_res$field != null;
		}

		public function set roleRes(value:String):void {
			role_res$field = value;
		}

		public function get roleRes():String {
			return role_res$field;
		}

		/**
		 *  @private
		 */
		public static const SPECIAL_EFFECT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AnimationProto.special_effect", "specialEffect", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var special_effect$field:int;

		public function clearSpecialEffect():void {
			hasField$0 &= 0xffffffbf;
			special_effect$field = new int();
		}

		public function get hasSpecialEffect():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set specialEffect(value:int):void {
			hasField$0 |= 0x40;
			special_effect$field = value;
		}

		public function get specialEffect():int {
			return special_effect$field;
		}

		/**
		 *  @private
		 */
		public static const OFFSET_X:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AnimationProto.offset_x", "offsetX", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var offset_x$field:int;

		public function clearOffsetX():void {
			hasField$0 &= 0xffffff7f;
			offset_x$field = new int();
		}

		public function get hasOffsetX():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set offsetX(value:int):void {
			hasField$0 |= 0x80;
			offset_x$field = value;
		}

		public function get offsetX():int {
			return offset_x$field;
		}

		/**
		 *  @private
		 */
		public static const OFFSET_Y:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AnimationProto.offset_y", "offsetY", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var offset_y$field:int;

		public function clearOffsetY():void {
			hasField$0 &= 0xfffffeff;
			offset_y$field = new int();
		}

		public function get hasOffsetY():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set offsetY(value:int):void {
			hasField$0 |= 0x100;
			offset_y$field = value;
		}

		public function get offsetY():int {
			return offset_y$field;
		}

		/**
		 *  @private
		 */
		public static const IS_MULTI_DIRECTION:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.AnimationProto.is_multi_direction", "isMultiDirection", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_multi_direction$field:Boolean;

		public function clearIsMultiDirection():void {
			hasField$0 &= 0xfffffdff;
			is_multi_direction$field = new Boolean();
		}

		public function get hasIsMultiDirection():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set isMultiDirection(value:Boolean):void {
			hasField$0 |= 0x200;
			is_multi_direction$field = value;
		}

		public function get isMultiDirection():Boolean {
			return is_multi_direction$field;
		}

		/**
		 *  @private
		 */
		public static const WEAPON_RES:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.AnimationProto.weapon_res", "weaponRes", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var weapon_res$field:String;

		public function clearWeaponRes():void {
			weapon_res$field = null;
		}

		public function get hasWeaponRes():Boolean {
			return weapon_res$field != null;
		}

		public function set weaponRes(value:String):void {
			weapon_res$field = value;
		}

		public function get weaponRes():String {
			return weapon_res$field;
		}

		/**
		 *  @private
		 */
		public static const BIND_BONE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.AnimationProto.bind_bone", "bindBone", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var bind_bone$field:String;

		public function clearBindBone():void {
			bind_bone$field = null;
		}

		public function get hasBindBone():Boolean {
			return bind_bone$field != null;
		}

		public function set bindBone(value:String):void {
			bind_bone$field = value;
		}

		public function get bindBone():String {
			return bind_bone$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasSceneRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, scene_res$field);
			}
			if (hasDelay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, delay$field);
			}
			if (hasLoopCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, loop_count$field);
			}
			if (hasIsOnRole) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_on_role$field);
			}
			if (hasSoundName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, sound_name$field);
			}
			if (hasNeedRotation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, need_rotation$field);
			}
			if (hasRandomRange) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, random_range$field);
			}
			if (hasRoleRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, role_res$field);
			}
			if (hasSpecialEffect) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, special_effect$field);
			}
			if (hasOffsetX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, offset_x$field);
			}
			if (hasOffsetY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, offset_y$field);
			}
			if (hasIsMultiDirection) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_multi_direction$field);
			}
			if (hasWeaponRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, weapon_res$field);
			}
			if (hasBindBone) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, bind_bone$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var scene_res$count:uint = 0;
			var delay$count:uint = 0;
			var loop_count$count:uint = 0;
			var is_on_role$count:uint = 0;
			var sound_name$count:uint = 0;
			var need_rotation$count:uint = 0;
			var random_range$count:uint = 0;
			var role_res$count:uint = 0;
			var special_effect$count:uint = 0;
			var offset_x$count:uint = 0;
			var offset_y$count:uint = 0;
			var is_multi_direction$count:uint = 0;
			var weapon_res$count:uint = 0;
			var bind_bone$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (scene_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.sceneRes cannot be set twice.');
					}
					++scene_res$count;
					this.sceneRes = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (delay$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.delay cannot be set twice.');
					}
					++delay$count;
					this.delay = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (loop_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.loopCount cannot be set twice.');
					}
					++loop_count$count;
					this.loopCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (is_on_role$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.isOnRole cannot be set twice.');
					}
					++is_on_role$count;
					this.isOnRole = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 7:
					if (sound_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.soundName cannot be set twice.');
					}
					++sound_name$count;
					this.soundName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 8:
					if (need_rotation$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.needRotation cannot be set twice.');
					}
					++need_rotation$count;
					this.needRotation = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 9:
					if (random_range$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.randomRange cannot be set twice.');
					}
					++random_range$count;
					this.randomRange = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (role_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.roleRes cannot be set twice.');
					}
					++role_res$count;
					this.roleRes = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 11:
					if (special_effect$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.specialEffect cannot be set twice.');
					}
					++special_effect$count;
					this.specialEffect = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (offset_x$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.offsetX cannot be set twice.');
					}
					++offset_x$count;
					this.offsetX = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 13:
					if (offset_y$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.offsetY cannot be set twice.');
					}
					++offset_y$count;
					this.offsetY = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 14:
					if (is_multi_direction$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.isMultiDirection cannot be set twice.');
					}
					++is_multi_direction$count;
					this.isMultiDirection = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 15:
					if (weapon_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.weaponRes cannot be set twice.');
					}
					++weapon_res$count;
					this.weaponRes = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 16:
					if (bind_bone$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimationProto.bindBone cannot be set twice.');
					}
					++bind_bone$count;
					this.bindBone = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
