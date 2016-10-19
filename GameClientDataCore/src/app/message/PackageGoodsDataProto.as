package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PackageGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RACE_DIFF:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.PackageGoodsDataProto.race_diff", "raceDiff", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var race_diff$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearRaceDiff():void {
			hasField$0 &= 0xfffffffe;
			race_diff$field = new Boolean();
		}

		public function get hasRaceDiff():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set raceDiff(value:Boolean):void {
			hasField$0 |= 0x1;
			race_diff$field = value;
		}

		public function get raceDiff():Boolean {
			return race_diff$field;
		}

		/**
		 *  @private
		 */
		public static const OPEN_COST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.PackageGoodsDataProto.open_cost", "openCost", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var open_cost$field:app.message.UpgradeProto;

		public function clearOpenCost():void {
			open_cost$field = null;
		}

		public function get hasOpenCost():Boolean {
			return open_cost$field != null;
		}

		public function set openCost(value:app.message.UpgradeProto):void {
			open_cost$field = value;
		}

		public function get openCost():app.message.UpgradeProto {
			return open_cost$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRaceDiff) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, race_diff$field);
			}
			if (hasOpenCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, open_cost$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var race_diff$count:uint = 0;
			var open_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (race_diff$count != 0) {
						throw new flash.errors.IOError('Bad data format: PackageGoodsDataProto.raceDiff cannot be set twice.');
					}
					++race_diff$count;
					this.raceDiff = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (open_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: PackageGoodsDataProto.openCost cannot be set twice.');
					}
					++open_cost$count;
					this.openCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.openCost);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
