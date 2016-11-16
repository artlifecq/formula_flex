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
	public dynamic final class JinWeiRequiresProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.JinWeiRequiresProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const FIGHTING_AMOUNT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.JinWeiRequiresProto.fighting_amount", "fightingAmount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fighting_amount$field:Int64;

		public function clearFightingAmount():void {
			fighting_amount$field = null;
		}

		public function get hasFightingAmount():Boolean {
			return fighting_amount$field != null;
		}

		public function set fightingAmount(value:Int64):void {
			fighting_amount$field = value;
		}

		public function get fightingAmount():Int64 {
			return fighting_amount$field;
		}

		/**
		 *  @private
		 */
		public static const FIGHTING_RANK:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.JinWeiRequiresProto.fighting_rank", "fightingRank", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fighting_rank$field:int;

		public function clearFightingRank():void {
			hasField$0 &= 0xfffffffd;
			fighting_rank$field = new int();
		}

		public function get hasFightingRank():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set fightingRank(value:int):void {
			hasField$0 |= 0x2;
			fighting_rank$field = value;
		}

		public function get fightingRank():int {
			return fighting_rank$field;
		}

		/**
		 *  @private
		 */
		public static const IS_SELF_COUNTRY:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.JinWeiRequiresProto.is_self_country", "isSelfCountry", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_self_country$field:Boolean;

		public function clearIsSelfCountry():void {
			hasField$0 &= 0xfffffffb;
			is_self_country$field = new Boolean();
		}

		public function get hasIsSelfCountry():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isSelfCountry(value:Boolean):void {
			hasField$0 |= 0x4;
			is_self_country$field = value;
		}

		public function get isSelfCountry():Boolean {
			return is_self_country$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasFightingAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, fighting_amount$field);
			}
			if (hasFightingRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fighting_rank$field);
			}
			if (hasIsSelfCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_self_country$field);
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
			var fighting_amount$count:uint = 0;
			var fighting_rank$count:uint = 0;
			var is_self_country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinWeiRequiresProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (fighting_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinWeiRequiresProto.fightingAmount cannot be set twice.');
					}
					++fighting_amount$count;
					this.fightingAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (fighting_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinWeiRequiresProto.fightingRank cannot be set twice.');
					}
					++fighting_rank$count;
					this.fightingRank = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (is_self_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinWeiRequiresProto.isSelfCountry cannot be set twice.');
					}
					++is_self_country$count;
					this.isSelfCountry = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
