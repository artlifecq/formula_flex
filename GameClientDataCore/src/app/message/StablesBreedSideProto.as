package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipedMountProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class StablesBreedSideProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HERO_ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.StablesBreedSideProto.hero_id", "heroId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_id$field:Int64;

		public function clearHeroId():void {
			hero_id$field = null;
		}

		public function get hasHeroId():Boolean {
			return hero_id$field != null;
		}

		public function set heroId(value:Int64):void {
			hero_id$field = value;
		}

		public function get heroId():Int64 {
			return hero_id$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPED_MOUNT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.StablesBreedSideProto.equiped_mount", "equipedMount", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipedMountProto; });

		private var equiped_mount$field:app.message.EquipedMountProto;

		public function clearEquipedMount():void {
			equiped_mount$field = null;
		}

		public function get hasEquipedMount():Boolean {
			return equiped_mount$field != null;
		}

		public function set equipedMount(value:app.message.EquipedMountProto):void {
			equiped_mount$field = value;
		}

		public function get equipedMount():app.message.EquipedMountProto {
			return equiped_mount$field;
		}

		/**
		 *  @private
		 */
		public static const IS_LOCKED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.StablesBreedSideProto.is_locked", "isLocked", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_locked$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsLocked():void {
			hasField$0 &= 0xfffffffe;
			is_locked$field = new Boolean();
		}

		public function get hasIsLocked():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isLocked(value:Boolean):void {
			hasField$0 |= 0x1;
			is_locked$field = value;
		}

		public function get isLocked():Boolean {
			return is_locked$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHeroId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, hero_id$field);
			}
			if (hasEquipedMount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, equiped_mount$field);
			}
			if (hasIsLocked) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_locked$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var hero_id$count:uint = 0;
			var equiped_mount$count:uint = 0;
			var is_locked$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (hero_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: StablesBreedSideProto.heroId cannot be set twice.');
					}
					++hero_id$count;
					this.heroId = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (equiped_mount$count != 0) {
						throw new flash.errors.IOError('Bad data format: StablesBreedSideProto.equipedMount cannot be set twice.');
					}
					++equiped_mount$count;
					this.equipedMount = new app.message.EquipedMountProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.equipedMount);
					break;
				case 3:
					if (is_locked$count != 0) {
						throw new flash.errors.IOError('Bad data format: StablesBreedSideProto.isLocked cannot be set twice.');
					}
					++is_locked$count;
					this.isLocked = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
