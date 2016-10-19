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
	public dynamic final class MazeRankObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.MazeRankObjProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:Int64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:Int64):void {
			id$field = value;
		}

		public function get id():Int64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MazeRankObjProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const COST_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.MazeRankObjProto.cost_time", "costTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost_time$field:Int64;

		public function clearCostTime():void {
			cost_time$field = null;
		}

		public function get hasCostTime():Boolean {
			return cost_time$field != null;
		}

		public function set costTime(value:Int64):void {
			cost_time$field = value;
		}

		public function get costTime():Int64 {
			return cost_time$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MazeRankObjProto.country", "country", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country$field:int;

		private var hasField$0:uint = 0;

		public function clearCountry():void {
			hasField$0 &= 0xfffffffe;
			country$field = new int();
		}

		public function get hasCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set country(value:int):void {
			hasField$0 |= 0x1;
			country$field = value;
		}

		public function get country():int {
			return country$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasCostTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, cost_time$field);
			}
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var name$count:uint = 0;
			var cost_time$count:uint = 0;
			var country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeRankObjProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeRankObjProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (cost_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeRankObjProto.costTime cannot be set twice.');
					}
					++cost_time$count;
					this.costTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeRankObjProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
