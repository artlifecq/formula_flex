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
	public dynamic final class AchievementProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ACHIEVED_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AchievementProto.achieved_type", "achievedType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var achieved_type$field:int;

		private var hasField$0:uint = 0;

		public function clearAchievedType():void {
			hasField$0 &= 0xfffffffe;
			achieved_type$field = new int();
		}

		public function get hasAchievedType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set achievedType(value:int):void {
			hasField$0 |= 0x1;
			achieved_type$field = value;
		}

		public function get achievedType():int {
			return achieved_type$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVED_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AchievementProto.achieved_id", "achievedId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var achieved_id$field:int;

		public function clearAchievedId():void {
			hasField$0 &= 0xfffffffd;
			achieved_id$field = new int();
		}

		public function get hasAchievedId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set achievedId(value:int):void {
			hasField$0 |= 0x2;
			achieved_id$field = value;
		}

		public function get achievedId():int {
			return achieved_id$field;
		}

		/**
		 *  @private
		 */
		public static const PROGRESS:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.AchievementProto.progress", "progress", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var progress$field:Int64;

		public function clearProgress():void {
			progress$field = null;
		}

		public function get hasProgress():Boolean {
			return progress$field != null;
		}

		public function set progress(value:Int64):void {
			progress$field = value;
		}

		public function get progress():Int64 {
			return progress$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAchievedType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, achieved_type$field);
			}
			if (hasAchievedId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, achieved_id$field);
			}
			if (hasProgress) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, progress$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var achieved_type$count:uint = 0;
			var achieved_id$count:uint = 0;
			var progress$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (achieved_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProto.achievedType cannot be set twice.');
					}
					++achieved_type$count;
					this.achievedType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (achieved_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProto.achievedId cannot be set twice.');
					}
					++achieved_id$count;
					this.achievedId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (progress$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProto.progress cannot be set twice.');
					}
					++progress$count;
					this.progress = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
