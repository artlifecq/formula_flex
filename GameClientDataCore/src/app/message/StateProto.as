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
	public dynamic final class StateProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StateProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.StateProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IS_BUFF:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.StateProto.is_buff", "isBuff", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_buff$field:Boolean;

		public function clearIsBuff():void {
			hasField$0 &= 0xfffffffd;
			is_buff$field = new Boolean();
		}

		public function get hasIsBuff():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isBuff(value:Boolean):void {
			hasField$0 |= 0x2;
			is_buff$field = value;
		}

		public function get isBuff():Boolean {
			return is_buff$field;
		}

		/**
		 *  @private
		 */
		public static const GROUP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StateProto.group", "group", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var group$field:int;

		public function clearGroup():void {
			hasField$0 &= 0xfffffffb;
			group$field = new int();
		}

		public function get hasGroup():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set group(value:int):void {
			hasField$0 |= 0x4;
			group$field = value;
		}

		public function get group():int {
			return group$field;
		}

		/**
		 *  @private
		 */
		public static const STACK_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StateProto.stack_type", "stackType", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stack_type$field:int;

		public function clearStackType():void {
			hasField$0 &= 0xfffffff7;
			stack_type$field = new int();
		}

		public function get hasStackType():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set stackType(value:int):void {
			hasField$0 |= 0x8;
			stack_type$field = value;
		}

		public function get stackType():int {
			return stack_type$field;
		}

		/**
		 *  @private
		 */
		public static const ICON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.StateProto.icon", "icon", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var icon$field:String;

		public function clearIcon():void {
			icon$field = null;
		}

		public function get hasIcon():Boolean {
			return icon$field != null;
		}

		public function set icon(value:String):void {
			icon$field = value;
		}

		public function get icon():String {
			return icon$field;
		}

		/**
		 *  @private
		 */
		public static const DESCRIPTION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.StateProto.description", "description", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var description$field:String;

		public function clearDescription():void {
			description$field = null;
		}

		public function get hasDescription():Boolean {
			return description$field != null;
		}

		public function set description(value:String):void {
			description$field = value;
		}

		public function get description():String {
			return description$field;
		}

		/**
		 *  @private
		 */
		public static const NOTICE_ON_ADD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.StateProto.notice_on_add", "noticeOnAdd", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var notice_on_add$field:String;

		public function clearNoticeOnAdd():void {
			notice_on_add$field = null;
		}

		public function get hasNoticeOnAdd():Boolean {
			return notice_on_add$field != null;
		}

		public function set noticeOnAdd(value:String):void {
			notice_on_add$field = value;
		}

		public function get noticeOnAdd():String {
			return notice_on_add$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.StateProto.total_time", "totalTime", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_time$field:Int64;

		public function clearTotalTime():void {
			total_time$field = null;
		}

		public function get hasTotalTime():Boolean {
			return total_time$field != null;
		}

		public function set totalTime(value:Int64):void {
			total_time$field = value;
		}

		public function get totalTime():Int64 {
			return total_time$field;
		}

		/**
		 *  @private
		 */
		public static const IS_HIDDEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.StateProto.is_hidden", "isHidden", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_hidden$field:Boolean;

		public function clearIsHidden():void {
			hasField$0 &= 0xffffffef;
			is_hidden$field = new Boolean();
		}

		public function get hasIsHidden():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isHidden(value:Boolean):void {
			hasField$0 |= 0x10;
			is_hidden$field = value;
		}

		public function get isHidden():Boolean {
			return is_hidden$field;
		}

		/**
		 *  @private
		 */
		public static const INIT_ANIMATION:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.StateProto.init_animation", "initAnimation", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var initAnimation:Array = [];

		/**
		 *  @private
		 */
		public static const ANIMATION:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.StateProto.animation", "animation", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var animation:Array = [];

		/**
		 *  @private
		 */
		public static const DISAPPEAR_ANIMATION:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.StateProto.disappear_animation", "disappearAnimation", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var disappearAnimation:Array = [];

		/**
		 *  @private
		 */
		public static const BEEN_HURT_ANIMATION:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.StateProto.been_hurt_animation", "beenHurtAnimation", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var beenHurtAnimation:Array = [];

		/**
		 *  @private
		 */
		public static const IS_STUN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.StateProto.is_stun", "isStun", (30 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_stun$field:Boolean;

		public function clearIsStun():void {
			hasField$0 &= 0xffffffdf;
			is_stun$field = new Boolean();
		}

		public function get hasIsStun():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isStun(value:Boolean):void {
			hasField$0 |= 0x20;
			is_stun$field = value;
		}

		public function get isStun():Boolean {
			return is_stun$field;
		}

		/**
		 *  @private
		 */
		public static const IS_UNMOVABLE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.StateProto.is_unmovable", "isUnmovable", (31 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_unmovable$field:Boolean;

		public function clearIsUnmovable():void {
			hasField$0 &= 0xffffffbf;
			is_unmovable$field = new Boolean();
		}

		public function get hasIsUnmovable():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set isUnmovable(value:Boolean):void {
			hasField$0 |= 0x40;
			is_unmovable$field = value;
		}

		public function get isUnmovable():Boolean {
			return is_unmovable$field;
		}

		/**
		 *  @private
		 */
		public static const IS_HUSH:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.StateProto.is_hush", "isHush", (32 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_hush$field:Boolean;

		public function clearIsHush():void {
			hasField$0 &= 0xffffff7f;
			is_hush$field = new Boolean();
		}

		public function get hasIsHush():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set isHush(value:Boolean):void {
			hasField$0 |= 0x80;
			is_hush$field = value;
		}

		public function get isHush():Boolean {
			return is_hush$field;
		}

		/**
		 *  @private
		 */
		public static const IS_INVISIBLE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.StateProto.is_invisible", "isInvisible", (34 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_invisible$field:Boolean;

		public function clearIsInvisible():void {
			hasField$0 &= 0xfffffeff;
			is_invisible$field = new Boolean();
		}

		public function get hasIsInvisible():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set isInvisible(value:Boolean):void {
			hasField$0 |= 0x100;
			is_invisible$field = value;
		}

		public function get isInvisible():Boolean {
			return is_invisible$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TRUE_SIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.StateProto.is_true_sight", "isTrueSight", (35 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_true_sight$field:Boolean;

		public function clearIsTrueSight():void {
			hasField$0 &= 0xfffffdff;
			is_true_sight$field = new Boolean();
		}

		public function get hasIsTrueSight():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set isTrueSight(value:Boolean):void {
			hasField$0 |= 0x200;
			is_true_sight$field = value;
		}

		public function get isTrueSight():Boolean {
			return is_true_sight$field;
		}

		/**
		 *  @private
		 */
		public static const IS_INVICIBLE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.StateProto.is_invicible", "isInvicible", (36 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_invicible$field:Boolean;

		public function clearIsInvicible():void {
			hasField$0 &= 0xfffffbff;
			is_invicible$field = new Boolean();
		}

		public function get hasIsInvicible():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set isInvicible(value:Boolean):void {
			hasField$0 |= 0x400;
			is_invicible$field = value;
		}

		public function get isInvicible():Boolean {
			return is_invicible$field;
		}

		/**
		 *  @private
		 */
		public static const IS_HUN_LUAN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.StateProto.is_hun_luan", "isHunLuan", (37 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_hun_luan$field:Boolean;

		public function clearIsHunLuan():void {
			hasField$0 &= 0xfffff7ff;
			is_hun_luan$field = new Boolean();
		}

		public function get hasIsHunLuan():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set isHunLuan(value:Boolean):void {
			hasField$0 |= 0x800;
			is_hun_luan$field = value;
		}

		public function get isHunLuan():Boolean {
			return is_hun_luan$field;
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
			if (hasIsBuff) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_buff$field);
			}
			if (hasGroup) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, group$field);
			}
			if (hasStackType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, stack_type$field);
			}
			if (hasIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, icon$field);
			}
			if (hasDescription) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, description$field);
			}
			if (hasNoticeOnAdd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, notice_on_add$field);
			}
			if (hasTotalTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, total_time$field);
			}
			if (hasIsHidden) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_hidden$field);
			}
			for (var initAnimation$index:uint = 0; initAnimation$index < this.initAnimation.length; ++initAnimation$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.initAnimation[initAnimation$index]);
			}
			for (var animation$index:uint = 0; animation$index < this.animation.length; ++animation$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.animation[animation$index]);
			}
			for (var disappearAnimation$index:uint = 0; disappearAnimation$index < this.disappearAnimation.length; ++disappearAnimation$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.disappearAnimation[disappearAnimation$index]);
			}
			for (var beenHurtAnimation$index:uint = 0; beenHurtAnimation$index < this.beenHurtAnimation.length; ++beenHurtAnimation$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.beenHurtAnimation[beenHurtAnimation$index]);
			}
			if (hasIsStun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_stun$field);
			}
			if (hasIsUnmovable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_unmovable$field);
			}
			if (hasIsHush) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 32);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_hush$field);
			}
			if (hasIsInvisible) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 34);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_invisible$field);
			}
			if (hasIsTrueSight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 35);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_true_sight$field);
			}
			if (hasIsInvicible) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 36);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_invicible$field);
			}
			if (hasIsHunLuan) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 37);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_hun_luan$field);
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
			var is_buff$count:uint = 0;
			var group$count:uint = 0;
			var stack_type$count:uint = 0;
			var icon$count:uint = 0;
			var description$count:uint = 0;
			var notice_on_add$count:uint = 0;
			var total_time$count:uint = 0;
			var is_hidden$count:uint = 0;
			var is_stun$count:uint = 0;
			var is_unmovable$count:uint = 0;
			var is_hush$count:uint = 0;
			var is_invisible$count:uint = 0;
			var is_true_sight$count:uint = 0;
			var is_invicible$count:uint = 0;
			var is_hun_luan$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (is_buff$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.isBuff cannot be set twice.');
					}
					++is_buff$count;
					this.isBuff = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 4:
					if (group$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.group cannot be set twice.');
					}
					++group$count;
					this.group = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (stack_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.stackType cannot be set twice.');
					}
					++stack_type$count;
					this.stackType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.icon cannot be set twice.');
					}
					++icon$count;
					this.icon = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 12:
					if (description$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.description cannot be set twice.');
					}
					++description$count;
					this.description = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 13:
					if (notice_on_add$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.noticeOnAdd cannot be set twice.');
					}
					++notice_on_add$count;
					this.noticeOnAdd = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 14:
					if (total_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.totalTime cannot be set twice.');
					}
					++total_time$count;
					this.totalTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 15:
					if (is_hidden$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.isHidden cannot be set twice.');
					}
					++is_hidden$count;
					this.isHidden = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 20:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.initAnimation);
						break;
					}
					this.initAnimation.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 21:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.animation);
						break;
					}
					this.animation.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 22:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.disappearAnimation);
						break;
					}
					this.disappearAnimation.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 23:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.beenHurtAnimation);
						break;
					}
					this.beenHurtAnimation.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 30:
					if (is_stun$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.isStun cannot be set twice.');
					}
					++is_stun$count;
					this.isStun = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 31:
					if (is_unmovable$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.isUnmovable cannot be set twice.');
					}
					++is_unmovable$count;
					this.isUnmovable = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 32:
					if (is_hush$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.isHush cannot be set twice.');
					}
					++is_hush$count;
					this.isHush = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 34:
					if (is_invisible$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.isInvisible cannot be set twice.');
					}
					++is_invisible$count;
					this.isInvisible = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 35:
					if (is_true_sight$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.isTrueSight cannot be set twice.');
					}
					++is_true_sight$count;
					this.isTrueSight = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 36:
					if (is_invicible$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.isInvicible cannot be set twice.');
					}
					++is_invicible$count;
					this.isInvicible = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 37:
					if (is_hun_luan$count != 0) {
						throw new flash.errors.IOError('Bad data format: StateProto.isHunLuan cannot be set twice.');
					}
					++is_hun_luan$count;
					this.isHunLuan = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
