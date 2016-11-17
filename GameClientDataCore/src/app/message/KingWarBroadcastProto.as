package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.KingWarBroadcastProto.ContinueKillingProto;
	import app.message.KingWarBroadcastProto.SeizeCrystalProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class KingWarBroadcastProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.KingWarBroadcastProto.time", "time", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:Int64;

		public function clearTime():void {
			time$field = null;
		}

		public function get hasTime():Boolean {
			return time$field != null;
		}

		public function set time(value:Int64):void {
			time$field = value;
		}

		public function get time():Int64 {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const CONTINUE_KILLING:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.KingWarBroadcastProto.continue_killing", "continueKilling", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.KingWarBroadcastProto.ContinueKillingProto; });

		private var continue_killing$field:app.message.KingWarBroadcastProto.ContinueKillingProto;

		public function clearContinueKilling():void {
			continue_killing$field = null;
		}

		public function get hasContinueKilling():Boolean {
			return continue_killing$field != null;
		}

		public function set continueKilling(value:app.message.KingWarBroadcastProto.ContinueKillingProto):void {
			continue_killing$field = value;
		}

		public function get continueKilling():app.message.KingWarBroadcastProto.ContinueKillingProto {
			return continue_killing$field;
		}

		/**
		 *  @private
		 */
		public static const SEIZE_CRYSTAL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.KingWarBroadcastProto.seize_crystal", "seizeCrystal", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.KingWarBroadcastProto.SeizeCrystalProto; });

		private var seize_crystal$field:app.message.KingWarBroadcastProto.SeizeCrystalProto;

		public function clearSeizeCrystal():void {
			seize_crystal$field = null;
		}

		public function get hasSeizeCrystal():Boolean {
			return seize_crystal$field != null;
		}

		public function set seizeCrystal(value:app.message.KingWarBroadcastProto.SeizeCrystalProto):void {
			seize_crystal$field = value;
		}

		public function get seizeCrystal():app.message.KingWarBroadcastProto.SeizeCrystalProto {
			return seize_crystal$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, time$field);
			}
			if (hasContinueKilling) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, continue_killing$field);
			}
			if (hasSeizeCrystal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, seize_crystal$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var time$count:uint = 0;
			var continue_killing$count:uint = 0;
			var seize_crystal$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarBroadcastProto.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 10:
					if (continue_killing$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarBroadcastProto.continueKilling cannot be set twice.');
					}
					++continue_killing$count;
					this.continueKilling = new app.message.KingWarBroadcastProto.ContinueKillingProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.continueKilling);
					break;
				case 11:
					if (seize_crystal$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarBroadcastProto.seizeCrystal cannot be set twice.');
					}
					++seize_crystal$count;
					this.seizeCrystal = new app.message.KingWarBroadcastProto.SeizeCrystalProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.seizeCrystal);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
