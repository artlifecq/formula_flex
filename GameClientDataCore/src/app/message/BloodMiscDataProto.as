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
	public dynamic final class BloodMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PLAN_COST:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.BloodMiscDataProto.plan_cost", "planCost", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var planCost:Array = [];

		/**
		 *  @private
		 */
		public static const SCORE_TITLE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.BloodMiscDataProto.score_title", "scoreTitle", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var score_title$field:String;

		public function clearScoreTitle():void {
			score_title$field = null;
		}

		public function get hasScoreTitle():Boolean {
			return score_title$field != null;
		}

		public function set scoreTitle(value:String):void {
			score_title$field = value;
		}

		public function get scoreTitle():String {
			return score_title$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var planCost$index:uint = 0; planCost$index < this.planCost.length; ++planCost$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.planCost[planCost$index]);
			}
			if (hasScoreTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, score_title$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var score_title$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.planCost);
						break;
					}
					this.planCost.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 3:
					if (score_title$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodMiscDataProto.scoreTitle cannot be set twice.');
					}
					++score_title$count;
					this.scoreTitle = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
