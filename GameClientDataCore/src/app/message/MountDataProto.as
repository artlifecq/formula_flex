package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.Quality;
	import app.message.PrefixType;
	import app.message.MountType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MountDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MountDataProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.MountDataProto.mount_type", "mountType", (3 << 3) | com.netease.protobuf.WireType.VARINT, app.message.MountType);

		private var mount_type$field:int;

		public function clearMountType():void {
			hasField$0 &= 0xfffffffd;
			mount_type$field = new int();
		}

		public function get hasMountType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set mountType(value:int):void {
			hasField$0 |= 0x2;
			mount_type$field = value;
		}

		public function get mountType():int {
			return mount_type$field;
		}

		/**
		 *  @private
		 */
		public static const PREFIX_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.MountDataProto.prefix_type", "prefixType", (4 << 3) | com.netease.protobuf.WireType.VARINT, app.message.PrefixType);

		private var prefix_type$field:int;

		public function clearPrefixType():void {
			hasField$0 &= 0xfffffffb;
			prefix_type$field = new int();
		}

		public function get hasPrefixType():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set prefixType(value:int):void {
			hasField$0 |= 0x4;
			prefix_type$field = value;
		}

		public function get prefixType():int {
			return prefix_type$field;
		}

		/**
		 *  @private
		 */
		public static const QUALITY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.MountDataProto.quality", "quality", (5 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var quality$field:int;

		public function clearQuality():void {
			hasField$0 &= 0xfffffff7;
			quality$field = new int();
		}

		public function get hasQuality():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set quality(value:int):void {
			hasField$0 |= 0x8;
			quality$field = value;
		}

		public function get quality():int {
			return quality$field;
		}

		/**
		 *  @private
		 */
		public static const SPECIES_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountDataProto.species_id", "speciesId", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var species_id$field:int;

		public function clearSpeciesId():void {
			hasField$0 &= 0xffffffef;
			species_id$field = new int();
		}

		public function get hasSpeciesId():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set speciesId(value:int):void {
			hasField$0 |= 0x10;
			species_id$field = value;
		}

		public function get speciesId():int {
			return species_id$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_EXP_ADDITIONAL:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("app.message.MountDataProto.upgrade_exp_additional", "upgradeExpAdditional", (7 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var upgrade_exp_additional$field:Number;

		public function clearUpgradeExpAdditional():void {
			hasField$0 &= 0xffffffdf;
			upgrade_exp_additional$field = new Number();
		}

		public function get hasUpgradeExpAdditional():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set upgradeExpAdditional(value:Number):void {
			hasField$0 |= 0x20;
			upgrade_exp_additional$field = value;
		}

		public function get upgradeExpAdditional():Number {
			return upgrade_exp_additional$field;
		}

		/**
		 *  @private
		 */
		public static const RESOURCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountDataProto.resource", "resource", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var resource$field:int;

		public function clearResource():void {
			hasField$0 &= 0xffffffbf;
			resource$field = new int();
		}

		public function get hasResource():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set resource(value:int):void {
			hasField$0 |= 0x40;
			resource$field = value;
		}

		public function get resource():int {
			return resource$field;
		}

		/**
		 *  @private
		 */
		public static const RIDE_MOVE_SPEED:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountDataProto.ride_move_speed", "rideMoveSpeed", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ride_move_speed$field:int;

		public function clearRideMoveSpeed():void {
			hasField$0 &= 0xffffff7f;
			ride_move_speed$field = new int();
		}

		public function get hasRideMoveSpeed():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set rideMoveSpeed(value:int):void {
			hasField$0 |= 0x80;
			ride_move_speed$field = value;
		}

		public function get rideMoveSpeed():int {
			return ride_move_speed$field;
		}

		/**
		 *  @private
		 */
		public static const VITALITY_EXP:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.MountDataProto.vitality_exp", "vitalityExp", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var vitalityExp:Array = [];

		/**
		 *  @private
		 */
		public static const MOUNT_REFINE_ADD_VITALITY_EXP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountDataProto.mount_refine_add_vitality_exp", "mountRefineAddVitalityExp", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mount_refine_add_vitality_exp$field:int;

		public function clearMountRefineAddVitalityExp():void {
			hasField$0 &= 0xfffffeff;
			mount_refine_add_vitality_exp$field = new int();
		}

		public function get hasMountRefineAddVitalityExp():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set mountRefineAddVitalityExp(value:int):void {
			hasField$0 |= 0x100;
			mount_refine_add_vitality_exp$field = value;
		}

		public function get mountRefineAddVitalityExp():int {
			return mount_refine_add_vitality_exp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasMountType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, mount_type$field);
			}
			if (hasPrefixType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, prefix_type$field);
			}
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, quality$field);
			}
			if (hasSpeciesId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, species_id$field);
			}
			if (hasUpgradeExpAdditional) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, upgrade_exp_additional$field);
			}
			if (hasResource) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, resource$field);
			}
			if (hasRideMoveSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ride_move_speed$field);
			}
			for (var vitalityExp$index:uint = 0; vitalityExp$index < this.vitalityExp.length; ++vitalityExp$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.vitalityExp[vitalityExp$index]);
			}
			if (hasMountRefineAddVitalityExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mount_refine_add_vitality_exp$field);
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
			var name$count:uint = 0;
			var mount_type$count:uint = 0;
			var prefix_type$count:uint = 0;
			var quality$count:uint = 0;
			var species_id$count:uint = 0;
			var upgrade_exp_additional$count:uint = 0;
			var resource$count:uint = 0;
			var ride_move_speed$count:uint = 0;
			var mount_refine_add_vitality_exp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (mount_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.mountType cannot be set twice.');
					}
					++mount_type$count;
					this.mountType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 4:
					if (prefix_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.prefixType cannot be set twice.');
					}
					++prefix_type$count;
					this.prefixType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 5:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 6:
					if (species_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.speciesId cannot be set twice.');
					}
					++species_id$count;
					this.speciesId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (upgrade_exp_additional$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.upgradeExpAdditional cannot be set twice.');
					}
					++upgrade_exp_additional$count;
					this.upgradeExpAdditional = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 8:
					if (resource$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.resource cannot be set twice.');
					}
					++resource$count;
					this.resource = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (ride_move_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.rideMoveSpeed cannot be set twice.');
					}
					++ride_move_speed$count;
					this.rideMoveSpeed = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.vitalityExp);
						break;
					}
					this.vitalityExp.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 11:
					if (mount_refine_add_vitality_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountDataProto.mountRefineAddVitalityExp cannot be set twice.');
					}
					++mount_refine_add_vitality_exp$count;
					this.mountRefineAddVitalityExp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
