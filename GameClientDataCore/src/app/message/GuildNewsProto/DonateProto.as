package app.message.GuildNewsProto {
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
	public dynamic final class DonateProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DONATE_HERO_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.GuildNewsProto.DonateProto.donate_hero_name", "donateHeroName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var donate_hero_name$field:String;

		public function clearDonateHeroName():void {
			donate_hero_name$field = null;
		}

		public function get hasDonateHeroName():Boolean {
			return donate_hero_name$field != null;
		}

		public function set donateHeroName(value:String):void {
			donate_hero_name$field = value;
		}

		public function get donateHeroName():String {
			return donate_hero_name$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.GuildNewsProto.DonateProto.money", "money", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:Int64;

		public function clearMoney():void {
			money$field = null;
		}

		public function get hasMoney():Boolean {
			return money$field != null;
		}

		public function set money(value:Int64):void {
			money$field = value;
		}

		public function get money():Int64 {
			return money$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDonateHeroName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, donate_hero_name$field);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, money$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var donate_hero_name$count:uint = 0;
			var money$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (donate_hero_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: DonateProto.donateHeroName cannot be set twice.');
					}
					++donate_hero_name$count;
					this.donateHeroName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: DonateProto.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
