package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpriteStatProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NicknameProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NicknameProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.NicknameProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.NicknameProto.desc", "desc", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:String;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:String):void {
			desc$field = value;
		}

		public function get desc():String {
			return desc$field;
		}

		/**
		 *  @private
		 */
		public static const RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.NicknameProto.res", "res", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var res$field:String;

		public function clearRes():void {
			res$field = null;
		}

		public function get hasRes():Boolean {
			return res$field != null;
		}

		public function set res(value:String):void {
			res$field = value;
		}

		public function get res():String {
			return res$field;
		}

		/**
		 *  @private
		 */
		public static const STAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NicknameProto.stat", "stat", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var stat$field:app.message.SpriteStatProto;

		public function clearStat():void {
			stat$field = null;
		}

		public function get hasStat():Boolean {
			return stat$field != null;
		}

		public function set stat(value:app.message.SpriteStatProto):void {
			stat$field = value;
		}

		public function get stat():app.message.SpriteStatProto {
			return stat$field;
		}

		/**
		 *  @private
		 */
		public static const IS_SPECIAL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.NicknameProto.is_special", "isSpecial", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_special$field:Boolean;

		public function clearIsSpecial():void {
			hasField$0 &= 0xfffffffd;
			is_special$field = new Boolean();
		}

		public function get hasIsSpecial():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isSpecial(value:Boolean):void {
			hasField$0 |= 0x2;
			is_special$field = value;
		}

		public function get isSpecial():Boolean {
			return is_special$field;
		}

		/**
		 *  @private
		 */
		public static const OPERATOR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.NicknameProto.operator", "operator", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var operator$field:int;

		public function clearOperator():void {
			hasField$0 &= 0xfffffffb;
			operator$field = new int();
		}

		public function get hasOperator():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set operator(value:int):void {
			hasField$0 |= 0x4;
			operator$field = value;
		}

		public function get operator():int {
			return operator$field;
		}

		/**
		 *  @private
		 */
		public static const COND_DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.NicknameProto.cond_desc", "condDesc", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var cond_desc$field:String;

		public function clearCondDesc():void {
			cond_desc$field = null;
		}

		public function get hasCondDesc():Boolean {
			return cond_desc$field != null;
		}

		public function set condDesc(value:String):void {
			cond_desc$field = value;
		}

		public function get condDesc():String {
			return cond_desc$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVEMENT_ID:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.NicknameProto.achievement_id", "achievementId", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var achievementId:Array = [];

		/**
		 *  @private
		 */
		public static const GROUP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.NicknameProto.group", "group", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var group$field:String;

		public function clearGroup():void {
			group$field = null;
		}

		public function get hasGroup():Boolean {
			return group$field != null;
		}

		public function set group(value:String):void {
			group$field = value;
		}

		public function get group():String {
			return group$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, desc$field);
			}
			if (hasRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, res$field);
			}
			if (hasStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, stat$field);
			}
			if (hasIsSpecial) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_special$field);
			}
			if (hasOperator) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, operator$field);
			}
			if (hasCondDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, cond_desc$field);
			}
			for (var achievementId$index:uint = 0; achievementId$index < this.achievementId.length; ++achievementId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.achievementId[achievementId$index]);
			}
			if (hasGroup) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, group$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var name$count:uint = 0;
			var desc$count:uint = 0;
			var res$count:uint = 0;
			var stat$count:uint = 0;
			var is_special$count:uint = 0;
			var operator$count:uint = 0;
			var cond_desc$count:uint = 0;
			var group$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: NicknameProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: NicknameProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: NicknameProto.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (res$count != 0) {
						throw new flash.errors.IOError('Bad data format: NicknameProto.res cannot be set twice.');
					}
					++res$count;
					this.res = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: NicknameProto.stat cannot be set twice.');
					}
					++stat$count;
					this.stat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.stat);
					break;
				case 6:
					if (is_special$count != 0) {
						throw new flash.errors.IOError('Bad data format: NicknameProto.isSpecial cannot be set twice.');
					}
					++is_special$count;
					this.isSpecial = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (operator$count != 0) {
						throw new flash.errors.IOError('Bad data format: NicknameProto.operator cannot be set twice.');
					}
					++operator$count;
					this.operator = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (cond_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: NicknameProto.condDesc cannot be set twice.');
					}
					++cond_desc$count;
					this.condDesc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.achievementId);
						break;
					}
					this.achievementId.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 10:
					if (group$count != 0) {
						throw new flash.errors.IOError('Bad data format: NicknameProto.group cannot be set twice.');
					}
					++group$count;
					this.group = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
