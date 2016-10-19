package app.message.AllFamilyHallDatasProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyBuildingBaseDataLevelProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyHallLevelDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BASE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.AllFamilyHallDatasProto.FamilyHallLevelDataProto.base", "base", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyBuildingBaseDataLevelProto; });

		private var base$field:app.message.FamilyBuildingBaseDataLevelProto;

		public function clearBase():void {
			base$field = null;
		}

		public function get hasBase():Boolean {
			return base$field != null;
		}

		public function set base(value:app.message.FamilyBuildingBaseDataLevelProto):void {
			base$field = value;
		}

		public function get base():app.message.FamilyBuildingBaseDataLevelProto {
			return base$field;
		}

		/**
		 *  @private
		 */
		public static const CAPACITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AllFamilyHallDatasProto.FamilyHallLevelDataProto.capacity", "capacity", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var capacity$field:int;

		private var hasField$0:uint = 0;

		public function clearCapacity():void {
			hasField$0 &= 0xfffffffe;
			capacity$field = new int();
		}

		public function get hasCapacity():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set capacity(value:int):void {
			hasField$0 |= 0x1;
			capacity$field = value;
		}

		public function get capacity():int {
			return capacity$field;
		}

		/**
		 *  @private
		 */
		public static const VICE_LEADER_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AllFamilyHallDatasProto.FamilyHallLevelDataProto.vice_leader_count", "viceLeaderCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vice_leader_count$field:int;

		public function clearViceLeaderCount():void {
			hasField$0 &= 0xfffffffd;
			vice_leader_count$field = new int();
		}

		public function get hasViceLeaderCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set viceLeaderCount(value:int):void {
			hasField$0 |= 0x2;
			vice_leader_count$field = value;
		}

		public function get viceLeaderCount():int {
			return vice_leader_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBase) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, base$field);
			}
			if (hasCapacity) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, capacity$field);
			}
			if (hasViceLeaderCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, vice_leader_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var base$count:uint = 0;
			var capacity$count:uint = 0;
			var vice_leader_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (base$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyHallLevelDataProto.base cannot be set twice.');
					}
					++base$count;
					this.base = new app.message.FamilyBuildingBaseDataLevelProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.base);
					break;
				case 2:
					if (capacity$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyHallLevelDataProto.capacity cannot be set twice.');
					}
					++capacity$count;
					this.capacity = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (vice_leader_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyHallLevelDataProto.viceLeaderCount cannot be set twice.');
					}
					++vice_leader_count$count;
					this.viceLeaderCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
