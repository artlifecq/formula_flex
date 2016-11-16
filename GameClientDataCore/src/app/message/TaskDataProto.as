package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import app.message.TaskTargetProto;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TaskDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.TaskDataProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:flash.utils.ByteArray;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:flash.utils.ByteArray):void {
			name$field = value;
		}

		public function get name():flash.utils.ByteArray {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const DESC:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.TaskDataProto.desc", "desc", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:flash.utils.ByteArray;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:flash.utils.ByteArray):void {
			desc$field = value;
		}

		public function get desc():flash.utils.ByteArray {
			return desc$field;
		}

		/**
		 *  @private
		 */
		public static const TARGET:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.TaskDataProto.target", "target", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskTargetProto; });

		[ArrayElementType("app.message.TaskTargetProto")]
		public var target:Array = [];

		/**
		 *  @private
		 */
		public static const DIALOG_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskDataProto.dialog_type", "dialogType", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dialog_type$field:int;

		private var hasField$0:uint = 0;

		public function clearDialogType():void {
			hasField$0 &= 0xfffffffe;
			dialog_type$field = new int();
		}

		public function get hasDialogType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set dialogType(value:int):void {
			hasField$0 |= 0x1;
			dialog_type$field = value;
		}

		public function get dialogType():int {
			return dialog_type$field;
		}

		/**
		 *  @private
		 */
		public static const DIALOG:RepeatedFieldDescriptor_TYPE_STRING = new RepeatedFieldDescriptor_TYPE_STRING("app.message.TaskDataProto.dialog", "dialog", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("String")]
		public var dialog:Array = [];

		/**
		 *  @private
		 */
		public static const SOUND:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.TaskDataProto.sound", "sound", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var sound$field:String;

		public function clearSound():void {
			sound$field = null;
		}

		public function get hasSound():Boolean {
			return sound$field != null;
		}

		public function set sound(value:String):void {
			sound$field = value;
		}

		public function get sound():String {
			return sound$field;
		}

		/**
		 *  @private
		 */
		public static const FIX_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TaskDataProto.fix_prize", "fixPrize", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var fix_prize$field:app.message.PrizeProto;

		public function clearFixPrize():void {
			fix_prize$field = null;
		}

		public function get hasFixPrize():Boolean {
			return fix_prize$field != null;
		}

		public function set fixPrize(value:app.message.PrizeProto):void {
			fix_prize$field = value;
		}

		public function get fixPrize():app.message.PrizeProto {
			return fix_prize$field;
		}

		/**
		 *  @private
		 */
		public static const SELECTABLE_PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.TaskDataProto.selectable_prize", "selectablePrize", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		[ArrayElementType("app.message.PrizeProto")]
		public var selectablePrize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, name$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, desc$field);
			}
			for (var target$index:uint = 0; target$index < this.target.length; ++target$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.target[target$index]);
			}
			if (hasDialogType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dialog_type$field);
			}
			for (var dialog$index:uint = 0; dialog$index < this.dialog.length; ++dialog$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, this.dialog[dialog$index]);
			}
			if (hasSound) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, sound$field);
			}
			if (hasFixPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, fix_prize$field);
			}
			for (var selectablePrize$index:uint = 0; selectablePrize$index < this.selectablePrize.length; ++selectablePrize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.selectablePrize[selectablePrize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var name$count:uint = 0;
			var desc$count:uint = 0;
			var dialog_type$count:uint = 0;
			var sound$count:uint = 0;
			var fix_prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 2:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskDataProto.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 7:
					this.target.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.TaskTargetProto()));
					break;
				case 8:
					if (dialog_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskDataProto.dialogType cannot be set twice.');
					}
					++dialog_type$count;
					this.dialogType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					this.dialog.push(com.netease.protobuf.ReadUtils.read_TYPE_STRING(input));
					break;
				case 10:
					if (sound$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskDataProto.sound cannot be set twice.');
					}
					++sound$count;
					this.sound = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 12:
					if (fix_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskDataProto.fixPrize cannot be set twice.');
					}
					++fix_prize$count;
					this.fixPrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.fixPrize);
					break;
				case 13:
					this.selectablePrize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.PrizeProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
