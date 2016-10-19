package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.MazeDungeonProto.MazePortalDataProto;
	import app.message.SquareAreaProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MazeDungeonProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FLOOR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MazeDungeonProto.floor", "floor", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var floor$field:int;

		private var hasField$0:uint = 0;

		public function clearFloor():void {
			hasField$0 &= 0xfffffffe;
			floor$field = new int();
		}

		public function get hasFloor():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set floor(value:int):void {
			hasField$0 |= 0x1;
			floor$field = value;
		}

		public function get floor():int {
			return floor$field;
		}

		/**
		 *  @private
		 */
		public static const PORTAL_DATAS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.MazeDungeonProto.portal_datas", "portalDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MazeDungeonProto.MazePortalDataProto; });

		[ArrayElementType("app.message.MazeDungeonProto.MazePortalDataProto")]
		public var portalDatas:Array = [];

		/**
		 *  @private
		 */
		public static const IS_RANDOM_FLOOR:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.MazeDungeonProto.is_random_floor", "isRandomFloor", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_random_floor$field:Boolean;

		public function clearIsRandomFloor():void {
			hasField$0 &= 0xfffffffd;
			is_random_floor$field = new Boolean();
		}

		public function get hasIsRandomFloor():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isRandomFloor(value:Boolean):void {
			hasField$0 |= 0x2;
			is_random_floor$field = value;
		}

		public function get isRandomFloor():Boolean {
			return is_random_floor$field;
		}

		/**
		 *  @private
		 */
		public static const RANK_MONSTERS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.MazeDungeonProto.rank_monsters", "rankMonsters", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var rankMonsters:Array = [];

		/**
		 *  @private
		 */
		public static const STAY_BEFORE_START_AREA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MazeDungeonProto.stay_before_start_area", "stayBeforeStartArea", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SquareAreaProto; });

		private var stay_before_start_area$field:app.message.SquareAreaProto;

		public function clearStayBeforeStartArea():void {
			stay_before_start_area$field = null;
		}

		public function get hasStayBeforeStartArea():Boolean {
			return stay_before_start_area$field != null;
		}

		public function set stayBeforeStartArea(value:app.message.SquareAreaProto):void {
			stay_before_start_area$field = value;
		}

		public function get stayBeforeStartArea():app.message.SquareAreaProto {
			return stay_before_start_area$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_MAZE_PRIZE_NPC:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.MazeDungeonProto.has_maze_prize_npc", "hasMazePrizeNpc", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_maze_prize_npc$field:Boolean;

		public function clearHasMazePrizeNpc():void {
			hasField$0 &= 0xfffffffb;
			has_maze_prize_npc$field = new Boolean();
		}

		public function get hasHasMazePrizeNpc():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set hasMazePrizeNpc(value:Boolean):void {
			hasField$0 |= 0x4;
			has_maze_prize_npc$field = value;
		}

		public function get hasMazePrizeNpc():Boolean {
			return has_maze_prize_npc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFloor) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, floor$field);
			}
			for (var portalDatas$index:uint = 0; portalDatas$index < this.portalDatas.length; ++portalDatas$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.portalDatas[portalDatas$index]);
			}
			if (hasIsRandomFloor) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_random_floor$field);
			}
			for (var rankMonsters$index:uint = 0; rankMonsters$index < this.rankMonsters.length; ++rankMonsters$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.rankMonsters[rankMonsters$index]);
			}
			if (hasStayBeforeStartArea) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, stay_before_start_area$field);
			}
			if (hasHasMazePrizeNpc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, has_maze_prize_npc$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var floor$count:uint = 0;
			var is_random_floor$count:uint = 0;
			var stay_before_start_area$count:uint = 0;
			var has_maze_prize_npc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (floor$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeDungeonProto.floor cannot be set twice.');
					}
					++floor$count;
					this.floor = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					this.portalDatas.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.MazeDungeonProto.MazePortalDataProto()));
					break;
				case 3:
					if (is_random_floor$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeDungeonProto.isRandomFloor cannot be set twice.');
					}
					++is_random_floor$count;
					this.isRandomFloor = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.rankMonsters);
						break;
					}
					this.rankMonsters.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 5:
					if (stay_before_start_area$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeDungeonProto.stayBeforeStartArea cannot be set twice.');
					}
					++stay_before_start_area$count;
					this.stayBeforeStartArea = new app.message.SquareAreaProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.stayBeforeStartArea);
					break;
				case 6:
					if (has_maze_prize_npc$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeDungeonProto.hasMazePrizeNpc cannot be set twice.');
					}
					++has_maze_prize_npc$count;
					this.hasMazePrizeNpc = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
