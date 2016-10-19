package app.message.GuildNewsProto {
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
	public dynamic final class DemoteLevelProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL_AFTER_DEMOTE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildNewsProto.DemoteLevelProto.level_after_demote", "levelAfterDemote", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_after_demote$field:int;

		private var hasField$0:uint = 0;

		public function clearLevelAfterDemote():void {
			hasField$0 &= 0xfffffffe;
			level_after_demote$field = new int();
		}

		public function get hasLevelAfterDemote():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set levelAfterDemote(value:int):void {
			hasField$0 |= 0x1;
			level_after_demote$field = value;
		}

		public function get levelAfterDemote():int {
			return level_after_demote$field;
		}

		/**
		 *  @private
		 */
		public static const DEMOTE_RETURN_MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.GuildNewsProto.DemoteLevelProto.demote_return_money", "demoteReturnMoney", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var demote_return_money$field:Int64;

		public function clearDemoteReturnMoney():void {
			demote_return_money$field = null;
		}

		public function get hasDemoteReturnMoney():Boolean {
			return demote_return_money$field != null;
		}

		public function set demoteReturnMoney(value:Int64):void {
			demote_return_money$field = value;
		}

		public function get demoteReturnMoney():Int64 {
			return demote_return_money$field;
		}

		/**
		 *  @private
		 */
		public static const DEMOTE_RETURN_FAN_RONG_DU:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.GuildNewsProto.DemoteLevelProto.demote_return_fan_rong_du", "demoteReturnFanRongDu", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var demote_return_fan_rong_du$field:Int64;

		public function clearDemoteReturnFanRongDu():void {
			demote_return_fan_rong_du$field = null;
		}

		public function get hasDemoteReturnFanRongDu():Boolean {
			return demote_return_fan_rong_du$field != null;
		}

		public function set demoteReturnFanRongDu(value:Int64):void {
			demote_return_fan_rong_du$field = value;
		}

		public function get demoteReturnFanRongDu():Int64 {
			return demote_return_fan_rong_du$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevelAfterDemote) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level_after_demote$field);
			}
			if (hasDemoteReturnMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, demote_return_money$field);
			}
			if (hasDemoteReturnFanRongDu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, demote_return_fan_rong_du$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level_after_demote$count:uint = 0;
			var demote_return_money$count:uint = 0;
			var demote_return_fan_rong_du$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level_after_demote$count != 0) {
						throw new flash.errors.IOError('Bad data format: DemoteLevelProto.levelAfterDemote cannot be set twice.');
					}
					++level_after_demote$count;
					this.levelAfterDemote = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (demote_return_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: DemoteLevelProto.demoteReturnMoney cannot be set twice.');
					}
					++demote_return_money$count;
					this.demoteReturnMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (demote_return_fan_rong_du$count != 0) {
						throw new flash.errors.IOError('Bad data format: DemoteLevelProto.demoteReturnFanRongDu cannot be set twice.');
					}
					++demote_return_fan_rong_du$count;
					this.demoteReturnFanRongDu = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
