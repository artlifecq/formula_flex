package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpellProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ZhanCheMonsterDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ZHAN_CHE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ZhanCheMonsterDataProto.zhan_che_id", "zhanCheId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var zhan_che_id$field:int;

		private var hasField$0:uint = 0;

		public function clearZhanCheId():void {
			hasField$0 &= 0xfffffffe;
			zhan_che_id$field = new int();
		}

		public function get hasZhanCheId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set zhanCheId(value:int):void {
			hasField$0 |= 0x1;
			zhan_che_id$field = value;
		}

		public function get zhanCheId():int {
			return zhan_che_id$field;
		}

		/**
		 *  @private
		 */
		public static const MONSTER_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ZhanCheMonsterDataProto.monster_id", "monsterId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var monster_id$field:int;

		public function clearMonsterId():void {
			hasField$0 &= 0xfffffffd;
			monster_id$field = new int();
		}

		public function get hasMonsterId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set monsterId(value:int):void {
			hasField$0 |= 0x2;
			monster_id$field = value;
		}

		public function get monsterId():int {
			return monster_id$field;
		}

		/**
		 *  @private
		 */
		public static const SPELLS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.ZhanCheMonsterDataProto.spells", "spells", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellProto; });

		[ArrayElementType("app.message.SpellProto")]
		public var spells:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasZhanCheId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, zhan_che_id$field);
			}
			if (hasMonsterId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, monster_id$field);
			}
			for (var spells$index:uint = 0; spells$index < this.spells.length; ++spells$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.spells[spells$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var zhan_che_id$count:uint = 0;
			var monster_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (zhan_che_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ZhanCheMonsterDataProto.zhanCheId cannot be set twice.');
					}
					++zhan_che_id$count;
					this.zhanCheId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (monster_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ZhanCheMonsterDataProto.monsterId cannot be set twice.');
					}
					++monster_id$count;
					this.monsterId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					this.spells.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.SpellProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
