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
	public dynamic final class HeroLevelProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.HeroLevelProto.level", "level", (22 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const EXP:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroLevelProto.exp", "exp", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp$field:Int64;

		public function clearExp():void {
			exp$field = null;
		}

		public function get hasExp():Boolean {
			return exp$field != null;
		}

		public function set exp(value:Int64):void {
			exp$field = value;
		}

		public function get exp():Int64 {
			return exp$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_EXP:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroLevelProto.upgrade_exp", "upgradeExp", (24 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upgrade_exp$field:Int64;

		public function clearUpgradeExp():void {
			upgrade_exp$field = null;
		}

		public function get hasUpgradeExp():Boolean {
			return upgrade_exp$field != null;
		}

		public function set upgradeExp(value:Int64):void {
			upgrade_exp$field = value;
		}

		public function get upgradeExp():Int64 {
			return upgrade_exp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, exp$field);
			}
			if (hasUpgradeExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, upgrade_exp$field);
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
			var exp$count:uint = 0;
			var upgrade_exp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 22:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroLevelProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 23:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroLevelProto.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 24:
					if (upgrade_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroLevelProto.upgradeExp cannot be set twice.');
					}
					++upgrade_exp$count;
					this.upgradeExp = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
