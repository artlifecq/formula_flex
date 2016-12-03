package app.message {
	import com.netease.protobuf.Message;
	import com.netease.protobuf.ReadUtils;
	import com.netease.protobuf.WireType;
	import com.netease.protobuf.WriteUtils;
	import com.netease.protobuf.WritingBuffer;
	import com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_INT32;
	import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_MESSAGE;
	import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor_TYPE_ENUM;
	
	import flash.errors.IOError;
	import flash.utils.IDataInput;

	use namespace com.netease.protobuf.used_by_generated_code;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AddSpriteStatConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FREECLEARSPRITESTATPOINTLEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AddSpriteStatConfig.freeClearSpriteStatPointLevel", "freeClearSpriteStatPointLevel", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var freeClearSpriteStatPointLevel$field:int;

		private var hasField$0:uint = 0;

		public function clearFreeClearSpriteStatPointLevel():void {
			hasField$0 &= 0xfffffffe;
			freeClearSpriteStatPointLevel$field = new int();
		}

		public function get hasFreeClearSpriteStatPointLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set freeClearSpriteStatPointLevel(value:int):void {
			hasField$0 |= 0x1;
			freeClearSpriteStatPointLevel$field = value;
		}

		public function get freeClearSpriteStatPointLevel():int {
			return freeClearSpriteStatPointLevel$field;
		}

		/**
		 *  @private
		 */
		public static const CLEAR_SPRITE_STAT_POINT_COST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.AddSpriteStatConfig.clear_sprite_stat_point_cost", "clearSpriteStatPointCost", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var clear_sprite_stat_point_cost$field:app.message.UpgradeProto;

		public function clearClearSpriteStatPointCost():void {
			clear_sprite_stat_point_cost$field = null;
		}

		public function get hasClearSpriteStatPointCost():Boolean {
			return clear_sprite_stat_point_cost$field != null;
		}

		public function set clearSpriteStatPointCost(value:app.message.UpgradeProto):void {
			clear_sprite_stat_point_cost$field = value;
		}

		public function get clearSpriteStatPointCost():app.message.UpgradeProto {
			return clear_sprite_stat_point_cost$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_USE_SPRITE_STAT_POINT_TYPE:RepeatedFieldDescriptor_TYPE_ENUM = new RepeatedFieldDescriptor_TYPE_ENUM("app.message.AddSpriteStatConfig.can_use_sprite_stat_point_type", "canUseSpriteStatPointType", (3 << 3) | com.netease.protobuf.WireType.VARINT,Object);

		[ArrayElementType("int")]
		public var canUseSpriteStatPointType:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFreeClearSpriteStatPointLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, freeClearSpriteStatPointLevel$field);
			}
			if (hasClearSpriteStatPointCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, clear_sprite_stat_point_cost$field);
			}
			for (var canUseSpriteStatPointType$index:uint = 0; canUseSpriteStatPointType$index < this.canUseSpriteStatPointType.length; ++canUseSpriteStatPointType$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, this.canUseSpriteStatPointType[canUseSpriteStatPointType$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var freeClearSpriteStatPointLevel$count:uint = 0;
			var clear_sprite_stat_point_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (freeClearSpriteStatPointLevel$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddSpriteStatConfig.freeClearSpriteStatPointLevel cannot be set twice.');
					}
					++freeClearSpriteStatPointLevel$count;
					this.freeClearSpriteStatPointLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (clear_sprite_stat_point_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddSpriteStatConfig.clearSpriteStatPointCost cannot be set twice.');
					}
					++clear_sprite_stat_point_cost$count;
					this.clearSpriteStatPointCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.clearSpriteStatPointCost);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_ENUM, this.canUseSpriteStatPointType);
						break;
					}
					this.canUseSpriteStatPointType.push(com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
