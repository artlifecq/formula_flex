package app.message.UpgradePromotionProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradePromotionProtoType;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class UpgradePromotionSingleProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.UpgradePromotionProto.UpgradePromotionSingleProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const GLOBAL_LIMIT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.UpgradePromotionProto.UpgradePromotionSingleProto.global_limit", "globalLimit", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var global_limit$field:int;

		public function clearGlobalLimit():void {
			hasField$0 &= 0xfffffffd;
			global_limit$field = new int();
		}

		public function get hasGlobalLimit():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set globalLimit(value:int):void {
			hasField$0 |= 0x2;
			global_limit$field = value;
		}

		public function get globalLimit():int {
			return global_limit$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.UpgradePromotionProto.UpgradePromotionSingleProto.prize", "prize", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var prize$field:app.message.PrizeProto;

		public function clearPrize():void {
			prize$field = null;
		}

		public function get hasPrize():Boolean {
			return prize$field != null;
		}

		public function set prize(value:app.message.PrizeProto):void {
			prize$field = value;
		}

		public function get prize():app.message.PrizeProto {
			return prize$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.UpgradePromotionProto.UpgradePromotionSingleProto.type", "type", (4 << 3) | com.netease.protobuf.WireType.VARINT, app.message.UpgradePromotionProtoType);

		private var type$field:int;

		public function clearType():void {
			hasField$0 &= 0xfffffffb;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x4;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasGlobalLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, global_limit$field);
			}
			if (hasPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, prize$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, type$field);
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
			var global_limit$count:uint = 0;
			var prize$count:uint = 0;
			var type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradePromotionSingleProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (global_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradePromotionSingleProto.globalLimit cannot be set twice.');
					}
					++global_limit$count;
					this.globalLimit = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradePromotionSingleProto.prize cannot be set twice.');
					}
					++prize$count;
					this.prize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.prize);
					break;
				case 4:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradePromotionSingleProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
