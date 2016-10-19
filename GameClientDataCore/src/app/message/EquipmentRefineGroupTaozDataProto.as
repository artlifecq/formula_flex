package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentRefineTaozDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentRefineGroupTaozDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.EquipmentRefineGroupTaozDataProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const ICON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.EquipmentRefineGroupTaozDataProto.icon", "icon", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var icon$field:String;

		public function clearIcon():void {
			icon$field = null;
		}

		public function get hasIcon():Boolean {
			return icon$field != null;
		}

		public function set icon(value:String):void {
			icon$field = value;
		}

		public function get icon():String {
			return icon$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL_STAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentRefineGroupTaozDataProto.level_stage", "levelStage", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_stage$field:int;

		private var hasField$0:uint = 0;

		public function clearLevelStage():void {
			hasField$0 &= 0xfffffffe;
			level_stage$field = new int();
		}

		public function get hasLevelStage():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set levelStage(value:int):void {
			hasField$0 |= 0x1;
			level_stage$field = value;
		}

		public function get levelStage():int {
			return level_stage$field;
		}

		/**
		 *  @private
		 */
		public static const REFINE_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentRefineGroupTaozDataProto.refine_times", "refineTimes", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var refine_times$field:int;

		public function clearRefineTimes():void {
			hasField$0 &= 0xfffffffd;
			refine_times$field = new int();
		}

		public function get hasRefineTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set refineTimes(value:int):void {
			hasField$0 |= 0x2;
			refine_times$field = value;
		}

		public function get refineTimes():int {
			return refine_times$field;
		}

		/**
		 *  @private
		 */
		public static const DATAS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.EquipmentRefineGroupTaozDataProto.datas", "datas", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentRefineTaozDataProto; });

		[ArrayElementType("app.message.EquipmentRefineTaozDataProto")]
		public var datas:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, icon$field);
			}
			if (hasLevelStage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level_stage$field);
			}
			if (hasRefineTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, refine_times$field);
			}
			for (var datas$index:uint = 0; datas$index < this.datas.length; ++datas$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.datas[datas$index]);
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
			var icon$count:uint = 0;
			var level_stage$count:uint = 0;
			var refine_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineGroupTaozDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineGroupTaozDataProto.icon cannot be set twice.');
					}
					++icon$count;
					this.icon = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (level_stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineGroupTaozDataProto.levelStage cannot be set twice.');
					}
					++level_stage$count;
					this.levelStage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (refine_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineGroupTaozDataProto.refineTimes cannot be set twice.');
					}
					++refine_times$count;
					this.refineTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					this.datas.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.EquipmentRefineTaozDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
