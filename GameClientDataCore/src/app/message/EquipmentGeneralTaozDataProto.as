package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpriteStatProto;
	import app.message.EquipmentGeneralTaozAddStatProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentGeneralTaozDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentGeneralTaozDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.EquipmentGeneralTaozDataProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const LEVEL_STAGE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentGeneralTaozDataProto.level_stage", "levelStage", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_stage$field:int;

		public function clearLevelStage():void {
			hasField$0 &= 0xfffffffd;
			level_stage$field = new int();
		}

		public function get hasLevelStage():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set levelStage(value:int):void {
			hasField$0 |= 0x2;
			level_stage$field = value;
		}

		public function get levelStage():int {
			return level_stage$field;
		}

		/**
		 *  @private
		 */
		public static const TAOZ_ADD_STATS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.EquipmentGeneralTaozDataProto.taoz_add_stats", "taozAddStats", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentGeneralTaozAddStatProto; });

		[ArrayElementType("app.message.EquipmentGeneralTaozAddStatProto")]
		public var taozAddStats:Array = [];

		/**
		 *  @private
		 */
		public static const EVALUATE_ADD_STATS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.EquipmentGeneralTaozDataProto.evaluate_add_stats", "evaluateAddStats", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		[ArrayElementType("app.message.SpriteStatProto")]
		public var evaluateAddStats:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasLevelStage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level_stage$field);
			}
			for (var taozAddStats$index:uint = 0; taozAddStats$index < this.taozAddStats.length; ++taozAddStats$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.taozAddStats[taozAddStats$index]);
			}
			for (var evaluateAddStats$index:uint = 0; evaluateAddStats$index < this.evaluateAddStats.length; ++evaluateAddStats$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.evaluateAddStats[evaluateAddStats$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var name$count:uint = 0;
			var level_stage$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentGeneralTaozDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentGeneralTaozDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (level_stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentGeneralTaozDataProto.levelStage cannot be set twice.');
					}
					++level_stage$count;
					this.levelStage = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					this.taozAddStats.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.EquipmentGeneralTaozAddStatProto()));
					break;
				case 5:
					this.evaluateAddStats.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.SpriteStatProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
