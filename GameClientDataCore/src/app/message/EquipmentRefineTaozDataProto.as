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
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentRefineTaozDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentRefineTaozDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SUB_REFINE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentRefineTaozDataProto.sub_refine_times", "subRefineTimes", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sub_refine_times$field:int;

		public function clearSubRefineTimes():void {
			hasField$0 &= 0xfffffffd;
			sub_refine_times$field = new int();
		}

		public function get hasSubRefineTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set subRefineTimes(value:int):void {
			hasField$0 |= 0x2;
			sub_refine_times$field = value;
		}

		public function get subRefineTimes():int {
			return sub_refine_times$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_STAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentRefineTaozDataProto.add_stat", "addStat", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var add_stat$field:app.message.SpriteStatProto;

		public function clearAddStat():void {
			add_stat$field = null;
		}

		public function get hasAddStat():Boolean {
			return add_stat$field != null;
		}

		public function set addStat(value:app.message.SpriteStatProto):void {
			add_stat$field = value;
		}

		public function get addStat():app.message.SpriteStatProto {
			return add_stat$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasSubRefineTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, sub_refine_times$field);
			}
			if (hasAddStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, add_stat$field);
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
			var sub_refine_times$count:uint = 0;
			var add_stat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineTaozDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (sub_refine_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineTaozDataProto.subRefineTimes cannot be set twice.');
					}
					++sub_refine_times$count;
					this.subRefineTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (add_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineTaozDataProto.addStat cannot be set twice.');
					}
					++add_stat$count;
					this.addStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.addStat);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
