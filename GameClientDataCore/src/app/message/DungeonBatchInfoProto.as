package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DungeonBatchInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BATCH_NUMBER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.DungeonBatchInfoProto.batch_number", "batchNumber", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var batch_number$field:int;

		private var hasField$0:uint = 0;

		public function clearBatchNumber():void {
			hasField$0 &= 0xfffffffe;
			batch_number$field = new int();
		}

		public function get hasBatchNumber():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set batchNumber(value:int):void {
			hasField$0 |= 0x1;
			batch_number$field = value;
		}

		public function get batchNumber():int {
			return batch_number$field;
		}

		/**
		 *  @private
		 */
		public static const CURRENT_MONSTER_TYPE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.DungeonBatchInfoProto.current_monster_type_id", "currentMonsterTypeId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var current_monster_type_id$field:int;

		public function clearCurrentMonsterTypeId():void {
			hasField$0 &= 0xfffffffd;
			current_monster_type_id$field = new int();
		}

		public function get hasCurrentMonsterTypeId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set currentMonsterTypeId(value:int):void {
			hasField$0 |= 0x2;
			current_monster_type_id$field = value;
		}

		public function get currentMonsterTypeId():int {
			return current_monster_type_id$field;
		}

		/**
		 *  @private
		 */
		public static const NEXT_MONSTER_TYPE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.DungeonBatchInfoProto.next_monster_type_id", "nextMonsterTypeId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var next_monster_type_id$field:int;

		public function clearNextMonsterTypeId():void {
			hasField$0 &= 0xfffffffb;
			next_monster_type_id$field = new int();
		}

		public function get hasNextMonsterTypeId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set nextMonsterTypeId(value:int):void {
			hasField$0 |= 0x4;
			next_monster_type_id$field = value;
		}

		public function get nextMonsterTypeId():int {
			return next_monster_type_id$field;
		}

		/**
		 *  @private
		 */
		public static const CURRENT_BATCH_PRIZE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.DungeonBatchInfoProto.current_batch_prize", "currentBatchPrize", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var current_batch_prize$field:app.message.PrizeProto;

		public function clearCurrentBatchPrize():void {
			current_batch_prize$field = null;
		}

		public function get hasCurrentBatchPrize():Boolean {
			return current_batch_prize$field != null;
		}

		public function set currentBatchPrize(value:app.message.PrizeProto):void {
			current_batch_prize$field = value;
		}

		public function get currentBatchPrize():app.message.PrizeProto {
			return current_batch_prize$field;
		}

		/**
		 *  @private
		 */
		public static const EXPIRE_DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.DungeonBatchInfoProto.expire_duration", "expireDuration", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var expire_duration$field:Int64;

		public function clearExpireDuration():void {
			expire_duration$field = null;
		}

		public function get hasExpireDuration():Boolean {
			return expire_duration$field != null;
		}

		public function set expireDuration(value:Int64):void {
			expire_duration$field = value;
		}

		public function get expireDuration():Int64 {
			return expire_duration$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBatchNumber) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, batch_number$field);
			}
			if (hasCurrentMonsterTypeId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, current_monster_type_id$field);
			}
			if (hasNextMonsterTypeId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, next_monster_type_id$field);
			}
			if (hasCurrentBatchPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, current_batch_prize$field);
			}
			if (hasExpireDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, expire_duration$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var batch_number$count:uint = 0;
			var current_monster_type_id$count:uint = 0;
			var next_monster_type_id$count:uint = 0;
			var current_batch_prize$count:uint = 0;
			var expire_duration$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (batch_number$count != 0) {
						throw new flash.errors.IOError('Bad data format: DungeonBatchInfoProto.batchNumber cannot be set twice.');
					}
					++batch_number$count;
					this.batchNumber = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (current_monster_type_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: DungeonBatchInfoProto.currentMonsterTypeId cannot be set twice.');
					}
					++current_monster_type_id$count;
					this.currentMonsterTypeId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (next_monster_type_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: DungeonBatchInfoProto.nextMonsterTypeId cannot be set twice.');
					}
					++next_monster_type_id$count;
					this.nextMonsterTypeId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (current_batch_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: DungeonBatchInfoProto.currentBatchPrize cannot be set twice.');
					}
					++current_batch_prize$count;
					this.currentBatchPrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.currentBatchPrize);
					break;
				case 5:
					if (expire_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: DungeonBatchInfoProto.expireDuration cannot be set twice.');
					}
					++expire_duration$count;
					this.expireDuration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
