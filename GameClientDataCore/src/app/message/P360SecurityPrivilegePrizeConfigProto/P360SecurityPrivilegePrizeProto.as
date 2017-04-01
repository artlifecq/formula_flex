package app.message.P360SecurityPrivilegePrizeConfigProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import app.message.GoodsWrapperProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class P360SecurityPrivilegePrizeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GRADE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.P360SecurityPrivilegePrizeConfigProto.P360SecurityPrivilegePrizeProto.grade", "grade", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var grade$field:int;

		private var hasField$0:uint = 0;

		public function clearGrade():void {
			hasField$0 &= 0xfffffffe;
			grade$field = new int();
		}

		public function get hasGrade():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set grade(value:int):void {
			hasField$0 |= 0x1;
			grade$field = value;
		}

		public function get grade():int {
			return grade$field;
		}

		/**
		 *  @private
		 */
		public static const DESC:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.P360SecurityPrivilegePrizeConfigProto.P360SecurityPrivilegePrizeProto.desc", "desc", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:flash.utils.ByteArray;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:flash.utils.ByteArray):void {
			desc$field = value;
		}

		public function get desc():flash.utils.ByteArray {
			return desc$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.P360SecurityPrivilegePrizeConfigProto.P360SecurityPrivilegePrizeProto.prize", "prize", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var prize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGrade) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, grade$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, desc$field);
			}
			for (var prize$index:uint = 0; prize$index < this.prize.length; ++prize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.prize[prize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var grade$count:uint = 0;
			var desc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (grade$count != 0) {
						throw new flash.errors.IOError('Bad data format: P360SecurityPrivilegePrizeProto.grade cannot be set twice.');
					}
					++grade$count;
					this.grade = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: P360SecurityPrivilegePrizeProto.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 3:
					this.prize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
