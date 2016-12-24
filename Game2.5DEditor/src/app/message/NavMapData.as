package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NavMapData.SpellLimitPolygonProto;
	import app.message.NavMapData.PolygonProto;
	import app.message.NavMapData.StallPolygonProto;
	import app.message.NavMapData.WalkablePolygonData;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NavMapData extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NUM_BLOCKS_X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NavMapData.num_blocks_x", "numBlocksX", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var num_blocks_x$field:int;

		private var hasField$0:uint = 0;

		public function clearNumBlocksX():void {
			hasField$0 &= 0xfffffffe;
			num_blocks_x$field = new int();
		}

		public function get hasNumBlocksX():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set numBlocksX(value:int):void {
			hasField$0 |= 0x1;
			num_blocks_x$field = value;
		}

		public function get numBlocksX():int {
			return num_blocks_x$field;
		}

		/**
		 *  @private
		 */
		public static const NUM_BLOCKS_Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NavMapData.num_blocks_y", "numBlocksY", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var num_blocks_y$field:int;

		public function clearNumBlocksY():void {
			hasField$0 &= 0xfffffffd;
			num_blocks_y$field = new int();
		}

		public function get hasNumBlocksY():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set numBlocksY(value:int):void {
			hasField$0 |= 0x2;
			num_blocks_y$field = value;
		}

		public function get numBlocksY():int {
			return num_blocks_y$field;
		}

		/**
		 *  @private
		 */
		public static const WALKABLE_POLY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NavMapData.walkable_poly", "walkablePoly", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NavMapData.WalkablePolygonData; });

		private var walkable_poly$field:app.message.NavMapData.WalkablePolygonData;

		public function clearWalkablePoly():void {
			walkable_poly$field = null;
		}

		public function get hasWalkablePoly():Boolean {
			return walkable_poly$field != null;
		}

		public function set walkablePoly(value:app.message.NavMapData.WalkablePolygonData):void {
			walkable_poly$field = value;
		}

		public function get walkablePoly():app.message.NavMapData.WalkablePolygonData {
			return walkable_poly$field;
		}

		/**
		 *  @private
		 */
		public static const PKABLE_POLY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.NavMapData.pkable_poly", "pkablePoly", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NavMapData.PolygonProto; });

		[ArrayElementType("app.message.NavMapData.PolygonProto")]
		public var pkablePoly:Array = [];

		/**
		 *  @private
		 */
		public static const SPELL_LIMIT_POLY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.NavMapData.spell_limit_poly", "spellLimitPoly", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NavMapData.SpellLimitPolygonProto; });

		[ArrayElementType("app.message.NavMapData.SpellLimitPolygonProto")]
		public var spellLimitPoly:Array = [];

		/**
		 *  @private
		 */
		public static const STALL_POLY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.NavMapData.stall_poly", "stallPoly", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NavMapData.StallPolygonProto; });

		[ArrayElementType("app.message.NavMapData.StallPolygonProto")]
		public var stallPoly:Array = [];

		/**
		 *  @private
		 */
		public static const STALL_GRID_LENGTH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NavMapData.stall_grid_length", "stallGridLength", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stall_grid_length$field:int;

		public function clearStallGridLength():void {
			hasField$0 &= 0xfffffffb;
			stall_grid_length$field = new int();
		}

		public function get hasStallGridLength():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set stallGridLength(value:int):void {
			hasField$0 |= 0x4;
			stall_grid_length$field = value;
		}

		public function get stallGridLength():int {
			if(!hasStallGridLength) {
				return 100;
			}
			return stall_grid_length$field;
		}

		/**
		 *  @private
		 */
		public static const SAFE_POLY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.NavMapData.safe_poly", "safePoly", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NavMapData.PolygonProto; });

		[ArrayElementType("app.message.NavMapData.PolygonProto")]
		public var safePoly:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasNumBlocksX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, num_blocks_x$field);
			}
			if (hasNumBlocksY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, num_blocks_y$field);
			}
			if (hasWalkablePoly) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, walkable_poly$field);
			}
			for (var pkablePoly$index:uint = 0; pkablePoly$index < this.pkablePoly.length; ++pkablePoly$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.pkablePoly[pkablePoly$index]);
			}
			for (var spellLimitPoly$index:uint = 0; spellLimitPoly$index < this.spellLimitPoly.length; ++spellLimitPoly$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.spellLimitPoly[spellLimitPoly$index]);
			}
			for (var stallPoly$index:uint = 0; stallPoly$index < this.stallPoly.length; ++stallPoly$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.stallPoly[stallPoly$index]);
			}
			if (hasStallGridLength) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, stall_grid_length$field);
			}
			for (var safePoly$index:uint = 0; safePoly$index < this.safePoly.length; ++safePoly$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.safePoly[safePoly$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var num_blocks_x$count:uint = 0;
			var num_blocks_y$count:uint = 0;
			var walkable_poly$count:uint = 0;
			var stall_grid_length$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (num_blocks_x$count != 0) {
						throw new flash.errors.IOError('Bad data format: NavMapData.numBlocksX cannot be set twice.');
					}
					++num_blocks_x$count;
					this.numBlocksX = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (num_blocks_y$count != 0) {
						throw new flash.errors.IOError('Bad data format: NavMapData.numBlocksY cannot be set twice.');
					}
					++num_blocks_y$count;
					this.numBlocksY = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (walkable_poly$count != 0) {
						throw new flash.errors.IOError('Bad data format: NavMapData.walkablePoly cannot be set twice.');
					}
					++walkable_poly$count;
					this.walkablePoly = new app.message.NavMapData.WalkablePolygonData();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.walkablePoly);
					break;
				case 4:
					this.pkablePoly.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.NavMapData.PolygonProto()));
					break;
				case 5:
					this.spellLimitPoly.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.NavMapData.SpellLimitPolygonProto()));
					break;
				case 6:
					this.stallPoly.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.NavMapData.StallPolygonProto()));
					break;
				case 7:
					if (stall_grid_length$count != 0) {
						throw new flash.errors.IOError('Bad data format: NavMapData.stallGridLength cannot be set twice.');
					}
					++stall_grid_length$count;
					this.stallGridLength = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					this.safePoly.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.NavMapData.PolygonProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
