package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PlanSkillObjProto;
	import app.message.BloodSkillObjProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BloodModuleObjClientProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodModuleObjClientProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ALLPLANS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.BloodModuleObjClientProto.allPlans", "allPlans", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PlanSkillObjProto; });

		[ArrayElementType("app.message.PlanSkillObjProto")]
		public var allPlans:Array = [];

		/**
		 *  @private
		 */
		public static const INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodModuleObjClientProto.index", "index", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var index$field:int;

		public function clearIndex():void {
			hasField$0 &= 0xfffffffd;
			index$field = new int();
		}

		public function get hasIndex():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set index(value:int):void {
			hasField$0 |= 0x2;
			index$field = value;
		}

		public function get index():int {
			return index$field;
		}

		/**
		 *  @private
		 */
		public static const CURRENTPROGRESSRATE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodModuleObjClientProto.currentProgressRate", "currentProgressRate", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var currentProgressRate$field:int;

		public function clearCurrentProgressRate():void {
			hasField$0 &= 0xfffffffb;
			currentProgressRate$field = new int();
		}

		public function get hasCurrentProgressRate():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set currentProgressRate(value:int):void {
			hasField$0 |= 0x4;
			currentProgressRate$field = value;
		}

		public function get currentProgressRate():int {
			return currentProgressRate$field;
		}

		/**
		 *  @private
		 */
		public static const RANDOMSKILLS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.BloodModuleObjClientProto.randomSkills", "randomSkills", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BloodSkillObjProto; });

		[ArrayElementType("app.message.BloodSkillObjProto")]
		public var randomSkills:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			for (var allPlans$index:uint = 0; allPlans$index < this.allPlans.length; ++allPlans$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.allPlans[allPlans$index]);
			}
			if (hasIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, index$field);
			}
			if (hasCurrentProgressRate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, currentProgressRate$field);
			}
			for (var randomSkills$index:uint = 0; randomSkills$index < this.randomSkills.length; ++randomSkills$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.randomSkills[randomSkills$index]);
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
			var index$count:uint = 0;
			var currentProgressRate$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodModuleObjClientProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					this.allPlans.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.PlanSkillObjProto()));
					break;
				case 3:
					if (index$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodModuleObjClientProto.index cannot be set twice.');
					}
					++index$count;
					this.index = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (currentProgressRate$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodModuleObjClientProto.currentProgressRate cannot be set twice.');
					}
					++currentProgressRate$count;
					this.currentProgressRate = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					this.randomSkills.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.BloodSkillObjProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
