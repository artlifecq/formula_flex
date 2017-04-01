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
	public dynamic final class KingWarMonsterProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ADD_POINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.KingWarMonsterProto.add_point", "addPoint", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_point$field:int;

		private var hasField$0:uint = 0;

		public function clearAddPoint():void {
			hasField$0 &= 0xfffffffe;
			add_point$field = new int();
		}

		public function get hasAddPoint():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set addPoint(value:int):void {
			hasField$0 |= 0x1;
			add_point$field = value;
		}

		public function get addPoint():int {
			return add_point$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_POINT_DURATION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.KingWarMonsterProto.add_point_duration", "addPointDuration", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_point_duration$field:int;

		public function clearAddPointDuration():void {
			hasField$0 &= 0xfffffffd;
			add_point_duration$field = new int();
		}

		public function get hasAddPointDuration():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set addPointDuration(value:int):void {
			hasField$0 |= 0x2;
			add_point_duration$field = value;
		}

		public function get addPointDuration():int {
			return add_point_duration$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAddPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_point$field);
			}
			if (hasAddPointDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_point_duration$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var add_point$count:uint = 0;
			var add_point_duration$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (add_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMonsterProto.addPoint cannot be set twice.');
					}
					++add_point$count;
					this.addPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (add_point_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMonsterProto.addPointDuration cannot be set twice.');
					}
					++add_point_duration$count;
					this.addPointDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
