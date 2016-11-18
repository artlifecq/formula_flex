package app.message {
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
	public dynamic final class RecoveryGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ADD_LIFE_FIXED:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RecoveryGoodsDataProto.add_life_fixed", "addLifeFixed", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_life_fixed$field:int;

		private var hasField$0:uint = 0;

		public function clearAddLifeFixed():void {
			hasField$0 &= 0xfffffffe;
			add_life_fixed$field = new int();
		}

		public function get hasAddLifeFixed():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set addLifeFixed(value:int):void {
			hasField$0 |= 0x1;
			add_life_fixed$field = value;
		}

		public function get addLifeFixed():int {
			return add_life_fixed$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_LIFE_MAX_PER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RecoveryGoodsDataProto.add_life_max_per", "addLifeMaxPer", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_life_max_per$field:int;

		public function clearAddLifeMaxPer():void {
			hasField$0 &= 0xfffffffd;
			add_life_max_per$field = new int();
		}

		public function get hasAddLifeMaxPer():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set addLifeMaxPer(value:int):void {
			hasField$0 |= 0x2;
			add_life_max_per$field = value;
		}

		public function get addLifeMaxPer():int {
			return add_life_max_per$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_LIFE_CUR_PER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RecoveryGoodsDataProto.add_life_cur_per", "addLifeCurPer", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_life_cur_per$field:int;

		public function clearAddLifeCurPer():void {
			hasField$0 &= 0xfffffffb;
			add_life_cur_per$field = new int();
		}

		public function get hasAddLifeCurPer():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set addLifeCurPer(value:int):void {
			hasField$0 |= 0x4;
			add_life_cur_per$field = value;
		}

		public function get addLifeCurPer():int {
			return add_life_cur_per$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_MANA_FIXED:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RecoveryGoodsDataProto.add_mana_fixed", "addManaFixed", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_mana_fixed$field:int;

		public function clearAddManaFixed():void {
			hasField$0 &= 0xfffffff7;
			add_mana_fixed$field = new int();
		}

		public function get hasAddManaFixed():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set addManaFixed(value:int):void {
			hasField$0 |= 0x8;
			add_mana_fixed$field = value;
		}

		public function get addManaFixed():int {
			return add_mana_fixed$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_MANA_MAX_PER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RecoveryGoodsDataProto.add_mana_max_per", "addManaMaxPer", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_mana_max_per$field:int;

		public function clearAddManaMaxPer():void {
			hasField$0 &= 0xffffffef;
			add_mana_max_per$field = new int();
		}

		public function get hasAddManaMaxPer():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set addManaMaxPer(value:int):void {
			hasField$0 |= 0x10;
			add_mana_max_per$field = value;
		}

		public function get addManaMaxPer():int {
			return add_mana_max_per$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_MANA_CUR_PER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RecoveryGoodsDataProto.add_mana_cur_per", "addManaCurPer", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_mana_cur_per$field:int;

		public function clearAddManaCurPer():void {
			hasField$0 &= 0xffffffdf;
			add_mana_cur_per$field = new int();
		}

		public function get hasAddManaCurPer():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set addManaCurPer(value:int):void {
			hasField$0 |= 0x20;
			add_mana_cur_per$field = value;
		}

		public function get addManaCurPer():int {
			return add_mana_cur_per$field;
		}

		/**
		 *  @private
		 */
		public static const SINGLE_EFFECT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.RecoveryGoodsDataProto.single_effect", "singleEffect", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var single_effect$field:Boolean;

		public function clearSingleEffect():void {
			hasField$0 &= 0xffffffbf;
			single_effect$field = new Boolean();
		}

		public function get hasSingleEffect():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set singleEffect(value:Boolean):void {
			hasField$0 |= 0x40;
			single_effect$field = value;
		}

		public function get singleEffect():Boolean {
			return single_effect$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAddLifeFixed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_life_fixed$field);
			}
			if (hasAddLifeMaxPer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_life_max_per$field);
			}
			if (hasAddLifeCurPer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_life_cur_per$field);
			}
			if (hasAddManaFixed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_mana_fixed$field);
			}
			if (hasAddManaMaxPer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_mana_max_per$field);
			}
			if (hasAddManaCurPer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_mana_cur_per$field);
			}
			if (hasSingleEffect) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, single_effect$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var add_life_fixed$count:uint = 0;
			var add_life_max_per$count:uint = 0;
			var add_life_cur_per$count:uint = 0;
			var add_mana_fixed$count:uint = 0;
			var add_mana_max_per$count:uint = 0;
			var add_mana_cur_per$count:uint = 0;
			var single_effect$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (add_life_fixed$count != 0) {
						throw new flash.errors.IOError('Bad data format: RecoveryGoodsDataProto.addLifeFixed cannot be set twice.');
					}
					++add_life_fixed$count;
					this.addLifeFixed = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (add_life_max_per$count != 0) {
						throw new flash.errors.IOError('Bad data format: RecoveryGoodsDataProto.addLifeMaxPer cannot be set twice.');
					}
					++add_life_max_per$count;
					this.addLifeMaxPer = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (add_life_cur_per$count != 0) {
						throw new flash.errors.IOError('Bad data format: RecoveryGoodsDataProto.addLifeCurPer cannot be set twice.');
					}
					++add_life_cur_per$count;
					this.addLifeCurPer = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (add_mana_fixed$count != 0) {
						throw new flash.errors.IOError('Bad data format: RecoveryGoodsDataProto.addManaFixed cannot be set twice.');
					}
					++add_mana_fixed$count;
					this.addManaFixed = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (add_mana_max_per$count != 0) {
						throw new flash.errors.IOError('Bad data format: RecoveryGoodsDataProto.addManaMaxPer cannot be set twice.');
					}
					++add_mana_max_per$count;
					this.addManaMaxPer = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (add_mana_cur_per$count != 0) {
						throw new flash.errors.IOError('Bad data format: RecoveryGoodsDataProto.addManaCurPer cannot be set twice.');
					}
					++add_mana_cur_per$count;
					this.addManaCurPer = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (single_effect$count != 0) {
						throw new flash.errors.IOError('Bad data format: RecoveryGoodsDataProto.singleEffect cannot be set twice.');
					}
					++single_effect$count;
					this.singleEffect = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
