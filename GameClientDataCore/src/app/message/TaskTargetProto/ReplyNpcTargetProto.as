package app.message.TaskTargetProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReplyNpcTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NPC_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.ReplyNpcTargetProto.npc_id", "npcId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var npc_id$field:int;

		private var hasField$0:uint = 0;

		public function clearNpcId():void {
			hasField$0 &= 0xfffffffe;
			npc_id$field = new int();
		}

		public function get hasNpcId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set npcId(value:int):void {
			hasField$0 |= 0x1;
			npc_id$field = value;
		}

		public function get npcId():int {
			return npc_id$field;
		}

		/**
		 *  @private
		 */
		public static const NPC_DIALOG:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.TaskTargetProto.ReplyNpcTargetProto.npc_dialog", "npcDialog", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var npc_dialog$field:flash.utils.ByteArray;

		public function clearNpcDialog():void {
			npc_dialog$field = null;
		}

		public function get hasNpcDialog():Boolean {
			return npc_dialog$field != null;
		}

		public function set npcDialog(value:flash.utils.ByteArray):void {
			npc_dialog$field = value;
		}

		public function get npcDialog():flash.utils.ByteArray {
			return npc_dialog$field;
		}

		/**
		 *  @private
		 */
		public static const NPC_EXAM_QUESTION:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.TaskTargetProto.ReplyNpcTargetProto.npc_exam_question", "npcExamQuestion", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var npc_exam_question$field:String;

		public function clearNpcExamQuestion():void {
			npc_exam_question$field = null;
		}

		public function get hasNpcExamQuestion():Boolean {
			return npc_exam_question$field != null;
		}

		public function set npcExamQuestion(value:String):void {
			npc_exam_question$field = value;
		}

		public function get npcExamQuestion():String {
			return npc_exam_question$field;
		}

		/**
		 *  @private
		 */
		public static const NPC_EXAM_SELECTIONS:RepeatedFieldDescriptor_TYPE_STRING = new RepeatedFieldDescriptor_TYPE_STRING("app.message.TaskTargetProto.ReplyNpcTargetProto.npc_exam_selections", "npcExamSelections", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("String")]
		public var npcExamSelections:Array = [];

		/**
		 *  @private
		 */
		public static const NPC_EXAM_ANSWER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.ReplyNpcTargetProto.npc_exam_answer", "npcExamAnswer", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var npc_exam_answer$field:int;

		public function clearNpcExamAnswer():void {
			hasField$0 &= 0xfffffffd;
			npc_exam_answer$field = new int();
		}

		public function get hasNpcExamAnswer():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set npcExamAnswer(value:int):void {
			hasField$0 |= 0x2;
			npc_exam_answer$field = value;
		}

		public function get npcExamAnswer():int {
			return npc_exam_answer$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasNpcId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, npc_id$field);
			}
			if (hasNpcDialog) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, npc_dialog$field);
			}
			if (hasNpcExamQuestion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, npc_exam_question$field);
			}
			for (var npcExamSelections$index:uint = 0; npcExamSelections$index < this.npcExamSelections.length; ++npcExamSelections$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, this.npcExamSelections[npcExamSelections$index]);
			}
			if (hasNpcExamAnswer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, npc_exam_answer$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var npc_id$count:uint = 0;
			var npc_dialog$count:uint = 0;
			var npc_exam_question$count:uint = 0;
			var npc_exam_answer$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (npc_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReplyNpcTargetProto.npcId cannot be set twice.');
					}
					++npc_id$count;
					this.npcId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (npc_dialog$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReplyNpcTargetProto.npcDialog cannot be set twice.');
					}
					++npc_dialog$count;
					this.npcDialog = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 3:
					if (npc_exam_question$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReplyNpcTargetProto.npcExamQuestion cannot be set twice.');
					}
					++npc_exam_question$count;
					this.npcExamQuestion = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					this.npcExamSelections.push(com.netease.protobuf.ReadUtils.read_TYPE_STRING(input));
					break;
				case 5:
					if (npc_exam_answer$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReplyNpcTargetProto.npcExamAnswer cannot be set twice.');
					}
					++npc_exam_answer$count;
					this.npcExamAnswer = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
