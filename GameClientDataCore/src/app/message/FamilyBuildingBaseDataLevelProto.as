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
	public dynamic final class FamilyBuildingBaseDataLevelProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyBuildingBaseDataLevelProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_MONEY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyBuildingBaseDataLevelProto.upgrade_money", "upgradeMoney", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upgrade_money$field:Int64;

		public function clearUpgradeMoney():void {
			upgrade_money$field = null;
		}

		public function get hasUpgradeMoney():Boolean {
			return upgrade_money$field != null;
		}

		public function set upgradeMoney(value:Int64):void {
			upgrade_money$field = value;
		}

		public function get upgradeMoney():Int64 {
			return upgrade_money$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_BUILD_TOKEN:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyBuildingBaseDataLevelProto.upgrade_build_token", "upgradeBuildToken", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upgrade_build_token$field:Int64;

		public function clearUpgradeBuildToken():void {
			upgrade_build_token$field = null;
		}

		public function get hasUpgradeBuildToken():Boolean {
			return upgrade_build_token$field != null;
		}

		public function set upgradeBuildToken(value:Int64):void {
			upgrade_build_token$field = value;
		}

		public function get upgradeBuildToken():Int64 {
			return upgrade_build_token$field;
		}

		/**
		 *  @private
		 */
		public static const BUILDING_DESC:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.FamilyBuildingBaseDataLevelProto.building_desc", "buildingDesc", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var building_desc$field:String;

		public function clearBuildingDesc():void {
			building_desc$field = null;
		}

		public function get hasBuildingDesc():Boolean {
			return building_desc$field != null;
		}

		public function set buildingDesc(value:String):void {
			building_desc$field = value;
		}

		public function get buildingDesc():String {
			return building_desc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasUpgradeMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, upgrade_money$field);
			}
			if (hasUpgradeBuildToken) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, upgrade_build_token$field);
			}
			if (hasBuildingDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, building_desc$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level$count:uint = 0;
			var upgrade_money$count:uint = 0;
			var upgrade_build_token$count:uint = 0;
			var building_desc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyBuildingBaseDataLevelProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (upgrade_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyBuildingBaseDataLevelProto.upgradeMoney cannot be set twice.');
					}
					++upgrade_money$count;
					this.upgradeMoney = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (upgrade_build_token$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyBuildingBaseDataLevelProto.upgradeBuildToken cannot be set twice.');
					}
					++upgrade_build_token$count;
					this.upgradeBuildToken = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (building_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyBuildingBaseDataLevelProto.buildingDesc cannot be set twice.');
					}
					++building_desc$count;
					this.buildingDesc = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
