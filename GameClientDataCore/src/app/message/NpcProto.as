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
	import app.message.NpcDialogProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NpcProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.NpcProto.title", "title", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var title$field:flash.utils.ByteArray;

		public function clearTitle():void {
			title$field = null;
		}

		public function get hasTitle():Boolean {
			return title$field != null;
		}

		public function set title(value:flash.utils.ByteArray):void {
			title$field = value;
		}

		public function get title():flash.utils.ByteArray {
			return title$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_BE_ATTACKED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.NpcProto.can_be_attacked", "canBeAttacked", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_be_attacked$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearCanBeAttacked():void {
			hasField$0 &= 0xfffffffe;
			can_be_attacked$field = new Boolean();
		}

		public function get hasCanBeAttacked():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set canBeAttacked(value:Boolean):void {
			hasField$0 |= 0x1;
			can_be_attacked$field = value;
		}

		public function get canBeAttacked():Boolean {
			return can_be_attacked$field;
		}

		/**
		 *  @private
		 */
		public static const DIALOG_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.NpcProto.dialog_type", "dialogType", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dialog_type$field:int;

		public function clearDialogType():void {
			hasField$0 &= 0xfffffffd;
			dialog_type$field = new int();
		}

		public function get hasDialogType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set dialogType(value:int):void {
			hasField$0 |= 0x2;
			dialog_type$field = value;
		}

		public function get dialogType():int {
			return dialog_type$field;
		}

		/**
		 *  @private
		 */
		public static const DIALOG:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.NpcProto.dialog", "dialog", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var dialog$field:flash.utils.ByteArray;

		public function clearDialog():void {
			dialog$field = null;
		}

		public function get hasDialog():Boolean {
			return dialog$field != null;
		}

		public function set dialog(value:flash.utils.ByteArray):void {
			dialog$field = value;
		}

		public function get dialog():flash.utils.ByteArray {
			return dialog$field;
		}

		/**
		 *  @private
		 */
		public static const DIALOGS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.NpcProto.dialogs", "dialogs", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NpcDialogProto; });

		[ArrayElementType("app.message.NpcDialogProto")]
		public var dialogs:Array = [];

		/**
		 *  @private
		 */
		public static const FAR_DISTANCE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.NpcProto.far_distance", "farDistance", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var far_distance$field:int;

		public function clearFarDistance():void {
			hasField$0 &= 0xfffffffb;
			far_distance$field = new int();
		}

		public function get hasFarDistance():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set farDistance(value:int):void {
			hasField$0 |= 0x4;
			far_distance$field = value;
		}

		public function get farDistance():int {
			return far_distance$field;
		}

		/**
		 *  @private
		 */
		public static const DISPLAY_RES:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.NpcProto.display_res", "displayRes", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var display_res$field:String;

		public function clearDisplayRes():void {
			display_res$field = null;
		}

		public function get hasDisplayRes():Boolean {
			return display_res$field != null;
		}

		public function set displayRes(value:String):void {
			display_res$field = value;
		}

		public function get displayRes():String {
			return display_res$field;
		}

		/**
		 *  @private
		 */
		public static const MAP_MARK:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.NpcProto.map_mark", "mapMark", (18 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var map_mark$field:String;

		public function clearMapMark():void {
			map_mark$field = null;
		}

		public function get hasMapMark():Boolean {
			return map_mark$field != null;
		}

		public function set mapMark(value:String):void {
			map_mark$field = value;
		}

		public function get mapMark():String {
			return map_mark$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, title$field);
			}
			if (hasCanBeAttacked) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_be_attacked$field);
			}
			if (hasDialogType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dialog_type$field);
			}
			if (hasDialog) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, dialog$field);
			}
			for (var dialogs$index:uint = 0; dialogs$index < this.dialogs.length; ++dialogs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.dialogs[dialogs$index]);
			}
			if (hasFarDistance) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, far_distance$field);
			}
			if (hasDisplayRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, display_res$field);
			}
			if (hasMapMark) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 18);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, map_mark$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var title$count:uint = 0;
			var can_be_attacked$count:uint = 0;
			var dialog_type$count:uint = 0;
			var dialog$count:uint = 0;
			var far_distance$count:uint = 0;
			var display_res$count:uint = 0;
			var map_mark$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcProto.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 2:
					if (can_be_attacked$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcProto.canBeAttacked cannot be set twice.');
					}
					++can_be_attacked$count;
					this.canBeAttacked = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 10:
					if (dialog_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcProto.dialogType cannot be set twice.');
					}
					++dialog_type$count;
					this.dialogType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (dialog$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcProto.dialog cannot be set twice.');
					}
					++dialog$count;
					this.dialog = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 12:
					this.dialogs.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.NpcDialogProto()));
					break;
				case 16:
					if (far_distance$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcProto.farDistance cannot be set twice.');
					}
					++far_distance$count;
					this.farDistance = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 17:
					if (display_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcProto.displayRes cannot be set twice.');
					}
					++display_res$count;
					this.displayRes = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 18:
					if (map_mark$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcProto.mapMark cannot be set twice.');
					}
					++map_mark$count;
					this.mapMark = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
