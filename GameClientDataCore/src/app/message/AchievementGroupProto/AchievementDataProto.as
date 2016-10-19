package app.message.AchievementGroupProto {
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
	public dynamic final class AchievementDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AchievementGroupProto.AchievementDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.AchievementGroupProto.AchievementDataProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.AchievementGroupProto.AchievementDataProto.desc", "desc", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const COND_DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.AchievementGroupProto.AchievementDataProto.cond_desc", "condDesc", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const ICON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.AchievementGroupProto.AchievementDataProto.icon", "icon", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const POINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AchievementGroupProto.AchievementDataProto.point", "point", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var point$field:int;

		public function clearPoint():void {
			hasField$0 &= 0xfffffffd;
			point$field = new int();
		}

		public function get hasPoint():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set point(value:int):void {
			hasField$0 |= 0x2;
			point$field = value;
		}

		public function get point():int {
			return point$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_PROGRESS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AchievementGroupProto.AchievementDataProto.total_progress", "totalProgress", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_progress$field:int;

		public function clearTotalProgress():void {
			hasField$0 &= 0xfffffffb;
			total_progress$field = new int();
		}

		public function get hasTotalProgress():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set totalProgress(value:int):void {
			hasField$0 |= 0x4;
			total_progress$field = value;
		}

		public function get totalProgress():int {
			return total_progress$field;
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
			if (hasCondDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, cond_desc$field);
			}
			if (hasIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, icon$field);
			}
			if (hasPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, point$field);
			}
			if (hasTotalProgress) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, total_progress$field);
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
			var cond_desc$count:uint = 0;
			var icon$count:uint = 0;
			var point$count:uint = 0;
			var total_progress$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementDataProto.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (cond_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementDataProto.condDesc cannot be set twice.');
					}
					++cond_desc$count;
					this.condDesc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementDataProto.icon cannot be set twice.');
					}
					++icon$count;
					this.icon = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (point$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementDataProto.point cannot be set twice.');
					}
					++point$count;
					this.point = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (total_progress$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementDataProto.totalProgress cannot be set twice.');
					}
					++total_progress$count;
					this.totalProgress = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
