package app.message.PhoenixRefineRecordProtos {
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
	public dynamic final class PhoenixRefineRecordProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HERO_ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.PhoenixRefineRecordProtos.PhoenixRefineRecordProto.hero_id", "heroId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_id$field:Int64;

		public function clearHeroId():void {
			hero_id$field = null;
		}

		public function get hasHeroId():Boolean {
			return hero_id$field != null;
		}

		public function set heroId(value:Int64):void {
			hero_id$field = value;
		}

		public function get heroId():Int64 {
			return hero_id$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.PhoenixRefineRecordProtos.PhoenixRefineRecordProto.hero_name", "heroName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var hero_name$field:String;

		public function clearHeroName():void {
			hero_name$field = null;
		}

		public function get hasHeroName():Boolean {
			return hero_name$field != null;
		}

		public function set heroName(value:String):void {
			hero_name$field = value;
		}

		public function get heroName():String {
			return hero_name$field;
		}

		/**
		 *  @private
		 */
		public static const BAO_JI_TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.PhoenixRefineRecordProtos.PhoenixRefineRecordProto.bao_ji_time", "baoJiTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bao_ji_time$field:int;

		private var hasField$0:uint = 0;

		public function clearBaoJiTime():void {
			hasField$0 &= 0xfffffffe;
			bao_ji_time$field = new int();
		}

		public function get hasBaoJiTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set baoJiTime(value:int):void {
			hasField$0 |= 0x1;
			bao_ji_time$field = value;
		}

		public function get baoJiTime():int {
			return bao_ji_time$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.PhoenixRefineRecordProtos.PhoenixRefineRecordProto.type", "type", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		public function clearType():void {
			hasField$0 &= 0xfffffffd;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x2;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHeroId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, hero_id$field);
			}
			if (hasHeroName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, hero_name$field);
			}
			if (hasBaoJiTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bao_ji_time$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var hero_id$count:uint = 0;
			var hero_name$count:uint = 0;
			var bao_ji_time$count:uint = 0;
			var type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (hero_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoenixRefineRecordProto.heroId cannot be set twice.');
					}
					++hero_id$count;
					this.heroId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (hero_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoenixRefineRecordProto.heroName cannot be set twice.');
					}
					++hero_name$count;
					this.heroName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (bao_ji_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoenixRefineRecordProto.baoJiTime cannot be set twice.');
					}
					++bao_ji_time$count;
					this.baoJiTime = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoenixRefineRecordProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
