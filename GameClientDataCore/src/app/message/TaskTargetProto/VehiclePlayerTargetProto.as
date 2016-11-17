package app.message.TaskTargetProto {
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
	public dynamic final class VehiclePlayerTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VEHICLE_PLAYER_NPC:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.VehiclePlayerTargetProto.vehicle_player_npc", "vehiclePlayerNpc", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vehicle_player_npc$field:int;

		private var hasField$0:uint = 0;

		public function clearVehiclePlayerNpc():void {
			hasField$0 &= 0xfffffffe;
			vehicle_player_npc$field = new int();
		}

		public function get hasVehiclePlayerNpc():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set vehiclePlayerNpc(value:int):void {
			hasField$0 |= 0x1;
			vehicle_player_npc$field = value;
		}

		public function get vehiclePlayerNpc():int {
			return vehicle_player_npc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVehiclePlayerNpc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vehicle_player_npc$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var vehicle_player_npc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (vehicle_player_npc$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePlayerTargetProto.vehiclePlayerNpc cannot be set twice.');
					}
					++vehicle_player_npc$count;
					this.vehiclePlayerNpc = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
