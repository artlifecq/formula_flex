package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SingleStatsProto;
	import app.message.TotalStatProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpriteStatProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SINGLE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpriteStatProto.single", "single", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SingleStatsProto; });

		private var single$field:app.message.SingleStatsProto;

		public function clearSingle():void {
			single$field = null;
		}

		public function get hasSingle():Boolean {
			return single$field != null;
		}

		public function set single(value:app.message.SingleStatsProto):void {
			single$field = value;
		}

		public function get single():app.message.SingleStatsProto {
			return single$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpriteStatProto.total", "total", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TotalStatProto; });

		private var total$field:app.message.TotalStatProto;

		public function clearTotal():void {
			total$field = null;
		}

		public function get hasTotal():Boolean {
			return total$field != null;
		}

		public function set total(value:app.message.TotalStatProto):void {
			total$field = value;
		}

		public function get total():app.message.TotalStatProto {
			return total$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSingle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, single$field);
			}
			if (hasTotal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, total$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var single$count:uint = 0;
			var total$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (single$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpriteStatProto.single cannot be set twice.');
					}
					++single$count;
					this.single = new app.message.SingleStatsProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.single);
					break;
				case 2:
					if (total$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpriteStatProto.total cannot be set twice.');
					}
					++total$count;
					this.total = new app.message.TotalStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.total);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
