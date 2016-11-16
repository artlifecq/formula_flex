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
	public dynamic final class RelationConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FRIEND_COUNT_LIMIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RelationConfig.friend_count_limit", "friendCountLimit", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var friend_count_limit$field:int;

		private var hasField$0:uint = 0;

		public function clearFriendCountLimit():void {
			hasField$0 &= 0xfffffffe;
			friend_count_limit$field = new int();
		}

		public function get hasFriendCountLimit():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set friendCountLimit(value:int):void {
			hasField$0 |= 0x1;
			friend_count_limit$field = value;
		}

		public function get friendCountLimit():int {
			return friend_count_limit$field;
		}

		/**
		 *  @private
		 */
		public static const BLACK_COUNT_LIMIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RelationConfig.black_count_limit", "blackCountLimit", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var black_count_limit$field:int;

		public function clearBlackCountLimit():void {
			hasField$0 &= 0xfffffffd;
			black_count_limit$field = new int();
		}

		public function get hasBlackCountLimit():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set blackCountLimit(value:int):void {
			hasField$0 |= 0x2;
			black_count_limit$field = value;
		}

		public function get blackCountLimit():int {
			return black_count_limit$field;
		}

		/**
		 *  @private
		 */
		public static const ENEMY_COUNT_LIMIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RelationConfig.enemy_count_limit", "enemyCountLimit", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var enemy_count_limit$field:int;

		public function clearEnemyCountLimit():void {
			hasField$0 &= 0xfffffffb;
			enemy_count_limit$field = new int();
		}

		public function get hasEnemyCountLimit():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set enemyCountLimit(value:int):void {
			hasField$0 |= 0x4;
			enemy_count_limit$field = value;
		}

		public function get enemyCountLimit():int {
			return enemy_count_limit$field;
		}

		/**
		 *  @private
		 */
		public static const DEGREE_TITLE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.RelationConfig.degree_title", "degreeTitle", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var degree_title$field:String;

		public function clearDegreeTitle():void {
			degree_title$field = null;
		}

		public function get hasDegreeTitle():Boolean {
			return degree_title$field != null;
		}

		public function set degreeTitle(value:String):void {
			degree_title$field = value;
		}

		public function get degreeTitle():String {
			return degree_title$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFriendCountLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, friend_count_limit$field);
			}
			if (hasBlackCountLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, black_count_limit$field);
			}
			if (hasEnemyCountLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, enemy_count_limit$field);
			}
			if (hasDegreeTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, degree_title$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var friend_count_limit$count:uint = 0;
			var black_count_limit$count:uint = 0;
			var enemy_count_limit$count:uint = 0;
			var degree_title$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (friend_count_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: RelationConfig.friendCountLimit cannot be set twice.');
					}
					++friend_count_limit$count;
					this.friendCountLimit = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (black_count_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: RelationConfig.blackCountLimit cannot be set twice.');
					}
					++black_count_limit$count;
					this.blackCountLimit = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (enemy_count_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: RelationConfig.enemyCountLimit cannot be set twice.');
					}
					++enemy_count_limit$count;
					this.enemyCountLimit = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (degree_title$count != 0) {
						throw new flash.errors.IOError('Bad data format: RelationConfig.degreeTitle cannot be set twice.');
					}
					++degree_title$count;
					this.degreeTitle = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
