package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.RankPromotionProto.SingleRankPrizeProto;
	import app.message.RankPromotionProto.RankPromotionProtoType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RankPromotionProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.RankPromotionProto.start_time", "startTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start_time$field:Int64;

		public function clearStartTime():void {
			start_time$field = null;
		}

		public function get hasStartTime():Boolean {
			return start_time$field != null;
		}

		public function set startTime(value:Int64):void {
			start_time$field = value;
		}

		public function get startTime():Int64 {
			return start_time$field;
		}

		/**
		 *  @private
		 */
		public static const END_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.RankPromotionProto.end_time", "endTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var end_time$field:Int64;

		public function clearEndTime():void {
			end_time$field = null;
		}

		public function get hasEndTime():Boolean {
			return end_time$field != null;
		}

		public function set endTime(value:Int64):void {
			end_time$field = value;
		}

		public function get endTime():Int64 {
			return end_time$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.RankPromotionProto.type", "type", (3 << 3) | com.netease.protobuf.WireType.VARINT, app.message.RankPromotionProto.RankPromotionProtoType);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.RankPromotionProto.title", "title", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var title$field:String;

		public function clearTitle():void {
			title$field = null;
		}

		public function get hasTitle():Boolean {
			return title$field != null;
		}

		public function set title(value:String):void {
			title$field = value;
		}

		public function get title():String {
			return title$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.RankPromotionProto.name", "name", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const RULE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.RankPromotionProto.rule", "rule", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var rule$field:String;

		public function clearRule():void {
			rule$field = null;
		}

		public function get hasRule():Boolean {
			return rule$field != null;
		}

		public function set rule(value:String):void {
			rule$field = value;
		}

		public function get rule():String {
			return rule$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.RankPromotionProto.prize", "prize", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.RankPromotionProto.SingleRankPrizeProto; });

		[ArrayElementType("app.message.RankPromotionProto.SingleRankPrizeProto")]
		public var prize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, start_time$field);
			}
			if (hasEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, end_time$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, type$field);
			}
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, title$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasRule) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, rule$field);
			}
			for (var prize$index:uint = 0; prize$index < this.prize.length; ++prize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.prize[prize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var start_time$count:uint = 0;
			var end_time$count:uint = 0;
			var type$count:uint = 0;
			var title$count:uint = 0;
			var name$count:uint = 0;
			var rule$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankPromotionProto.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankPromotionProto.endTime cannot be set twice.');
					}
					++end_time$count;
					this.endTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankPromotionProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 4:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankPromotionProto.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankPromotionProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 6:
					if (rule$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankPromotionProto.rule cannot be set twice.');
					}
					++rule$count;
					this.rule = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 7:
					this.prize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.RankPromotionProto.SingleRankPrizeProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
