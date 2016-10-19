package app.message.NpcDialogProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.VehiclePathDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class VehiclePathDialogProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VEHICLE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NpcDialogProto.VehiclePathDialogProto.vehicle", "vehicle", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.VehiclePathDataProto; });

		private var vehicle$field:app.message.VehiclePathDataProto;

		public function clearVehicle():void {
			vehicle$field = null;
		}

		public function get hasVehicle():Boolean {
			return vehicle$field != null;
		}

		public function set vehicle(value:app.message.VehiclePathDataProto):void {
			vehicle$field = value;
		}

		public function get vehicle():app.message.VehiclePathDataProto {
			return vehicle$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVehicle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, vehicle$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var vehicle$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (vehicle$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathDialogProto.vehicle cannot be set twice.');
					}
					++vehicle$count;
					this.vehicle = new app.message.VehiclePathDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.vehicle);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
