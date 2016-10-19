package app.message.MountVitalityDatasProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpriteStatProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MountVitalityDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VITALITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountVitalityDatasProto.MountVitalityDataProto.vitality", "vitality", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vitality$field:int;

		private var hasField$0:uint = 0;

		public function clearVitality():void {
			hasField$0 &= 0xfffffffe;
			vitality$field = new int();
		}

		public function get hasVitality():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set vitality(value:int):void {
			hasField$0 |= 0x1;
			vitality$field = value;
		}

		public function get vitality():int {
			return vitality$field;
		}

		/**
		 *  @private
		 */
		public static const STAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MountVitalityDatasProto.MountVitalityDataProto.stat", "stat", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var stat$field:app.message.SpriteStatProto;

		public function clearStat():void {
			stat$field = null;
		}

		public function get hasStat():Boolean {
			return stat$field != null;
		}

		public function set stat(value:app.message.SpriteStatProto):void {
			stat$field = value;
		}

		public function get stat():app.message.SpriteStatProto {
			return stat$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVitality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, vitality$field);
			}
			if (hasStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, stat$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var vitality$count:uint = 0;
			var stat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (vitality$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountVitalityDataProto.vitality cannot be set twice.');
					}
					++vitality$count;
					this.vitality = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountVitalityDataProto.stat cannot be set twice.');
					}
					++stat$count;
					this.stat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.stat);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
