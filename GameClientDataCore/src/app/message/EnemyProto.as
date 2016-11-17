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
	public dynamic final class EnemyProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ENEMY_ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.EnemyProto.enemy_id", "enemyId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var enemy_id$field:Int64;

		public function clearEnemyId():void {
			enemy_id$field = null;
		}

		public function get hasEnemyId():Boolean {
			return enemy_id$field != null;
		}

		public function set enemyId(value:Int64):void {
			enemy_id$field = value;
		}

		public function get enemyId():Int64 {
			return enemy_id$field;
		}

		/**
		 *  @private
		 */
		public static const WIN_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EnemyProto.win_times", "winTimes", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var win_times$field:int;

		private var hasField$0:uint = 0;

		public function clearWinTimes():void {
			hasField$0 &= 0xfffffffe;
			win_times$field = new int();
		}

		public function get hasWinTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set winTimes(value:int):void {
			hasField$0 |= 0x1;
			win_times$field = value;
		}

		public function get winTimes():int {
			return win_times$field;
		}

		/**
		 *  @private
		 */
		public static const FAIL_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EnemyProto.fail_times", "failTimes", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fail_times$field:int;

		public function clearFailTimes():void {
			hasField$0 &= 0xfffffffd;
			fail_times$field = new int();
		}

		public function get hasFailTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set failTimes(value:int):void {
			hasField$0 |= 0x2;
			fail_times$field = value;
		}

		public function get failTimes():int {
			return fail_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEnemyId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, enemy_id$field);
			}
			if (hasWinTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, win_times$field);
			}
			if (hasFailTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fail_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var enemy_id$count:uint = 0;
			var win_times$count:uint = 0;
			var fail_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (enemy_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EnemyProto.enemyId cannot be set twice.');
					}
					++enemy_id$count;
					this.enemyId = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (win_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: EnemyProto.winTimes cannot be set twice.');
					}
					++win_times$count;
					this.winTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (fail_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: EnemyProto.failTimes cannot be set twice.');
					}
					++fail_times$count;
					this.failTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
