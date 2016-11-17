package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.ReliveCostProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReliveTypeDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RELIVE_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ReliveTypeDataProto.relive_type", "reliveType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var relive_type$field:int;

		private var hasField$0:uint = 0;

		public function clearReliveType():void {
			hasField$0 &= 0xfffffffe;
			relive_type$field = new int();
		}

		public function get hasReliveType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set reliveType(value:int):void {
			hasField$0 |= 0x1;
			relive_type$field = value;
		}

		public function get reliveType():int {
			return relive_type$field;
		}

		/**
		 *  @private
		 */
		public static const FREE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ReliveTypeDataProto.free_times", "freeTimes", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var free_times$field:int;

		public function clearFreeTimes():void {
			hasField$0 &= 0xfffffffd;
			free_times$field = new int();
		}

		public function get hasFreeTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set freeTimes(value:int):void {
			hasField$0 |= 0x2;
			free_times$field = value;
		}

		public function get freeTimes():int {
			return free_times$field;
		}

		/**
		 *  @private
		 */
		public static const LIFE_PERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ReliveTypeDataProto.life_percent", "lifePercent", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var life_percent$field:int;

		public function clearLifePercent():void {
			hasField$0 &= 0xfffffffb;
			life_percent$field = new int();
		}

		public function get hasLifePercent():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set lifePercent(value:int):void {
			hasField$0 |= 0x4;
			life_percent$field = value;
		}

		public function get lifePercent():int {
			return life_percent$field;
		}

		/**
		 *  @private
		 */
		public static const MANA_PERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ReliveTypeDataProto.mana_percent", "manaPercent", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mana_percent$field:int;

		public function clearManaPercent():void {
			hasField$0 &= 0xfffffff7;
			mana_percent$field = new int();
		}

		public function get hasManaPercent():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set manaPercent(value:int):void {
			hasField$0 |= 0x8;
			mana_percent$field = value;
		}

		public function get manaPercent():int {
			return mana_percent$field;
		}

		/**
		 *  @private
		 */
		public static const ALL_RELIVE_COST:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.ReliveTypeDataProto.all_relive_cost", "allReliveCost", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ReliveCostProto; });

		[ArrayElementType("app.message.ReliveCostProto")]
		public var allReliveCost:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasReliveType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, relive_type$field);
			}
			if (hasFreeTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, free_times$field);
			}
			if (hasLifePercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, life_percent$field);
			}
			if (hasManaPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, mana_percent$field);
			}
			for (var allReliveCost$index:uint = 0; allReliveCost$index < this.allReliveCost.length; ++allReliveCost$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.allReliveCost[allReliveCost$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var relive_type$count:uint = 0;
			var free_times$count:uint = 0;
			var life_percent$count:uint = 0;
			var mana_percent$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (relive_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReliveTypeDataProto.reliveType cannot be set twice.');
					}
					++relive_type$count;
					this.reliveType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (free_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReliveTypeDataProto.freeTimes cannot be set twice.');
					}
					++free_times$count;
					this.freeTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (life_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReliveTypeDataProto.lifePercent cannot be set twice.');
					}
					++life_percent$count;
					this.lifePercent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (mana_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReliveTypeDataProto.manaPercent cannot be set twice.');
					}
					++mana_percent$count;
					this.manaPercent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					this.allReliveCost.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.ReliveCostProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
