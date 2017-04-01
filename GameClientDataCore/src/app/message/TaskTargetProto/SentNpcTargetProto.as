package app.message.TaskTargetProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AreaDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SentNpcTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SET_NPC_ACCEPT_NPC:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.SentNpcTargetProto.set_npc_accept_npc", "setNpcAcceptNpc", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var set_npc_accept_npc$field:int;

		private var hasField$0:uint = 0;

		public function clearSetNpcAcceptNpc():void {
			hasField$0 &= 0xfffffffe;
			set_npc_accept_npc$field = new int();
		}

		public function get hasSetNpcAcceptNpc():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set setNpcAcceptNpc(value:int):void {
			hasField$0 |= 0x1;
			set_npc_accept_npc$field = value;
		}

		public function get setNpcAcceptNpc():int {
			return set_npc_accept_npc$field;
		}

		/**
		 *  @private
		 */
		public static const SET_NPC_ACCEPT_NPC_DIALOG:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.TaskTargetProto.SentNpcTargetProto.set_npc_accept_npc_dialog", "setNpcAcceptNpcDialog", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var set_npc_accept_npc_dialog$field:String;

		public function clearSetNpcAcceptNpcDialog():void {
			set_npc_accept_npc_dialog$field = null;
		}

		public function get hasSetNpcAcceptNpcDialog():Boolean {
			return set_npc_accept_npc_dialog$field != null;
		}

		public function set setNpcAcceptNpcDialog(value:String):void {
			set_npc_accept_npc_dialog$field = value;
		}

		public function get setNpcAcceptNpcDialog():String {
			return set_npc_accept_npc_dialog$field;
		}

		/**
		 *  @private
		 */
		public static const SET_NPC_TARGET_AREA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TaskTargetProto.SentNpcTargetProto.set_npc_target_area", "setNpcTargetArea", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AreaDataProto; });

		private var set_npc_target_area$field:app.message.AreaDataProto;

		public function clearSetNpcTargetArea():void {
			set_npc_target_area$field = null;
		}

		public function get hasSetNpcTargetArea():Boolean {
			return set_npc_target_area$field != null;
		}

		public function set setNpcTargetArea(value:app.message.AreaDataProto):void {
			set_npc_target_area$field = value;
		}

		public function get setNpcTargetArea():app.message.AreaDataProto {
			return set_npc_target_area$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSetNpcAcceptNpc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, set_npc_accept_npc$field);
			}
			if (hasSetNpcAcceptNpcDialog) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, set_npc_accept_npc_dialog$field);
			}
			if (hasSetNpcTargetArea) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, set_npc_target_area$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var set_npc_accept_npc$count:uint = 0;
			var set_npc_accept_npc_dialog$count:uint = 0;
			var set_npc_target_area$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (set_npc_accept_npc$count != 0) {
						throw new flash.errors.IOError('Bad data format: SentNpcTargetProto.setNpcAcceptNpc cannot be set twice.');
					}
					++set_npc_accept_npc$count;
					this.setNpcAcceptNpc = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (set_npc_accept_npc_dialog$count != 0) {
						throw new flash.errors.IOError('Bad data format: SentNpcTargetProto.setNpcAcceptNpcDialog cannot be set twice.');
					}
					++set_npc_accept_npc_dialog$count;
					this.setNpcAcceptNpcDialog = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (set_npc_target_area$count != 0) {
						throw new flash.errors.IOError('Bad data format: SentNpcTargetProto.setNpcTargetArea cannot be set twice.');
					}
					++set_npc_target_area$count;
					this.setNpcTargetArea = new app.message.AreaDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.setNpcTargetArea);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
