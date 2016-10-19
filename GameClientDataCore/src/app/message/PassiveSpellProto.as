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
	public dynamic final class PassiveSpellProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SPRITE_STAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.PassiveSpellProto.sprite_stat", "spriteStat", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var sprite_stat$field:app.message.SpriteStatProto;

		public function clearSpriteStat():void {
			sprite_stat$field = null;
		}

		public function get hasSpriteStat():Boolean {
			return sprite_stat$field != null;
		}

		public function set spriteStat(value:app.message.SpriteStatProto):void {
			sprite_stat$field = value;
		}

		public function get spriteStat():app.message.SpriteStatProto {
			return sprite_stat$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSpriteStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, sprite_stat$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var sprite_stat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (sprite_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: PassiveSpellProto.spriteStat cannot be set twice.');
					}
					++sprite_stat$count;
					this.spriteStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.spriteStat);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
