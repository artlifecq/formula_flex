package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PackageProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_OPEN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.PackageProto.is_open", "isOpen", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_open$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsOpen():void {
			hasField$0 &= 0xfffffffe;
			is_open$field = new Boolean();
		}

		public function get hasIsOpen():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isOpen(value:Boolean):void {
			hasField$0 |= 0x1;
			is_open$field = value;
		}

		public function get isOpen():Boolean {
			return is_open$field;
		}

		/**
		 *  @private
		 */
		public static const PACKAGE_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PackageProto.package_prize", "packagePrize", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var package_prize$field:app.message.PrizeProto;

		public function clearPackagePrize():void {
			package_prize$field = null;
		}

		public function get hasPackagePrize():Boolean {
			return package_prize$field != null;
		}

		public function set packagePrize(value:app.message.PrizeProto):void {
			package_prize$field = value;
		}

		public function get packagePrize():app.message.PrizeProto {
			return package_prize$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsOpen) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_open$field);
			}
			if (hasPackagePrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, package_prize$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_open$count:uint = 0;
			var package_prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_open$count != 0) {
						throw new flash.errors.IOError('Bad data format: PackageProto.isOpen cannot be set twice.');
					}
					++is_open$count;
					this.isOpen = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (package_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: PackageProto.packagePrize cannot be set twice.');
					}
					++package_prize$count;
					this.packagePrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.packagePrize);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
