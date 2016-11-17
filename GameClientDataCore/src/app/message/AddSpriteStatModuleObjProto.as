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
	public dynamic final class AddSpriteStatModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OBTAIN_SPRITE_STAT_POINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AddSpriteStatModuleObjProto.obtain_sprite_stat_point", "obtainSpriteStatPoint", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var obtain_sprite_stat_point$field:int;

		private var hasField$0:uint = 0;

		public function clearObtainSpriteStatPoint():void {
			hasField$0 &= 0xfffffffe;
			obtain_sprite_stat_point$field = new int();
		}

		public function get hasObtainSpriteStatPoint():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set obtainSpriteStatPoint(value:int):void {
			hasField$0 |= 0x1;
			obtain_sprite_stat_point$field = value;
		}

		public function get obtainSpriteStatPoint():int {
			return obtain_sprite_stat_point$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_STAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.AddSpriteStatModuleObjProto.add_stat", "addStat", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var add_stat$field:app.message.SpriteStatProto;

		public function clearAddStat():void {
			add_stat$field = null;
		}

		public function get hasAddStat():Boolean {
			return add_stat$field != null;
		}

		public function set addStat(value:app.message.SpriteStatProto):void {
			add_stat$field = value;
		}

		public function get addStat():app.message.SpriteStatProto {
			return add_stat$field;
		}

		/**
		 *  @private
		 */
		public static const USED_SPRITE_STAT_POINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AddSpriteStatModuleObjProto.used_sprite_stat_point", "usedSpriteStatPoint", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var used_sprite_stat_point$field:int;

		public function clearUsedSpriteStatPoint():void {
			hasField$0 &= 0xfffffffd;
			used_sprite_stat_point$field = new int();
		}

		public function get hasUsedSpriteStatPoint():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set usedSpriteStatPoint(value:int):void {
			hasField$0 |= 0x2;
			used_sprite_stat_point$field = value;
		}

		public function get usedSpriteStatPoint():int {
			return used_sprite_stat_point$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasObtainSpriteStatPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, obtain_sprite_stat_point$field);
			}
			if (hasAddStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, add_stat$field);
			}
			if (hasUsedSpriteStatPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, used_sprite_stat_point$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var obtain_sprite_stat_point$count:uint = 0;
			var add_stat$count:uint = 0;
			var used_sprite_stat_point$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (obtain_sprite_stat_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddSpriteStatModuleObjProto.obtainSpriteStatPoint cannot be set twice.');
					}
					++obtain_sprite_stat_point$count;
					this.obtainSpriteStatPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (add_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddSpriteStatModuleObjProto.addStat cannot be set twice.');
					}
					++add_stat$count;
					this.addStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.addStat);
					break;
				case 3:
					if (used_sprite_stat_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddSpriteStatModuleObjProto.usedSpriteStatPoint cannot be set twice.');
					}
					++used_sprite_stat_point$count;
					this.usedSpriteStatPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
