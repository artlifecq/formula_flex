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
	public dynamic final class MazeHeroInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_FINISHED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.MazeHeroInfoProto.is_finished", "isFinished", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_finished$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsFinished():void {
			hasField$0 &= 0xfffffffe;
			is_finished$field = new Boolean();
		}

		public function get hasIsFinished():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isFinished(value:Boolean):void {
			hasField$0 |= 0x1;
			is_finished$field = value;
		}

		public function get isFinished():Boolean {
			return is_finished$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECT_PRIZE_FLOORS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.MazeHeroInfoProto.collect_prize_floors", "collectPrizeFloors", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var collectPrizeFloors:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsFinished) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_finished$field);
			}
			for (var collectPrizeFloors$index:uint = 0; collectPrizeFloors$index < this.collectPrizeFloors.length; ++collectPrizeFloors$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.collectPrizeFloors[collectPrizeFloors$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_finished$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_finished$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeHeroInfoProto.isFinished cannot be set twice.');
					}
					++is_finished$count;
					this.isFinished = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.collectPrizeFloors);
						break;
					}
					this.collectPrizeFloors.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
